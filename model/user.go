package model

import "errors"

// User is a representation of a User. Dah.
type User struct {
	FirstName string `json:"firstName" pact:"example=Sally"`
	LastName  string `json:"lastName" pact:"example=McSmiley Face😀😍"`
	Username  string `json:"username" pact:"example=sally"`
	Type      string `json:"type" pact:"example=admin,regex=^(admin|user|guest)$"`
	ID        int    `json:"id" pact:"example=10"`
}

var (
	// ErrNotFound represents a resource not found (404)
	ErrNotFound = errors.New("not found")

	// ErrUnauthorized represents a Forbidden (403)
	ErrUnauthorized = errors.New("unauthorized")

	// ErrEmpty is returned when input string is empty
	ErrEmpty = errors.New("empty string")
)

// LoginRequest is the login request API struct.
type LoginRequest struct {
	Username string `json:"username" pact:"example=sally"`
	Password string `json:"password" pact:"example=badpassword"`
}

// LoginResponse is the login response API struct.
type LoginResponse struct {
	User *User `json:"user"`
}
