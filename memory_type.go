package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type MemoryType C.wasm_memorytype_t

type Shared uint8

const (
	NOTSHARED = Shared(C.WASM_NOTSHARED)
	SHARED    = Shared(C.WASM_SHARED)
)

type Index uint8

const (
	INDEX_I32 = Index(C.WASM_INDEX_I32)
	INDEX_I64 = Index(C.WASM_INDEX_I64)
)

func NewMemoryType(limits *Limits, shared Shared, index int) *MemoryType {
	return (*MemoryType)(C.wasm_memorytype_new((*C.wasm_limits_t)(unsafe.Pointer(limits)), (C.wasm_shared_t)(shared), (C.wasm_index_t)(index)))
}

func (m *MemoryType) Close() error {
	m.Delete()
	return nil
}

func (m *MemoryType) Delete() {
	C.wasm_memorytype_delete((*C.wasm_memorytype_t)(m))
}

func (m *MemoryType) Limits() *Limits {
	return (*Limits)(unsafe.Pointer(C.wasm_memorytype_limits((*C.wasm_memorytype_t)(m))))
}

func (m *MemoryType) Shared() Shared {
	return (Shared)(C.wasm_memorytype_shared((*C.wasm_memorytype_t)(m)))
}
