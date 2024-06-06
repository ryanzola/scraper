# Use the official Golang image as the base image
FROM golang:1.22

# Set the Current Working Directory inside the container
WORKDIR /app

# Install air for hot reloading, goose for migrations, and the PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client \
    && go install github.com/air-verse/air@latest \
    && go install github.com/pressly/goose/v3/cmd/goose@latest

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Copy entrypoint script
COPY entrypoint.sh .

# Make entrypoint script executable
RUN chmod +x entrypoint.sh

# Command to run the entrypoint script
CMD ["./entrypoint.sh"]