CREATE TABLE user_table (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(25)
);
INSERT INTO user_table (user_name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('David'),
('Eva'),
('Frank'),
('Grace'),
('Helen'),
('Ian'),
('Julia');

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES user_table(id)
);
INSERT INTO post (title, user_id) VALUES
('Alice’s first post', 3),
('Bob’s intro post', 7),
('Charlie shares an update', 3),
('David’s thoughts on coding', 5),
('Eva’s weekend recap', 2),
('Frank writes about travel', 6),
('Grace shares a recipe', 1),
('Helen reviews a book', 6),
('Ian discusses tech trends', 10),
('this is testing null', NULL);


SELECT * FROM user_table;
SELECT * FROM post;
--inner join not accept null
SELECT 
    post.id AS post_id,
    post.title,
    post.user_id,
    user_table.user_name
FROM 
    post
JOIN 
    user_table ON post.user_id = user_table.id;

SELECT 
  u.user_name ,
  p.title as post_id
FROM 
    post p
JOIN 
    user_table u ON p.user_id = u.id;

--left join lest table data musst be then other table data, null accept
SELECT * FROM post
LEFT JOIN
 user_table on post.user_id = user_table.id;
 ;   
 --swap join
 SELECT * FROM user_table
LEFT JOIN
 post on post.user_id = user_table.id;
 ;   

--right table right priority hight and other table null accept
SELECT * FROM post
RIGHT JOIN
 user_table on post.user_id = user_table.id;
 ;  
 --swap 
 SELECT * FROM user_table
RIGHT JOIN
 post on post.user_id = user_table.id;
 ;  

 --full jou=in
 SELECT * FROM post
FULL JOIN
 user_table on post.user_id = user_table.id;
 ; 