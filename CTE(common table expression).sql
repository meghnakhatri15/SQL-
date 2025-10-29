use regex1;

CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    region VARCHAR(20),
    month VARCHAR(10),
    sales INT
);

INSERT INTO sales_data (id, emp_name, region, month, sales) VALUES
(1, 'Asha',   'North', 'Jan', 12000),
(2, 'Asha',   'North', 'Feb', 15000),
(3, 'Asha',   'North', 'Mar', 14000),

(4, 'Ravi',   'South', 'Jan', 10000),
(5, 'Ravi',   'South', 'Feb', 13000),
(6, 'Ravi',   'South', 'Mar', 17000),

(7, 'Neha',   'East',  'Jan', 16000),
(8, 'Neha',   'East',  'Feb', 15500),
(9, 'Neha',   'East',  'Mar', 18000),

(10, 'Kiran', 'West',  'Jan', 9000),
(11, 'Kiran', 'West',  'Feb', 11000),
(12, 'Kiran', 'West',  'Mar', 15000);

select * from sales_data;

-- lag()
select emp_name, month, sales,
lag(sales) over(partition by emp_name order by id) as prev_month_sales
from sales_data;

-- lead()
select emp_name, month, sales,
lead(sales) over(partition by emp_name order by id) as next_month_sales
from sales_data;

-- ntile()
select emp_name, month, sales,
ntile(3) over(order by sales desc)
from sales_data;

-- CTE (Common Table Expression):- temporary named result set that we can reference within a single SQL query


use window_test;

select * from employee_Sales;

select * from
(select *,
dense_rank() over(order by sale_amount desc) as totalrank from employee_sales)as abc
where totalrank=6;

-- common table expression
with abc as(
select *,dense_rank() over(order by sale_amount desc) as totalrank from employee_sales
)
select * from abc where emp_id=8;

use sakila;
select * from actor;
select * from film_actor;

with film_cte as(
select * from film_actor where actor_id=1
)
select actor.actor_id, film_id from actor join film_cte on actor.actor_id=film_cte.actor_id;

-- set operstion (combine result two or more select statemet)

-- union(remove duplicate values from columns)
select * from actor where actor_id<=3
union
select * from actor where actor_id between 3 and 6;

-- union all(have duplicacy in columns)
select * from actor where actor_id<=3
union all
select * from actor where actor_id between 3 and 6;

-- create  a series of number from 1 to 10;

-- recursive CTE (A Recursive CTE is a query that calls itself until a condition is met)
with recursive cte as(
select 1 as num -- base case
union 
select num+1 from cte
where num<10) -- end case
select * from cte;

use regex1;
select * from employees;

with xyz as(
select deptid, avg(salary) as avgsalary from employees group by deptid)
select * from employees join xyz where employees.deptid 