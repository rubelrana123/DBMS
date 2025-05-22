CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting sample data into the orders table
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
    (1, '2022-01-05', 100.50),
    (2, '2022-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2022-01-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2022-02-01', 250.50),
    (1, '2022-02-05', 180.25);

--     **6:** Find customers who have placed more than 2 orders and
-- calculate the total amount spent by     each of these customers.

--  7: Find the total amount of orders placed each month in the year 2022.
 SELECT extract(month FROM order_date) as month , count(order_id) as totalOrder FROM orders
 GROUP BY month;

  SELECT extract(month FROM order_date) as month , count(order_id) as totalOrder FROM orders
 GROUP BY month;
SELECT extract(month FROM order_date) as month,
       count(total_amount) as total
FROM orders
GROUP BY month;
--  7: Find the total amount of orders placed each month in the year 2022.

SELECT
 sum(total_amount) as total, 
 extract(month FROM order_date) as month 
 from orders
 WHERE extract(year FROM order_date) = '2022'
GROUP BY month


--  7: Find the total amount of orders placed each month in the year 2022.

SELECT 
sum(total_amount) as amount,
extract(month from order_date) as month,
extract(year from order_date) as year
FROM orders
WHERE extract(year from order_date) = '2022'
GROUP BY month , year;


--     **6:** Find customers who have placed more than 2 orders and
-- calculate the total amount spent by     each of these customers.
SELECT
    customer_id,
    SUM(total_amount) AS total_amount_spent
FROM
    orders
GROUP BY
    customer_id
HAVING
    COUNT(order_id) > 2;
 
select * from orders;

SELECT version();