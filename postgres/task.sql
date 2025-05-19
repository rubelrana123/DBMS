--level 1 --
-- Table Alteration Tasks (Based on 8-1 to 8-3)
-- Add a column email (VARCHAR) to the existing students table.


-- Rename the column email to student_email.


-- Add a UNIQUE constraint to student_email.


-- Add a PRIMARY KEY to a new table named courses.


-- Drop a column from any existing table.
-- 



CREATE TABLE student_table (
    id SERIAL PRIMARY KEY,
    roll INTEGER UNIQUE,
    name VARCHAR(50),
    age INTEGER,
    department VARCHAR(50),
    score FLOAT4,
    status VARCHAR(25) DEFAULT 'passed',
    last_login DATE
);


SELECT * from student_table;

ALTER TABLE student_table
 ADD COLUMN email VARCHAR(50);

 ALter Table student_table 
  RENAME email to student_email

ALTER TABLE student_table
ADD CONSTRAINT unique_student_email UNIQUE(student_email);


SELECT * from student_table;

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course VARCHAR(50)

)

select * from courses;
ALTER Table courses 
 ADD column price INTEGER;

 alter Table courses 
 drop COLUMN price


 -- level 2 
--  Filtering & Logical Operations (Based on 8-5, 8-7, 8-8)
-- Write a query to find all students who have a score greater than 80 and not null.


-- Use the NOT operator to exclude students from a specific department.


-- Fetch students whose names start with ‘A’ using LIKE and ILIKE.


-- Select all students whose age is between 18 and 25.


-- Retrieve rows using IN for a specific set of roll numbers.


INSERT INTO student_table (roll, name, age, department, score, last_login)
VALUES
 
(105, 'Ethan Davis', 23, 'EEE', 55.0, '2025-05-11'),
(106, 'Fiona Lee', 21, 'CSE', 91.2, '2025-05-10'),
(107, 'George Kim', 22, 'BBA', 60.4, '2025-05-09'),
(108, 'Hannah Scott', 20, 'CSE', 88.9, '2025-05-08'),
(109, 'Ian Hall', 23, 'EEE', 43.3, '2025-05-07'),
(110, 'Julia Adams', 21, 'CSE', 95.6, '2025-05-06'),
(111, 'Kevin Turner', 20, 'BBA', 58.7, '2025-05-05'),
(112, 'Lily Martin', 22, 'CSE', 76.2, '2025-05-04'),
(113, 'Mike Wilson', 24, 'EEE', 39.8, '2025-05-03'),
(114, 'Nina Patel', 21, 'BBA', 49.5, '2025-05-02'),
(115, 'Owen Wright', 23, 'CSE', 83.1, '2025-05-01'),
(116, 'Paula Young', 20, 'EEE', 66.6, '2025-04-30'),
(117, 'Quincy Zhang', 22, 'CSE', 77.4, '2025-04-29'),
(118, 'Rachel King', 21, 'BBA', 68.8, '2025-04-28'),
(119, 'Samir Khan', 23, 'EEE', 59.9, '2025-04-27'),
(120, 'Tina Brooks', 20, 'CSE', 92.0, '2025-04-26');

SELECT * from student_table;

SELECT count(*) from student_table;

select avg(score) from student_table;

select  max(age) as max_age, min(age) as min_age from student_table
  
--   --level 3
--   Update & Delete Operations (Based on 8-9, 8-10)
-- Update the status of students who scored less than 50 to 'failed'.


-- Delete students who have not logged in since last year.


-- Use LIMIT and OFFSET to fetch the second page of results (5 per page).


UPDATE student_table
SET status = 'failed'
WHERE score < 50;

SELECT * FROM student_table

DELETE FROM student_table
WHERE last_login < CURRENT_DATE - INTERVAL '7 days';

ALTER TABLE student_table
ALTER COLUMN student_email SET DEFAULT 'DDDDD@gmail.com';

UPDATE student_table
SET student_email = '123@gmail.com'
WHERE student_email IS NULL;


SELECT * from student_table
LIMIT 5 OFFSET (5 * 0)

SELECT * from student_table
LIMIT 5 OFFSET (5 * 1)

SELECT * from student_table
LIMIT 5 OFFSET (5 * 3)