package main

import (
	"fmt"
	"github.com/moontrade/wavm-go/worker"
	"math"
	"os"
	"runtime"
	"runtime/debug"
	"time"
)

func main() {
	var (
		file       []byte
		fileObject []byte
		fileWASM   []byte
		err        error
	)

	if runtime.GOOS == "darwin" {
		println("darwin detected")
		if runtime.GOARCH == "arm64" {
			file, err = os.ReadFile("./main.darwin_arm64")
		} else if runtime.GOARCH == "amd64" {
			file, err = os.ReadFile("./main.darwin_amd64")
			if err != nil {
				panic(err)
			}
			fileObject, err = os.ReadFile("./main_object.darwin_amd64")
		} else {
			panic("unsupported arch")
		}
		if err != nil {
			panic(err)
		}
	} else if runtime.GOOS == "linux" {
		if runtime.GOARCH == "arm64" {
			file, err = os.ReadFile("./main.linux_arm64")
		} else if runtime.GOARCH == "amd64" {
			file, err = os.ReadFile("./main.linux_amd64")
			if err != nil {
				panic(err)
			}
			fileObject, err = os.ReadFile("./main_object.linux_amd64")
		} else {
			panic("unsupported arch")
		}
		if err != nil {
			panic(err)
		}
	}

	fileWASM, _ = os.ReadFile("./main.wasm")
	_ = file
	_ = fileObject
	_ = fileWASM

	info, ok := debug.ReadBuildInfo()
	if ok {
		fmt.Println(info)
	}

	debug.FreeOSMemory()
	loader := worker.NewLoader(worker.DefaultEngine)

	workers := make([]*worker.Worker, 0, 128)
	count := 5000

	println("loading", count, "workers")
	for i := 0; i < count; i++ {
		wkr, err := loader.Load(true, false, file, math.MaxUint16, 8)
		if err != nil {
			panic(err)
		}
		err = wkr.Start()
		if err != nil {
			panic(err)
		}

		workers = append(workers, wkr)

		//wkr.Close()

		var mstats runtime.MemStats
		runtime.ReadMemStats(&mstats)
		var stats debug.GCStats
		debug.ReadGCStats(&stats)
		fmt.Println(stats.NumGC, stats.PauseTotal.String(), time.Duration(stats.NumGC)/stats.PauseTotal, "heap in use", mstats.HeapInuse, "heap sys", mstats.HeapSys)
	}

	for i := 0; i < 100; i++ {
		var stats debug.GCStats
		debug.ReadGCStats(&stats)
		fmt.Println(stats.NumGC, stats.PauseTotal.String())
		time.Sleep(time.Second)
	}

	//for _, wkr := range workers {
	//	err = wkr.Close()
	//	if err != nil {
	//		panic(err)
	//	}
	//}

	//_ = worker.Close()
	time.Sleep(time.Hour)
}
