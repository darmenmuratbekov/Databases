create table products (
UPC_code varchar primary key,
brand varchar references brand_belongs,
price integer);
--
--  UPC  code products
create table products_weight(
  UPC_code varchar primary key,
  name varchar references type_of_product,
  weight numeric(2,2)
);
--
create table packging(
means_of_packaging  varchar(1)  primary key,
name varchar);
--
create table brand_belongs(
brand varchar primary key ,
vendor_name varchar);
--
create table branch(
branch_code varchar primary key,
city varchar,
street varchar,
opening_hours varchar,
closing_hours varchar
);
--
create table customers(
customer_id varchar primary key,
customer_name  varchar,
age integer);



--  date data calendar
create table history_of_purchases(
purchase_id varchar primary key,
customer_id  varchar references customers,
date_of_purchase date,
UPC_code varchar references products ,
means_of_packaging varchar(1)
references packging ,
branch_code varchar references branch
);
create table type_of_product(
name varchar primary key,
type varchar
);
insert into products(upc_code, brand, price)  VALUES
('UPC123','Nike',100 ),
('UPC124', 'Adidas', 200),
('UPC125', 'Jordan', 300),
('UPC126', 'kale', 400),
('UPC127','PEPSI', 500);
insert  into  products_weight(upc_code, name, weight) VALUES
('UPC123' ,'product1', 1.5),
('UPC125', 'product2', 1.6),
('UPC126', 'product3', 1.7),
('UPC127', 'product4', 1.8),
('UPC128', 'product5', 1.9);

insert  into packging(means_of_packaging, name) VALUES
('B',  'BOXING'),
('P',  'PACKING');




insert into brand_belongs(brand, vendor_name) VALUES
('Nike', 'Magnum' ),
('Adidas',  'Mega_shops'),
 ('Jordan',  'Small'),
('kale','Golden_Mart' ),
('PEPSI','Pepsi_shop');
insert into  branch(branch_code, city, street, opening_hours, closing_hours) VALUES

('BC123','Almaty', 'Abay', '7.00', '23.00'),
('BC124', 'Astana', 'Kabanbay_batur', '8,00', '24.00'),
('BC125', 'New_York', 'Wall-street', '8.00', '24.00'),
('BC126', 'Moscow', 'Red_place', '6.00',  '20.00'),
('BC127', 'Semey', 'kendala', '9.00', '20,00');

insert  into  customers(customer_id, customer_name, age) VALUES

('ID134', 'DARMEN',  17),
('ID298', 'DAULET',  19),
('ID367',  'AIDOS', 23),
('ID456', 'SYMBAT',  23),
('ID567', 'OMAR',  43);

insert into history_of_purchases(purchase_id, customer_id, date_of_purchase, UPC_code, means_of_packaging, branch_code) VALUES

('ID201', 'ID134','2016-03-22', 'UPC123', 'B', 'BC123' ),
('ID202',  'ID135', '2016-04-22', 'UPC124', 'P', 'BC124'),
('ID202', 'ID136', '2020-04-09', 'UPC125', 'B', 'BC125'),
('ID203', 'ID136', '2010-04-18', 'UPC126', 'B', 'BC126'),
('ID204', 'ID137', '2021-08-18', 'UPC127', 'P', 'BC127'),
('ID205',  'ID138', '200-09-28', 'UPC128', 'B', 'BC128');
insert   into  type_of_product(name, type) Values
('product1', 'perfume'),
('product2', 'Handbag'),
('product3', 'hat' ),
('product4', 'watch'),
('product5', 'glasses');


SELECT count(purchase_id) , b.city,  UPC_code from products p join history_of_purchases hop on p.UPC_code = hop.UPC_code

join products_weight pw on hop.UPC_code = pw.UPC_code join branch b on hop.branch_code = b.branch_code
group by (b.city,  Upc_code)
limit 20;


SELECT count(purchase_id), branch_code from products p join history_of_purchases hop on p.UPC_code = hop.UPC_code
join products_weight pw on hop.UPC_code = pw.UPC_code and date_part('year',date_of_purchase) = 2020
group by Upc_code
limit 5;


SELECT count(purchase_id),b.branch_code,  UPC_code from products p join history_of_purchases hop on p.UPC_code = hop.UPC_code

join products_weight pw on hop.UPC_code = pw.UPC_code join branch b on hop.branch_code = b.branch_code
group by UPC_code,b.branch_code
limit 20;

SELECT count(purchase_id),b.branch_code,  UPC_code from products p join history_of_purchases hop on p.UPC_code = hop.UPC_code

join products_weight pw on hop.UPC_code = pw.UPC_code join branch b on hop.branch_code = b.branch_code
group by UPC_code,b.branch_code
limit 20;
