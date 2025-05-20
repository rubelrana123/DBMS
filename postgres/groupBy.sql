SELECT country, count(*) FROM students
GROUP BY country;

SELECT count(country) as total,country, avg(age)  FROM students
GROUP BY country
HAVING NOT avg(age) = 21.0000000000000000;


SELECT  extract(year FROM dob) as birth_year , count(extract(year FROM dob)) from students 
GROUP BY birth_year