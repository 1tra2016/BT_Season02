CREATE DATABASE "UniversityDB";

CREATE SCHEMA IF NOT EXISTS university;

CREATE TABLE IF NOT EXISTS university.students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS university.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

CREATE TABLE IF NOT EXISTS university.enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES university.students(student_id),
    course_id INT REFERENCES university.courses(course_id),
    enroll_date DATE
);


SELECT datname FROM pg_database;

SELECT schema_name
FROM information_schema.schemata
WHERE catalog_name = 'UniversityDB';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'students';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'courses';

SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'enrollments';



