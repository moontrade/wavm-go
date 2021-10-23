package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type Global C.wasm_global_t

func NewGlobal(
	compartment *Compartment,
	globalType *GlobalType,
	val *Val,
	debugName string,
) *C.wasm_global_t {
	var name *C.char
	if debugName == "" {
		name = EMPTY
	} else {
		name = C.CString(debugName)
		defer C.free(unsafe.Pointer(name))
	}
	return C.wasm_global_new((*C.wasm_compartment_t)(compartment), (*C.wasm_globaltype_t)(globalType), (*C.wasm_val_t)(val), name)
}

func (g *Global) Close() error {
	g.Delete()
	return nil
}

func (g *Global) Delete() {
	C.wasm_global_delete((*C.wasm_global_t)(g))
}

func (g *Global) Type() *GlobalType {
	return (*GlobalType)(C.wasm_global_type((*C.wasm_global_t)(g)))
}

func (g *Global) Get(store *Store) *Val {
	var out C.wasm_val_t //
	C.wasm_global_get((*C.wasm_store_t)(store), (*C.wasm_global_t)(g), &out)
	return (*Val)(&out)
}

//func WASMGlobalSet(global *Global, val *Val) {
//	C.wasm_global_set((*C.wasm_global_t)(global), (*C.wasm_val_t)(val))
//}
//
//func (g *Global) Set(val *Val) {
//	WASMGlobalSet(g, val)
//}
