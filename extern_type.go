package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"

type (
	ExternType C.wasm_externtype_t
	ExternKind uint8
)

const (
	ExternFunc   = ExternKind(C.WASM_EXTERN_FUNC)
	ExternTable  = ExternKind(C.WASM_EXTERN_TABLE)
	ExternMemory = ExternKind(C.WASM_EXTERN_MEMORY)
	ExternGlobal = ExternKind(C.WASM_EXTERN_GLOBAL)
)

func WASMExternKind(extern *Extern) ExternKind {
	return ExternKind(C.wasm_extern_kind((*C.wasm_extern_t)(extern)))
}

func (e *Extern) AsKind() ExternKind {
	return WASMExternKind(e)
}

func WASMExternType(extern *Extern) *ExternType {
	return (*ExternType)(C.wasm_extern_type((*C.wasm_extern_t)(extern)))
}

func FuncTypeAsExternType(t *FuncType) *ExternType {
	return (*ExternType)(C.wasm_functype_as_externtype((*C.wasm_functype_t)(t)))
}

func GlobalTypeAsExternType(t *GlobalType) *ExternType {
	return (*ExternType)(C.wasm_globaltype_as_externtype((*C.wasm_globaltype_t)(t)))
}

func TableTypeAsExternType(t *TableType) *ExternType {
	return (*ExternType)(C.wasm_tabletype_as_externtype((*C.wasm_tabletype_t)(t)))
}

func MemoryTypeAsExternType(t *MemoryType) *ExternType {
	return (*ExternType)(C.wasm_memorytype_as_externtype((*C.wasm_memorytype_t)(t)))
}

func ExternTypeAsFuncType(t *ExternType) *FuncType {
	return (*FuncType)(C.wasm_externtype_as_functype((*C.wasm_externtype_t)(t)))
}

func ExternTypeAsGlobalType(t *ExternType) *GlobalType {
	return (*GlobalType)(C.wasm_externtype_as_globaltype((*C.wasm_externtype_t)(t)))
}

func ExternTypeAsTableType(t *ExternType) *TableType {
	return (*TableType)(C.wasm_externtype_as_tabletype((*C.wasm_externtype_t)(t)))
}

func ExternTypeAsMemoryType(t *ExternType) *MemoryType {
	return (*MemoryType)(C.wasm_externtype_as_memorytype((*C.wasm_externtype_t)(t)))
}

//func WASMExternType(extern *Extern) *ExternType {
//	return (*ExternType)(C.wasm_extern_type_const((*C.wasm_extern_t)(extern)))
//}

func FuncTypeAsExternTypeConst(t *FuncType) *ExternType {
	return (*ExternType)(C.wasm_functype_as_externtype_const((*C.wasm_functype_t)(t)))
}

func GlobalTypeAsExternTypeConst(t *GlobalType) *ExternType {
	return (*ExternType)(C.wasm_globaltype_as_externtype_const((*C.wasm_globaltype_t)(t)))
}

func TableTypeAsExternTypeConst(t *TableType) *ExternType {
	return (*ExternType)(C.wasm_tabletype_as_externtype_const((*C.wasm_tabletype_t)(t)))
}

func MemoryTypeAsExternTypeConst(t *MemoryType) *ExternType {
	return (*ExternType)(C.wasm_memorytype_as_externtype_const((*C.wasm_memorytype_t)(t)))
}

func ExternTypeAsFuncTypeConst(t *ExternType) *FuncType {
	return (*FuncType)(C.wasm_externtype_as_functype_const((*C.wasm_externtype_t)(t)))
}

func ExternTypeAsGlobalTypeConst(t *ExternType) *GlobalType {
	return (*GlobalType)(C.wasm_externtype_as_globaltype_const((*C.wasm_externtype_t)(t)))
}

func ExternTypeAsTableTypeConst(t *ExternType) *TableType {
	return (*TableType)(C.wasm_externtype_as_tabletype_const((*C.wasm_externtype_t)(t)))
}

func ExternTypeAsMemoryTypeConst(t *ExternType) *MemoryType {
	return (*MemoryType)(C.wasm_externtype_as_memorytype_const((*C.wasm_externtype_t)(t)))
}

//func WASMFuncAsExternConst(fn *Func) *Extern {
//	return (*Extern)(C.wasm_func_as_extern_const((*C.wasm_func_t)(fn)))
//}
//func WASMGlobalAsExternConst(global *Global) *Extern {
//	return (*Extern)(C.wasm_global_as_extern_const((*C.wasm_global_t)(global)))
//}
//func WASMTableAsExternConst(table *Table) *Extern {
//	return (*Extern)(C.wasm_table_as_extern_const((*C.wasm_table_t)(table)))
//}
//func WASMMemoryAsExternConst(memory *Memory) *Extern {
//	return (*Extern)(C.wasm_memory_as_extern_const((*C.wasm_memory_t)(memory)))
//}
//func WASMExternAsFuncConst(extern *Extern) *Func {
//	return (*Func)(C.wasm_extern_as_func_const((*C.wasm_extern_t)(extern)))
//}
//func WASMExternAsGlobalConst(extern *Extern) *Global {
//	return (*Global)(C.wasm_extern_as_global_const((*C.wasm_extern_t)(extern)))
//}
//func WASMExternAsTableConst(extern *Extern) *Table {
//	return (*Table)(C.wasm_extern_as_table_const((*C.wasm_extern_t)(extern)))
//}
//func WASMExternAsMemoryConst(extern *Extern) *Memory {
//	return (*Memory)(C.wasm_extern_as_memory_const((*C.wasm_extern_t)(extern)))
//}
