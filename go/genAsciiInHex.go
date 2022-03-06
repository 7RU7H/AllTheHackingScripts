import main

import (
  "fmt"
	"strconv"
	"strings"
)

func main() {
	fmt.Println(genAsciiHex())
}

// Generate Ascii in Hex
func genAsciiHex() string {
	var hexform string = `\x`
	var zeroAdd string = "0"
	var i int64
	builder := strings.Builder{}
	for i = 0; i <= 256; i++ {
		hexA := strconv.FormatInt(i, 16)
		if len(hexA) > 1 {
			builder.WriteString(hexform + hexA)
		} else {
			builder.WriteString(hexform + zeroAdd + hexA)
		}
	}
	return builder.String()
}
