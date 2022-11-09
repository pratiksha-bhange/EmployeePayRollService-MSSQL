--UC1-Create Database--
CREATE DATABASE PayRoll_Services;

--UC2 - Create employee_payroll table
create table employee_payroll( ID int primary key not null identity(1,1), NameofStudent varchar (150) not null,Salary int not null,StartDate date);

select * from employee_payroll

--UC3 - inserting values to table
insert into employee_payroll (nameofStudent, Salary, StartDate) values
('Pratiksha', 40000, '22-Mar-2022'),
('kiran', 70000, '17-June-2007'),
('Virat', 50000, '18-May-2010'),
('Rohini', 60000, '09-Jan-2009');