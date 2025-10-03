-- group by-
 use sakila;
 select * from payment;
 
 select customer_id,sum(amount),count(customer_id) from payment
 group by customer_id;
 
 select payment_id,count(*) from payment group by payment_id;
 
 select customer_id,count(customer_id) from payment where count(customer_id)>30
 group by customer_id;-- it will give error because where condition does not apply on aggregate function
-- for aggregate function we use 'having'


-- having-
select customer_id,count(customer_id) from payment 
 group by customer_id having count(customer_id)>30;
 
 
 -- 
 
 select * from payment;
 
 select amount,count(*),sum(amount) from payment group by amount;
 
 select amount,count(*) from payment where amount>2 group by amount having count(*)>3000;
 
 -- Alias(as)-(giving a new name)-
 
 select amount,count(*) as totalcount, sum(amount) from payment 
 where amount>2 group by amount having totalcount>3000;
 
 -- 1. get the staff id and the total no. of customer serve by each staff
 
 select * from payment;
 
 select staff_id , count(customer_id) from payment  group by staff_id;
 
 -- get the total amount and the no. of payments done for each month
 
 select month(payment_date),sum(amount),count(payment_id) from payment group by month(payment_date);
 
 -- get the amount and total no. of unique customer who have done the payment for each amount
 
 select amount,count(distinct customer_id) from  payment group by amount;
 -- get the no.of transiction acheived for each amount for the year 2005 
 -- where the no.of transaction should be greater than 15
 
 select amount,count(payment_id) from payment where year(payment_date)=2005 group by amount
 having count(payment_id)>15;
 