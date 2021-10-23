package wavm

/*
#include <stdlib.h>
#include "wavm-c.h"

char* wasm_module_compile(wasm_engine_t* engine,
						  const char* wasmBytes,
						  uintptr_t numWASMBytes,
						  uintptr_t* outBytes);

char* wasm_module_compile_object(wasm_engine_t* engine,
								const char* wasmBytes,
								uintptr_t numWASMBytes,
								uintptr_t* outBytes);
*/
import "C"
import (
	"reflect"
	"unsafe"
)

type Engine C.wasm_engine_t

func NewEngine() *Engine {
	return (*Engine)(C.wasm_engine_new())
}

func (e *Engine) Close() error {
	e.Delete()
	return nil
}

func (e *Engine) Delete() {
	C.wasm_engine_delete((*C.wasm_engine_t)(e))
}

func NewEngineWithConfig(config *Config) *Engine {
	return (*Engine)(C.wasm_engine_new_with_config((*C.wasm_config_t)(config)))
}

func (e *Engine) NewCompartment(debugName string) *Compartment {
	return NewCompartment(e, debugName)
}

func (e *Engine) NewModule(binary []byte) *Module {
	return NewModule(e, binary)
}

func (e *Engine) NewPrecompiledModule(binary []byte) *Module {
	return NewModulePrecompiled(e, binary)
}

func (e *Engine) Compile(wasm []byte, out []byte) []byte {
	var size C.uintptr_t
	bytes := C.wasm_module_compile(
		(*C.wasm_engine_t)(e),
		(*C.char)(unsafe.Pointer(&wasm[0])),
		(C.uintptr_t)(len(wasm)),
		&size,
	)
	if bytes == nil {
		return nil
	}
	if len(out) < int(size) {
		out = make([]byte, int(size))
	}
	copy(out, *(*[]byte)(unsafe.Pointer(&reflect.SliceHeader{
		Data: uintptr(unsafe.Pointer(bytes)),
		Len:  int(size),
		Cap:  int(size),
	})))
	// Free
	C.free(unsafe.Pointer(bytes))
	return out[:int(size)]
}

func (e *Engine) CompileObject(wasm []byte, out []byte) []byte {
	var size C.uintptr_t
	bytes := C.wasm_module_compile_object(
		(*C.wasm_engine_t)(e),
		(*C.char)(unsafe.Pointer(&wasm[0])),
		(C.uintptr_t)(len(wasm)),
		&size,
	)
	if bytes == nil {
		return nil
	}
	if len(out) < int(size) {
		out = make([]byte, int(size))
	}
	copy(out, *(*[]byte)(unsafe.Pointer(&reflect.SliceHeader{
		Data: uintptr(unsafe.Pointer(bytes)),
		Len:  int(size),
		Cap:  int(size),
	})))
	// Free
	C.free(unsafe.Pointer(bytes))
	return out[:int(size)]
}
