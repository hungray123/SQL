Create database MM
--Q1:
Create table Movie(
	M_id int IDENTITY(1,1) PRIMARY KEY,
	Mname nvarchar(50) NOT NULL,
	Duration int CHECK(Duration >=60) NOT NULL,
	Genre int CHECK(Genre BETWEEN 1 AND 8) NOT NULL,
	Director nvarchar(30) NOT NULL,
	MoneyOfTicket money NOT NULL,
	Comments nText,
)
EXEC sp_addextendedproperty
	@name='Genre',@value= '(1:Action, 2:Adventure, 3:Comedy, 4:Crime(gangster), 
							5:Dramas, 6:Horror, 7:Musical/Dance, 8:War)',
	@level0type='Schema',@level0name='dbo',
	@level1type='Table',@level1name='Movie',
	@level2type='Column',@level2name='Genre'

INSERT INTO Movie(Mname,Duration,Genre,Director,MoneyOfTicket,Comments) 
VALUES (N'Thiên Long Bát Bộ',240,1,N'Văn Hưng',250.000,'Great')
INSERT INTO Movie(Mname,Duration,Genre,Director,MoneyOfTicket,Comments) 
VALUES (N'Tân Lộc Đỉnh Ký',180,3,N'Alex Vương',899.000,'Amazing')
INSERT INTO Movie(Mname,Duration,Genre,Director,MoneyOfTicket,Comments) 
VALUES (N'Xác Sống 2',220,6,N'Dix K',850.000,'Amazing')
INSERT INTO Movie(Mname,Duration,Genre,Director,MoneyOfTicket,Comments) 
VALUES (N'Châu Tinh Trì',300,3,N'Liễu Phạm',950.000,'Amazing')
INSERT INTO Movie(Mname,Duration,Genre,Director,MoneyOfTicket,Comments) 
VALUES (N'Họa Bì',120,5,N'Tài Mafia',350.000,'Good')

Create table Actor(
	A_id int IDENTITY(1,1) PRIMARY KEY,
	Aname nvarchar(50) NOT NULL,
	Age int NOT NULL,
	Salary money NOT NULL,
	Nationality nvarchar(50) NOT NULL,
)

INSERT INTO Actor(Aname,Age,Salary,Nationality) 
VALUES (N'Tiêu Phong',29,50.000,N'Trung Quốc')
INSERT INTO Actor(Aname,Age,Salary,Nationality) 
VALUES (N'Ngô Gia',30,50.000,N'Trung Quốc')
INSERT INTO Actor(Aname,Age,Salary,Nationality) 
VALUES (N'Thích Tam',20,50.000,N'Trung Quốc')
INSERT INTO Actor(Aname,Age,Salary,Nationality) 
VALUES (N'Châu Tinh Trì',29,100.000,N'Trung Quốc')
INSERT INTO Actor(Aname,Age,Salary,Nationality) 
VALUES (N'Đoàn Dự',19,70.000,N'Trung Quốc')

INSERT INTO Actor(Aname,Age,Salary,Nationality) 
VALUES (N'Bao Công ',55,140.000,N'Trung Quốc')
INSERT INTO Actor(Aname,Age,Salary,Nationality) 
VALUES (N'Vương Tú',51,90.000,N'Trung Quốc')

Create table ActedIn(
	A_id int,
	M_id int,
	Notes nText,
	primary key (A_id,M_id),
	foreign key (A_id) references Movie,
	foreign key (M_id) references Actor,
)
INSERT INTO ActedIn(A_id,M_id) 
VALUES(1,1),
INSERT INTO ActedIn(A_id,M_id) 
VALUES(2,2),
INSERT INTO ActedIn(A_id,M_id) 
VALUES(2,1)
INSERT INTO ActedIn(A_id,M_id) 
VALUES(3,1)
INSERT INTO ActedIn(A_id,M_id) 
VALUES(4,2)
INSERT INTO ActedIn(A_id,M_id) 
VALUES(5,2)

--Q2:
--Q2a:
ALTER TABLE Movie ADD ImageLink nvarchar(70)
ALTER TABLE Movie ADD constraint u_m UNIQUE(ImageLink) 
UPDATE Movie SET ImageLink='No img2' WHERE M_id=2
--select * from Actor
--select * from ActedIn
--Q2b: Insert 5 record . Update
UPDATE MOVIE SET Mname =N'Xác Sống 3'WHERE M_id=3
UPDATE Actor SET Aname =N'Thích Kiều Tam' WHERE A_id=3
--Q3c:
Select * from Actor Where Age>50
--Q3d:
Select Aname,Salary from Actor ORDER BY Salary DESC
--Q3e:
Select Aname, STRING_AGG(Mname,' ,') WITHIN GROUP ( ORDER BY Mname ASC) AS Movies
From   Actor ,Movie, ActedIn 
Where  Movie.M_id=ActedIn.M_id AND Actor.A_id=ActedIn.A_id AND Actor.A_id=2
Group by Aname
--Q3f:
Select Mname as TenPhim, Count(tt.M_id) as Dienvien From  Movie as A inner join ActedIn as tt on tt.M_id=A.M_id
Group by Mname HAVING Count(tt.M_id) >3
--Finish--
Select Mname as TenPhim, Count(tt.M_id) as Dienvien,STRING_AGG(Aname,' ,') WITHIN GROUP ( ORDER BY Aname ASC) AS Actor 
From  Movie as A inner join ActedIn as tt on tt.M_id=A.M_id inner join Actor on Actor.A_id=tt.A_id
Group by Mname HAVING Count(tt.M_id) >3

SELECT Mname as TenPhim, Count(A.A_id) as DienVien, STRING_AGG(Aname, ', ') WITHIN GROUP(ORDER BY Aname ASC) AS Name
FROM Movie as M inner join ActedIn on ActedIn.M_id=M.M_id 
				inner join Actor as A on A.A_id=ActedIn.A_id
GROUP BY Mname HAVING Count(A.A_id) >3
