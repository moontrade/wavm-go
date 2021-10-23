package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type TableType C.wasm_tabletype_t

func NewTableType(t *ValType, limits *Limits, shared Shared, index int) *TableType {
	return (*TableType)(C.wasm_tabletype_new(
		(*C.wasm_valtype_t)(t),
		(*C.wasm_limits_t)(unsafe.Pointer(limits)),
		(C.wasm_shared_t)(shared),
		(C.wasm_index_t)(index),
	))
}

func (t *TableType) Close() error {
	t.Delete()
	return nil
}

func (t *TableType) Delete() {
	C.wasm_tabletype_delete((*C.wasm_tabletype_t)(t))
}

func (t *TableType) Element() *ValType {
	return (*ValType)(C.wasm_tabletype_element((*C.wasm_tabletype_t)(t)))
}

func (t *TableType) Limits() *Limits {
	return (*Limits)(unsafe.Pointer(C.wasm_tabletype_limits((*C.wasm_tabletype_t)(t))))
}

func (t *TableType) Shared() Shared {
	return (Shared)(C.wasm_tabletype_shared((*C.wasm_tabletype_t)(t)))
}
