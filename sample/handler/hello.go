package handler

import (
	"fmt"
	"net/http"
)

type HelloHandler struct{}

func NewHelloHandler() *HelloHandler {
	return &HelloHandler{}
}

func (h *HelloHandler) HelloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Println("key1", r.FormValue("key1"))
	w.WriteHeader(http.StatusNoContent)
}
