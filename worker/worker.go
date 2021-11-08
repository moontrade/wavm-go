package worker

/*
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "worker.h"
#include "wavm-c.h"
*/
import "C"
import (
	"fmt"
	"github.com/moontrade/wavm-go"
	"unsafe"
)

func Now() int64 {
	return runtimeNano()
}

type Worker struct {
	id               int64
	next             *Worker
	prev             *Worker
	engine           *wavm.Engine
	compartment      *wavm.Compartment
	store            *wavm.Store
	memory           *wavm.Memory
	start            *wavm.Func
	resume           *wavm.Func
	alloc            *wavm.Func
	realloc          *wavm.Func
	free             *wavm.Func
	stub             *wavm.Func
	funcCall         *C.void // wasm_func_call ptr
	log              *C.char // log buffer managed by C (malloc/free)
	logLen           int64
	logCap           int64
	begin            int64
	end              int64
	started          int64
	resumeAt         int64
	resumeAtStack    *int64 // setTimeout stack managed by C (malloc/free)
	resumeAtStackLen int64
	resumeAtStackCap int64
	Params           []wavm.Val
	Results          []wavm.Val
	Funcs            []*wavm.Func
	Globals          []*wavm.Global
	Tables           []*wavm.Table
	Memories         []*wavm.Memory
	Args             args
}

type args struct {
	worker         uintptr
	thunk          uintptr
	fn             uintptr
	trap           uintptr
	argPointer     uintptr
	resultsPointer uintptr
	args           [8]wavm.Val
	results        [8]wavm.Val
}

func (w *Worker) SetArgI32(index int, value int32) {
	w.Args.args[index].SetI32(value)
}
func (w *Worker) SetArgF32(index int, value float32) {
	w.Args.args[index].SetF32(value)
}
func (w *Worker) SetArgI64(index int, value int64) {
	w.Args.args[index].SetI64(value)
}
func (w *Worker) SetArgF64(index int, value float64) {
	w.Args.args[index].SetF64(value)
}
func (w *Worker) SetArgV128(index int, value wavm.V128T) {
	w.Args.args[index].SetV128(value)
}
func (w *Worker) ResultI32(index int) int32 {
	return w.Args.results[index].I32()
}
func (w *Worker) ResultI64(index int) int64 {
	return w.Args.results[index].I64()
}
func (w *Worker) ResultF32(index int) float32 {
	return w.Args.results[index].F32()
}
func (w *Worker) ResultF64(index int) float64 {
	return w.Args.results[index].F64()
}
func (w *Worker) ResultV128(index int) wavm.V128T {
	return w.Args.results[index].V128()
}

func (w *Worker) init() {
	const (
		secondOffset         = unsafe.Sizeof(uintptr(0))
		argsPointerOffset    = secondOffset + unsafe.Sizeof(uintptr(0))
		argsMax              = 8
		argsSize             = unsafe.Sizeof(wavm.Val{}) * argsMax
		resultsPointerOffset = argsPointerOffset + unsafe.Sizeof(uintptr(0))
	)

	w.Args.worker = uintptr(unsafe.Pointer(w))
	w.Args.argPointer = uintptr(unsafe.Pointer(&w.Args.args[0]))
	w.Args.resultsPointer = uintptr(unsafe.Pointer(&w.Args.results[0]))
}

func (w *Worker) Close() error {
	if w.log != nil {
		C.free(unsafe.Pointer(w.log))
		w.log = nil
	}
	if w.resumeAtStack != nil {
		C.free(unsafe.Pointer(w.resumeAtStack))
		w.resumeAtStack = nil
	}

	w.store.Delete()
	w.compartment.Delete()
	w.engine.Delete()
	return nil
}

func (w *Worker) Start() error {
	w.begin = Now()
	if err := w.Call(w.start); err != nil {
		w.end = Now()
		return err
	}
	w.end = Now()
	w.started = w.end
	return nil
}

var (
	funcCall             = uintptr(unsafe.Pointer(wavm.WASMFuncCall))
	funcCallNoCopy       = uintptr(unsafe.Pointer(wavm.WASMFuncCallNoCopy))
	funcCallNoTrap       = uintptr(unsafe.Pointer(wavm.WASMFuncCallNoTrap))
	funcCallNoCopyNoTrap = uintptr(unsafe.Pointer(wavm.WASMFuncCallNoCopyNoTrap))
)

func (w *Worker) Call(fn *wavm.Func) error {
	w.Args.fn = uintptr(unsafe.Pointer(fn))
	w.Args.thunk = funcCall
	w.Args.trap = 0
	w.doCall()
	if w.Args.trap != 0 {
		trap := (*wavm.Trap)(unsafe.Pointer(w.Args.trap))
		e := fmt.Errorf(trap.String())
		trap.Delete()
		return e
	}
	return nil
}

func (w *Worker) CallNoCopy(fn *wavm.Func) error {
	w.Args.fn = uintptr(unsafe.Pointer(fn))
	w.Args.thunk = funcCallNoCopy
	w.Args.trap = 0
	w.doCall()
	if w.Args.trap != 0 {
		trap := (*wavm.Trap)(unsafe.Pointer(w.Args.trap))
		e := fmt.Errorf(trap.String())
		trap.Delete()
		return e
	}
	return nil
}

func (w *Worker) CallNoTrap(fn *wavm.Func) error {
	w.Args.fn = uintptr(unsafe.Pointer(fn))
	w.Args.thunk = funcCallNoTrap
	w.Args.trap = 0
	w.doCall()
	if w.Args.trap != 0 {
		trap := (*wavm.Trap)(unsafe.Pointer(w.Args.trap))
		e := fmt.Errorf(trap.String())
		trap.Delete()
		return e
	}
	return nil
}

func (w *Worker) CallNoCopyNoTrap(fn *wavm.Func) error {
	w.Args.fn = uintptr(unsafe.Pointer(fn))
	w.Args.thunk = funcCallNoCopyNoTrap
	w.Args.trap = 0
	w.doCall()
	if w.Args.trap != 0 {
		trap := (*wavm.Trap)(unsafe.Pointer(w.Args.trap))
		e := fmt.Errorf(trap.String())
		trap.Delete()
		return e
	}
	return nil
}

////export moontradeSetTimeout
//func moontradeSetTimeout(workerPtr unsafe.Pointer, nanos int64) {
//	worker := (*Worker)(workerPtr)
//	_ = worker
//	println("setTimeout", uintptr(workerPtr), nanos)
//}

func moontrade_fd_write() wavm.FuncCallback {
	return (wavm.FuncCallback)(C.moontrade_fd_write)
}

func moontrade_clock_time_get() wavm.FuncCallback {
	return (wavm.FuncCallback)(C.moontrade_clock_time_get)
}

func moontrade_args_sizes_get() wavm.FuncCallback {
	return (wavm.FuncCallback)(C.moontrade_args_sizes_get)
}

func moontrade_args_get() wavm.FuncCallback {
	return (wavm.FuncCallback)(C.moontrade_args_get)
}

func moontrade_set_timeout() wavm.FuncCallback {
	return (wavm.FuncCallback)(C.moontrade_set_timeout)
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// Testing Stuff
////////////////////////////////////////////////////////////////////////////////////////////////////
func stub_safe() {
	C.moontrade_stub()
}

func stub_fast() {
	callStub()
}

func moontrade_benchmark_stub(worker *Worker, n int) {
	C.moontrade_benchmark_stub((*C.moontrade_worker_t)(unsafe.Pointer(worker)), (C.int64_t)(n))
}

func moontrade_benchmark_stub_no_copy(worker *Worker, n int) {
	C.moontrade_benchmark_stub_fn((*C.moontrade_worker_t)(unsafe.Pointer(worker)), unsafe.Pointer((*C.void)(wavm.WASMFuncCallNoCopy)), (C.int64_t)(n))
}

func moontrade_benchmark_stub_no_trap(worker *Worker, n int) {
	C.moontrade_benchmark_stub_fn((*C.moontrade_worker_t)(unsafe.Pointer(worker)), unsafe.Pointer((*C.void)(wavm.WASMFuncCallNoTrap)), (C.int64_t)(n))
}

func moontrade_benchmark_stub_no_copy_no_trap(worker *Worker, n int) {
	C.moontrade_benchmark_stub_fn((*C.moontrade_worker_t)(unsafe.Pointer(worker)), unsafe.Pointer((*C.void)(wavm.WASMFuncCallNoCopyNoTrap)), (C.int64_t)(n))
}
