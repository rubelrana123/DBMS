-- Active: 1747493249510@@localhost@5432@sessiondb

-- 1. Create tables
CREATE TABLE departments (
    id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(50)
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    score NUMERIC(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
);

CREATE TABLE course_enrollments  (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_title VARCHAR(50),
    enrolled_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert into departments
INSERT INTO departments (name) VALUES
('Computer Science'),
('Electrical Engineering'),
('Mechanical Engineering'),
('Civil Engineering'),
('Physics'),
('Chemistry'),
('Mathematics'),
('Biology'),
('Business Administration'),
('Arts');

-- 3. Insert into students
INSERT INTO students (name, age, score, department_id) VALUES
('Alice Smith', 20, 85.5, 1),
('Bob Johnson', 21, 78.2, 2),
('Charlie Brown', 19, 92.0, 1),
('Diana Miller', 22, 65.1, 3),
('Eve Davis', 20, 70.0, 4),
('Frank White', 21, 88.7, 5),
('Grace Taylor', 19, 75.9, 6),
('Henry Wilson', 22, 81.3, 7),
('Ivy Moore', 20, 95.0, 8),
('Jack Green', 21, 60.5, 9);

-- 4. Insert into course_enrollments 
INSERT INTO course_enrollments  (student_id, course_title, enrolled_on) 
VALUES 
 (5, 'Introduction to Python', '2024-01-15 09:00:00'),
 (3, 'Database Management 101', '2024-01-20 10:30:00'),
 (6, 'Web Development Basics', '2024-02-01 11:00:00'),
 (8, 'Advanced SQL Techniques', '2024-02-10 14:00:00'),
 (5, 'Data Structures and Algorithms', '2024-02-15 09:30:00'),
 (9, 'Cloud Computing Fundamentals', '2024-03-01 13:00:00'),
 (4, 'Machine Learning Principles', '2024-03-05 10:00:00'),
 (7, 'Cybersecurity Essentials', '2024-03-10 16:00:00'),
 (8, 'Operating Systems Concepts', '2024-03-12 08:45:00'),
 (1, 'Network Security', '2024-03-20 11:15:00');


 TRUNCATE TABLE students;
 TRUNCATE TABLE course_enrollments;
 TRUNCATE TABLE departments;


-- Retrieve all students who scored higher than the average score.

SELECT * from students;
SELECT * from course_enrollments;
SELECT * from departments;


-- Find students whose age is greater than the average age of all students.

SELECT name, score from students WHERE score >(
SELECT avg(score) as high_score from students);

-- Get names of students who are enrolled in any course (use IN with subquery).

SELECT name from students;
SELECT * FROM 
SELECT e.course_title, s.name from course_enrollments as e
JOIN students as s ON e.student_id = s.id;

-- Retrieve departments with at least one student scoring above 90 (use EXISTS).

