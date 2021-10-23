#include "worker.h"

#if defined(__APPLE__) || defined(__MACH__)
#include <mach/mach_time.h>
#endif

#ifndef unlikely
#   if (defined(__GNUC__) || __has_builtin(__builtin_expect)) && !defined(__COVERITY__)
#       define unlikely(cond) __builtin_expect(!!(cond), 0)
#   else
#       define unlikely(x) (!!(x))
#   endif
#endif /* unlikely */

static __thread moontrade_worker_t* WORKER;

void moontrade_stub() {}

uint64_t moontrade_now(void) {
#if defined(_WIN32) || defined(_WIN64)
  LARGE_INTEGER counter;
  counter.QuadPart = 0;
  QueryPerformanceCounter(&counter);
  return counter.QuadPart;
#elif defined(__APPLE__) || defined(__MACH__)
  return mach_absolute_time();
#else

#if defined(__linux__) || defined(__gnu_linux__)
//  static clockid_t posix_clockid = -1;
//  if (unlikely(posix_clockid < 0))
//    posix_clockid = choice_monoclock();
#elif defined(CLOCK_MONOTONIC)
#define posix_clockid CLOCK_MONOTONIC
#else
#define posix_clockid CLOCK_REALTIME
#endif

  struct timespec ts;
  if (unlikely(clock_gettime(CLOCK_MONOTONIC, &ts) != 0)) {
    ts.tv_nsec = 0;
    ts.tv_sec = 0;
  }
  return (uint64_t)ts.tv_sec * (uint64_t)1000000000 + (uint64_t)ts.tv_nsec;
#endif
}

// int64_t moontrade_now() {
// 	struct timespec t;
// 	clock_gettime(CLOCK_MONOTONIC, &t);
// 	return ((int64_t)t.tv_sec * (int64_t)1000000000) + (int64_t)t.tv_nsec;
// }

static inline int64_t now() {
	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return ((int64_t)t.tv_sec * (int64_t)1000000000) + (int64_t)t.tv_nsec;
}

void moontrade_benchmark_stub(moontrade_worker_t* worker, int64_t n) {
	WORKER = worker;
	for (int64_t i = 0; i < n; i++) {
		WORKER = worker;
		wasm_trap_t* trap = ((wasm_func_call_t)worker->funcCall)(worker->store, worker->stub, NULL, NULL);
		if (trap != NULL) {

		}
	}
}

static wasm_trap_t* do_stub_call(moontrade_worker_t* worker,
							void* fn,
							const wasm_val_t args[],
							wasm_val_t results[]) {
	WORKER = worker;
//	worker->begin = now();
	wasm_trap_t* trap = ((wasm_func_call_t)fn)(worker->store, worker->stub, NULL, NULL);
//	wasm_trap_t* trap = ((wasm_func_call_t)worker->funcCall)(worker->store, func, args, results);
//	worker->end = now();
	return trap;
}

void moontrade_benchmark_stub_fn(moontrade_worker_t* worker, void* fn, int64_t n) {
	WORKER = worker;
	for (int64_t i = 0; i < n; i++) {
		WORKER = worker;
//		do_stub_call(worker, worker->stub, NULL, NULL);
		((wasm_func_call_t)fn)(worker->store, worker->stub, NULL, NULL);
	}
}

wasm_trap_t* moontrade_start(moontrade_worker_t* worker) {
	WORKER = worker;
	worker->resumeAt = 0;
//	worker->begin = now();
	wasm_trap_t* trap = ((wasm_func_call_t)worker->funcCall)(worker->store, worker->start, NULL, NULL);
//	worker->end = now();
	printf("WASM moontrade_start: %llu ns\n", (long long unsigned)worker->end - (long long unsigned)worker->begin);
	return trap;
}

wasm_trap_t* moontrade_resume(moontrade_worker_t* worker) {
	WORKER = worker;
	worker->resumeAt = 0;
//	worker->begin = now();
	wasm_trap_t* trap = ((wasm_func_call_t)worker->funcCall)(worker->store, worker->resume, NULL, NULL);
//	worker->end = now();
	printf("WASM moontrade_resume: %llu\n", (long long unsigned)WORKER->begin);
	return trap;
}

void moontrade_call(uintptr_t arg0, uintptr_t arg1) {
	//printf("moontrade_call_fuzzer\n");
	// Cast first arg to moontrade_call_t*
	moontrade_call_t* call = (moontrade_call_t*)arg0;
	WORKER = call->worker;
	call->trap = ((wasm_func_call_t)call->thunk)(call->worker->store, call->func, *(call->args), *(call->results));
}

//wasm_trap_t* moontrade_call(moontrade_worker_t* worker,
//							const wasm_func_t* func,
//							const wasm_val_t args[],
//							wasm_val_t results[]) {
//	WORKER = worker;
////	printf("moontrade_call\n");
////	worker->begin = now();
//	wasm_trap_t* trap = ((wasm_func_call_t)worker->funcCall)(worker->store, func, args, results);
////	worker->end = now();
//	return trap;
//}

// fd_write
wasm_trap_t* moontrade_fd_write(const wasm_val_t args[], wasm_val_t results[]) {
	struct moontrade_worker_t* worker = WORKER;

//	printf("WASM fd_write: %llu\n", (uint64_t)WORKER->begin);

	// Append to worker log buffer
	return NULL;
}

// clock_time_get
wasm_trap_t* moontrade_clock_time_get(const wasm_val_t args[], wasm_val_t results[]) {
	//printf("WASM clock_time_get\n");
	struct timespec now;
	clock_gettime(CLOCK_REALTIME, &now);
	//system_clock::time_point begin = system_clock::now();
	int64_t epoch = ((int64_t)now.tv_sec * (int64_t)1000000000) + (int64_t)now.tv_nsec;

//	printf("WASM clock_time_get: %llu\n", (uint64_t)epoch);
	return NULL;
}

// args_sizes_get
wasm_trap_t* moontrade_args_sizes_get(const wasm_val_t args[], wasm_val_t results[]) {
	struct moontrade_worker_t* worker = WORKER;
//	printf("WASM args_sizes_get_001\n");
	return NULL;
}

// args_get
wasm_trap_t* moontrade_args_get(const wasm_val_t args[], wasm_val_t results[]) {
	struct moontrade_worker_t* worker = WORKER;
//	printf("WASM args_get_001: %i\n", args[0].i32);
	return NULL;
}

// set_timeout
wasm_trap_t* moontrade_set_timeout(const wasm_val_t args[], wasm_val_t results[]) {
	struct moontrade_worker_t* worker = WORKER;

	// Calculate resumeAt
	int64_t resumeAt = now() + (int64_t)args[0].i64;

	// Update worker resumeAt if earlier
	int64_t currentResumeAt = worker->resumeAt;
	if (currentResumeAt == 0 || resumeAt < currentResumeAt) {
		worker->resumeAt = resumeAt;

		if (currentResumeAt > 0) {
			if (worker->resumeAtStackLen >= 128) {
				return NULL;
			}
			// Push into sleep buffer
			if (worker->resumeAtStack == NULL) {
				worker->resumeAtStack = (int64_t*)malloc(sizeof(int64_t)*8);
			}
		}
	}

	printf("WASM set_timeout: worker: %llu  nanos: %llu  resumeAt: %llu\n", (long long unsigned)worker->id, (long long unsigned)args[0].i64, (long long unsigned)resumeAt);
//	moontradeSetTimeout((void*)WORKER, (int64_t)args[0].i64);
	return NULL;
}