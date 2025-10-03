use sakila;

select * from actor;

-- like operator( filter the data according to pattern )

-- % ( symbol/wildcard character ) : zero or more character
select * from actor where first_name like 'N%';
select * from actor where first_name like '%S';
select * from actor where first_name like 'S%T';

select * from actor where first_name like '%S%';

-- ( _ ): exactly 1 character
select * from actor where first_name like 'E_';

select * from actor where first_name like 'A____%';

select * from actor where first_name like '_A%';

select * from actor where first_name like '_D%';

-- (1.) Get the actor id and the first name where the last two word should be TE

select actor_id,first_name from  actor where first_name like '%TE';

-- (2.) where the double N should be present in the middle

select actor_id,first_name from actor where first_name like '_%NN%_';

-- (3.) get the first name and last name where in the last name column the 
-- first word is B and second last word R

select first_name,last_name from actor where last_name like 'B%R_';

-- (4.) get the user information where first name will have minimum 4 character

select * from actor where first_name like '____%';

-- (5.) get all the columns where the actor id is from 2 to 90 and the first name s should be present
-- in the middle and a should be the last second character
select * from actor where actor_id between 2 and 90 and first_name like '_%S%A_';

-- Functions-->
-- inbuilt functions
-- Scalar function(row function) - apply on each row and return the output for each row
-- multi row function

-- total character in each first_name
select first_name,char_length(first_name) from actor;

select first_name,char_length(first_name),lower(first_name) from actor;

select first_name,last_name, concat(first_name,last_name) from actor;

select first_name,last_name, concat(first_name,'regex') from actor;

select first_name,last_name ,concat(first_name,' ',last_name) from actor;

select first_name,last_name ,concat_ws(' ',first_name,last_name) from actor;

-- substr ( to extract some data)
-- substr(col,starting position,total character)
select first_name,substr(first_name,2) from actor;

select first_name,substr(first_name,1,3) from actor;

select first_name,substr(first_name,-4) from actor;

select first_name,substr(first_name,-4,2) from actor;


