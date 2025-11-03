CREATE DATABASE LibraryDB;

CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    price NUMERIC(10, 2)
);

SELECT schema_name
FROM information_schema.schemata
WHERE catalog_name = 'LibraryDB';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_schema = 'library' AND table_name = 'books';
