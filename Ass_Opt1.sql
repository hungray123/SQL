Create database HungVV
go

Create table Trainee(
	TraineeID int primary key IDENTITY(1,1),
	Full_Name nvarchar(30) NOT NULL,
	Birth_Date date,
	Gender nvarchar(8),
	ET_IQ int,
	ET_Gmath int,
	ET_English int,
	Training_Class char(20),
	Evaluation_Notes nText
)
ALTER TABLE Trainee add Constraint IQ_INPUT CHECK(ET_IQ BETWEEN 0 AND 20 )
ALTER TABLE Trainee add Constraint Gmath_INPUT CHECK(ET_Gmath BETWEEN 0 AND 20 )
ALTER TABLE Trainee add Constraint English_INPUT CHECK(ET_English BETWEEN 0 AND 50 )
--------------------------------------------------------------------------------------
--Câu 1A: Thêm >10 bản ghi.
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Vương Văn Hưng','2000-03-11','Nam',18,20,50,'FPT123XYZ',N'Xuất sắc,đẹp trai,phong độ')

Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Nguyễn Thu Trang','2000-05-19',N'Nữ',20,20,50,'FPT123XYZ',N'Xuất sắc,xinh gái,dịu dàng')
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Nguyễn Bích Ngọc','2000-08-24',N'Nữ',15,19,40,'FPT123XYZ',N'Xuất sắc,xinh gái,dịu dàng')
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Phạm Thùy Dung','2000-08-01',N'Nữ',15,12,45,'FPT123XYZ',N'Xuất sắc,xinh gái,học giỏi')
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Lê Tuyết Nhung','2000-11-24',N'Nữ',15,19,40,'FPT123XYZ',N'Xuất sắc,xinh gái,cá tính')
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Phùng Thanh Hương','2000-09-21',N'Nữ',20,20,40,'FPT123XYZ',N'Xuất sắc,xinh gái,học giỏi,sáng tạo')

Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Mạc Hồng Nhi','2000-11-20',N'Nữ',20,19,40,'FPT123XYZ',N'Xuất sắc,xinh gái,hiền lành')
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Nguyễn Hoàng Châu','2000-11-21',N'Nữ',20,19,40,'FPT123XYZ',N'Xuất sắc,xinh gái,học giỏi,ngoan ngoãn')

Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Trần Thanh Phong','2000-12-15','Nam',14,19,42,'FPT123XYZ',N'Giỏi,đẹp trai bình thường,ngoan ngoãn')

Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Lê Đình Nam','2000-03-15','Nam',18,20,44,'FPT123XYZ',N'Giỏi,đẹp trai,chăm chỉ')
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Nguyễn Thành Nam','2000-04-18','Nam',18,20,50,'FPT123XYZ',N'Xuất sắc,đẹp trai,chăm chỉ,tốt bụng')
Insert into Trainee(Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
VALUES(N'Nguyễn Thanh Tùng','2000-02-10','Nam',16,20,50,'FPT123XYZ',N'Giỏi,đẹp trai,tốt bụng')

--SELECT *from Trainee
--drop table Trainee
--DELETE from  Trainee where Full_Name=N'Phạm Thùy Dung'
--DELETE from  Trainee where Fsoft_Account='user123'
--ALTER TABLE Trainee drop column Fsoft_Account 

--Câu 1B: add column Fsoft_Account 
ALTER TABLE Trainee ADD Fsoft_Account nvarchar(30);
ALTER TABLE Trainee ADD Fsoft_Account nvarchar(30) NOT NULL UNIQUE;
--ALTER TABLE Trainee ALTER Column Fsoft_Account nvarchar(30) NOT NULL;
--ALTER TABLE Trainee ADD UNIQUE (Fsoft_Account)
--Update Trainee SET Fsoft_Account='user1' where TraineeID=1



--Câu 1C: ...
	CREATE VIEW view_scores AS 
	Select Full_Name,ET_IQ,ET_Gmath,ET_English from Trainee where ET_IQ +ET_Gmath>=20 AND
														          ET_IQ>=8 AND
														          ET_Gmath>=8 AND
														          ET_English>=18
	
	Select *from view_scores
--Câu 1D: ..
SELECT MONTH(Birth_Date) as Tháng, STRING_AGG(Full_Name,', ')
	WITHIN GROUP ( ORDER BY Full_Name ASC) AS Full_Name 
	FROM TRAINEE 
	where ET_IQ+ET_Gmath>=20 AND 
		  ET_IQ>8 AND 
		  ET_Gmath>=8 AND 
		  ET_English>=18 
	group by MONTH(Birth_Date)
--Câu 1E:
 SELECT Top 1 Full_Name,LEN(Full_Name) AS Length, 2021-YEAR(Birth_Date) as Age,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class
 FROM TRAINEE 
 order by Length DESC,Full_Name ASC




