package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"

type ValType C.wasm_valtype_t

func NewValType(kind ValKind) *ValType {
	return (*ValType)(C.wasm_valtype_new((C.wasm_valkind_t)(kind)))
}

func (v *ValType) Delete() {
	C.wasm_valtype_delete((*C.wasm_valtype_t)(v))
}

func (v *ValType) Kind() ValKind {
	return ValKind(C.wasm_valtype_kind((*C.wasm_valtype_t)(v)))
}

func (t *ValType) IsNum() bool {
	return t.Kind().IsNum()
}

func (t *ValType) IsRef() bool {
	return t.Kind().IsRef()
}

func ValTypeI32() *ValType {
	return NewValType(I32)
}

func ValTypeI64() *ValType {
	return NewValType(I64)
}

func ValTypeF32() *ValType {
	return NewValType(F32)
}

func ValTypeF64() *ValType {
	return NewValType(F64)
}

func ValTypeV128() *ValType {
	return NewValType(V128)
}

func ValTypeAnyref() *ValType {
	return NewValType(ANYREF)
}

func ValTypeFuncref() *ValType {
	return NewValType(FUNCREF)
}
