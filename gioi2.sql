-- CREATE DATABASE ElearningDB;

CREATE SCHEMA elearning;
SET search_path TO elearning;

create table students(
	student_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(50) not null unique
);

create table instructors (
	instructor_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(50) not null unique
);
create table courses(
	course_id serial primary key,
	student_id int references students(student_id),
	instructor_id int references instructors (instructor_id)
);

create table enrollments(
	enrollment_id serial primary key,
	student_id int references students(student_id),
	course_id int references courses(course_id),
	enroll_date date not null
);

create table assignments(
	assignment_id serial primary key,
	course_id int references courses(course_id),
	title varchar(100) not null,
	due_date date not null
);

create table submissions(
	submission_id serial primary key,
	assignment_id int references assignments(assignment_id),
	student_id int references students(student_id),
	submission_date date not null,
	grade numeric(10,2) check (grade>=0 and grade<=10)
);