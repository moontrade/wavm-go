package main

import (
	"os"
	"runtime"
	"time"

	"github.com/moontrade/wavm-go/worker"
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
	_ = fileObject
	_ = fileWASM

	loader := worker.NewLoader(worker.DefaultEngine)

	workers := make([]*worker.Worker, 0, 128)
	count := 5000

	println("loading", count, "workers")
	for i := 0; i < count; i++ {
		worker, err := loader.Load(true, false, file)
		if err != nil {
			panic(err)
		}
		err = worker.Start()
		if err != nil {
			panic(err)
		}

		workers = append(workers, worker)
	}

	//_ = worker.Close()
	time.Sleep(time.Hour)
}
