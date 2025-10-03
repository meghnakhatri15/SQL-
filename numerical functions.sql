use sakila;

select * from actor;

-- Numerical functions-->

-- 1. round--> round off the value

select round(11.5);

select round(11.68,1); -- only the decimal part

select round(11.62,1);

select round(11.685,1);

-- only the integer round off

select round(7.627,-1);

select round(2.627,-1);

select round(12.627,-1);

select round(546.54,-3);

-- truncate--> it will extract the value
select truncate(546.637,2);

-- other functions-->

select mod(10,2);

select floor(6.9999);

select ceil(4.0002);

-- date functions [imporatnt functions]--

select current_date(),current_time(),current_timestamp(),now();

-- 1. adddate-->

select now(),adddate(now(),2);

select now(),adddate(now(),interval 2 month); -- month

select now(),adddate(now(),interval 2 year);

select now(),adddate(now(),interval 2 hour);

select now(),adddate(now(),interval -2 day);

-- addtime-
select now(),addtime(now(),'02:00:00');

-- year/month/last_day--

select now(),year(now()),month(now()),last_day(now());

-- extract-
select now(),extract( Year from now());
select now(),extract( QUARTER from now());

-- date format--

select now(),date_format( now(),'Year is %y,my month is %M');

Use sakila;
select * from payment;

select payment_date,year(payment_date),extract( month from payment_date),
date_format(payment_date,'Hours of shopping %H'),
datediff( payment_date,now() ) from payment;



