package main

import (
	"net/http"
	"sample/handler"
)

func main() {
	// 「/hoge」に対する処理を追加
	helloHandler := handler.NewHelloHandler()
	http.HandleFunc("/Hello/World", helloHandler.HelloWorld)

	//ローカルホストの8080ポートをリッスン
	http.ListenAndServe("localhost:8080", nil)
}
