build:
	@go build -o bin/scraper

run: build
	@./bin/scraper

test:
	@go test -v ./... -count=1..
