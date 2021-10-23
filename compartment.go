package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type Compartment C.wasm_compartment_t

func NewCompartment(engine *Engine, debugName string) *Compartment {
	var name *C.char
	if debugName == "" {
		name = EMPTY
	} else {
		name = C.CString(debugName)
		defer C.free(unsafe.Pointer(name))
	}
	return (*Compartment)(C.wasm_compartment_new((*C.wasm_engine_t)(engine), name))
}

func (c *Compartment) Close() error {
	c.Delete()
	return nil
}

func (c *Compartment) Delete() {
	C.wasm_compartment_delete((*C.wasm_compartment_t)(c))
}

func (c *Compartment) Clone() *Compartment {
	return (*Compartment)(C.wasm_compartment_clone((*C.wasm_compartment_t)(c)))
}

func (c *Compartment) Contains(ref *Ref) bool {
	return bool(C.wasm_compartment_contains((*C.wasm_compartment_t)(c), (*C.wasm_ref_t)(ref)))
}

func (c *Compartment) NewStore(debugName string) *Store {
	return NewStore(c, debugName)
}
