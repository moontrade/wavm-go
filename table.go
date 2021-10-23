package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type Table C.wasm_table_t

func NewTable(
	compartment *Compartment,
	tableType *TableType,
	init *Ref,
	debugName string) *Table {
	name := C.CString(debugName)
	defer C.free(unsafe.Pointer(name))
	return (*Table)(C.wasm_table_new((*C.wasm_compartment_t)(compartment), (*C.wasm_tabletype_t)(tableType), (*C.wasm_ref_t)(init), name))
}

func (t *Table) Close() error {
	t.Delete()
	return nil
}

func (t *Table) Delete() {
	C.wasm_table_delete((*C.wasm_table_t)(t))
}

func (t *Table) Type() *TableType {
	return (*TableType)(C.wasm_table_type((*C.wasm_table_t)(t)))
}

func (t *Table) Get(index int) *Ref {
	return (*Ref)(C.wasm_table_get((*C.wasm_table_t)(t), (C.wasm_table_size_t)(index)))
}

func (t *Table) Set(index int, value *Ref) bool {
	return bool(C.wasm_table_set((*C.wasm_table_t)(t), (C.wasm_table_size_t)(index), (*C.wasm_ref_t)(value)))
}

func (t *Table) Size() int {
	return int(C.wasm_table_size((*C.wasm_table_t)(t)))
}

func (t *Table) Grow(delta int, init *Ref) (bool, int) {
	var previousSize C.wasm_table_size_t
	ok := bool(C.wasm_table_grow((*C.wasm_table_t)(t), (C.wasm_table_size_t)(delta), (*C.wasm_ref_t)(init), &previousSize))
	return ok, int(previousSize)
}
