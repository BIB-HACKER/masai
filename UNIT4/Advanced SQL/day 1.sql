# Creating a database
create database demo;

# selecting a given database
use demo;

# Constraints ->


# Primary key (Way 1)
# not null, unique is primary key

create table Users(
ID int primary key,
Full_Name varchar(30)
);

# Droping the table
drop table Users;

#Primary key (Way 2)
create table Users(
ID int,
Full_Name varchar(30),
constraint pk_users_ primary key(ID)
);

# Inserting the data
insert into Users
values
('1', 'Bibhakar'),
-- ('1', 'Papon'); it's show error
('2', 'Papon');

select * from Users;

# Droping the table
drop table Users;
-- _________________________________________________
#Unique Contraint  (Way 1)
create table Users(
ID int unique,
Full_Name varchar(30)
);

# Inserting the data
insert into Users
values
('1', 'Bibhakar'),
-- ('1', 'Papon'); it's show error
('2', 'Papon');

select * from Users;

# Droping the table
drop table Users;

#Unique Constraint (Way 2)
create table Users(
ID int,
Full_Name varchar(30),
constraint unique_constraint unique(ID)   -- contraint name is Static
);

# Inserting the data
insert into Users
values
('1', 'Bibhakar'),
-- ('1', 'Papon'); it's show error
('2', 'Papon');

select * from Users;

# Droping the table
drop table Users;

drop constraint unique_constraint;

-- ______________________________________________________
# Foreign Key (Way 1)
create table Users(
ID int primary key,
Full_Name varchar(30)
);

create table Blogs(
Blog_ID int primary key,
Blog_Name varchar(100),
UserID int,
foreign key (UserID) references Users(ID)
);

select * from Blogs;

# Droping the table
drop table Blogs;
Drop table Users;


# Foreign Key (Way 2)
create table Users(
ID int primary key,
Full_Name varchar(30)
);

create table Blogs(
Blog_ID int primary key,
Blog_Name varchar(100),
UserID int,
constraint fk_users_ foreign key (UserID) references Users(ID)
);

select * from Blogs;

# Droping the table
drop table Blogs;
Drop table Users;

#CHECK

# Way 1 -
create table Users(
ID int primary key,
Full_Name varchar(30) check (Full_Name like '%a%')
);

# Percentage (%) is a wildcard operator.
# it denotes any number of any charactes;

# Inserting the data
insert into Users
values
('1', 'Bibhakar');

# Inserting the data
insert into Users
values
('2', 'Bullet'); -- Bullet is not inserted in User table, because 'bullet' dont have 'a'

select * from Users;

# Droping the table
Drop table Users;


# Way 2 -
create table Users(
ID int primary key,
Full_Name varchar(30),
constraint ck_users_ check (Full_Name like '%a%')
);

# Percentage (%) is a wildcard operator.
# it denotes any number of any charactes;

# Inserting the data
insert into Users
values
('1', 'Bibhakar');

# Inserting the data
insert into Users
values
('2', 'Bullet'); -- Bullet is not inserted in User table, because 'bullet' dont have 'a'

select * from Users;

# Droping the table
Drop table Users;

-- ________________________________________________________________________

# Default constraint
create table Users(
ID int primary key,
FulL_Name varchar(30) default 'MySQL'
);

# inserting the data
insert into Users (ID)
values
(1),
(2),
(3);

select * from Users;

# Droping the table
Drop table Users;

# Not null Constriant
create table Users(
ID int not null,
Full_Name varchar(30)
);

# Inserting the data
insert into Users (Full_Name)
values
('Bibhakar'),
('Ajay'),
('Papon');   -- In Users table ID column inputs must be require

# Droping the table
Drop table Users;

# Dropping the DATABASE
drop database demo;

-- =========================================================================================================
#  Selecting the masai database
use masai;

# Getting an idea about the tables
select * from category;
select * from customers ;
select * from orderdetails;
select * from orders;
select * from payments;
select * from products;
select * from shippers;
select * from suppliers;

# Alter -> change the structure of the table
alter table customers
add Favorite_Sport varchar(30);

select * from customers;

# Dropping a column
alter table customers
drop column Favorite_Sport;

select * from customers;

# Alter -> change the structure of the table
alter table customers
add Favorite_Sport varchar(30);

alter table customers 
alter Favorite_Sport set default 'Cricket';

select * from customers;

# Inserting the data
insert into customers (CustomerID, FirstName, City)
values
(1, 'Prateek', 'Bangalore');

select * from customers;

# Dropping the default vaue
alter table customers
alter Favorite_Sport drop default;

alter table customers 
alter Favorite_Sport set default null ;

# Inserting the data
insert into customers (CustomerID, FirstName, City)
values
(2, 'Nrupul', 'Pune');

select * from customers;

# Dropping the primary key
alter table customers
drop primary key;   -- show error, because thare have no primary key

# Adding a primary key
alter table customers
add primary key (CustomerID);

# Dropping the primary key
alter table customers
drop primary key;

# Adding a primary key
alter table customers
add constraint pk_cust_ primary key (CustomerID);

alter table customers 
alter Favorite_Sport set default null ;

# Inserting the data
INSERT INTO Customers (CustomerID, FirstName) 
VALUES 
(5, 'Ajay');

select * from customers;

# Changing the datatype of the column
alter table customers
modify column Date_of_Birth Date;  -- output only date formate

select * from customers;

# Renaming a column
alter table customers
rename column CustomerID to ID;

select * from customers;

# Renaming a table
alter table customers
rename Customer_Details;

select * from customers;  -- show error, because table name has changed

select * from Customer_Details;













