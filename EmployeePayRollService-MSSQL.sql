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

--UC7 - find sum, average, min, max and number of male and female employees.
select Sum(salary)  as "TotalSalaryofMales" from employee_payroll where gender = 'M' group by gender;
select Sum(salary)  as "TotalSalaryofFemale" from employee_payroll where gender = 'F' group by gender;
select Sum(salary) as "TotalSalary",Gender from employee_payroll group by Gender;
select Avg(salary) as "AverageSalary",Gender from employee_payroll group by Gender;
select Min(salary) as "MinimumSalary",Gender from employee_payroll group by Gender;
select Max(salary) as "MaximumSalary",Gender from employee_payroll group by Gender;
select count(salary) as "NumberofMales&Females",Gender from employee_payroll group by Gender;


--UC8-- add employee phone, department(not null), Address (using default values)
select * from employee_payroll;

alter table employee_payroll add PhoneNo bigint;

update employee_payroll set PhoneNo = 9234569874 where id = 1;

alter table employee_payroll add Address varchar(100) not null default 'Bangalore';
alter table employee_payroll add Department varchar(250) not null default 'IT';

--UC9 - Extend table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay.
Alter table employee_payroll
add basicpay float, Deduction float, TaxablePay float, IncomeTax float, NetPay float;
select *from employee_payroll;
Update employee_payroll set Deduction = 1000 where Gender = 'F';
Update employee_payroll set Deduction = 1000 where Gender = 'M';
Update employee_payroll set basicpay = 5000 where Gender = 'M';
Update employee_payroll set basicpay = 8000 where Gender = 'F';
update employee_payroll set NetPay = (basicPay - Deduction)
update employee_payroll set TaxablePay = 0, IncomeTax = 0
select * from employee_payroll; 