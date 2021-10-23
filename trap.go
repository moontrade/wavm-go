package wavm

// #include <stdlib.h>
// #include "wavm-c.h"
import "C"
import "unsafe"

type (
	Trap C.wasm_trap_t

	/*
		typedef struct wasm_frame_t
		{
			wasm_func_t* function;
			size_t instr_index;
		} wasm_frame_t;
	*/
	Frame struct {
		Function   *Func
		InstrIndex C.size_t
	}
)

func NewTrap(compartment *Compartment, message string) *Trap {
	msgbytes := []byte(message)
	return (*Trap)(C.wasm_trap_new(
		(*C.wasm_compartment_t)(compartment),
		(*C.char)(unsafe.Pointer(&msgbytes[0])),
		(C.size_t)(len(msgbytes))))
}

func (t *Trap) Close() error {
	t.Delete()
	return nil
}

func (t *Trap) Delete() {
	C.wasm_trap_delete((*C.wasm_trap_t)(t))
}

func (t *Trap) String() string {
	return string(t.Message(make([]byte, 1024)))
}

func (t *Trap) Error() string {
	return t.String()
}

func (t *Trap) Message(b []byte) []byte {
	if b == nil {
		b = make([]byte, 1024)
	}
	size := C.size_t(len(b))
	C.wasm_trap_message((*C.wasm_trap_t)(t), (*C.char)(unsafe.Pointer(&b[0])), &size)
	if int(size) > len(b) {
		b = make([]byte, int(size))
		C.wasm_trap_message((*C.wasm_trap_t)(t), (*C.char)(unsafe.Pointer(&b[0])), &size)
	}
	return b[0:int(size)]
}

func (t *Trap) StackNumFrames() int {
	return int(C.wasm_trap_stack_num_frames((*C.wasm_trap_t)(t)))
}

func (t *Trap) StackFrame(index int, outFrame *Frame) {
	C.wasm_trap_stack_frame((*C.wasm_trap_t)(t), (C.size_t)(index), (*C.wasm_frame_t)(unsafe.Pointer(outFrame)))
}
