SELECT * FROM workers;

CREATE OR REPLACE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL
AS $$
    SELECT COUNT(*) FROM workers;
$$;


SELECT emp_count();

 CREATE OR REPLACE FUNCTION emp_delete()
RETURNS void
LANGUAGE SQL
AS $$
    DELETE FROM workers WHERE employee_id = 30;
$$;
SELECT emp_delete()

 CREATE OR REPLACE FUNCTION emp_delete_by_id(p_emp_id INT)
RETURNS void
LANGUAGE SQL
AS $$
    DELETE FROM workers WHERE employee_id = p_emp_id;
$$;
SELECT emp_delete_by_id(29)

--pprocedure 
CREATE PROCEDURE remove_emp()
LANGUAGE plpgsql
AS $$
   BEGIN
    DELETE FROM workers WHERE employee_id = 28; 
    END

  $$
  
  call remove_emp();

-- //precedure using variable
CREATE OR REPLACE PROCEDURE remove_worker_var(p_emp_id INT)
LANGUAGE plpgsql
AS $$
   DECLARE 
   demo_var INT;
   BEGIN
    SELECT employee_id INTO demo_var FROM workers WHERE employee_id = p_emp_id; 
    DELETE FROM workers WHERE employee_id = demo_var;
    RAISE NOTICE 'worker delete sucessfully';
    END;

  $$;
  
  call remove_worker_var(24);

SELECT * FROM workers;
 SELECT employee_id  FROM workers WHERE employee_id = 27;