package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import (
	"reflect"
	"unsafe"
)

type (
	/*
		typedef struct wasm_import_t
		{
			const char* module;
			size_t num_module_bytes;
			const char* name;
			size_t num_name_bytes;
			wasm_externtype_t* type;
		} wasm_import_t;
	*/
	Import struct {
		module           *C.char
		num_module_bytes C.size_t
		name             *C.char
		num_name_bytes   C.size_t
		_type            *C.wasm_externtype_t
	}
)

func (w *Import) Module() string {
	return string(*(*string)(unsafe.Pointer(&reflect.StringHeader{
		Data: uintptr(unsafe.Pointer(w.module)),
		Len:  int(w.num_module_bytes),
	})))
}

func (w *Import) ModuleUnsafe() string {
	return *(*string)(unsafe.Pointer(&reflect.StringHeader{
		Data: uintptr(unsafe.Pointer(w.module)),
		Len:  int(w.num_module_bytes),
	}))
}

func (w *Import) Name() string {
	return string(w.NameUnsafe())
}

func (w *Import) NameUnsafe() string {
	return *(*string)(unsafe.Pointer(&reflect.StringHeader{
		Data: uintptr(unsafe.Pointer(w.name)),
		Len:  int(w.num_name_bytes),
	}))
}
