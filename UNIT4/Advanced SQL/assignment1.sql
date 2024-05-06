create database assignment1;

use assignment1;

-- 1. Create a table with Columns - ID, First_Name, Last_Name, Phone_Number. 
--    Assign following constraints without naming them in a single SQL Syntax:

create table one(
ID int primary key,
First_Name varchar(255) check (First_Name like 'A%'),
Last_Name varchar(5) check (length(Last_Name)=5),
Phone_Number varchar(10) unique
);

-- ________________________________________________________________________
-- 2. Create a table with Columns - ID, First_Name, Last_Name, Phone_Number. 
--    Assign following constraints along with naming them in a single SQL Syntax:

create table two (
ID int primary key,
First_Name varchar(255) constraint CHK_FirstName check (First_Name like 'A%'),
Last_Name varchar(5) constraint CHK_LastName check (length(Last_Name)=5),
Phone_Number varchar(10) unique,
constraint PK_ID unique(ID),
constraint UK_PhoneNumber unique(Phone_Number)
);

drop database assignment1;
-- __________________________________________________________
-- 3. Create 2 tables Customers and Orders.
create database assignment1;

use assignment1;

create table Customers(
ID int primary key,
Name varbinary(255),
Phone_Num varchar(10),
Address varchar(255)
);

create table Orders(
ID int primary key,
Customer_ID int,
Total_Order_Amount decimal(10, 2),
constraint fk_customer foreign key (Customer_ID) references Customers(ID)
);

drop database assignment1;

-- ___________________________________________________________
-- 4. Import Customers table from here: 
--    https://drive.google.com/file/d/1W3ueqDoTbpkjd63jPDywyBlwhkM2Csgc/view?usp=sharing

create database assignment1;

use assignment1;

select * from customers;

alter table customers
add constraint Pk_Ifo primary key (FirstName, LastName, City);

drop database assignment1;

-- __________________________________________________________
-- 5. Create following table:

create database assignment1;

use assignment1;

create table Users (
ID int, 
Name varchar(255),
Phone varchar(20),
Address varchar(255),
City varchar(100),
State varchar(100),
Country varchar(100),
Email varchar(255),
constraint PK_User primary key (Name, City, State)
);

select * from Users;
drop database assignment1;
-- _______________________________________________
-- 6. Add Constraints to Existing Table: Given an existing table 'Employees' with columns - 
--    Emp_ID, Emp_Name, Department, Salary, Email. hint - If no table given you need to first create it then solve question

create database assignment1;

use assignment1;

create table Employees(
Emp_ID int,
Emp_Name varchar(255),
Department varchar(100),
Salary decimal,
Email varchar(255),
constraint CHK_Salary check (Salary > 3000),
constraint UK_Email unique (Email)
);

select * from Employees;
drop database assignment1;

-- _________________________________________________________
--  7. Create Table with Multiple Check Constraints: Create a table 'Library_Books' with columns - Book_ID, Title, Genre, Publication_Year, Price.

create database assignment1;

use assignment1;

create table Library_Books (
Book_ID int primary key,
Title varchar(255),
Genre varchar(100) check (Genre in ('Fiction', 'Non-Fiction', 'Science', 'History')),
Publication_Year int check (Publication_Year>1900),
Price decimal check (Price>0)
);

select * from Library_Books;
drop database assignment1;



