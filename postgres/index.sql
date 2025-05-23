SELECT * from workers;


EXPLAIN ANALYSE
SELECT * FROM workers where employee_name = 'David Lee';
SELECT * FROM workers where employee_name = 'David Lee';


CREATE INDEX idx_employee_name
ON workers (employee_name);

CREATE INDEX idx_employee_dept
ON workers USING HASH (department_name);

EXPLAIN ANALYSE SELECT * from workers WHERE department_name = 'HR';
SELECT * from workers WHERE department_name = 'HR';

SHOW data_directory;