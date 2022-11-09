--UC1-Create Database--
CREATE DATABASE PayRoll_Services;

--UC2 - Create employee_payroll table
create table employee_payroll( ID int primary key not null identity(1,1), NameofStudent varchar (150) not null,Salary float not null,StartDate date);

select * from employee_payroll

