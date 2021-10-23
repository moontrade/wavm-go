package worker

import (
	"runtime"
	"sync"
	"time"
)

// Reactor schedules workers to run
type Reactor struct {
	workers map[int64]*Worker
	started int64
	wg      sync.WaitGroup
	mu      sync.Mutex
}

func NewReactor() *Reactor {
	return &Reactor{}
}

func (r *Reactor) Start() {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.started > 0 {
		return
	}

	r.wg.Add(1)
	go r.run()
}

func (r *Reactor) run() {
	defer r.wg.Done()
	// Important for C __thread thread-local storage to work.
	runtime.LockOSThread()
	defer runtime.UnlockOSThread()

	for {
		time.Sleep(time.Second)
	}
}
