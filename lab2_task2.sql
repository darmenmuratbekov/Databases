create database kbtu
template template0
ENCODING UTF8;
-- сверху создавал отдельную базу данных под названием "kbtu".

-- внизу создавал product
CREATE TABLE product(
    id varchar NOT NULL ,
    name varchar NOT NULL,
    description text,
    price double precision NOT NULL,
    UNIQUE (id,name),
    PRIMARY KEY(id)
);

-- внизу создавал orders_items

CREATE TABLE order_items(
    order_code integer NOT NULL REFERENCES orders(code),
    product_id varchar NOT NULL REFERENCES product(id),
    quantity integer NOT NULL,
    UNIQUE(order_code,product_id),
    PRIMARY KEY(order_code,product_id)
);
-- внизу создавал orders

CREATE TABLE orders(
    code integer UNIQUE NOT NULL,
    customer_id integer REFERENCES customers(id),
    total_sum double precision NOT NULL,
    is_paid boolean NOT NULL

);
-- внизу создавал customer
CREATE TABLE customers(
    id integer NOT NULL,
    full_name varchar(50) NOT NULL,
    timestamp timestamp NOT NULL,
    delivery_adress text NOT NULL
);
-- insert ex
INSERT INTO product(id, name, description, price) VALUES ('a8$3245','chocolate','69% cocao','40.3')
-- update ex
UPDATE product SET id = 'avvrgsdf', name = 'bananas', description = 'for eat',price = '23'WHERE name = 'chocolate';
-- WHERE name = 'chocolate'; идет как флажок

-- delete ex
DELETE FROM product where name = 'bananas';

DROP TABLE product;

alter table customers
ADD PRIMARY KEY (id);