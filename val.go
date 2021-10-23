package wavm

/*
#include <stdlib.h>
#include "wavm-c.h"

int32_t wasm_val_get_i32(wasm_val_t* val) {
	return val->i32;
}

int32_t wasm_val_get_i64(wasm_val_t* val) {
	return val->i64;
}

int32_t wasm_val_get_f32(wasm_val_t* val) {
	return val->f32;
}

int32_t wasm_val_get_f64(wasm_val_t* val) {
	return val->f64;
}
*/
import "C"
import "unsafe"

type (
	/*
		typedef union wasm_val_t
		{
			int32_t i32;
			int64_t i64;
			wasm_float32_t f32;
			wasm_float64_t f64;
			wasm_v128_t v128;
			wasm_ref_t* ref;
		} wasm_val_t;
	*/
	Val C.wasm_val_t
	/*
		// NOTE: not 128-bit aligned
		typedef struct wasm_v128_t
		{
			uint64_t u64x2[2];
		} wasm_v128_t;
	*/
	V128T struct {
		u64x2 [2]uint64
	}
)

func ValI32(value int32) Val {
	v := Val{}
	v.SetI32(value)
	return v
}

func ValI64(value int64) Val {
	v := Val{}
	v.SetI64(value)
	return v
}

func ValF32(value float32) Val {
	v := Val{}
	v.SetF32(value)
	return v
}

func ValF64(value float64) Val {
	v := Val{}
	v.SetF64(value)
	return v
}

type ValKind uint8

const (
	I32     = ValKind(C.WASM_I32)
	I64     = ValKind(C.WASM_I64)
	F32     = ValKind(C.WASM_F32)
	F64     = ValKind(C.WASM_F64)
	V128    = ValKind(C.WASM_V128)
	ANYREF  = ValKind(C.WASM_ANYREF)
	FUNCREF = ValKind(C.WASM_FUNCREF)
)

func (k ValKind) IsNum() bool {
	return k < ANYREF
}
func (k ValKind) IsRef() bool {
	return k >= ANYREF
}

func (v *Val) I32() int32 {
	return *(*int32)(unsafe.Pointer(v))
}
func ValGetI32(val *Val) int32 {
	return int32(C.wasm_val_get_i32((*C.wasm_val_t)(val)))
}
func (v *Val) SetI32(value int32) {
	*(*int32)(unsafe.Pointer(v)) = value
}

func (v *Val) I64() int64 {
	return *(*int64)(unsafe.Pointer(v))
}
func ValGetI64(val *Val) int64 {
	return int64(C.wasm_val_get_i64((*C.wasm_val_t)(val)))
}
func (v *Val) SetI64(value int64) {
	*(*int64)(unsafe.Pointer(v)) = value
}

func (v *Val) F32() float32 {
	return *(*float32)(unsafe.Pointer(v))
}
func ValGetF32(val *Val) float32 {
	return float32(C.wasm_val_get_f32((*C.wasm_val_t)(val)))
}
func (v *Val) SetF32(value float32) {
	*(*float32)(unsafe.Pointer(v)) = value
}

func (v *Val) F64() float64 {
	return *(*float64)(unsafe.Pointer(v))
}
func ValGetF64(val *Val) float64 {
	return float64(C.wasm_val_get_f64((*C.wasm_val_t)(val)))
}
func (v *Val) SetF64(value float64) {
	*(*float64)(unsafe.Pointer(v)) = value
}

func (v *Val) V128() V128T {
	return *(*V128T)(unsafe.Pointer(v))
}
func (v *Val) SetV128(value V128T) {
	*(*V128T)(unsafe.Pointer(v)) = value
}

func (v *Val) Ref32() uint32 {
	return *(*uint32)(unsafe.Pointer(v))
}
func (v *Val) SetRef32(value uint32) {
	*(*uint32)(unsafe.Pointer(v)) = value
}

func (v *Val) Ref64() uint64 {
	return *(*uint64)(unsafe.Pointer(v))
}
func (v *Val) SetRef64(value uint64) {
	*(*uint64)(unsafe.Pointer(v)) = value
}
