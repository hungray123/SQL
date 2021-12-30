create database Tutorial;

create table STUDENT(
	SSN char(20) primary key,
	Name nvarchar(30),
	Major nvarchar(30),
	Bdate datetime
)

create table COURSE(
	Course char(20) primary key,
	Cname nvarchar(30),
	Dept nvarchar(30),
)
create table ENROLL(
	SSN char(20) ,
	Course char(20),
	Quarters nvarchar(30),
	Grade nvarchar(30),
	primary key (SSN,Course),
	foreign key (SSN) references STUDENT,
	foreign key (Course) references COURSE
)
create table BOOK_ADOPTION(
	Course char(20) ,
	Quarters nvarchar(30),
	Book_ISBN nvarchar(30),

	primary key (Course,Book_ISBN),
	foreign key (Course) references COURSE
)


create table TEXT(
	Book_ISBN nvarchar(30) primary key,
	Book_Title nvarchar(30),
	Publisher nvarchar(30),
	Author  nvarchar(30),
)
