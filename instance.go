package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type Instance C.wasm_instance_t

func NewInstance(
	store *Store,
	module *Module,
	imports []*Extern,
	outTrap **Trap,
	debugName string,
) *Instance {
	var name *C.char
	if debugName == "" {
		name = EMPTY
	} else {
		name = C.CString(debugName)
		defer C.free(unsafe.Pointer(name))
	}
	return (*Instance)(C.wasm_instance_new(
		(*C.wasm_store_t)(store),
		(*C.wasm_module_t)(module),
		(**C.wasm_extern_t)(unsafe.Pointer(&imports[0])),
		(**C.wasm_trap_t)(unsafe.Pointer(outTrap)),
		name,
	))
}

func (s *Store) NewInstance(
	module *Module,
	imports []*Extern,
	outTrap **Trap,
	debugName string,
) *Instance {
	return NewInstance(s, module, imports, outTrap, debugName)
}

func (inst *Instance) Close() error {
	inst.Delete()
	return nil
}
func (inst *Instance) Delete() {
	C.wasm_instance_delete((*C.wasm_instance_t)(inst))
}

func (inst *Instance) NumExports() int {
	return int(C.wasm_instance_num_exports((*C.wasm_instance_t)(inst)))
}

func (inst *Instance) Export(index int) *Extern {
	return (*Extern)(C.wasm_instance_export((*C.wasm_instance_t)(inst), C.size_t(index)))
}

func (inst *Instance) Exports(exports []*Extern) []*Extern {
	count := inst.NumExports()
	if len(exports) > 0 {
		exports = exports[:0]
	}
	for i := 0; i < count; i++ {
		exports = append(exports, inst.Export(i))
	}
	return exports
}
