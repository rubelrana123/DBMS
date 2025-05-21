-- Creating the customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    join_date DATE
);

-- Creating the orders table
CREATE TABLE all_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    amount DECIMAL(10, 2),
    status VARCHAR(20) -- e.g., 'Completed', 'Pending', 'Cancelled'
);
-- Inserting data into customers
INSERT INTO customers (customer_name, email, country, join_date) VALUES
('Alice Johnson', 'alice@gmail.com', 'USA', '2022-01-15'),
('Bob Smith', 'bob@gmail.com', 'UK', '2021-11-22'),
('Charlie Brown', 'charlie@gmail.com', 'Canada', '2023-03-05'),
('Diana Prince', 'diana@gmail.com', 'USA', '2022-07-09'),
('Ethan Hunt', 'ethan@gmail.com', 'Germany', '2021-06-18');

-- Inserting data into orders
INSERT INTO all_orders (customer_id, order_date, amount, status) VALUES
(1, '2022-02-10', 150.00, 'Completed'),
(1, '2022-04-15', 200.00, 'Completed'),
(1, '2023-01-05', 300.00, 'Cancelled'),
(2, '2022-01-10', 120.00, 'Completed'),
(2, '2023-05-20', 450.00, 'Completed'),
(3, '2023-04-25', 500.00, 'Pending'),
(3, '2023-05-01', 350.00, 'Completed'),
(4, '2022-08-15', 220.00, 'Completed'),
(4, '2023-02-14', 180.00, 'Cancelled'),
(5, '2021-07-01', 100.00, 'Completed');


-- 1. List all customers and the total number of orders they have placed.
SELECT count(order_id) as total_order, customer_name FROM customers
  JOIN all_orders USING(customer_id)
--   WHERE all_orders.status = 'Completed'
  GROUP BY customer_name;

-- 2. Find the total amount spent by each customer (only for 'Completed' orders).
SELECT * from all_orders;
SELECT sum(amount) as total_amount, customer_name FROM customers
  JOIN all_orders USING(customer_id)
  WHERE all_orders.status = 'Completed'
  GROUP BY customer_name;

-- 3. Which customers have placed more than 2 orders?
  SELECT customer_name, count(order_id) from customers
  JOIN all_orders USING (customer_id)
  GROUP BY customer_name
  Having COUNT(order_id) >= 2;

--test__
SELECT avg(amount) FROM all_orders;

-- 4. Show all orders with amount greater than the average order amount.
SELECT order_id, amount from all_orders
  GROUP BY order_id 
  Having (avg(amount) < amount);


-- 5. List the names of customers from the USA who have made at least one 'Completed' order.

-- 6. Find the month (from any year) with the highest total sales amount.

-- 7. List customers who joined in 2022 and haven't placed any orders yet.

-- 8. Which country has the highest number of customers?

-- 9. Find the average amount per order for each customer.

-- 10. List the top 2 customers who spent the most in total (only completed orders).