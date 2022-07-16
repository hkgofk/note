CREATE DATABASE MovieCollection
GO
USE MovieCollection
GO

CREATE TABLE Movie(
	MovieID INT IDENTITY(1,1) PRIMARY KEY,
	MovieName VARCHAR(100) NOT NULL,
	Duration FLOAT CHECK (Duration >= 1) NOT NULL,
	Genre INT CHECK (Genre BETWEEN 1 AND 8) NOT NULL,
	Director VARCHAR(100) NOT NULL,
	AmountOfMoney MONEY NOT NULL,
	Comments NTEXT
)
CREATE TABLE Actor(
	ActorID INT PRIMARY KEY IDENTITY(1,1),
	ActorName VARCHAR(100) NOT NULL,
	Age INT NOT NULL,
	AVGsalary MONEY NOT NULL,
	Nationality VARCHAR(100) NOT NULL   
)
CREATE TABLE ActedIn(
	ActorID INT,
	MovieID INT,
	StartTime DATE NOT NULL,
	FinishTime DATE NOT NULL,
	PRIMARY KEY(ActorID, MovieID)
)
ALTER TABLE dbo.ActedIn ADD CONSTRAINT fk_ActedIn_ActorID FOREIGN KEY(ActorID) REFERENCES dbo.Actor(ActorID)
ALTER TABLE dbo.ActedIn ADD CONSTRAINT fk_ActedIn_MovieID FOREIGN KEY(MovieID) REFERENCES dbo.Movie(MovieID)
--Q2
ALTER TABLE dbo.Movie ADD ImageLink VARCHAR(100) NOT NULL UNIQUE
--insert data Movie
insert into Movie (MovieName, Duration, Genre, Director, AmountOfMoney, Comments, ImageLink) values ('Tao of Steve, The', 1.5, 1, 'Amara Cluely', '$436.40', null, 'http://dummyimage.com/105x100.png/ff4444/ffffff');
insert into Movie (MovieName, Duration, Genre, Director, AmountOfMoney, Comments, ImageLink) values ('Bronx Obama', 2, 2, 'Daphna Nozzolinii', '$418.44', null, 'http://dummyimage.com/241x100.png/ff4444/ffffff');
insert into Movie (MovieName, Duration, Genre, Director, AmountOfMoney, Comments, ImageLink) values ('Children in the Wind (Kaze no naka no kodomo)', 2.5, 3, 'Janella Allchin', '$910.74', null, 'http://dummyimage.com/122x100.png/dddddd/000000');
insert into Movie (MovieName, Duration, Genre, Director, AmountOfMoney, Comments, ImageLink) values ('Report to the Commissioner', 2, 4, 'Ricardo Dwyer', '$629.73', null, 'http://dummyimage.com/116x100.png/5fa2dd/ffffff');
insert into Movie (MovieName, Duration, Genre, Director, AmountOfMoney, Comments, ImageLink) values ('Pavilion of Women', 3, 5, 'Caron Broadberrie', '$797.52', null, 'http://dummyimage.com/166x100.png/5fa2dd/ffffff');
--insert data Actor
insert into Actor (ActorName, Age, AVGsalary, Nationality) values ('Mal Ege', 40, '$354.45', 'Indonesia');
insert into Actor (ActorName, Age, AVGsalary, Nationality) values ('Lissi Akerman', 4, '$80.38', 'Armenia');
insert into Actor (ActorName, Age, AVGsalary, Nationality) values ('Joana Scarlan', 48, '$356.45', 'Portugal');
insert into Actor (ActorName, Age, AVGsalary, Nationality) values ('Angelica Corneck', 38, '$937.64', 'Pakistan');
insert into Actor (ActorName, Age, AVGsalary, Nationality) values ('Franzen Gazey', 29, '$978.67', 'Malaysia');
--insert data ActedIn
insert into ActedIn (ActorID, MovieID, StartTime, FinishTime) values (3, 3, '7/8/2021', '9/5/2021');
insert into ActedIn (ActorID, MovieID, StartTime, FinishTime) values (5, 3, '4/19/2021', '7/10/2021');
insert into ActedIn (ActorID, MovieID, StartTime, FinishTime) values (5, 1, '6/10/2021', '3/27/2021');
insert into ActedIn (ActorID, MovieID, StartTime, FinishTime) values (4, 5, '11/12/2021', '8/23/2021');
insert into ActedIn (ActorID, MovieID, StartTime, FinishTime) values (1, 3, '10/11/2021', '1/11/2021');

UPDATE dbo.Actor SET ActorName = 'Nguyen Trung Hieu' WHERE ActorID = 1
--Q3
--cau 1
SELECT ActorID,ActorName,Age,AVGsalary,Nationality 
FROM dbo.Actor
WHERE Age > 50
--cau 2
SELECT ActorName,AVGsalary FROM dbo.Actor
ORDER BY AVGsalary DESC
--cau 3
SELECT MovieName 'Movie name' FROM dbo.Actor JOIN dbo.ActedIn ON ActedIn.ActorID = Actor.ActorID JOIN dbo.Movie ON Movie.MovieID = ActedIn.MovieID
WHERE ActorName LIKE 'Franzen Gazey'
--cau 4
SELECT Movie.MovieName 'Movie name' FROM dbo.ActedIn INNER JOIN dbo.Movie ON Movie.MovieID = ActedIn.MovieID INNER JOIN dbo.Actor ON Actor.ActorID = ActedIn.ActorID
WHERE dbo.Movie.Genre = 1
GROUP BY Movie.MovieName
HAVING COUNT(Actor.ActorID) > 3
