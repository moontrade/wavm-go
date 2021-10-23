package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"

type Extern C.wasm_extern_t

func (e *Extern) Delete() {
	C.wasm_extern_delete((*C.wasm_extern_t)(e))
}

func (e *Extern) Close() error {
	e.Delete()
	return nil
}

func (f *Func) AsExtern() *Extern {
	return (*Extern)(C.wasm_func_as_extern((*C.wasm_func_t)(f)))
}

func (g *Global) AsExtern() *Extern {
	return (*Extern)(C.wasm_global_as_extern((*C.wasm_global_t)(g)))
}

func (t *Table) AsExtern() *Extern {
	return (*Extern)(C.wasm_table_as_extern((*C.wasm_table_t)(t)))
}

func (m *Memory) AsExtern() *Extern {
	return (*Extern)(C.wasm_memory_as_extern((*C.wasm_memory_t)(m)))
}

func (e *Extern) AsFunc() *Func {
	return (*Func)(C.wasm_extern_as_func((*C.wasm_extern_t)(e)))
}

func (e *Extern) AsGlobal() *Global {
	return (*Global)(C.wasm_extern_as_global((*C.wasm_extern_t)(e)))
}
func (e *Extern) AsTable() *Table {
	return (*Table)(C.wasm_extern_as_table((*C.wasm_extern_t)(e)))
}
func (e *Extern) AsMemory() *Memory {
	return (*Memory)(C.wasm_extern_as_memory((*C.wasm_extern_t)(e)))
}
