package wavm

/*
#include <stdlib.h>
#include "wavm-c.h"

wasm_trap_t* wasm_func_call_no_copy(wasm_store_t*,
								   const wasm_func_t*,
								   const wasm_val_t args[],
								   wasm_val_t results[]);

wasm_trap_t* wasm_func_call_no_trap(wasm_store_t*,
								   const wasm_func_t*,
								   const wasm_val_t args[],
								   wasm_val_t results[]);

wasm_trap_t* wasm_func_call_no_copy_no_trap(wasm_store_t*,
								   			const wasm_func_t*,
										   	const wasm_val_t args[],
										   	wasm_val_t results[]);

*/
import "C"
import "unsafe"

type (
	Func         C.wasm_func_t
	FuncCallback C.wasm_func_callback_t
)

var (
	WASMFuncCall             = C.wasm_func_call
	WASMFuncCallNoCopy       = C.wasm_func_call_no_copy
	WASMFuncCallNoTrap       = C.wasm_func_call_no_trap
	WASMFuncCallNoCopyNoTrap = C.wasm_func_call_no_copy_no_trap
)

func NewFunc(
	compartment *Compartment,
	funcType *FuncType,
	callback FuncCallback,
	debugName string) *Func {
	var name *C.char
	if debugName == "" {
		name = EMPTY
	} else {
		name = C.CString(debugName)
		defer C.free(unsafe.Pointer(name))
	}
	return (*Func)(C.wasm_func_new(
		(*C.wasm_compartment_t)(compartment),
		(*C.wasm_functype_t)(funcType),
		(C.wasm_func_callback_t)(callback),
		name,
	))
}

func (c *Compartment) NewFunc(
	funcType *FuncType,
	callback FuncCallback,
	debugName string,
) *Func {
	return NewFunc(c, funcType, callback, debugName)
}

//func WASMFuncNewWithEnv(
//	compartment *Compartment,
//	funcType *FuncType,
//	callback C.wasm_func_callback_with_env_t,
//	env *C.void,
//	finalizer func(env *C.void),
//	debugName string,
//) *Func {
//	name := C.CString(debugName)
//	defer C.free(unsafe.Pointer(name))
//	return (*Func)(C.wasm_func_new((*C.wasm_compartment_t)(compartment), (*C.wasm_functype_t)(funcType), callback, name))
//}

func (f *Func) Close() error {
	f.Delete()
	return nil
}

func (f *Func) Delete() {
	C.wasm_func_delete((*C.wasm_func_t)(f))
}

func (f *Func) Type() *FuncType {
	return (*FuncType)(C.wasm_func_type((*C.wasm_func_t)(f)))
}

func (f *Func) ParamArity() int {
	return int(C.wasm_func_param_arity((*C.wasm_func_t)(f)))
}

func (f *Func) ResultArity() int {
	return int(C.wasm_func_result_arity((*C.wasm_func_t)(f)))
}

func (f *Func) Call(store *Store, args *Val, results *Val) *Trap {
	return (*Trap)(C.wasm_func_call(
		(*C.wasm_store_t)(store),
		(*C.wasm_func_t)(f),
		(*C.wasm_val_t)(args),
		(*C.wasm_val_t)(results),
	))
}

func (f *Func) CallNoTrap(store *Store, args *Val, results *Val) *Trap {
	return (*Trap)(C.wasm_func_call_no_trap(
		(*C.wasm_store_t)(store),
		(*C.wasm_func_t)(f),
		(*C.wasm_val_t)(args),
		(*C.wasm_val_t)(results),
	))
}

func (f *Func) CallNoCopy(store *Store, args *Val, results *Val) *Trap {
	return (*Trap)(C.wasm_func_call_no_copy(
		(*C.wasm_store_t)(store),
		(*C.wasm_func_t)(f),
		(*C.wasm_val_t)(args),
		(*C.wasm_val_t)(results),
	))
}

func (f *Func) CallUnsafe(store *Store, args *Val, results *Val) *Trap {
	return (*Trap)(C.wasm_func_call_no_copy_no_trap(
		(*C.wasm_store_t)(store),
		(*C.wasm_func_t)(f),
		(*C.wasm_val_t)(args),
		(*C.wasm_val_t)(results),
	))
}
