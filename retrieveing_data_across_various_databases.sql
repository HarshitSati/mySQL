select*
from sql_store.orders;

select order_id, first_name, last_name, o.customer_id
from orders o
join customers c
	ON o.customer_id = c.customer_id;
    
select order_id, o.product_id, quantity, o.unit_price 
from order_items o
join products p
	on p.product_id = o.product_id
order by product_id;

-- join two tables in different databases
Select *
from order_items oi
join sql_inventory.products p
	on oi.product_id = p.product_id;

-- query will be different depending on the current dataset
-- for eguse sql_inventory instead of sql_store, you'll have to 
-- from sql_store.order_items oi join products p on .....

-- Self joins
USE sql_hr;

select e.employee_id, e.first_name, m.first_name as Manager
from employees e
join employees m
	ON e.reports_to = m.employee_id;

-- joining more than two tables

use sql_store;

select 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name
from orders o
join customers c 
	on o.customer_id = c.customer_id
join order_statuses os
	on o.status = os.order_status_id;
    
use sql_invoicing;

select 
	p.payment_id,
    p.client_id, 
    p.invoice_id, 
    pm.name as payment_method,
	c.name
from payments p
join payment_methods pm
	on p.payment_method = pm.payment_method_id
join clients c
	on p.client_id = c.client_id;
    
-- Coumpound join conditions
use sql_store;
select* 
from order_items oi
join order_item_notes oin
	ON oi.order_id = oin.order_id
	AND oi.product_id = oin.product_id;
-- implicit join

select*
from orders o
join customers c
	ON o.customer_id = c.customer_id;
    -- can also be written as in impicit
select*
from orders o, customers c
where o.customer_id = c.customer_id; -- save yourself from cross joint

-- join means inner join 
-- Outer joins

select c.customer_id, c.first_name, o.order_id
from customers c
join orders o
	on c.customer_id = o.customer_id -- if we have an oder in orders table hence not all customers will be returned 
order by c.customer_id;

-- left join

select c.customer_id, c.first_name, o.order_id
from customers c
left join orders o
	on c.customer_id = o.customer_id 
order by c.customer_id;

-- right join 
select c.customer_id, c.first_name, o.order_id
from customers c
right join orders o
	on c.customer_id = o.customer_id 
order by c.customer_id;

-- products with order how many times each product has been ordered
select p.product_id, p.name, o.quantity
from order_items o
join products p 
	on o.product_id= p.product_id;
 -- what all orders exist that have been ordered and not ordered   
select p.product_id, p.name, o.quantity
from order_items o
right join products p 
	on o.product_id= p.product_id
order by product_id desc;

-- outer join between multiple tables
select 
	c.customer_id,
    c.first_name,
	o.order_id,
    sh.name as shipper
from customers c 
left join orders o
	on c.customer_id = o.customer_id
left join shippers sh
	on o.shipper_id = sh.shipper_id
order by c.customer_id;

select o.order_date, o.order_id, c.first_name,
	s.name as shipper, os.name
from orders o
join customers c
	on c.customer_id = o.customer_id
left join shippers s
	on s.shipper_id = o.shipper_id
join order_statuses os
	on os.order_status_id = o.status
order by name;

-- self outer joins
select 
	e.employee_id,
    e.first_name,
    m.first_name as manager
from employees e
left join employees m
	on e.reports_to = m.employee_id;

-- Using claus
select 
	o.order_id,
    c.first_name,
    sh.name as shipper
from orders o
join customers c
	using (customer_id)
left join shippers sh
	using (shipper_id) -- using can also be used to replace (join on __ and __ )
-- on what date who has bought through which process at what amount
select 
	c.name,
	p.date,
    p.amount,
    pm.name
from clients c
join payments p 
	USING(client_id)
join payment_methods pm
	ON pm.payment_method_id = p.payment_method;
    
-- natural joins
select
	o.order_id,
	c.first_name
from orders o
natural join customers c;

-- cross join
select
	c.first_name AS customer,
	p.name as product
from customers c
cross join products p;

select
	s.name as shipper, p.name as product
from shippers s, products p
order by shipper;

-- unions

select order_id, order_date, 'Active' as status
from orders
where order_date >= '2019-01-01'
union
select order_id, order_date, 'Archived' as status
from orders
where order_date < '2019-01-01';

select first_name
from customers
union
select name from shippers ;

select 
	customer_id,
	first_name,
    points,
    'Bronze' as type
from customers
where points < 2000
union
select 
	customer_id,
	first_name,
    points,
    'Silver' as type
from customers
where points between 2000 and 2999
union
select 
	customer_id,
	first_name,
    points,
    'Gold' as type
from customers
where points >= 3000
order by type

