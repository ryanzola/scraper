package main

import (
	"log"
	"net/http"
)

func handleReadiness(w http.ResponseWriter, r *http.Request) {
	log.Printf("Readiness check")
	respondWithJSON(w, 200, struct{}{})
}
