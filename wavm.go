package wavm

/*
//#cgo linux,amd64 CXXFLAGS: -std=c++17
//#cgo linux,amd64 LDFLAGS: -lstdc++
//#cgo linux,arm64 CXXFLAGS: -std=c++17
//#cgo linux,arm64 LDFLAGS: -lstdc++
//#cgo darwin,amd64 CXXFLAGS: -std=c++17
//#cgo darwin,arm64 LDFLAGS: -lstdc++
//#cgo darwin,arm64 CXXFLAGS: -std=c++17
//#cgo darwin,arm64 LDFLAGS: -lstdc++
#cgo linux,amd64 LDFLAGS: -Wl,-rpath,./ -L./ -Wl,-rpath,${SRCDIR}/packaged/lib/linux_amd64 -L${SRCDIR}/packaged/lib/linux_amd64
#cgo linux,amd64 LDFLAGS: -lWAVM -lz
#cgo linux,arm64 LDFLAGS: -Wl,-rpath,./ -L./ -Wl,-rpath,${SRCDIR}/packaged/lib/linux_amd64 -L${SRCDIR}/packaged/lib/linux_arm64
#cgo linux,arm64 LDFLAGS: -lWAVM -lz
#cgo darwin,amd64 LDFLAGS: -Wl,-rpath,./ -L./ -L${SRCDIR}/packaged/lib/darwin_amd64
#cgo darwin,arm64 LDFLAGS: -lWAVM -lz
#cgo darwin,arm64 LDFLAGS: -Wl,-rpath,./ -L./ -Wl,-rpath,${SRCDIR}/packaged/lib/darwin_arm64 -L${SRCDIR}/packaged/lib/darwin_arm64
//#cgo darwin,arm64 LDFLAGS: -Wl,-rpath,./ -L./ -L${SRCDIR}/packaged/lib/darwin_arm64
#cgo darwin,arm64 LDFLAGS: -lWAVM -lz
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
