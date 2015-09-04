# SQL Homework

For this homework, we will use sqlite3, it is already available on your machine using the command `sqlite3`, copy the file sql_dump.sql in a folder where your sqlite3 database will be, then type:

```
sqlite3 wishlists.db < sql_dump.sql
```

This will create the database wishlists. Unlike Postgres, sqlite3 create a file in the folder where you are, if you delete this file, you delete the db !

To connect to the database, type `sqlite3 wishlists.db`, then you can execute sql statements.

Write SQL statements that:

    1. Selects the names of all products that are not on sale.

     select name from products where on_sale = 'f';

    2. Selects the names of all products that cost less than £20.

    select name from products where price < 20;

    3. Selects the name and price of the most expensive product.

    select name, max(price) from products

    4. Selects the name and price of the second most expensive product.
    
    select name, max(price) from products where price < (select max(price) from products);

    5. Selects the name and price of the least expensive product.

    select name, min(price) from products;

    6. Selects the names and prices of all products, ordered by price in descending order.

    select name, price from products order by price DESC;

    7. Selects the average price of all products.

    select avg(price) from products;

    8. Selects the sum of the price of all products.

    select sum(price) from products;

    9. Selects the sum of the price of all products whose prices is less than £20.

    select sum(price) from products where price < 20;

    10. Selects the id of the user with your name.

    select name from users where id = 5 ;

    11. Selects the names of all users whose names start with the letter "J".

    select name from users where name like 'J%';
    

    12. Selects the number of users whose first names are "Spencer".

    select id from users where name like 'Spencer%';

    13. Selects the number of users who want a "Teddy Bear".

    select id from products where name = 'Teddy Bear'); 
    select id from wishlists where product_id = (select id from products where name = "Teddy Bear");



    14. Selects the count of items on the wishlish of the user with your name.
    
    select count(product_id) from wishlists where user_id = 3;

    15. Selects the count and name of all products on the wishlist, ordered by count in descending order.


    select name, count(name)from (select * from products JOIN wishlists where products.id = wishlists.user_id) group by name order by count(name) DESC;


    16. Selects the count and name of all products that are not on sale on the wishlist, ordered by count in descending order.

    select name, count(name)from (select * from products JOIN wishlists where products.id = wishlists.user_id) where on_sale = 'f'  group by name order by count(name) DESC;

    17. Inserts a user with the name "Jonathan Anderson" into the users table. Ensure the created_at column is set to the current time.


    insert into users (created_at, name) values (current_timestamp, 'Jonathan Anderson');


    18. Selects the id of the user with the name "Jonathan Anderson"?

    select id from users where name = "Jonathan Anderson";


    19. Inserts a wishlist entry for the user with the name "Jonathan Anderson" for the product "The Ruby Programming Language".

    insert into wishlists (created_at, user_id, product_id) values (current_timestamp, (select id from users where name = "Jonathon Anderson"), (select id from products where name = "The Ruby Programming Language"));


    20. Updates the name of the "Jonathan Anderson" user to be "Jon Anderson".

    update users set name = "Jon Anderson" where name = "Jonathan Anderson"; 

    21. Deletes the user with the name "Jon Anderson".

    delete from users where name =  "Jon Anderson";

    22. Deletes the wishlist item for the user you just deleted.

    delete from wishlists where id = 78; 

Please supply SQL statements, and the results they generate.



###Hints
  - As with anything, if you get stuck, move on, then go back if you have time.
  - Don't spend all night on it!
  - Use the resources on teh internetz to solve harder ones - there are solutions to these questions that work with what we've learnt today, but other tools exist in SQL that could make the queries 'better' or 'easier'.
