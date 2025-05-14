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

