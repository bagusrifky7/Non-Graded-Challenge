/* Membuat tabel customer_table */
create table customer_table (
customer_id int,
    customer_name varchar,
    city varchar
);

/* Membuat tabel order_table */
create table order_table (
order_id int,
	customer_id int,
	order_date date,
	total_amount float4
);

/* Input value tabel customer_table */
insert into customer_table
values
(1, 'John Doe', 'New York'),
(2, 'Jane Smith', 'Los Angeles'),
(3, 'David Johnson', 'Chicago');

/* Input value order_table */
insert into order_table
values
(1, 1, '2022-01-10', 100.00),
(2, 1, '2022-02-15', 150.00),
(3, 2, '2022-03-20', 200.00),
(4, 3, '2022-04-25', 50.00);

/* Display kedua tabel */
select * from customer_table;
select * from order_table;

/* anak tabel dari customer_table */
create table cust_name as 
	select customer_id, customer_name from customer_table;

/* anak tabel dari order_table */
create table cust_order as
	select customer_id, count(total_amount) as total_order from order_table
	group by customer_id;

/* Tabel joins untuk output */
select
	a.customer_name,
	b.total_order
from cust_name as a
inner join cust_order as b
on a.customer_id = b.customer_id;

