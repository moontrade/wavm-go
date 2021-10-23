package wavm

/*
#include <stdlib.h>
#include "wavm-c.h"

wasm_module_t* wasm_module_precompiled_new(wasm_engine_t*,
										  const char* binary,
										  size_t num_binary_bytes);
*/
import "C"
import (
	"reflect"
	"unsafe"
)

type (
	Module C.wasm_module_t
)

func NewModule(engine *Engine, binary []byte) *Module {
	slice := (*reflect.StringHeader)(unsafe.Pointer(&binary))
	return (*Module)(C.wasm_module_new((*C.wasm_engine_t)(engine), (*C.char)(unsafe.Pointer(slice.Data)), (C.size_t)(slice.Len)))
}

func NewModulePrecompiled(engine *Engine, binary []byte) *Module {
	slice := (*reflect.StringHeader)(unsafe.Pointer(&binary))
	return (*Module)(C.wasm_module_precompiled_new((*C.wasm_engine_t)(engine), (*C.char)(unsafe.Pointer(slice.Data)), (C.size_t)(slice.Len)))
}

//func wasm_module_new_text(engine *C.wasm_engine_t, wast string) *C.wasm_module_t {
//	return wasm_module_new_wast(engine, []byte(wast))
//}

func NewModuleText(engine *Engine, wast string) *Module {
	if len(wast) == 0 {
		return nil
	}
	ptr := C.CString(wast)
	defer C.free(unsafe.Pointer(ptr))

	return (*Module)(C.wasm_module_new_text((*C.wasm_engine_t)(engine), ptr, C.size_t(len(wast))))
}

func (m *Module) Close() error {
	m.Delete()
	return nil
}
func (m *Module) Delete() {
	C.wasm_module_delete((*C.wasm_module_t)(m))
}

func (m *Module) Print() string {
	return string(m.PrintTo(nil))
}

func (m *Module) PrintTo(b []byte) []byte {
	var out C.size_t
	ptr := C.wasm_module_print((*C.wasm_module_t)(m), &out)
	b = append(b, *(*string)(unsafe.Pointer(&reflect.StringHeader{
		Data: uintptr(unsafe.Pointer(ptr)),
		Len:  int(out),
	}))...)
	if ptr == nil {
		return nil
	}
	C.free(unsafe.Pointer(ptr))
	return b
}

func ModuleValidate(binary []byte) bool {
	if len(binary) == 0 {
		return false
	}
	return bool(C.wasm_module_validate((*C.char)(unsafe.Pointer(&binary[0])), (C.size_t)(len(binary))))
}

func (m *Module) NumImports() int {
	return int(C.wasm_module_num_imports((*C.wasm_module_t)(m)))
}

func (m *Module) Import(index int) Import {
	var out C.wasm_import_t
	C.wasm_module_import((*C.wasm_module_t)(m), (C.size_t)(index), &out)
	return *(*Import)(unsafe.Pointer(&out))
}

func (m *Module) Imports(imports []Import) []Import {
	count := m.NumImports()
	if len(imports) > 0 {
		imports = imports[:0]
	}
	for i := 0; i < count; i++ {
		imports = append(imports, m.Import(i))
	}
	return imports
}

func (m *Module) NumExports() int {
	return int(C.wasm_module_num_exports((*C.wasm_module_t)(m)))
}

func (m *Module) Export(index int) Export {
	var out C.wasm_export_t
	C.wasm_module_export((*C.wasm_module_t)(m), (C.size_t)(index), &out)
	return *(*Export)(unsafe.Pointer(&out))
}

func (m *Module) Exports(exports []Export) []Export {
	count := m.NumExports()
	if len(exports) > 0 {
		exports = exports[:0]
	}
	for i := 0; i < count; i++ {
		exports = append(exports, m.Export(i))
	}
	return exports
}
