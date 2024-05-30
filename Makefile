build:
	@go build -o bin/scraper

run: build
	@./bin/scraper

migrate-up:
	@goose -dir ./sql/schema postgres postgres://postgres:postgres@localhost:5432/postgres up

migrate-down:
	goose -dir ./sql/schema postgres postgres://postgres:postgres@localhost:5432/postgres down-to 0

clean:
	@rm -rf bin

test:
	@go test -v ./... -count=1..
