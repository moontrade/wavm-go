package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type FuncType C.wasm_functype_t

func NewFuncType(params []*ValType, results []*ValType) *FuncType {
	var _params **C.wasm_valtype_t
	var _results **C.wasm_valtype_t

	if len(params) > 0 {
		_params = (**C.wasm_valtype_t)(unsafe.Pointer(&params[0]))
	} else {
		_params = nil
	}
	if len(results) > 0 {
		_results = (**C.wasm_valtype_t)(unsafe.Pointer(&results[0]))
	} else {
		_results = nil
	}

	return (*FuncType)(C.wasm_functype_new(
		_params,
		(C.size_t)(len(params)),
		_results,
		(C.size_t)(len(results)),
	))
}

func (f *FuncType) Close() error {
	f.Delete()
	return nil
}

func (f *FuncType) Delete() {
	C.wasm_functype_delete((*C.wasm_functype_t)(f))
}

func (f *FuncType) NumParams() int {
	return int(C.wasm_functype_num_params((*C.wasm_functype_t)(f)))
}

func (f *FuncType) Param(index int) *ValType {
	return (*ValType)(C.wasm_functype_param((*C.wasm_functype_t)(f), (C.size_t)(index)))
}

func (f *FuncType) NumResults() int {
	return int(C.wasm_functype_num_results((*C.wasm_functype_t)(f)))
}

func (f *FuncType) Result(index int) *ValType {
	return (*ValType)(C.wasm_functype_result((*C.wasm_functype_t)(f), (C.size_t)(index)))
}

func FuncType_0_0() *FuncType {
	return NewFuncType(nil, nil)
}

func FuncType_2_0(
	p1 *ValType,
	p2 *ValType,
) *FuncType {
	p := [2]*ValType{p1, p2}
	return NewFuncType(p[0:2], nil)
}

func FuncType_3_0(
	p1 *ValType,
	p2 *ValType,
	p3 *ValType,
) *FuncType {
	p := [3]*ValType{p1, p2, p3}
	return NewFuncType(p[0:3], nil)
}

func FuncType_0_1(r1 *ValType) *FuncType {
	r := [1]*ValType{r1}
	return NewFuncType(nil, r[0:1])
}

func FuncType_1_0(
	p1 *ValType,
) *FuncType {
	p := [1]*ValType{p1}
	return NewFuncType(p[0:1], nil)
}

func FuncType_1_1(
	p1 *ValType,
	r1 *ValType,
) *FuncType {
	p := [1]*ValType{p1}
	r := [1]*ValType{r1}
	return NewFuncType(p[0:1], r[0:1])
}

func FuncType_2_1(
	p1 *ValType,
	p2 *ValType,
	r1 *ValType,
) *FuncType {
	p := [2]*ValType{p1, p2}
	r := [1]*ValType{r1}
	return NewFuncType(p[0:2], r[0:1])
}

func FuncType_3_1(
	p1 *ValType,
	p2 *ValType,
	p3 *ValType,
	r1 *ValType,
) *FuncType {
	p := [3]*ValType{p1, p2, p3}
	r := [1]*ValType{r1}
	return NewFuncType(p[0:3], r[0:1])
}

func FuncType_0_2(
	r1 *ValType,
	r2 *ValType,
) *FuncType {
	r := [2]*ValType{r1, r2}
	return NewFuncType(nil, r[0:2])
}

func FuncType_1_2(
	p1 *ValType,
	r1 *ValType,
	r2 *ValType,
) *FuncType {
	p := [1]*ValType{p1}
	r := [2]*ValType{r1, r2}
	return NewFuncType(p[0:1], r[0:2])
}

func FuncType_2_2(
	p1 *ValType,
	p2 *ValType,
	r1 *ValType,
	r2 *ValType,
) *FuncType {
	p := [2]*ValType{p1, p2}
	r := [2]*ValType{r1, r2}
	return NewFuncType(p[0:2], r[0:2])
}

func FuncType_3_2(
	p1 *ValType,
	p2 *ValType,
	p3 *ValType,
	r1 *ValType,
	r2 *ValType,
) *FuncType {
	p := [3]*ValType{p1, p2, p3}
	r := [2]*ValType{r1, r2}
	return NewFuncType(p[0:3], r[0:2])
}

func FuncType_4_1(
	p1 *ValType,
	p2 *ValType,
	p3 *ValType,
	p4 *ValType,
	r1 *ValType,
) *FuncType {
	p := [4]*ValType{p1, p2, p3, p4}
	r := [1]*ValType{r1}
	return NewFuncType(p[0:4], r[0:1])
}
