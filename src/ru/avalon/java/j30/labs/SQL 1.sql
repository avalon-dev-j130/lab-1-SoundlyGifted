
create table Roles
(
    id integer unique generated always as 
        identity(start with 1, increment by 1),
    name varchar(255) primary key
);

create table UserInfo
(
    id integer primary key generated always as 
        identity(start with 1, increment by 1),
    name varchar(255) not null,
    surname varchar(255) not null 
);

create table "User"
(
    id integer unique generated always as 
        identity(start with 1, increment by 1),
    email varchar(255) primary key,
    password varchar(255),
    info integer unique 
        references UserInfo(id),
    role integer
        references Roles(id)
);

create table "Order"
(
    id integer primary key generated always as 
        identity(start with 1, increment by 1),
    "user" integer not null 
        references "User"(id),
    created timestamp not null
);

create table Supplier
(
    id integer unique generated always as 
        identity(start with 1, increment by 1),
    name varchar(255) primary key,
    address varchar(255) not null,
    phone varchar(255),
    representative varchar(255) not null    
);

create table Product
(
    id integer unique generated always as 
        identity(start with 1, increment by 1),
    code varchar(255) primary key,
    title varchar(255),
    supplier integer
        references Supplier(id),
    initial_price double,
    retail_value double
);

create table Order2Product
(
    "order" integer
        references "Order"(id),
    product integer
        references Product(id),
    constraint Order2ProductTieUp primary key("order", product)
);