use sakila;

-- 1.Drop column picture from staff.
alter table staff
drop column picture;

-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer
where first_name = "tammy" and last_name = "sanders";

insert into staff
values (3, "Tammy", "Sanders", 79, lower('TAMMY.SANDERS@sakilacustomer.org'), 2, 1, "Tammy", " ", current_timestamp());

-- 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
select customer_id from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select film_id from film
where title = "Academy Dinosaur";

select inventory_id from inventory
where film_id = 1;

select staff_id from staff
where first_name = "Mike";

insert into rental
values (16050, current_timestamp(), 1, 130, current_timestamp(), 1, current_timestamp());

-- 4.Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. 
select * from customer
where active = 0;

create table deleted_users (
customer_id int unique not null,
email varchar(255) default null,
date datetime default null,
constraint primary key (customer_id)
);

insert into deleted_users (customer_id, email, date)
select customer_id, email, create_date from customer
where active = 0;

select * from deleted_users;

SET FOREIGN_KEY_CHECKS=0;
delete from customer where active = 0;
SET FOREIGN_KEY_CHECKS=1;
