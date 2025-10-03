show databases;  -- will show all database in mysql


use sakila;    -- use sakila as a database

-- show table to see all table
show Tables;

-- Select statment( DQL )  * access all column
select * from actor;

describe actor;  -- will give table info( column,datatype,relationship and more)

select actor_id,first_name from actor;  -- select statement table it can be in any case format

select actor_id,first_name,actor_id,last_name from actor;

-- don't create new column in original data
select actor_id,first_name,actor_id*5 from actor; 

-- where is condition used to select the particular row 
select * from actor where actor_id=5;

-- for column
select * from actor where first_name='NICK'; -- DATA SHOULD BE CASE SENSITIVE

select actor_id,last_name,first_name from actor where last_name='DAVIS';

-- not equal to
select * from actor where actor_id!=5;
select * from actor where actor_id<>5;

select * from actor where first_name='NICK' and actor_id=44;

select * from actor where first_name='NICK' or actor_id=46;


select * from actor where actor_id>=2 and actor_id<=6;
select * from actor where actor_id between 2 and 6;  -- lower to higher (not higher to lower)

select * from actor where actor_id>2 and actor_id>6;

select * from actor where actor_id not between 2 and 6;

-- both are same
select * from actor where actor_id=2 or actor_id=8 or actor_id=19;
select * from actor where actor_id in (2,8,19);
select * from actor where first_name in ('NICK','ED');


-- 1. from actor table get the first name and actor id whose last name is genius.

select actor id ,first_name from actor where last_name='GENIUS';

-- 2.get the actor id and the first name where actor id is from value 3 to 18 or 
-- the name should not be ED.

select first_name,actor_id from actor where actor_id
 between 3 and 18 or first_name!='ED';

-- 3.get the last name ,actor id ,first name where the first name is either nick or grace.

select last_name,actor_id,first_name from actor
 where first_name='NICK' or first_name='GRACE';

-- 4.get all the columns where the actor id is from 2 to 6 or actor id greater than 5.

select * from actor where actor_id between 2 and 6 or actor_id>5;
