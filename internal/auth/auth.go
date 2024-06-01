package auth

import (
	"errors"
	"net/http"
	"strings"
)

// GetAPIKey extracts an API key from
// the headers of an HTTP request.
// Example:
// Authorization: ApiKey {insert api key here}
func GetAPIKey(headers http.Header) (string, error) {
	val := headers.Get("Authorization")
	if val == "" {
		return "", errors.New("no authentication info found")
	}

	vals := strings.Split(val, " ")
	if len(vals) != 2 {
		return "", errors.New("malformed auth header")
	}

	if vals[0] != "ApiKey" {
		return "", errors.New("unsupported auth type")
	}

	return vals[1], nil
}
