package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"

type Memory C.wasm_memory_t

//func NewMemory(compartment *C.wasm_compartment_t, memoryType *C.wasm_memorytype_t, debugName string) *C.wasm_memory_t {
//	var name *C.char
//	if debugName == "" {
//		name = EMPTY
//	} else {
//		name = C.CString(debugName)
//		defer C.free(unsafe.Pointer(name))
//	}
//	return C.wasm_memory_new(compartment, memoryType, name)
//}

func (m *Memory) Close() error {
	m.Delete()
	return nil
}

func (m *Memory) Delete() {
	C.wasm_memory_delete((*C.wasm_memory_t)(m))
}

func (m *Memory) Data() *C.char {
	return C.wasm_memory_data((*C.wasm_memory_t)(m))
}

func (m *Memory) Size() int {
	return int(C.wasm_memory_data_size((*C.wasm_memory_t)(m)))
}

func (m *Memory) Pages() int {
	return int(C.wasm_memory_size((*C.wasm_memory_t)(m)))
}

func (m *Memory) Grow(delta int) (bool, int) {
	var previousSize C.wasm_memory_pages_t
	ok := bool(C.wasm_memory_grow((*C.wasm_memory_t)(m), (C.wasm_memory_pages_t)(delta), &previousSize))
	return ok, int(previousSize)
}
