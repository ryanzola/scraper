#!/bin/sh

# Print debug information
echo "DB_URL: $DB_URL"
echo "Running database migrations..."

# Wait for the PostgreSQL database to become available
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "db" -U "$POSTGRES_USER" -c '\q'; do
  >&2 echo "PostgreSQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "PostgreSQL is up - executing command"

# Run database migrations
goose -dir ./sql/schema postgres $DB_URL up

# Check if the migrations ran successfully
if [ $? -eq 0 ]; then
  echo "Migrations ran successfully, starting air..."
else
  echo "Migration failed, exiting."
  exit 1
fi

# Start air for hot reloading
air