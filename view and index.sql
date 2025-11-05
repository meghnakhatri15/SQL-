-- view-->t doesn’t store the data itself — it just shows the result of a saved query.
-- view are virtual table
-- make query simple.
use sakila;
select * from actor;
select * from film_actor;

select first_name, film_id from actor join film_actor 
where actor.actor_id=film_actor.film_id;
-- complex query view

create view v_actor as
select first_name, film_id from actor join film_actor 
where actor.actor_id=film_actor.film_id;
select * from v_actor;

-- view for specific column(security)
create view v_firstt as
select first_name from actor;

select * from v_firstt;

-- ctas (create table as select)
create table yash119 as
select * from actor where actor_id between 2 and 5;

select * from yash119;

-- view
create view v_yash  -- updatable
as select actor_id, first_name from yash110;

select * from v_yash;
SET SQL_SAFE_UPDATES =0;
update v_yash set first_name='xyz';
 select * from yash110;
 
 -- non updatable view
 create view v_ac as
select first_name, film_id from actor join film_actor 
where actor.actor_id=film_actor.film_id;
select * from v_ac;

-- indexes ->An index is like a shortcut or a book index that helps the database find data faster.
-- clustured index--> The data is physically arranged (sorted) in the order of the index
CREATE TABLE Stude (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
INSERT INTO Stude (StudentID, Name, Age)
VALUES
(3, 'Alice', 15),
(1, 'Bob', 16),
(5, 'Charlie', 14),
(2, 'David', 15),
(4, 'Eva', 17);
SELECT * FROM Stude WHERE StudentID = 3;


-- non clustured index--> The data is not sorted
create table students(
   student_id int,
   name varchar(50),
   age int
);
insert into students (student_id, name, age) values
(3, 'alice',20),
(1, 'bob', 15),
(5, 'charlie', 19),
(2, 'david' , 21),
(4, 'eve', 23);

select * from students;

explain select * from students where student_id=2; -- use of index
explain select * from students where name='bob';-- no index use

create index idx_student on students(student_id);-- index created (non clustured index)
show indexes from students;

-- composite index  (combination of two columns)
create index idx_student_c on students(student_id, name); -- composite index (non clustured index)
explain select * from students where student_id=2; 
explain select * from students where name='bob';

explain select * from students where name like 'al%';
create index idx_student_c on students(name(3)); -- partial index
explain select * from students where name like 'alice';