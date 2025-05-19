-- ALTER TABLE person2
--  ADD COLUMN email VARCHAR(25);
SELECT * FROM person2;
INSERT INTO person2 (id,user_name, age, email)
VALUES(6,'sssss', 29, 'ra@gmail.com' )

ALTER TABLE person2
 DROP COLUMN email;
SELECT * FROM person2;

ALTER TABLE person2
 ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;

ALTER TABLE person2 
  RENAME COLUMN age to user_age

INSERT INTO person2 VALUES(5,'lala', 21,'lala@gmail.comn')


ALTER TABLE person2
    alter COLUMN user_name type VARCHAR(25);

alter Table person2
alter column age set NOT NULL;
alter table person2
alter COLUMN age DROP NOT NULL;

ALTER Table person2
 add constraint unique_person2_age UNIQUE(age)

 ALTER table person2 
 add constraint pk_perosn2_user_name PRIMARY KEY(user_name);
  ALTER table person2 
 drop constraint unique_person2_age;

DROP person3;

TRUNCATE person3;