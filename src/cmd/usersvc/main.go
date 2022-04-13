package main

import (
	"log"
	"net"
	"net/http"

	"github.com/sonzqn/pact-provider-go/src"
)

func main() {
	mux := provider.GetHTTPHandler()

	ln, err := net.Listen("tcp", ":8088")
	if err != nil {
		log.Fatal(err)
	}
	defer ln.Close()

	log.Printf("API starting: port %d (%s)", 8080, ln.Addr())
	log.Printf("API terminating: %v", http.Serve(ln, mux))
}
