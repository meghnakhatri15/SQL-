use sakila;
select * from actor;
select first_name from actor where actor_id=2;

select * from actor where first_name='NICK';
-- subquery
select * from actor where first_name=(select first_name from actor where actor_id=5);

select * from payment;
-- i need those payemnt amounts where payemnt id=3

select * from payment
where amount=(select amount from payment where payment_id=3);

-- get the payment id amount and payment date where the amount  of rental_id 1476

select payment_id, amount, payment_date from payment
where amount=(select amount from payment where rental_id=1476);

-- get the payment_id amount and payemnt_date where the month of the table is equal to 
-- the month of payment id=4

select * from payment;
select payment_id, amount,payment_date from payment
where month(payment_date)=(select month(payment_date) from payment where payment_id=4); 

-- scaler subquery [when a subquery return only 1 row]
-- than the operator are used in subquery


-- get the payment_id and amount from the table where the amount is equal to the maximum 
-- amount of the table

select payment_id, amount from payment 
where amount=(select max(amount) from payment);
 