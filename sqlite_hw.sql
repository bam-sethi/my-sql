
-- 1.
 select name from products where on_sale = 'f';
-- 2.
select name from products where price < 20;
-- 3.
select name, max(price) from products
-- 4.
select name, max(price) from products where price < (select max(price) from products);
-- 5.
select name, min(price) from products;
-- 6.
select name, price from products order by price DESC;
-- 7.
select avg(price) from products;
-- 8.
select sum(price) from products;
-- 9.
select sum(price) from products where price < 20;
-- 10.
select name from users where id = 5 ;
-- 11.
select name from users where name like 'J%';
-- 12.
select id from users where name like 'Spencer%';
-- 13.
select count(user_id) from wishlists where product_id  = (select id from products where name = 'Teddy Bear'); 
select id from wishlists where product_id = (select id from products where name = "Teddy Bear");
-- 14.
select count(product_id) from wishlists where user_id = 3;
-- 15.
select name, count(name)from (select * from products JOIN wishlists where products.id = wishlists.user_id) group by name order by count(name) DESC;
-- 16.
select name, count(name)from (select * from products JOIN wishlists where products.id = wishlists.user_id) where on_sale = 'f'  group by name order by count(name) DESC;
-- 17.
insert into users (created_at, name) values (current_timestamp, 'Jonathan Anderson');
-- 18
select id from users where name = "Jonathan Anderson";
-- 19.
insert into wishlists (created_at, user_id, product_id) values (current_timestamp, (select id from users where name = "Jonathon Anderson"), (select id from products where name = "The Ruby Programming Language"));
-- 20.
   update users set name = "Jon Anderson" where name = "Jonathan Anderson"; 
-- 21.
  delete from users where name =  "Jon Anderson";
-- 22.
delete from wishlists where id = 78; 


