-- 1️⃣ Create the above database as shown in the image with the following steps :

-- Create database named " store ".

CREATE DATABASE store;

-- Create table countries.

USE store ;
CREATE TABLE countries(
code int PRIMARY KEY , 
name VARCHAR(20) unique ,
continent_name VARCHAR(20) NOT NULL);

-- Create table users.

USE store ;
CREATE TABLE users(
id int PRIMARY KEY,
full_name VARCHAR(20),
email VARCHAR(20) unique,
gender char(1) check(gender='m' or gender='f'),
date_of_birth VARCHAR(15),
created_at datetime default CURRENT_TIMESTAMP , 
country_code int ,
 FOREIGN KEY(country_code) REFERENCES countries (code));
 
-- Create table orders.

 USE store ;
CREATE TABLE orders(
id int PRIMARY KEY,
user_id int ,
status VARCHAR(6) check(status='start' or status='finish'),
created_at datetime default CURRENT_TIMESTAMP , 
 FOREIGN KEY(user_id) REFERENCES users (id));


-- Create table products.

 USE store ;
CREATE TABLE products(
id int PRIMARY KEY,
name VARCHAR(10) NOT NULL,
price int default 0,
status VARCHAR(10) check(status='valid' or status='expired'),
created_at datetime default CURRENT_TIMESTAMP );



-- Create table order_products.

USE store ;
CREATE TABLE order_products(
order_id int ,
product_id int ,
quantity int default 0 , 
PRIMARY KEY( order_id,product_id),
FOREIGN KEY(product_id) REFERENCES products (id),
FOREIGN KEY(order_id) REFERENCES orders (id));


--  Write the DML commands for the following instructions ( choose data randomly ) :

-- Add new row to the countries table.


insert into countries values (1,'Riyadh','Riyadh');
select * from countries;

-- Add new row to the users table.


insert into users(id , full_name , email,gender,date_of_birth, country_code) values (1,'ghadeer','ap@gmail.com','f','01-06-1998',1);
select * from users;


-- Add new row to the orders table.

insert into orders(id , user_id , status) values (1,1,'start');
select * from orders;


-- Add new row to the products table.

insert into products(id , name ,price , status) values (1,'app',100,'valid');
select * from products;


-- Add new row to the order_products table.

insert into order_products values (1,1,100);
select * from order_products;


-- Update row from countries table.

update countries set name='Damam' where code=1;
select * from countries;



-- Delete row from products table.
-- first need delete column that have FOREIGN KEY with table product then can delete row from products table
delete from order_products where product_id=1;
delete from products where id=1;