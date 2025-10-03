-- multiple row function ( aggregate function )

use sakila;
select * from payment;

-- sum-
select sum(amount) from payment;

select sum(amount),sum(round(amount)) from payment;

-- count-
select count(amount) from payment;

select count(amount) from payment where amount>5;

-- count(*)-

select * from address;

select count(address_id),count(address2),count(*) from address;

select * from payment;

-- all functions-

select  max(amount) , min(amount) , sum(amount),avg(amount),count(amount) from payment;

-- distinct-> find unique value-

select distinct amount from payment;
 
select distinct amount,customer_id from payment; 

select count(distinct amount),count(amount) from payment;

-- 1. get the payment id and amount for year 2005
select * from payment;
select payment_id,amount from payment where year(payment_date)=2005;

-- 2. get the unique customers who have done the payment in the month of june

select count(distinct customer_id) from payment where month(payment_date)=06;

-- 3.get the maximum amount ,avg amount and the difference between maximum and avg amount
-- where the amount of payment is greter than 2 dollar for year 2006

select max(amount),avg(amount),max(amount)-avg(amount) from payment 
where amount>2 and year(payment_date)=2006; 

-- group by satement (grouping similar values)

select * from payment group by coustomer_id; -- it will give error because we can only use
											-- that column in select that is used in group by 
select customer_id from payment group by customer_id;

select distinct customer_id,count(customer_id) from payment; -- it will give error

select customer_id, count(payment_id)from payment group by customer_id;	