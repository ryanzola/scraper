package main

import (
	"fmt"
	"net/http"

	"github.com/ryanzola/scraper/internal/auth"
	"github.com/ryanzola/scraper/internal/database"
)

type authedHandler func(http.ResponseWriter, *http.Request, database.User)

func (apiCfg *apiConfig) middlewareAuth(handler authedHandler) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// fmt.print a quote from the tv show "Friends"
		fmt.Println("Pivot! Pivot! Pivot!")
		key, err := auth.GetAPIKey(r.Header)
		if err != nil {
			respondWithError(w, http.StatusForbidden, fmt.Sprintf("authentication error: %v", err))
			return
		}

		user, err := apiCfg.DB.GetUserByAPIKey(r.Context(), key)
		if err != nil {
			respondWithError(w, http.StatusBadRequest, fmt.Sprintf("error getting user: %v", err))
			return
		}

		handler(w, r, user)
	}
}
