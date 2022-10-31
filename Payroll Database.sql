--UC1-Create Database--
create database Payroll_Service;

--UC2-Create Table--
create table EmployeePayroll(Id int identity(1,1)primary key, Empname varchar(200),Salary bigint,Startdate date)

--UC3-Insert Record--
insert into EmployeePayroll values('Charlie',30000,'2018-01-01','F')

--UC4-Retrive Payroll Data--
select * from EmployeePayroll

--UC5-Retrive Salary Data--
select * from EmployeePayroll WHERE Startdate BETWEEN CAST('2018-01-01' AS DATE) AND Getdate()

--UC6-Add Emp Gender--
alter table EmployeePayroll add Gender char(1)
update EmployeePayroll set Gender ='M' where Empname='Bill'

--UC7--
Select Sum(salary) as Total_Sum from EmployeePayroll where Gender='M' group by Gender 
Select Sum(salary) as Average_Salary from EmployeePayroll where Gender='M' group by Gender 
Select Sum(salary) as Min_Salary from EmployeePayroll where Gender='M' group by Gender 
Select Sum(salary) as Max_salary from EmployeePayroll where Gender='M' group by Gender 
Select count (*)   as Total_Record from EmployeePayroll group by Gender 