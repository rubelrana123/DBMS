-- Creating the employees table
CREATE TABLE all_employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES all_departments(department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Creating the departments table
CREATE TABLE all_departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Inserting sample data into the departments table
INSERT INTO all_departments (department_name) VALUES 
    ('HR'), 
    ('Marketing'), 
    ('Finance'), 
    ('IT'), 
    ('Sales'), 
    ('Engineering'), 
    ('Customer Support'), 
    ('Administration'), 
    ('Research'), 
    ('Quality Assurance');

-- Inserting sample data into the employees table with a foreign key constraint
INSERT INTO all_employees (employee_name, department_id, salary, hire_date) VALUES 
    ('John Doe', 1, 60000.00, '2022-01-10'),
    ('Jane Smith', 2, 75000.50, '2021-05-22'),
    ('Bob Johnson', 3, 80000.75, '2020-11-15'),
    ('Alice Williams', 4, 90000.25, '2019-08-03'),
    ('David Lee', 5, 65000.50, '2020-03-18'),
    ('Sara Brown', 6, 70000.00, '2021-09-28'),
    ('Mike Miller', 7, 55000.75, '2022-02-05'),
    ('Emily Davis', 8, 95000.00, '2018-12-12'),
    ('Chris Wilson', 9, 72000.50, '2020-06-30'),
    ('Amy White', 10, 68000.25, '2021-11-09'),
    ('John Johnson', 1, 62000.00, '2022-01-15'),
    ('Jessica Thompson', 2, 78000.50, '2021-06-05'),
    ('Michael Harris', 3, 85000.75, '2020-11-25'),
    ('Emma Martinez', 4, 92000.25, '2019-09-15'),
    ('James Taylor', 5, 67000.50, '2020-04-08'),
    ('Sophia Anderson', 6, 72000.00, '2021-10-10'),
    ('William Jackson', 7, 56000.75, '2022-02-10'),
    ('Olivia Nelson', 8, 97000.00, '2018-12-20'),
    ('Daniel White', 9, 73000.50, '2020-07-05'),
    ('Ava Wilson', 10, 69000.25, '2021-11-15'),
    ('Matthew Brown', 1, 63000.00, '2022-01-20'),
    ('Emily Garcia', 2, 76000.50, '2021-06-15'),
    ('Christopher Allen', 3, 86000.75, '2020-12-05'),
    ('Madison Hall', 4, 93000.25, '2019-09-25'),
    ('Andrew Cook', 5, 68000.50, '2020-04-18'),
    ('Abigail Torres', 6, 73000.00, '2021-10-20'),
    ('Ethan Murphy', 7, 57000.75, '2022-02-15'),
    ('Ella King', 8, 98000.00, '2018-12-28'),
    ('Nathan Rivera', 9, 74000.50, '2020-07-15'),
    ('Mia Roberts', 10, 70000.25, '2021-11-20');


   
 --1. **Inner Join to Retrieve Employee and Department Information**
-- 2. **Group By Department with Average Salary**
-- 3. **Count Employees in Each Department**
-- 4. **Find the Department name with the Highest Average Salary**
-- 5. **Count Employees Hired Each Year**

SELECT * FROM all_employees;
SELECT * FROM all_departments;


--inner join -Inner Join to Retrieve Employee and Department Information
SELECT emp.employee_id, emp.employee_name , emp.salary,emp.hire_date, dept.department_name  FROM all_employees as emp
JOIN all_departments as dept  ON emp.department_id = dept.department_id;


SELECT emp.employee_id, emp.employee_name , emp.salary,emp.hire_date, dept.department_name  FROM all_employees as emp
JOIN all_departments as dept  USING(department_id);
-- Group By Department with Average Salary 

SELECT round(avg(all_employees.salary)) as Salary,  all_departments.department_name from all_employees
JOIN all_departments USING(department_id)
GROUP BY all_departments.department_name 


DROP Table all_departments;
DROP Table all_employees;

-- 3. **Count Employees in Each Department**
--
SELECT department_name, count(all_employees.employee_id) from all_employees
JOIN all_departments USING(department_id)
GROUP BY department_name;

-- 4. **Find the Department name with the Highest Average Salary**
--df
SELECT department_name, avg(all_employees.salary) as salary from all_employees
JOIN all_departments USING(department_id)
GROUP BY department_name
ORDER BY salary DESC;

-- 5. **Count Employees Hired Each Year**


SELECT extract(year from all_employees.hire_date) as year, count(*), all_departments.department_name FROM all_employees 
JOIN all_departments USING(department_id)
 GROUP BY year , all_departments.department_name;