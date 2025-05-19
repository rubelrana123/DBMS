-- show timezone;
-- SELECT now()

CREATE table time2(ts TIMESTAMP without time zone , tsz TIMESTAMP with time zone);
SELECT * from  time2;
INSERT INTO time2 VALUES('2025-05-19 10:45:00' , '2025-05-19 10:45:00')

SELECT now()::date;
SELECT now();
SELECT now()::time;
SELECT CURRENT_DATE;

SELECT to_char(now(), 'dd/mm/yyyy' );

SELECT CURRENT_DATE - INTERVAL '1 year';

SELECT age(CURRENT_DATE, '2003-01-22');
SELECT * FROM students;

SELECT age(CURRENT_DATE, dob) as user_age , * FROM students;

SELECT extract(month FROM '2025-02-02'::date)

SELECT '0' ::BOOLEAN;