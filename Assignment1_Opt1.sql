create database FPT;

--Cau 1a
create table Departments(
	dno char(20) primary key,
	dName nvarchar(30),
	Budget float,
	Nmanaged nvarchar(30)
)
insert into Departments(dno,dName,Budget,Nmanaged) values ('d1','Ke Toan',20.000,'Anh Hung')
insert into Departments(dno,dName,Budget,Nmanaged) values ('d2','Giam Doc',80.000,'Anh Phong')
insert into Departments(dno,dName,Budget,Nmanaged) values ('d3','Hanh Chinh',50.000,'Chi Thu')
 
create table Employees(
	ssn char(20)  primary key ,
	FullName nvarchar(30),
	Age int,
	Phone int,
	Salary float,
	dno char(20),
	foreign key (dno) references Departments
)
insert into Employees(ssn,FullName,Age,Phone,Salary,dno) values ('001','vvh',20,0961461262,20.000,'d1')
insert into Employees(ssn,FullName,Age,Phone,Salary,dno) values ('002','vlt',20,0961461262,20.000,'d1')
insert into Employees(ssn,FullName,Age,Phone,Salary,dno) values ('003','vtp',20,0961461262,20.000,'d1')

insert into Employees(ssn,FullName,Age,Phone,Salary,dno) values ('004','ktl',25,0987564321,20.000,'d2')
insert into Employees(ssn,FullName,Age,Phone,Salary,dno) values ('005','cvk',25,0987564321,20.000,'d3')
insert into Employees(ssn,FullName,Age,Phone,Salary,dno) values ('006','plv',21,0987564321,20.000,'d3')

create table childOfEmployee(
	 Cname nvarchar(30) unique,
	 Age   int,
	 ssn char(20)
	 foreign key (ssn) references Employees
)
insert into childOfEmployee(Cname,Age,ssn) values ('Nam',15,'001')
insert into childOfEmployee(Cname,Age,ssn) values ('Thanh',8,'001')

insert into childOfEmployee(Cname,Age,ssn) values ('Thinh',4,'003')
insert into childOfEmployee(Cname,Age,ssn) values ('Phat',6,'003')

select Cname from childOfEmployee where ssn='001'(select FullName from Employees where ssn='001')
select Cname from childOfEmployee  Employees where ssn='001'
--alter table Employees add  unique (FullName)

--Cau 1b

Create schema NV;

create table NV.Departments(
	dno char(20) primary key,
	dName nvarchar(30),
	Budget float,
	Nmanaged nvarchar(30)
)
create table NV.Employees(
	ssn char(20)  primary key ,
	FullName nvarchar(30),
	Age int,
	Phone int,
	Salary float,
	dno char(20),
	foreign key (dno) references NV.Departments
)
create table NV.childOfEmployee(
	 Cname nvarchar(30) unique,
	 Age   int,
	 ssn char(20)
	 foreign key (ssn) references NV.Employees
)