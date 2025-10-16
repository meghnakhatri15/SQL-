-- datatype--
-- 1.numeric datatype
-- tinyint, smallint, mediumint, int, bigint
use regex123;
-- *.tinyint (1byte)
create table tushar(id tinyint); -- id tinyint unsigned/ using unsined negative number will not store it will start with 0 to 250
insert into tushar1 values(10),(-9);
insert into tushar1 values(-120);-- -128 to 127 (1byte)2**8
select * from tushar1;

-- *.smallint (2byte)
-- *.mediumint (3byte)
-- 2.float datatype
create table tushar2(id float);
insert into tushar2 values(12.345678);
select * from tushar2;

-- 3.double dataype
create table meghna3(id double(5,2)); -- pricision--> specify decimal digit(123.45)
insert into meghna3 values(123.45);
select * from meghna3;

-- 4. char datatype
-- fix size character and it will truncate the all wide spaces from the last
create table tushar4(gender char(5));
insert into tushar4 values('abc');
insert into tushar4 values('abcd');
insert into tushar4 values('abcdefg');-- give error
select * from tushar4;

-- 5. varchar datatype
create table tushar5(gender varchar(5));
insert into tushar5 values('abc');
insert into tushar5 values('abcd');
select gender, char_length(gender) from tushar5;

-- 6. datetime datatype
create table tushar6(date datetime);
insert into tushar6 values('2001-12-15');
select * from tushar6;

-- 7. timestamp datatype
create table tushar7(date timestamp);
insert into tushar7 values('2001-12-15');
insert into tushar7 values(current_timestamp());
select * from tushar7;




