package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type Foreign C.wasm_foreign_t

func NewForeign(compartment *Compartment, debugName string) *Foreign {
	var name *C.char
	if debugName == "" {
		name = EMPTY
	} else {
		name = C.CString(debugName)
		defer C.free(unsafe.Pointer(name))
	}
	return (*Foreign)(C.wasm_foreign_new((*C.wasm_compartment_t)(compartment), name))
}

func (f *Foreign) Close() error {
	f.Delete()
	return nil
}

func (f *Foreign) Delete() {
	C.wasm_foreign_delete((*C.wasm_foreign_t)(f))
}
