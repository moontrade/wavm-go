package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"

type Mutability uint8

const (
	CONST = Mutability(C.WASM_CONST)
	VAR   = Mutability(C.WASM_VAR)
)

type GlobalType C.wasm_globaltype_t

func NewGlobalType(valType *ValType, mutability Mutability) *GlobalType {
	return (*GlobalType)(C.wasm_globaltype_new(
		(*C.wasm_valtype_t)(valType),
		(C.wasm_mutability_t)(mutability),
	))
}

func (g *GlobalType) Close() error {
	if g == nil {
		return nil
	}
	g.Delete()
	return nil
}

func (g *GlobalType) Delete() {
	C.wasm_globaltype_delete((*C.wasm_globaltype_t)(g))
}

func (g *GlobalType) Content() *ValType {
	return (*ValType)(C.wasm_globaltype_content((*C.wasm_globaltype_t)(g)))
}

func (g *GlobalType) Mutability() Mutability {
	return (Mutability)(C.wasm_globaltype_mutability((*C.wasm_globaltype_t)(g)))
}
