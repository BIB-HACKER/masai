CREATE DATABASE IF NOT exists Udemy;

Use udemy;

CREATE TABLE IF NOT EXISTS courses(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(255) NOT NULL,
PRICE INT,
RATING decimal(3,1)
);

insert into courses (ID, NAME, PRICE, RATING) VALUES
(1,'Karole', 432, 3.3),
(2,'jolie', 101, 4.8),
(3, 'Lockwood', 283, 2.1),
(4, 'Mariel', 422, 4.7),
(5, 'Angelique', 213, 2.2);

-- 1. get all the courses
SELECT * FROM courses;

-- 2. get all the courses where price is greater than 200
select * from courses where PRICE > 200;

-- 3. change the name of the course for id 1 to Tech
update courses set name = 'Tech' where ID = 1;

-- 4. Delete the course with id 5
delete from courses where ID = 5;

select * from courses;