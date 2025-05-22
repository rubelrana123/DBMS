-- Active: 1747493249510@@localhost@5432@sessiondb
CREATE TABLE publishers(
    id SERIAL PRIMARY key,
    name VARCHAR(50) NOT NULL
);
INSERT INTO publishers (name) VALUES 
('Penguin Books'),
('HarperCollins'),
('Bloomsbury'),
('Oxford University Press');


CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author_name VARCHAR(50),
    published_year INT,
    price NUMERIC(10,2),
    in_stock BOOLEAN,
    publisher_id INT REFERENCES publishers(id)
);

INSERT INTO books (title, author_name, published_year, price, in_stock, publisher_id)
 VALUES
('The Hobbit', 'J.R.R. Tolkien', 1937, 250.00, true, 1),
('Harry Potter and the Philosophers Stone', 'J.K. Rowling', 1997, 300.00, true, 3),
('To Kill a Mockingbird', 'Harper Lee', 1960, 180.00, false, 2),
('1984', 'George Orwell', 1949, 220.00, true, 1),
('Animal Farm', 'George Orwell', 1945, 150.00, true, 4),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 200.00, false, 1),
('Brave New World', 'Aldous Huxley', 1932, 230.00, true, NULL); -- No publisher



SELECT * FROM books;
ALTER TABLE books ADD COLUMN genre VARCHAR(50);

ALTER TABLE books DROP COLUMN genre;

ALTER TABLE books ALTER COLUMN in_stock TYPE BOOLEAN DEFAULT true;

ALTER TABLE books RENAME COLUMN author_name to author;





---select

SELECT title,price FROM books;

SELECT * from books where in_stock = FALSE;

SELECT * FROM books WHERE author = 'George Orwell';

SELECT title, length(title) FROM books; -- schalar row wise work

SELECT count(*) from books;-- aggrregate column wise work assignment special
SELECT max(price), min(price) from books; 

--constional operator
SELECT * from books WHERE price BETWEEN 100 AND 200;

SELECT * from books WHERE title LIKE 'T%';--case sensitive

SELECT * from books WHERE title ILIKE 't%'; --not case sensetive

UPDATE books SET price = price * 1.10;

SELECT * FROM books;

--grouping
select * from books;

--delelte
ALTER TABLE books DROP CONSTRAINT books_publisher_id_fkey;

ALTER TABLE books 
ADD constraint books_publisher_id_fkey 
FOREIGN KEY(publisher_id)
REFERENCES publishers(id) 
ON DELETE CASCADE;
DELETE from publishers WHERE id  = 1;

DROP TABLE publishers;
DROP TABLE books;

SELECT * from publishers;
SELECT * FROM books;

SELECT b.title , p.name as publisher from books as b 
INNER JOIN publishers as p ON b.publisher_id = p.id;

