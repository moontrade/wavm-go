package worker

import (
	"os"
	"runtime"
	"testing"
	"time"

	"github.com/moontrade/wavm-go"
	"github.com/moontrade/wavm-go/worker/tsc"
)

var (
	file       []byte
	fileObject []byte
	fileWASM   []byte
)

func init() {
	if runtime.GOOS == "darwin" {
		file, _ = os.ReadFile("testdata/main.darwin_amd64")
		fileObject, _ = os.ReadFile("testdata/main_object.darwin_amd64")
	} else if runtime.GOOS == "linux" {
		file, _ = os.ReadFile("testdata/main.linux_amd64")
		fileObject, _ = os.ReadFile("testdata/main_object.linux_amd64")
	}
	fileWASM, _ = os.ReadFile("testdata/main.wasm")
}

func BenchmarkCGO(b *testing.B) {
	b.Run("cgo unsafe", func(b *testing.B) {
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			stub_fast()
		}
	})
	b.Run("cgo", func(b *testing.B) {
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			stub_safe()
		}
	})
}

func BenchmarkClock(b *testing.B) {
	//nanos := tsc.UnixNano()
	//println("monotonic", nanos, time.UnixMicro(nanos/1000).String())

	b.Run("time.Now()", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			time.Now().UnixNano()
		}
	})

	b.Run("tsc.UnixNano()", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			tsc.UnixNano()
		}
	})

	b.Run("runtime.nanoTime", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			runtimeNano()
		}
	})

	b.Run("cgo now", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			now()
		}
	})
}

func TestCompile(t *testing.T) {
	engine := wavm.NewEngine()
	buf := engine.Compile(fileWASM, nil)
	println("precompiled module", len(buf))
	os.WriteFile("testdata/main.linux_amd64", buf, 0755)

	buf = engine.CompileObject(fileWASM, buf)
	println("object", len(buf))
}

func BenchmarkCompile(b *testing.B) {
	buf := make([]byte, 128000)
	engine := wavm.NewEngine()

	b.ResetTimer()
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		buf = engine.Compile(fileWASM, buf)
		_ = buf
	}
}

func TestLoader(t *testing.T) {
	runtime.LockOSThread()
	defer runtime.UnlockOSThread()

	loader := NewLoader(DefaultEngine)
	worker, err := loader.Load(true, true, file)
	if err != nil {
		t.Fatal(err)
	}

	//Resume(worker)
	err = worker.Start()
	if err != nil {
		t.Fatal(err)
	}
	println("start took", time.Duration(worker.end-worker.begin).String())

	// Cache the Thunk
	_ = worker.Call(worker.stub)
	start := time.Now()
	err = worker.Call(worker.stub)
	if err != nil {
		t.Fatal(err)
	}
	println("stub_safe took", time.Now().Sub(start).String())

	_ = worker.Close()
	time.Sleep(time.Second)
}

func BenchmarkLoader(b *testing.B) {
	b.Run("Precompiled", func(b *testing.B) {
		loader := NewLoader(DefaultEngine)
		b.ResetTimer()
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			worker, err := loader.Load(true, false, file)
			if err != nil {
				b.Fatal(err)
			}
			_ = worker
			_ = worker.Close()
		}
		b.StopTimer()
		_ = loader.Close()
	})

	b.Run("Object", func(b *testing.B) {
		loader := NewLoader(DefaultEngine)
		b.ResetTimer()
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			worker, err := loader.Load(true, false, file)
			if err != nil {
				b.Fatal(err)
			}
			_ = worker
			_ = worker.Close()
		}
		b.StopTimer()
		_ = loader.Close()
	})
}

func BenchmarkStub(b *testing.B) {
	var (
		testRawBaseline = false
	)
	b.Run("Copy and Trap", func(b *testing.B) {
		//runtime.LockOSThread()
		//defer runtime.UnlockOSThread()
		loader := NewLoader(DefaultEngine)
		worker, err := loader.Load(true, false, file)
		err = worker.Call(worker.stub)
		b.ResetTimer()
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			err = worker.Call(worker.stub)
			if err != nil {
				b.Fatal(err)
			}
		}
		b.StopTimer()
		_ = loader.Close()
	})
	b.Run("No Copy", func(b *testing.B) {
		runtime.LockOSThread()
		defer runtime.UnlockOSThread()
		loader := NewLoader(DefaultEngine)
		worker, err := loader.Load(true, false, file)
		err = worker.CallNoCopy(worker.stub)
		b.ResetTimer()
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			err = worker.CallNoCopy(worker.stub)
			if err != nil {
				b.Fatal(err)
			}
		}
		b.StopTimer()
		_ = loader.Close()
	})
	b.Run("No Trap", func(b *testing.B) {
		runtime.LockOSThread()
		defer runtime.UnlockOSThread()
		loader := NewLoader(DefaultEngine)
		worker, err := loader.Load(true, false, file)
		err = worker.CallNoTrap(worker.stub)
		b.ResetTimer()
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			err = worker.CallNoTrap(worker.stub)
			if err != nil {
				b.Fatal(err)
			}
		}
		b.StopTimer()
		_ = loader.Close()
	})
	b.Run("No Copy and No Trap", func(b *testing.B) {
		runtime.LockOSThread()
		defer runtime.UnlockOSThread()
		loader := NewLoader(DefaultEngine)
		worker, err := loader.Load(true, false, file)
		err = worker.CallNoCopyNoTrap(worker.stub)
		_, _ = worker, err
		b.ResetTimer()
		b.ReportAllocs()
		for i := 0; i < b.N; i++ {
			//stub_safe()
			err = worker.CallNoCopyNoTrap(worker.stub)
			//if err != nil {
			//	b.Fatal(err)
			//}
		}
		b.StopTimer()
		_ = loader.Close()
	})

	if testRawBaseline {
		b.Run("Default No CGO", func(b *testing.B) {
			runtime.LockOSThread()
			defer runtime.UnlockOSThread()
			loader := NewLoader(DefaultEngine)
			worker, _ := loader.Load(true, false, file)
			b.ResetTimer()
			b.ReportAllocs()
			moontrade_benchmark_stub(worker, b.N)
			b.StopTimer()
			_ = loader.Close()
		})
		b.Run("Default No CGO No Copy", func(b *testing.B) {
			runtime.LockOSThread()
			defer runtime.UnlockOSThread()
			loader := NewLoader(DefaultEngine)
			worker, _ := loader.Load(true, false, file)
			b.ResetTimer()
			b.ReportAllocs()
			moontrade_benchmark_stub_no_copy(worker, b.N)
			b.StopTimer()
			_ = loader.Close()
		})
		b.Run("Default No CGO No Trap", func(b *testing.B) {
			runtime.LockOSThread()
			defer runtime.UnlockOSThread()
			loader := NewLoader(DefaultEngine)
			worker, _ := loader.Load(true, false, file)
			b.ResetTimer()
			b.ReportAllocs()
			moontrade_benchmark_stub_no_trap(worker, b.N)
			b.StopTimer()
			_ = loader.Close()
		})
		b.Run("Default No CGO No Copy No Trap", func(b *testing.B) {
			runtime.LockOSThread()
			defer runtime.UnlockOSThread()
			loader := NewLoader(DefaultEngine)
			worker, _ := loader.Load(true, false, file)
			b.ResetTimer()
			b.ReportAllocs()
			moontrade_benchmark_stub_no_copy_no_trap(worker, b.N)
			b.StopTimer()
			_ = loader.Close()
		})
	}
}

func BenchmarkLoadModule(b *testing.B) {
	engine := wavm.NewEngine()
	b.Run("WASM", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			wavm.NewModule(engine, fileWASM)
		}
	})

	b.Run("Compiled", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			wavm.NewModulePrecompiled(engine, file)
		}
	})
}
