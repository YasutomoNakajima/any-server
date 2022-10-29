package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/handlers"
)

func main() {
	protocol := "http"
	host := "localhost"
	port := 8080

	http.Handle("/", handlers.CombinedLoggingHandler(os.Stderr, http.FileServer(http.Dir("root/"))))

	// WEBサーバ起動
	log.Printf("Server listening on %s://%s:%v/", protocol, host, port)
	log.Print(http.ListenAndServe(fmt.Sprintf("%s:%v", host, port), nil))
}
