use sakila;
select * from payment;
select count(costomer_id), amount from payment group by amount;
select coustomer_id, count(amount) from payment group by coustomer_id;
select coustomer_id, amount, count(amount) from payement group by coustomer_id, amount;

select year(payment_date), sum(amount) from payment group by year(payemt_date);

select year(payment_date), staff_id,  sum(amount) from payment group by year(payment_date), staff_id;

-- order by (sort)
select * from payment order by coustomer_id desc, amount desc;

-- conditional function
select coustomer_id, amount, if(amount>3, "high","low" from payment;

select coustomer_id, amount, if(amount=2.99,"high", if(amount=5.99,"avg","low")) from payment;

-- case
select coutomer_id, amount,
case
    when amount=2.99 then "low"
    when amount=5.99 then "high"
    else "low"
end 
from payment;

-- select two column coustomer_id and status if the coustomer_id is greater then 1 print hello if the coustomer_id greater then 4 print user otherwise regex

select customer_id, 
case
    when customer_id>4 then "user"
    when customer_id>1 then "hello"
    else "regex"
end as "status"
from payment;

