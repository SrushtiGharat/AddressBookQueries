--UC1_Create database--
create database address_book_service
use address_book_service

--UC2_Create Table--
create table address_book
(
First_Name varchar(10) not null,
Last_Name varchar(10) not null,
Address varchar(30) not null,
City varchar(10) not null,
State varchar(15) not null,
ZipCode varchar(6) not null,
PhoneNo varchar(15) not null,
email varchar(20) not null
)

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'address_book';

--UC3_Insert values in table--
use address_book_service;
insert into address_book values
('Ram','Singh','23-River Park','Mumbai','Maharashtra','400500','9999999999','ramsingh@gmail.com'),
('Ravi','Pandey','17-Orchids Colony','Bangalore','Karnataka','500300','8888888888','ravipandey@gmail.com'),
('Seeta','Yadav','02-Green Tower','Mumbai','Maharashtra','400503','6666666666','seetasingh@gmail.com'),
('Riya','Sharma','32-Street Road','Hyderabad','Telangana','300200','444444444','riyasharma@gmail.com'),
('Shyam','Patil','20-Shastri Nagar','Bangalore','Karnataka','500303','7777777777','shyampatil@gmail.com');

select * from address_book;

--UC4_Update contact in addressbook--
Update address_book set PhoneNo = '5555555555' where First_Name = 'Riya' and Last_Name = 'Sharma'; 

--UC5_Delete contact from addressbook--
Delete from address_book where First_Name = 'Riya' and Last_Name = 'Sharma';

--UC6_Retrieve contact by state or city--
select * from address_book where city = 'Mumbai' or state = 'Karnataka';

--UC7_Get count by city or state--
select state,city,count(first_name) from address_book group by city,state;

--UC8_Sort by name given city--
select * from address_book where city = 'Mumbai' order by First_Name;
select * from address_book where city = 'Bangalore' order by First_Name;

--UC9_Add bookname and type columns--_
alter table address_book add addressbook_name varchar(20), type varchar(20);

update address_book set addressbook_name = 'Book1',type = 'Family' where First_Name = 'Seeta' or First_Name = 'Ram';
update address_book set addressbook_name = 'Book2',type = 'Friend' where First_Name = 'Ravi';
update address_book set addressbook_name = 'Book3',type = 'Profession' where First_Name = 'Shyam';

--UC10_Get count by type--
select type, COUNT(type) from address_book group by type;

--UC11_Add contact as friend and family--
Insert into address_book values('Seeta','Yadav','02-Green Tower','Mumbai','Maharashtra','400503','6666666666','seetasingh@gmail.com','Book2','Friend');
select * from address_book;