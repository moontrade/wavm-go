//go:build cgo_safe && !libfuzzer
// +build cgo_safe,!libfuzzer

package worker

// #include "worker.h"
import "C"
import "unsafe"

func callStub() {
	C.moontrade_stub()
}

func (w *Worker) doCall() {
	C.moontrade_call((C.uintptr_t)(uintptr(unsafe.Pointer(&w.Args))), (C.uintptr_t)(0))
}
