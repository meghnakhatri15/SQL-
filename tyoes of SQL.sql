-- self join example (query)
drop database if exists regex123;

create database regex123;
use regex123;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- VP of Sales
(3, 'Carol', 1),          -- VP of Engineering
(4, 'David', 2),          -- Sales Manager 1
(5, 'Eve', 2),            -- Sales Manager 2
(6, 'Frank', 3),          -- Engineering Manager 1
(7, 'Grace', 3),          -- Engineering Manager 2
(8, 'Heidi', 4),          -- Salesperson under David
(9, 'Ivan', 4),           -- Salesperson under David
(10, 'Judy', 5),          -- Salesperson under Eve
(11, 'Mallory', 6),       -- Engineer under Frank
(12, 'Niaj', 6),          -- Engineer under Frank
(13, 'Olivia', 7),        -- Engineer under Grace
(14, 'Peggy', 7),         -- Engineer under Grace
(15, 'Trent', 3);         -- Tech Lead under Carol (no direct reports)
use regex123;

select * from employees;

select employee_id, name, manager_id from employees as emp;

create database  regex123;
use regex123;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102);

select * from product;

select * from orders; 

-- no common column so working as cross join 
select p.pid, p.price, o.productid, o.city from product as p
natural join  orders as o;

-- changing column name
alter table orders rename column  productid to pid;
select * from orders;

-- common coluumn so working as inner join 
select p.pid, p.price, o.pid, o.city from product as p
natural join orders as o;

use sakila;
select * from actor;

select * from film_actor;

select a.actor_id, a.first_name, f.film_id from actor as a
join film_actor as f;

select * from film;

select a.actor_id, a.first_name, f.film_id, flm.title
from actor as a 
join film_actor as f 
join film as flm 
where a.actor_id=f.actor_id and f.film_id=flm.film_id;