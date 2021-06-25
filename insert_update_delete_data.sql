-- inserting a row

insert into customers 
values (DEFAULT, 'john', 'smith', NULL,NULL, 'adress', 'city', 'CA', DEFAULT); -- default as customer_id had AI

insert into customers ( first_name, last_name, address, city, state)
values ('john', 'smith', 'adress', 'city', 'CA');

-- inserting multiple rows
Insert into shippers (name)
values ('shipper'),('shipper2'),('shipper3');

insert into products (name,quantity_in_stock, unit_price)
values ('harshit',30,1.2);

-- inserting hierarchial rows
insert into orders(customer_id, order_date, status)
values(1, '2019-01-02', 1);
select LAST_INSERT_ID(); -- geting newly insert ID 

insert into order_items
values (Last_insert_id(), 1, 1, 2.95 ),
		(Last_insert_id(), 2, 2, 6.95 );
        
-- copy data from one table to another
-- make orders archive table and input 10 values
-- creating a copy of a table

create table orders_archived as
select * from orders ;

insert into orders_archived
select * from orders 
where order_date < '2018-01-01';

-- exercise
-- new table called invoices archived, instead of client id get client name
-- only incvoices that do have a payment dateinvoices
create table invoices_archived as
select c.name, i.invoice_id, i.number, i.invoice_total, i.payment_total, i.payment_date
from invoices i
left join clients c
	using(client_id)
where payment_date is not null;

-- updating a single row 

update invoices 
set payment_total = 10, payment_date = '2019-03-01'
where invoice_id = 1;

update invoices 
set 
	payment_total = invoice_total * 0.5,
    payment_date = due_date
where invoice_id = 19;

SELECT * FROM sql_invoicing.invoices;
update invoices 
set 
	payment_total = invoice_total * 0.5,
    payment_date = due_date
where client_id in (3, 4);

-- exercise
-- give any customers born before 1990
-- 50 extra points
update customers
set 
	points = points+50
where birth_date < '1990-01-01';

-- using subqueries in updates
-- find if of client first if only name is given
-- a subquery is a select statement in another sql statement 
update invoices 
set 
	payment_total = invoice_total * 0.5,
    payment_date = deu_date 
where client_id IN (	select client_id
					from clients 
					where state in ('CA','NY'));
				
-- exercise 
-- update the comments and points of customers who have more than 3000 customers
SELECT * FROM sql_store.customers;
update orders
set 
	comments = 'Gold customers'
where customer_id in (select customer_id from customers 
				where points > 3000)
-- deleting rows
Delete from invoices
where client_id = (select*
					from clients 
					where name = 'Myworks')






