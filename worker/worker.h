#ifndef __MOONTRADE_WORKER_H
#define __MOONTRADE_WORKER_H

#include <assert.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "wavm-c.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef wasm_trap_t* (*wasm_func_call_t)(wasm_store_t*, const wasm_func_t*, const wasm_val_t[], wasm_val_t[]);

typedef struct moontrade_worker_t
{
	int64_t id;
	struct moontrade_worker_t* next;
	struct moontrade_worker_t* prev;
	wasm_engine_t* engine;
	wasm_compartment_t* compartment;
	wasm_store_t* store;
	wasm_memory_t* memory;
	wasm_func_t* start;
	wasm_func_t* resume;
	wasm_func_t* alloc;
	wasm_func_t* realloc;
	wasm_func_t* free;
	wasm_func_t* stub;
	void* funcCall;
	const char* log;
	int64_t logLen;
	int64_t logCap;
	int64_t begin;
	int64_t end;
	int64_t started;
	int64_t resumeAt;
	int64_t* resumeAtStack;
	int64_t resumeAtStackLen;
	int64_t resumeAtStackCap;
} moontrade_worker_t;

typedef struct moontrade_call_t
{
	moontrade_worker_t* worker;
	wasm_func_t* thunk;
	wasm_func_t* func;
	wasm_trap_t* trap;
	wasm_val_t** args;
	wasm_val_t* results[];
} moontrade_call_t;

void moontrade_stub();

void moontrade_benchmark_stub(moontrade_worker_t* worker, int64_t n);
void moontrade_benchmark_stub_fn(moontrade_worker_t* worker, void* fn, int64_t n);

uint64_t moontrade_now();

wasm_trap_t* moontrade_start(moontrade_worker_t* worker);

wasm_trap_t* moontrade_resume(moontrade_worker_t* worker);

void moontrade_call(uintptr_t arg0, uintptr_t arg1);

//wasm_trap_t* moontrade_call(moontrade_worker_t* worker,
//							const wasm_func_t* func,
//							const wasm_val_t args[],
//							wasm_val_t results[]);

wasm_trap_t* moontrade_fd_write(const wasm_val_t args[], wasm_val_t results[]);

wasm_trap_t* moontrade_clock_time_get(const wasm_val_t args[], wasm_val_t results[]);

wasm_trap_t* moontrade_args_sizes_get(const wasm_val_t args[], wasm_val_t results[]);

wasm_trap_t* moontrade_args_get(const wasm_val_t args[], wasm_val_t results[]);

wasm_trap_t* moontrade_set_timeout(const wasm_val_t args[], wasm_val_t results[]);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // #ifdef __MOONTRADE_WORKER_H
