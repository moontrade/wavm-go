//go:build !amd64 && !arm64 && !tinygo
// +build !amd64,!arm64,!tinygo

package unsafecgo

import (
	"github.com/moontrade/wavm-go/unsafecgo/cgo"
)

func NonBlocking(fn *byte, arg0, arg1 uintptr) {
	cgo.NonBlocking(fn, arg0, arg1)
}

func Blocking(fn *byte, arg0, arg1 uintptr) {
	cgo.Blocking(fn, arg0, arg1)
}
