USE sql_store;

SELECT 
	last_name, 
    first_name, 
    points, 
    (points+10)*100 as operation
FROM customers
-- WHERE customer_id = 1
ORDER BY first_name;

SELECT state
FROM customers;
-- removing dups
SELECT DISTINCT state
from customers;

SELECT 
	name, 
    unit_price,
	unit_price*1.1 as "new price"
FROM products;

SELECT*
FROM customers
Where birth_date > '1990-01-01';

-- Get the orders places this year
SELECT *
from orders
where order_date > '2019-01-01';

SELECT* 
From customers
where NOT (birth_date > '1990-01-01' OR  -- where (birth_date <= '1990-01-01' AND (points <= 1000 AND state <>'VA') )
	(points > 1000 AND state = 'VA'));

Select*
from order_items
where order_id = 6 AND unit_price*quantity > 30;

-- IN operator
SELECT*
from customers
where state not in ('VA', 'FL', 'GA');  -- like lists in python

select* 
from products
where quantity_in_stock in (49, 38, 72);

select*
from customers 
where points between 1000 and 3000; -- where points >= 1000 AND points <= 3000

select* 
from customers 
where birth_date between '1990-01-01' AND '2000-01-01';

-- LIKE operator

select*
from customers
where last_name LIKE 'b%' OR last_name LIKE '_____y';

select*
from customers
where address LIKE '%TRAIL%' OR address LIKE '%AVENUE%'; -- sql not case sensitive

-- REGEX
select*
from customers 
where last_name REGEXP '^field'; -- ^ start with field, $ ends with field

select*
from customers 
where last_name REGEXP 'field$';

select*
from customers 
where last_name REGEXP 'field|mac|rose' ;

select*
from customers 
where last_name REGEXP '^field|mac|rose'; -- either start with field or should have mac rose 

select*
from customers 
where last_name REGEXP 'field$|mac|rose'; -- ends with field or should have mac or rose

select*
from customers 
where last_name REGEXP '[a-h]e';

select* 
from customers 
where first_name regexp 'ELKA|AMBUR';

select*
from customers
where last_name regexp 'EY$|ON$';

select*
from customers
where last_name regexp '^MY|SE';

select*
from customers
where last_name regexp 'B[RU]'; -- or 'br!bu'

-- NULL operator
select*
from customers
where phone is not null;

select* 
from orders
where shipped_date is null OR shipper_id is null;

select *
from customers 
order by state desc, first_name desc;

select*
from order_items 
where order_id =2
order by quantity*unit_price desc;

-- Limit claus
select* 
from customers
LIMIT 300;

select*
from customers
order by points desc
LIMIT 3




    
