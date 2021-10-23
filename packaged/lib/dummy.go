// See https://github.com/golang/go/issues/26366.
package lib

import (
	_ "github.com/moontrade/wavm-go/packaged/lib/darwin_amd64"
	_ "github.com/moontrade/wavm-go/packaged/lib/linux_amd64"
)
