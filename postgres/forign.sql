
CREATE TABLE user_table (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(25)
);
DROP TABLE user_table;

ALTER TABLE user_table
ALTER COLUMN user_name SET NOT NULL;


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
 
 SELECT * FROM user_table;

--
    --user_id INTEGER REFERENCES user_table(id) ON DELETE CASCAD
    --user_id INTEGER REFERENCES user_table(id) ON DELETE SET NULL
    --
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER DEFAULT 1 REFERENCES user_table(id) ON DELETE SET DEFAULT
);

DROP TABLE post;
-- Cascading Deletion -> ON DELETE CASCADE

 
ALTER TABLE post
ALTER COLUMN user_id SET NOT NULL;
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
('Julia’s life advice', 4);

SELECT * from post;

SELECT * FROM post
WHERE user_id = 3;

INSERT INTO post(title, user_id) VALUES('test', 2);


SELECT * from post;

---- Insertion constraint on INSERT post
-- Attempting to insert a post with a user ID that does not exist
-- Inserting a post with a valid user ID
-- Attempting to insert a post without specifying a user ID
-------------

-- Deletion constraint on DELETE user
-- Restrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default)
-- Cascading Deletion -> ON DELETE CASCADE
-- Setting NULL -> ON DELETE SET NULL
-- Set Default value -> ON DELETE SET DEFAULT

-- Restrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default)
-- Cascading Deletion -> ON DELETE CASCADE
    --user_id INTEGER REFERENCES user_table(id) ON DELETE CASCAD

DELETE FROM user_table
 WHERE id = 10;

 DROP TABLE user_table;
 DROP TABLE post;


 SELECT * FROM user_table;

 SELECT * FROM post;

-- Setting NULL -> ON DELETE SET NULL

SELECT * from user_table;
SELECT * from post;
DELETE FROM user_table
 WHERE id = 3;

-- Set Default value -> ON DELETE SET DEFAULT
    --user_id INTEGER REFERENCES user_table(id) ON DELETE SET NULL
--    user_id INTEGER DEFAULT 1 REFERENCES user_table(id) ON DELETE SET DEFAULT

SELECT * from user_table;
SELECT * from post;

 DROP TABLE user_table;
 DROP TABLE post;
 DELETE FROM user_table
 WHERE id = 3;