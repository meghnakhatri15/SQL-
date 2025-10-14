
create database corrdb;
use corrdb;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Chair', 'Furniture', 150.00),
(4, 'Desk', 'Furniture', 300.00),
(5, 'Monitor', 'Electronics', 250.00);

-- Insert data into sales
INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(1, 1, 3, '2025-09-10'),
(2, 2, 5, '2025-09-11'),
(3, 1, 2, '2025-09-15'),
(4, 3, 7, '2025-09-1');
use corrdb;

select * from products;
select * from sales;

-- list all the product whose price higher than the avg price of other product in the same category

select p_out.product_name, p_out.category, p_out.price from products as p_out
where p_out.price>(select avg(price) from products  as p_in where p_in.category=p_out.category);

-- get all products that have been sold more than 3 times in any single sale transaction

select p.product_name, p.product_id from products as p
where p.product_id in(select product_id from sales as s where s.product_id=p.product_id and quantity>3);

-- second highest price
select max(price) from products where price<(select max(price) from products);

-- for all information
select * from products where price=
(select max(price) from products where price<(select max(price) from products));

-- second lowest price
select min(price) from products where price>(select min(price) from products);

-- for all information
select * from products where price=
(select min(price) from products where price>(select min(price) from products));

-- 1.get all the information from product table where the price is greater than price of productid=3
select * from products  
where price>(select price from products where product_id=3);
 
-- 2grt all the information from product table where category of the same as that productid 2 
select * from products
where category in(select category from products where product_id=2);

-- 3 get all the information from product where cateogry of the product is same as pid=2 and pid=3 
select * from products
where category in(select category from products where product_id=2 and product_id=3);

-- 4 get all he info where the price of the product is greater than among all the product 
select * from products
where price>all(select price from products where category ='furniture');

-- 5 get the product id product name and the total quantity sold for each product
select p.product_id, p.product_name, sum(quantity) from products as p
join sales as s on p.product_id=s.product_id group by p.product_id, p.product_name;




