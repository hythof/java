package main

import (
	"os"
	"bytes"
)

func main() {
	if len(os.Args) < 3 {
		println("Usage: go run patch.go [libfoo.so] [libbar.so]")
		return
	}
	bin, err := os.ReadFile(os.Args[1]);
	if err != nil {
		panic(err.Error())
	}
	bin, err = patch(bin)
	if err != nil {
		panic(err.Error())
	}
	err = os.WriteFile(os.Args[2], bin, 0666)
	if err != nil {
		panic(err.Error())
	}
	println("ok");
}

func patch(bin []byte) ([]byte, error) {
	target := []byte{0xa6, 0xff, 0xff, 0x97}
	injection := []byte{0x9f, 0xff, 0xff, 0x97}
	for i:=0; i<len(bin); i+=4 {
		b := bin[i:i+4]
		if bytes.Equal(b, target) {
			for j:=0; j<len(injection); j++ {
				bin[i+j]=injection[j]
			}
			println("*** Replaced ***")
		}
	}
	return bin, nil
}
