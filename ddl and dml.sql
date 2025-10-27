-- DDL:- Data Definition Language
-- to define the structure of table

-- create :- ddl operation (to create an object)
use regex1;
create table t4(id int);

-- drop :- data and table structure both are deleted (we can't undo)
drop table t4;

-- alter :- table structure is changed
create table t3(id int);
alter table t3 add column name varchar(20);
desc t3;

alter table t3 drop column id;
desc t3;

select * from t3;
alter table t3 add column eid int primary key;
desc t3;
-- truncate (ddl operation) :- drop structure + recreate the structure
truncate t3;
select * from t3;


-- dml :- data manipulation language (insert, update, delete, merge)
insert into t3 values('mayu', 11), ('maanu', 12);
select * from t3;

update t3 set name = 'milan';  -- without condition (all rows are updated)
select * from t3;


set sql_safe_updates = 0;
update t3 set name = 'regex' where eid = 11;   -- update on condition 
select * from t3;

delete from t3; -- never used this because all data deleted 
delete from t3 where eid = 12;  -- we can undo it


-- create a col named as email datatype varchar
create table t6 (email varchar (30));

-- add a col named as roll no before the email col using after or first with alter
alter table t6 add column roll_no int first;

-- add a primary key to the roll no and unique key to the email
alter table t6 add primary key (roll_no), add unique (email);
show indexes from t6;

-- insert two rows into both the columns
insert into t6 values(10, 'mayu78@gmail.com'), (11, 'mannu34@gmail.com');
select * from t6;

-- add a new col into the table named as  phone no with datatype as str(varchar)
alter table t6 add column phone_no varchar(10);
desc t6;

-- update any one phone no having the characters
update t6 set phone_no = '12hjj8989' where roll_no = 11;
select * from t6;

-- try to change the datatype of phone no
update t6
set phone_no=null;

alter table t6 modify column phone_no bigint;
select * from t6;

insert into t6(roll_no, phone_no)
values(1,1234567890),
      (2,0987654321);
      
select * from t6;