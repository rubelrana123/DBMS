SELECT * from publishers;

SELECT * from books;
--cross all data 
SELECT b.title, b.author_name, p.name as publisher from books b CROSS JOIN publishers p;

ALTER TABLE publishers ADD COLUMN publisher_id DEFAULT(SERIAL);

SELECT * FROM books
NATURAL JOIN publishers;


SELECT name from publishers WHERE id IN (
    SELECT publisher_id FROM books GROUP BY publisher_id HAVING COUNT(*) > 1


);


SELECT * FROM books WHERE in_stock = true;


SELECT * from publishers as p 
WHERE EXISTS (
    SELECT 1 FROM books as b
    WHERE b.publisher_id = p.id AND b.in_stock = true
);



--function

CREATE OR REPLACE FUNCTION apply_discount(price NUMERIC, discount_percent NUMERIC)
RETURNS NUMERIC AS
$$
BEGIN
  RETURN price - (price * discount_percent / 2);
END;
$$
LANGUAGE plpgsql;


SELECT * , apply_discount(price,1.00) AS discounted_price FROM books;

--indexing 
CREATE INDEX idx_books_title ON books(title);

CREATE INDEX idx_books_author_price ON books(author_name, price);




EXPLAIN ANALYSE SELECT * from books;

CREATE INDEX idx_books_price ON books(price);

 SELECT * from books;