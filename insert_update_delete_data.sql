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

-- inserting in mutiple 