use sakila;
select * from payment;
-- multirow subquery

select amount from payment where payment_id=2 or payment_id=3;
select * from payment 

where amount in(select amount from payment where payment_id=2 or payment_id=3);
-- in and any both operator are same
select * from payment
where amount >any (select amount from payment where payment_id=2 or payment_id=3);
select * from payment
where amount <any (select amount from payment where payment_id=2 or payment_id=3)
order by amount desc;

-- all operator
select * from payment
where amount >all (select amount from payment where payment_id=2 or payment_id=3);

select * from payment
where amount <=all (select amount from payment where payment_id=2 or payment_id=3)
order by amount ;
