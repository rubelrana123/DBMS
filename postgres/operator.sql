SELECT * from students
WHERE age NOT BETWEEN 20 AND 22 AND first_name  like 'A%';

SELECT * FROM students
WHERE country IN ('USA', 'Australia');
SELECT * FROM students
WHERE first_name LIKE '__a%';
SELECT * FROM students
WHERE first_name ILIKE 'a%'

SELECT * FROM students
-- LIMIT(5);

SELECT * FROM students
LIMIT 5 OFFSET 5 * 0;
SELECT * FROM students
LIMIT 5 OFFSET 5 * 1;
SELECT * FROM students
LIMIT 5 OFFSET 5 * 2;

DELETE FROM students
WHERE age < 20;

SELECT * FROM students ORDER BY student_id;

update students
 SET first_name = 'Rubel' , last_name = 'Rana'
 WHERE student_id = 1;