CREATE VIEW dept_avg_salary  AS
SELECT department_name, avg(salary) from workers GROUP BY department_name;

SELECT * FROM dept_avg_salary;
SELECT department_name, avg(salary) from workers GROUP BY department_name;
