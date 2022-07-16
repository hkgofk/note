--Question 1
CREATE DATABASE Question1
USE Question1
GO
CREATE TABLE San_Pham(
	Ma_SP INT IDENTITY(1,1) PRIMARY KEY,
	Ten_SP VARCHAR(100) NOT NULL,
	Don_Gia MONEY NOT NULL
)
CREATE TABLE Khach_Hang(
	Ma_KH INT IDENTITY(1,1) PRIMARY KEY,
	Ten_KH NVARCHAR(100) NOT NULL,
	Phone_No CHAR(10) NOT NULL,
	Ghi_Chu NVARCHAR(500),
)
CREATE TABLE Don_Hang(
	Ma_DH INT IDENTITY(1,1) PRIMARY KEY,
	Ngay_DH DATE DEFAULT GETDATE(),
	Ma_SP INT,
	So_Luong INT,
	Ma_KH INT,
	CONSTRAINT fk_DH_SP FOREIGN KEY(Ma_SP) REFERENCES dbo.San_Pham(Ma_SP),
	CONSTRAINT fk_DH_KH FOREIGN KEY (Ma_KH) REFERENCES dbo.Khach_Hang(Ma_KH)
)
INSERT INTO dbo.Khach_Hang
(
    Ten_KH,
    Phone_No,
    Ghi_Chu
)
VALUES
(   N'Nguyễn Trung Hiếu', -- Ten_KH - nvarchar(100)
    '0987654321',  -- Phone_No - char(10)
    N'Khách hàng VIP'  -- Ghi_Chu - nvarchar(500)
    ),
(   N'Bùi Sĩ Quang', -- Ten_KH - nvarchar(100)
    '0987654322',  -- Phone_No - char(10)
    N'Khách hàng VIP'  -- Ghi_Chu - nvarchar(500)
    ),
(   N'Trần Tiểu Tam', -- Ten_KH - nvarchar(100)
    '0987654323',  -- Phone_No - char(10)
    N'Khách hàng VIP'  -- Ghi_Chu - nvarchar(500)
    )
INSERT INTO dbo.San_Pham
(
    Ten_SP,
    Don_Gia
)
VALUES
(   'Iphone 14 pro max',  -- Ten_SP - varchar(100)
    1000000 -- Don_Gia - money
    ),
(   'Samsung S22 ultra',  -- Ten_SP - varchar(100)
    2000000 -- Don_Gia - money
    ),
(   'Nokia 1280',  -- Ten_SP - varchar(100)
    5000000 -- Don_Gia - money
    )
 INSERT INTO dbo.Don_Hang
 (
     Ngay_DH,
     Ma_SP,
     So_Luong,
     Ma_KH
 )
 VALUES
 (   GETDATE(), -- Ngay_DH - date
     1,         -- Ma_SP - int
     1,         -- So_Luong - int
     1          -- Ma_KH - int
     ),
	(   GETDATE(), -- Ngay_DH - date
     2,         -- Ma_SP - int
     1,         -- So_Luong - int
     2          -- Ma_KH - int
     ),
	 (   GETDATE(), -- Ngay_DH - date
     3,         -- Ma_SP - int
     1,         -- So_Luong - int
     3          -- Ma_KH - int
     )
CREATE VIEW Order_Slip as
	SELECT k.Ten_KH, d.Ngay_DH, s.Ten_SP, d.So_Luong, d.So_Luong*s.Don_Gia 'Thanh tien'
	FROM dbo.Khach_Hang k JOIN dbo.Don_Hang d ON d.Ma_KH = k.Ma_KH
							JOIN dbo.San_Pham s ON s.Ma_SP = d.Ma_SP
SELECT * FROM Order_Slip

--Question 2
CREATE DATABASE Question2
USE Question2
GO
CREATE TABLE Department (
	Department_Number INT IDENTITY(1,1) PRIMARY KEY,
	Department_Name NVARCHAR(100) NOT NULL
)
CREATE TABLE Employee_Table (
	Employee_Number INT IDENTITY(1,1) PRIMARY KEY,
	Employee_Name NVARCHAR(100) NOT NULL,
	Department_Number INT,
	CONSTRAINT fk_empt_dept FOREIGN KEY(Department_Number) REFERENCES dbo.Department(Department_Number)
)
CREATE TABLE Skill_Table(
	Skill_Code INT IDENTITY(1,1) PRIMARY KEY,
	Skill_Name NVARCHAR(100) NOT NULL
)
CREATE TABLE Employee_Skill_Table(
	Employee_Number INT,
	Skill_Code INT,
	Date_Registered DATE DEFAULT GETDATE(),
	PRIMARY KEY(Employee_Number,Skill_Code),
	CONSTRAINT fk_EST_Emp FOREIGN KEY(Employee_Number) REFERENCES dbo.Employee_Table(Employee_Number),
	CONSTRAINT fk_EST_Skill FOREIGN KEY(Skill_Code) REFERENCES dbo.Skill_Table(Skill_Code)
)
INSERT INTO dbo.Department
(
    Department_Name
)
VALUES
(N'Giám đốc' -- Department_Name - nvarchar(100)
    ),
(N'Nhân viên' -- Department_Name - nvarchar(100)
    ),
(N'Bảo vệ' -- Department_Name - nvarchar(100)
    )
INSERT INTO dbo.Skill_Table
(
    Skill_Name
)
VALUES
(N'Java' -- Skill_Name - nvarchar(100)
    ),
(N'JavaScript' -- Skill_Name - nvarchar(100)
    ),
(N'PHP' -- Skill_Name - nvarchar(100)
    )
INSERT INTO dbo.Employee_Table
(
    Employee_Name,
    Department_Number
)
VALUES
(   N'Nguyễn Trung Hiếu', -- Employee_Name - nvarchar(100)
    1    -- Department_Number - int
    ),
(   N'Linh Ngoc Trinh', -- Employee_Name - nvarchar(100)
    2    -- Department_Number - int
    ),
(   N'KanCho', -- Employee_Name - nvarchar(100)
    3    -- Department_Number - int
    )
INSERT INTO	 dbo.Employee_Skill_Table
(
    Employee_Number,
    Skill_Code,
    Date_Registered
)
VALUES
(   1,        -- Employee_Number - int
    1,        -- Skill_Code - int
    GETDATE() -- Date_Registered - date
    ),
(   2,        -- Employee_Number - int
    2,        -- Skill_Code - int
    GETDATE() -- Date_Registered - date
    ),
(   3,        -- Employee_Number - int
    3,        -- Skill_Code - int
    GETDATE() -- Date_Registered - date
    )
INSERT INTO dbo.Employee_Skill_Table
(
    Employee_Number,
    Skill_Code,
    Date_Registered
)
VALUES
(   2,        -- Employee_Number - int
    1,        -- Skill_Code - int
    GETDATE() -- Date_Registered - date
    ),
(   3,        -- Employee_Number - int
    2,        -- Skill_Code - int
    GETDATE() -- Date_Registered - date
    )
--2
SELECT e.Employee_Name
FROM dbo.Employee_Table e JOIN dbo.Employee_Skill_Table es ON es.Employee_Number = e.Employee_Number
						JOIN dbo.Skill_Table s ON s.Skill_Code = es.Skill_Code
WHERE s.Skill_Name = 'Java'
--
SELECT Employee_Name
FROM dbo.Employee_Table
WHERE Employee_Number IN (
							SELECT e.Employee_Number
							FROM dbo.Employee_Table e JOIN dbo.Employee_Skill_Table es ON es.Employee_Number = e.Employee_Number
													JOIN dbo.Skill_Table s ON s.Skill_Code = es.Skill_Code
							WHERE s.Skill_Name = 'Java'
							)
--3
SELECT d.Department_Name, STRING_AGG(e.Employee_Name,',') 'List of departments employees'
FROM dbo.Department d JOIN dbo.Employee_Table e ON e.Department_Number = d.Department_Number
GROUP BY d.Department_Name
HAVING COUNT(e.Employee_Number) >= 3
--4
SELECT Employee_Number, Employee_Name
FROM dbo.Employee_Table
WHERE Employee_Number IN (
							SELECT e.Employee_Number
							FROM dbo.Employee_Table e JOIN dbo.Employee_Skill_Table es ON es.Employee_Number = e.Employee_Number
							GROUP BY e.Employee_Number
							HAVING COUNT(es.Skill_Code) > 1
							)
--5
CREATE VIEW cau5 AS 
	SELECT  e.Employee_Number, e.Employee_Name, d.Department_Name
	FROM dbo.Employee_Table e 
							JOIN dbo.Department d ON d.Department_Number = e.Department_Number
	WHERE e.Employee_Number IN (SELECT e.Employee_Number
								FROM dbo.Employee_Table e JOIN dbo.Employee_Skill_Table es ON es.Employee_Number = e.Employee_Number
								GROUP BY e.Employee_Number
								HAVING COUNT(es.Skill_Code) > 1)
SELECT * FROM cau5

SELECT * FROM dbo.Employee_Skill_Table
SELECT * FROM dbo.Employee_Table
SELECT * FROM dbo.Skill_Table
SELECT * FROM dbo.Department








