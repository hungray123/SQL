Create database EMS

Create table EMPLOYEE(
	STT INT IDENTITY(1,1),EmpNo AS 'EM' + RIGHT('000' + CAST(STT AS VARCHAR(3)), 3) PERSISTED,
		   CONSTRAINT PK_EM PRIMARY KEY(EmpNo),
	EmpName nvarchar(30),
	BirthDay date,
	DeptNo char(20),
	MgrNo char(20) NOT NULL,
	StartDate datetime2,
	Salary money,
	Level int  CHECK(Level BETWEEN 1 AND 7),
	Status int CHECK(Status BETWEEN 0 AND 2),
	Note nText
)

 INSERT INTO EMPLOYEE(EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Note)
 VALUES(N'Vương Văn Hưng','2000-03-11','DE001','VV01','2020-05-21',15.99,2,0,'PRO')
 INSERT INTO EMPLOYEE(EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Note)
 VALUES(N'Nguyễn Diệu Nhi','2000-04-11','DE001','VV01','2020-05-21',12.99,2,0,'GOOD')
 INSERT INTO EMPLOYEE(EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Note)
 VALUES(N'Trương Vô Kỵ','1999-05-11','DE001','VV01','2020-05-21',15.99,2,0,'PRO')
 INSERT INTO EMPLOYEE(EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Note)
 VALUES(N'Lý Mạc Sầu','2000-09-15','DE001','VV01','2020-05-21',15.99,2,0,'PRO')
 INSERT INTO EMPLOYEE(EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Note)
 VALUES(N'Âu Dương Phong','2000-11-11','DE001','VV01','2020-05-21',15.99,2,0,'PRO')

 INSERT INTO EMPLOYEE(EmpName,BirthDay,DeptNo,MgrNo,StartDate,Salary,Level,Status,Note)
 VALUES(N'Tiêu Phong','2000-12-11','DE001','VV01','2020-05-21',15.99,5,0,'PRO')

Create table SKILL(
	STT INT IDENTITY(1,1),SkillNo AS 'SK' + RIGHT('000' + CAST(STT AS VARCHAR(3)), 3) PERSISTED,
		   CONSTRAINT PK_SK PRIMARY KEY(SkillNo),
	SkillName nvarchar(30),
	Note nText
)
INSERT INTO SKILL(SkillName,Note)
VALUES('c#','VIP1')
INSERT INTO SKILL(SkillName,Note)
VALUES('Mobile','VIP2')
INSERT INTO SKILL(SkillName,Note)
VALUES('FE','VIP3')
INSERT INTO SKILL(SkillName,Note)
VALUES('BE','VIP4')
INSERT INTO SKILL(SkillName,Note)
VALUES('AS','VIP5')
Create table EMP_SKILL(
	SkillNo varchar(5),
	EmpNo varchar(5),
	SkillLevel int CHECK(SkillLevel BETWEEN 1 AND 3),
	RegDate datetime2,
	Description nText,
	primary key(SkillNo,EmpNo),
	foreign key (SkillNo) references SKILL,
	foreign key (EmpNo) references EMPLOYEE,
)
INSERT INTO EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate,Description)
VALUES('SK001','EM001',2,'2021-03-21','hihi')

INSERT INTO EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate,Description)
VALUES('SK001','EM005',2,'2021-03-21','hihi')
INSERT INTO EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate,Description)
VALUES('SK001','EM002',2,'2021-03-21','huhu')
INSERT INTO EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate,Description)
VALUES('SK001','EM003',2,'2021-03-21','kaka')
INSERT INTO EMP_SKILL(SkillNo,EmpNo,SkillLevel,RegDate,Description)
VALUES('SK001','EM004',2,'2021-03-21','tete')


Create table DEPARTMENT(
	STT INT IDENTITY(1,1),DeptNo AS 'DE' + RIGHT('000' + CAST(STT AS VARCHAR(3)), 3) PERSISTED,
		   CONSTRAINT PK_DE PRIMARY KEY(DeptNo),
	DeptName nvarchar(30),
	Note nText
)
INSERT INTO DEPARTMENT(DeptName,Note)
VALUES(N'Nhân sự',N'Xịn')
INSERT INTO DEPARTMENT(DeptName,Note)
VALUES(N'Hành chính',N'Xịn')
INSERT INTO DEPARTMENT(DeptName,Note)
VALUES(N'Chủ Tịch',N'Xịn')
INSERT INTO DEPARTMENT(DeptName,Note)
VALUES(N'Thư Ký',N'Xịn')
INSERT INTO DEPARTMENT(DeptName,Note)
VALUES(N'Giám Đốc',N'Xịn')

--Q2a:
ALTER TABLE EMPLOYEE ADD Email NVARCHAR(30) NOT NULL UNIQUE;
--Q2b:
ALTER TABLE EMPLOYEE ADD CONSTRAINT df_MG default 0 FOR MgrNo,  
					     CONSTRAINT df_ST default 0	FOR	Status;
--Q3a:
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_DE
FOREIGN KEY (DeptNo) REFERENCES DEPARTMENT(DeptNo);
--Q3B:
ALTER TABLE EMP_SKILL
  DROP COLUMN Description;
--Q4a:
-- Ở trên đã thêm.
--Q4b:
CREATE VIEW EMPLOYEE_TRACKING AS
	Select EmpNo,EmpName,Level 
	From EMPLOYEE
	Where Level >=3 AND Level <=5
Select * From EMPLOYEE_TRACKING
					