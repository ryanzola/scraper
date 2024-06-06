# Scraper

This is a simple rss scraper that scrapes the rss feed of a website and stores the data in a json file...maybe.

## Schema

Add a new migration to the `migrations` folder
run the command below to update the database schema
example: 001_create_table.sql

```bash
goose postgres postgres://postgres:postgres@localhost:5432/postgres up
```

## Queries

Add a new query to the `queries` folder
run the command below to generate the query functions

```bash
sqlc generate
```

incorporate the generated functions in your handlers

## Models

Add a new type to the `models` file for more controlled data access. Add a method to convert database types to api types

## Run

To run the application, run the command below

```bash
docker-compose up --build -d
```
