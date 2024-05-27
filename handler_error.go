package main

import (
	"log"
	"net/http"
)

func handleError(w http.ResponseWriter, r *http.Request) {
	log.Printf("Error endpoint")
	respondWithError(w, http.StatusBadRequest, "Something went wrong")
}
