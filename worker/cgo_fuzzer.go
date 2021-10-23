//go:build libfuzzer
// +build libfuzzer

package worker

// #include "worker.h"
import "C"
import "unsafe"

//go:linkname libfuzzerCall runtime.libfuzzerCall
func libfuzzerCall(fn *byte, arg0, arg1 uintptr)

func callStub() {
	libfuzzerCall((*byte)(C.moontrade_stub), 0, 0)
}

func (w *Worker) doCall() {
	libfuzzerCall((*byte)(C.moontrade_call), uintptr(unsafe.Pointer(&w.Args)), 0)
}

func now() {
	libfuzzerCall((*byte)(C.moontrade_now), 0, 0)
}
