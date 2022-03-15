package worker

import "C"
import (
	"errors"
	"fmt"
	"github.com/moontrade/wavm-go"
	"sync"
	"unsafe"
)

func DefaultEngine() *wavm.Engine {
	return wavm.NewEngineWithConfig(wavm.NewConfigAll().SetMultiMemory(false))
}

type Loader struct {
	engineFactory       func() *wavm.Engine
	counter             int64
	fd_write_type       *wavm.FuncType
	clock_time_get_type *wavm.FuncType
	args_sizes_get_type *wavm.FuncType
	args_get_type       *wavm.FuncType
	setTimeout_type     *wavm.FuncType
	modImports          []wavm.Import
	modExports          []wavm.Export
	imports             []*wavm.Extern
	exports             []*wavm.Extern
	compartment         *wavm.Compartment
	mu                  sync.Mutex
}

func NewLoader(engineFactory func() *wavm.Engine) *Loader {
	if engineFactory == nil {
		engineFactory = DefaultEngine
	}
	return &Loader{
		engineFactory: engineFactory,
		fd_write_type: wavm.FuncType_4_1(
			wavm.ValTypeI32(), wavm.ValTypeI32(), wavm.ValTypeI32(), wavm.ValTypeI32(),
			wavm.ValTypeI32(),
		),
		clock_time_get_type: wavm.FuncType_3_1(
			wavm.ValTypeI32(), wavm.ValTypeI64(), wavm.ValTypeI32(),
			wavm.ValTypeI32(),
		),
		args_sizes_get_type: wavm.FuncType_2_1(
			wavm.ValTypeI32(), wavm.ValTypeI32(),
			wavm.ValTypeI32(),
		),
		args_get_type: wavm.FuncType_2_1(
			wavm.ValTypeI32(), wavm.ValTypeI32(),
			wavm.ValTypeI32(),
		),
		setTimeout_type: wavm.FuncType_1_0(wavm.ValTypeI64()),
		modImports:      make([]wavm.Import, 0, 32),
		modExports:      make([]wavm.Export, 0, 32),
		imports:         make([]*wavm.Extern, 0, 32),
	}
}

func (wl *Loader) Close() error {
	wl.fd_write_type.Delete()
	wl.clock_time_get_type.Delete()
	wl.args_sizes_get_type.Delete()
	wl.args_get_type.Delete()
	wl.setTimeout_type.Delete()
	return nil
}

func (wl *Loader) findModuleExport(name string) *wavm.Export {
	for i := 0; i < len(wl.modExports); i++ {
		export := &wl.modExports[i]
		if export.NameUnsafe() == name {
			return export
		}
	}
	return nil
}

func (wl *Loader) Load(precompiled, trace bool, binary []byte, maxTableElems, maxMemoryPages int32) (*Worker, error) {
	wl.mu.Lock()
	defer wl.mu.Unlock()

	// Init Engine
	engine := wl.engineFactory()

	//compartment := wl.compartment
	//if compartment == nil {
	//	wl.compartment = engine.NewCompartment("")
	//	compartment = wl.compartment
	//}
	compartment := engine.NewCompartment("")

	// Init store
	store := compartment.NewStore("")
	// Load module
	var module *wavm.Module
	if precompiled {
		module = engine.NewPrecompiledModule(binary)
	} else {
		module = engine.NewModule(binary)
	}

	wl.counter++
	// Init worker
	worker := &Worker{
		id:          wl.counter,
		engine:      engine,
		compartment: compartment,
		store:       store,
		funcCall:    (*C.void)(wavm.WASMFuncCall),
	}

	// Module imports
	wl.modImports = wl.modImports[:0]
	wl.modImports = module.Imports(wl.modImports)
	for _, imp := range wl.modImports {
		if trace {
			println("import", imp.ModuleUnsafe(), "name", imp.NameUnsafe())
		}
	}

	// Module exports
	wl.modExports = wl.modExports[:0]
	wl.modExports = module.Exports(wl.modExports)
	for _, export := range wl.modExports {
		if trace {
			println("export", export.NameUnsafe())
		}
	}

	var (
		// Create import funcs
		fd_write = compartment.NewFunc(
			wl.fd_write_type,
			moontrade_fd_write(),
			//(wavm.FuncCallback)(C.moontrade_fd_write),
			//"fd_write",
			"",
		)
		clock_time_get = compartment.NewFunc(
			wl.clock_time_get_type,
			moontrade_clock_time_get(),
			//(wavm.FuncCallback)(C.moontrade_clock_time_get),
			//"clock_time_get",
			"",
		)
		args_sizes_get = compartment.NewFunc(
			wl.args_sizes_get_type,
			moontrade_args_sizes_get(),
			//(wavm.FuncCallback)(C.moontrade_args_sizes_get),
			//"args_sizes_get",
			"",
		)
		args_get = compartment.NewFunc(
			wl.args_get_type,
			moontrade_args_get(),
			//(wavm.FuncCallback)(C.moontrade_args_get),
			//"args_get",
			"",
		)
		setTimeout = compartment.NewFunc(
			wl.setTimeout_type,
			moontrade_set_timeout(),
			//(wavm.FuncCallback)(C.moontrade_set_timeout),
			//"setTimeout",
			"",
		)
	)

	// Instance imports
	wl.imports = wl.imports[:0]
	wl.imports = append(wl.imports, fd_write.AsExtern())
	wl.imports = append(wl.imports, clock_time_get.AsExtern())
	wl.imports = append(wl.imports, args_sizes_get.AsExtern())
	wl.imports = append(wl.imports, args_get.AsExtern())
	wl.imports = append(wl.imports, setTimeout.AsExtern())

	// New instance
	var trap *wavm.Trap
	instance := store.NewInstanceWithQuota(module, wl.imports, &trap, maxTableElems, maxMemoryPages, false, "")
	// Error?
	if trap != nil {
		// Clean up.
		for _, imp := range wl.imports {
			imp.AsFunc().Delete()
		}
		err := fmt.Errorf(trap.String())
		trap.Delete()
		return nil, err
	}

	fd_write.Delete()
	clock_time_get.Delete()
	args_sizes_get.Delete()
	args_get.Delete()
	setTimeout.Delete()
	// Cleanup wasm_func_t
	//for _, imp := range wl.imports {
	//	fn := imp.AsFunc()
	//	fn.Delete()
	//	//imp.AsFunc().Delete()
	//}

	// Instance exports

	wl.exports = wl.exports[:0]
	wl.exports = instance.Exports(wl.exports)

	// Assert
	if len(wl.exports) != len(wl.modExports) {
		instance.Delete()
		module.Delete()
		store.Delete()
		compartment.Delete()
		engine.Delete()
		return nil, errors.New("instance exports and module exports don't match")
	}

	// Map exports to worker
	for i, export := range wl.exports {
		modExport := &wl.modExports[i]

		switch export.AsKind() {
		case wavm.ExternFunc:
			fn := export.AsFunc()
			if trace {
				println("func export", modExport.NameUnsafe())
			}
			switch modExport.NameUnsafe() {
			case "_start":
				worker.start = fn
			case "resume":
				worker.resume = fn
			case "alloc":
				worker.alloc = fn
			case "realloc":
				worker.realloc = fn
			case "free":
				worker.free = fn
			case "stub":
				worker.stub = fn
			}
		case wavm.ExternTable:
		case wavm.ExternMemory:
			worker.memory = export.AsMemory()
		case wavm.ExternGlobal:
		}
	}

	// Clean up module
	module.Delete()
	// Clean up instance
	instance.Delete()

	// Init memory
	data := worker.memory.Data()
	pages := worker.memory.Pages()
	size := worker.memory.Size()
	//C.moontrade_memory_set(memory)
	if trace {
		fmt.Println("data", uintptr(unsafe.Pointer(data)), "pages", uint(pages), "size", size)
	}

	worker.init()

	return worker, nil
}
