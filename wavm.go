package wavm

/*
//#cgo linux,amd64 CXXFLAGS: -std=c++11
//#cgo linux,amd64 LDFLAGS: -lstdc++
#cgo linux,amd64 LDFLAGS: -Wl,-rpath,${SRCDIR}/packaged/lib/linux_amd64 -L${SRCDIR}/packaged/lib/linux_amd64
#cgo darwin,amd64 LDFLAGS: -Wl,-rpath,${SRCDIR}/packaged/lib/darwin_amd64 -L${SRCDIR}/packaged/lib/darwin_amd64
#cgo LDFLAGS: -lWAVM
#include <stdlib.h>
#include "wavm-c.h"
*/
import "C"
import (
	"math"

	_ "github.com/moontrade/wavm-go/packaged"
)

func init() {

}

var (
	EMPTY = C.CString("")
)

const (
	WASMMemoryPageSize        = 0x10000
	WASMMemoryPagesMax        = math.MaxUint32
	WASMTableSizeMax          = math.MaxUint32
	LimitsMaxDefault   uint32 = 0xffffffff
)
