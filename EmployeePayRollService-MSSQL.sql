--UC1-Create Database--
CREATE DATABASE PayRoll_Services;

--UC2 - Create employee_payroll table
create table employee_payroll( ID int primary key not null identity(1,1), NameofStudent varchar (150) not null,Salary int not null,StartDate date);

select * from employee_payroll

--UC3 - inserting values to table.
insert into employee_payroll (nameofStudent, Salary, StartDate) values
('Bill', 100000.00, '2018-01-03'),
('Terisa', 200000.00, '2019-11-13'),
('Charlie', 300000.00, '2020-05-21');


--UC4 - Retrieve employee_payroll data
select * from employee_payroll

--UC5 - Retrieve salary of particular employee and in particular date range.
select salary from employee_payroll where nameofStudent = 'Bill';
select * from employee_payroll
where StartDate between CAST ('2018-01-01' as date) and GETDATE()


--UC6 - add Gender to Employee_Payroll Table and Update the Rows to reflect the correct Employee Gender.
Alter table employee_payroll add Gender char(1);

Update employee_payroll set Gender='F' where nameofStudent = 'Terisa';
Update employee_payroll set Gender='M' where nameofStudent = 'Bill' or nameofStudent = 'Charlie';
update employee_payroll set salary = 300000.00 where nameofStudent = 'Terisa';


