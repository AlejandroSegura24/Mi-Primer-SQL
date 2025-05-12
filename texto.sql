CREATE TABLE if not exists clients (
    client_id integer primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null unique,
    phone_number varchar(15),
    created_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp
);

CREATE TABLE if not exists products (
    product_id integer unsigned primary key auto_increment,
    name varchar(100) not null,
    slug varchar (200) not null unique,
    description text,
    created_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp
);

CREATE TABLE if not exists bills (
    bill_id integer unsigned primary key auto_increment,
    client_id integer not null,
    total float,
    status enum('open', 'paid', 'lost') not null default 'open',
    created_at timestamp not null default current_timestamp,
    update_at timestamp not null default current_timestamp on update current_timestamp,
    foreign key (client_id) references clients(client_id)
);

instert into bills(client_id, total) value(10, 15.00);