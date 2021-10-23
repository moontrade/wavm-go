package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type Store C.wasm_store_t

func NewStore(compartment *Compartment, debugName string) *Store {
	var name *C.char
	if debugName == "" {
		name = EMPTY
	} else {
		name = C.CString(debugName)
		defer C.free(unsafe.Pointer(name))
	}
	return (*Store)(C.wasm_store_new((*C.wasm_compartment_t)(compartment), name))
}

func (s *Store) Close() error {
	s.Delete()
	return nil
}

func (s *Store) Delete() {
	C.wasm_store_delete((*C.wasm_store_t)(s))
}

func (s *Store) Call(fn *Func, args *Val, results *Val) *Trap {
	return fn.Call(s, args, results)
}
