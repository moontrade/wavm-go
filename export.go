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
		typedef struct wasm_export_t
		{
			const char* name;
			size_t num_name_bytes;
			wasm_externtype_t* type;
		} wasm_export_t;
	*/
	Export struct {
		name           *C.char
		num_name_bytes C.size_t
		_type          *C.wasm_externtype_t
	}
)

func (w *Export) NameUnsafe() string {
	return *(*string)(unsafe.Pointer(&reflect.StringHeader{
		Data: uintptr(unsafe.Pointer(w.name)),
		Len:  int(w.num_name_bytes),
	}))
}
