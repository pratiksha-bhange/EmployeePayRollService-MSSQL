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

-- UC10 - Adding another Value for Terissa in Sales&Marketing Department.
insert into employee_payroll 
values(104,'Terissa',400000.00,'2020-06-1','F',8156782910,'Sales','mumbai',2000,1000,200,18000),
(105,'Terissa',400000.00,'2020-06-1','F',8156782910,'Marketing','mumbai',2000,1000,200,18000);
select * from employee_payroll; 

--UC11 - adding same name to with differnt department and same other attributes to same table.
--adding Department table
create table Department(department_id int not null primary key,department_name varchar(20) not null);

--inserted data into department table
insert into Department values(101,'Sales'),(102,'Marketing');
select * from Department;

--creating payroll table
create table payroll(payroll_Id int not null primary key,basic_pay money not null,deductions money not null,taxable_pay money not null,net_pay money not null,income_tax money not null);

--inserted data into payroll table
insert into payroll values(201,500000,3000,2000,22000,300),
(202,600000,4000,3000,32000,400),
(203,700000,5000,4000,42000,500);
select * from payroll;

--adding company table
create table company(company_id int not null primary key,company_name varchar(20) not null);

--inserted data into company table
insert into company values
(301,'Nokia'),
(302,'Samsung');
select * from company;

--creating employee table
create table employee(employee_id int not null primary key,employee_name varchar(70) not null,gender char(1) not null,address varchar(100) not null,phone_number bigint not null,start_date datetime not null,company_id int not null,payroll_id int not null,basic_pay money not null,foreign key(company_id) references company(company_id),foreign key(payroll_id) references payroll(payroll_Id));

--inserted data into employee table
insert into employee values
(1,'Poonam','F','latur',3939390910,'2020-10-2',301,201,300000),
(2,'Ruhi','M','pune',3939690910,'2019-10-2',302,202,40000),
(3,'Diksha','F','amrvati',3959390910,'2020-10-2',301,203,600000);
select * from employee;

--creating employee department table
create table EmployeeDepartment(employee_Department_id int not null,employee_id int not null,department_id int not null,foreign key(employee_id) references employee(employee_id),foreign key(department_id)references Department(department_id));

--inserted data into employee department table
insert into EmployeeDepartment values
(401,1,101),
(402,2,102),
(401,1,102),
(402,2,101);
select * from EmployeeDepartment;