CREATE TABLE if not exists clients (
    client_id integer primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null unique,
    phone_number varchar(15),
    created_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp
);

-- CREATE TABLE if not exists products (
--     product_id integer unsigned primary key auto_increment,
--     name varchar(100) not null,
--     slug varchar (200) not null unique,
--     description text,
--     created_at timestamp not null default current_timestamp,
--     update_at timestamp not null default current_timestamp on update current_timestamp
-- );

CREATE TABLE if not exists products (
    product_id integer unsigned primary key auto_increment,
    sku varchar(20) not null unique,
    name varchar(50) not null,
    slug varchar(50) not null unique,
    description text,
    created_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp
);
alter table products add column price decimal(10,2) after slug;

CREATE TABLE if not exists bills (
    bill_id integer unsigned primary key auto_increment,
    client_id integer not null,
    total float,
    status enum('open', 'paid', 'lost') not null default 'open',
    created_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp
);

CREATE TABLE IF NOT EXISTS bill_products (
    bill_products_id integer unsigned primary key auto_increment,
    bill_id integer unsigned not null,
    product_id integer unsigned not null,
    quantity integer not null default 1,
    created_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp
); 

INSERT INTO clients(client_id, name, email) values(10, 'Eduardo', 'eduardo@mail.com');
INSERT INTO products(name, slug) values('cuaderno', 'slug-cuaderno');
INSERT INTO bills(client_id, total) values(10, 15.00);
INSERT INTO bill_products(product_id, bill_id) values(1, 1);

CREATE TABLE test (
    test_id integer unsigned primary key auto_increment,
    name varchar(100) not null,
    qty integer,
    created_at timestamp not null default current_timestamp
);

ALTER TABLE test add column price float;
ALTER TABLE test drop column price;

CREATE TABLE investment (
    invesment_id integer unsigned primary key auto_increment,
    product_id integer unsigned not null,
    investment integer not null default 0
); 
insert into investment(product_id, investment)
select product_id, stock * price from products

select b.status
from bills as b
left join ckients as c
on b.client_id = c.client_id

select concat ('El cliente ', c.name, ' tiene una cuenta ', b.status, ' con ', count(bp.bill_products_id), ' productos y suma $', round(sum(bp.quantity * p.price * (1 - bp.discount/100)))) as resultado
from bills as b 
left join clients as c
on b.client_id = c.client_id
left join bill_products as bp
on bp.bill_id = b.bill_id
left join products as p
on p.product_id = bp.product_id
group by b.bill_id;

select *
from bills as b 
left join clients as c
on b.client_id = c.client_id
left join bill_products as bp
on bp.bill_id = b.bill_id
left join products as p
on p.product_id = bp.product_id
group by b.bill_id;

INSERT INTO bills (client_id)
SELECT client_id FROM clients;

UPDATE clients
SET client_id = 6106
WHERE client_id = 6107;