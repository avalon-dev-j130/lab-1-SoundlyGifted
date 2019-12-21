-- drop table Order2Product;
-- drop table "Order";
-- drop table Product;
-- drop table Supplier;
-- drop table "User";
-- drop table UserInfo;
-- drop table Roles;

-- Tables creation and Tables Relationship establishment.
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
    "user" integer 
        references "User"(id),
    created timestamp
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

-- Inserting at least 3 random records into each Table.
insert into UserInfo(name, surname)
    values
        ('Michael', 'Malone'),
        ('Willie', 'Smith'),
        ('Seamus', 'Grace');

insert into Roles(name)
    values
        ('Buyer'),
        ('Director'),
        ('Production Manager');

insert into "User"(email, password, info, role)
    values
        ('michaelmalone@gmail.com', 'secretPwd1', 1, 2),
        ('williesmith@gmail.com',   'secretPwd2', 2, 3),
        ('seamusgrace@gmail.com',   'secretPwd3', 3, 1);

insert into "Order"("user", created)
    values
        (1, '2019-05-05 10:15:16'),
        (1, '2019-06-09 11:13:19'),
        (2, '2019-04-01 12:15:30'),
        (3, '2019-05-05 09:30:57'),
        (3, '2019-06-07 16:46:34'),
        (3, '2019-07-12 14:35:12');

insert into Supplier(name, address, phone, representative)
    values
        ('UK Autoparts', '21 Heol Y Cwmdu, Gendros, Swansea, SA5 8JF, UK', 
            '+44 808 100 8223', 'John Davis'),
        ('Eireann tires', 
'510C Grants Ave, Jordanstown, Rathcoole, Co. Dublin, D24 K838, Ireland', 
'+353 1 257 5860', 'Sean Murphy'),
        ('Hamburg office supplies', 'Ellenbogen 14, 20144 Hamburg, Germany', 
'+49 172 4529459', 'Hans Fischer');

insert into Product(code, title, supplier, initial_price, retail_value)
    values
        ('AGH-1056-19', 'Circuit Board A127-18', 1, 1000, 1599),
        ('BGC-2067-98', 'Winter Tier H67', 2, 400, 499),
        ('AVY-1098-10', 'Pen black ink BP10', 3, 12, 13.50);

insert into Order2Product("order", product)
    values
        (1, 3),
        (2, 3),
        (3, 1),
        (4, 2),
        (5, 2),
        (6, 2);