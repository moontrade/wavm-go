//go:build !cgo_safe && !libfuzzer
// +build !cgo_safe,!libfuzzer

package worker

// #include "worker.h"
import "C"
import (
	"unsafe"

	"github.com/moontrade/wavm-go/unsafecgo"
)

func callStub() {
	unsafecgo.NonBlocking((*byte)(C.moontrade_stub), 0, 0)
}

func (w *Worker) doCall() {
	unsafecgo.NonBlocking((*byte)(C.moontrade_call), uintptr(unsafe.Pointer(&w.Args)), 0)
}

func now() {
	unsafecgo.NonBlocking((*byte)(C.moontrade_now), 0, 0)
}
