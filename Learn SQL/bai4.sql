CREATE DATABASE EMS
USE EMS
go
-- Create table Employee, Status = 1: are working
CREATE TABLE [dbo].[Employee](
	[EmpNo] [int] NOT NULL
,	[EmpName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[BirthDay] [datetime] NOT NULL
,	[DeptNo] [int] NOT NULL
, 	[MgrNo] [int]
,	[StartDate] [datetime] NOT NULL
,	[Salary] [money] NOT NULL
,	[Status] [int] NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
,	[Level] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE Employee 
ADD CONSTRAINT PK_Emp PRIMARY KEY (EmpNo)
GO

ALTER TABLE [dbo].[Employee]  
ADD  CONSTRAINT [chk_Level] 
	CHECK  (([Level]=(7) OR [Level]=(6) OR [Level]=(5) OR [Level]=(4) OR [Level]=(3) OR [Level]=(2) OR [Level]=(1)))
GO
ALTER TABLE [dbo].[Employee]  
ADD  CONSTRAINT [chk_Status] 
	CHECK  (([Status]=(2) OR [Status]=(1) OR [Status]=(0)))

GO
ALTER TABLE [dbo].[Employee]
ADD Email NCHAR(30) 
GO

ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT chk_Email CHECK (Email IS NOT NULL)
GO

ALTER TABLE [dbo].[Employee] 
ADD CONSTRAINT chk_Email1 UNIQUE(Email)

GO
ALTER TABLE Employee
ADD CONSTRAINT DF_EmpNo DEFAULT 0 FOR EmpNo

GO
ALTER TABLE Employee
ADD CONSTRAINT DF_Status DEFAULT 0 FOR Status

GO
CREATE TABLE [dbo].[Skill](
	[SkillNo] [int] IDENTITY(1,1) NOT NULL
,	[SkillName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Skill
ADD CONSTRAINT PK_Skill PRIMARY KEY (SkillNo)

GO
CREATE TABLE [dbo].[Department](
	[DeptNo] [int] IDENTITY(1,1) NOT NULL
,	[DeptName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Department
ADD CONSTRAINT PK_Dept PRIMARY KEY (DeptNo)

GO
CREATE TABLE [dbo].[Emp_Skill](
	[SkillNo] [int] NOT NULL
,	[EmpNo] [int] NOT NULL
,	[SkillLevel] [int] NOT NULL
,	[RegDate] [datetime] NOT NULL
,	[Description] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT PK_Emp_Skill PRIMARY KEY (SkillNo, EmpNo)
GO

ALTER TABLE Employee  
ADD  CONSTRAINT [FK_1] FOREIGN KEY([DeptNo])
REFERENCES Department (DeptNo)

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT [FK_2] FOREIGN KEY ([EmpNo])
REFERENCES Employee([EmpNo])

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT [FK_3] FOREIGN KEY ([SkillNo])
REFERENCES Skill([SkillNo])
GO

INSERT INTO	dbo.Skill
(
    SkillName,
    Note
)
VALUES
(   N'C++', -- SkillName - nchar(30)
    N'Ngôn ngữ C++'  -- Note - nchar(100)
    ),
(   N'.NET', -- SkillName - nchar(30)
    N'Dot net'  -- Note - nchar(100)
    ),
(   N'Java', -- SkillName - nchar(30)
    N'Ngôn ngữ Java'  -- Note - nchar(100)
    ),
(   N'CSS', -- SkillName - nchar(30)
    N'Cascading Style Sheets'  -- Note - nchar(100)
    ),
(   N'HTML', -- SkillName - nchar(30)
    N'Hyper Text Markup Language'  -- Note - nchar(100)
    ),
(   N'SQL', -- SkillName - nchar(30)
    N'Structured Query Language'  -- Note - nchar(100)
    ),
(   N'Skill 1', -- SkillName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Skill 2', -- SkillName - nchar(30)
    N''  -- Note - nchar(100)
    )

INSERT INTO dbo.Department
(
    DeptName,
    Note
)
VALUES
(   N'Nhân sự', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Sale', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Marketing', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Giám đốc', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Nhân viên', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Bảo vệ', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Phát triển sản phẩm', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    ),
(   N'Ra mắt sản phẩm', -- DeptName - nchar(30)
    N''  -- Note - nchar(100)
    )

INSERT INTO dbo.Employee
(
    EmpNo,
    EmpName,
    BirthDay,
    DeptNo,
    MgrNo,
    StartDate,
    Salary,
    Status,
    Note,
    Level,
	email
)
VALUES
(   1,         -- EmpNo - int
    N'Hứa Vô Chu',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    1,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    1000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    1          -- Level - int
	,'email1@gmail.com'
    ),
(   2,         -- EmpNo - int
    N'Lục Tiểu Thiên',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    1,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    1000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    2          -- Level - int
	,'email2@gmail.com'
    ),
(   3,         -- EmpNo - int
    N'Mục Trần',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    1,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    1000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    1          -- Level - int
	,'email3@gmail.com'
    ),
(   4,         -- EmpNo - int
    N'Tiêu Viêm',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    3,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    1000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    1          -- Level - int
	,'email4@gmail.com'
    ),
(   5,         -- EmpNo - int
    N'La Phong',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    1,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    1000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    1          -- Level - int
	,'email5@gmail.com'
    ),
(   6,         -- EmpNo - int
    N'Đường Tam',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    7,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    1000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    1          -- Level - int
	,'email6@gmail.com'
    ),
(   7,         -- EmpNo - int
    N'Nguyễn Trung Hiếu',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    7,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    10000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    7          -- Level - int
	,'email7@gmail.com'
    ),
(   8,         -- EmpNo - int
    N'Quách Tĩnh',       -- EmpName - nchar(30)
    GETDATE(), -- BirthDay - datetime
    5,         -- DeptNo - int
    1,         -- MgrNo - int
    GETDATE(), -- StartDate - datetime
    1000000,      -- Salary - money
    0,         -- Status - int
    N'',       -- Note - nchar(100)
    6          -- Level - int
	,'email8@gmail.com'
    )

INSERT INTO dbo.Emp_Skill
(
    SkillNo,
    EmpNo,
    SkillLevel,
    RegDate,
    Description
)
VALUES
(   1,         -- SkillNo - int
    1,         -- EmpNo - int
    10,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    ),
(   1,         -- SkillNo - int
    2,         -- EmpNo - int
    3,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    ),
(   4,         -- SkillNo - int
    7,         -- EmpNo - int
    6,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    ),
(   2,         -- SkillNo - int
    3,         -- EmpNo - int
    5,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    ),
(   2,         -- SkillNo - int
    2,         -- EmpNo - int
    5,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    ),
(   5,         -- SkillNo - int
    1,         -- EmpNo - int
    3,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    ),
(   4,         -- SkillNo - int
    5,         -- EmpNo - int
    6,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    ),
(   4,         -- SkillNo - int
    6,         -- EmpNo - int
    7,         -- SkillLevel - int
    GETDATE(), -- RegDate - datetime
    N''        -- Description - nchar(100)
    )
--2
SELECT EmpName, Email, dbo.Department.DeptName
FROM dbo.Employee JOIN dbo.Department ON Department.DeptNo = Employee.DeptNo
WHERE DATEDIFF(MONTH, StartDate, GETDATE()) >= 6
--3
SELECT DISTINCT	EmpName
FROM dbo.Employee JOIN dbo.Emp_Skill ON Emp_Skill.EmpNo = Employee.EmpNo JOIN dbo.Skill ON Skill.SkillNo = Emp_Skill.SkillNo
WHERE SkillName = 'C++' OR SkillName = '.NET'
--4
SELECT emp.EmpName 'Employee name', mgr.EmpName 'Manager name', mgr.Email 'Manager Email'
FROM dbo.Employee emp JOIN	dbo.Employee mgr
ON mgr.EmpNo = emp.MgrNo
--5
SELECT DeptName, STRING_AGG(EmpName, ',') N'List of departments’ employees'
FROM dbo.Department JOIN dbo.Employee ON Employee.DeptNo = Department.DeptNo
GROUP BY DeptName
HAVING COUNT(*) >= 2
--6
SELECT EmpName, Email, COUNT(SkillNo) 'Number of skills'
FROM dbo.Employee JOIN dbo.Emp_Skill ON Emp_Skill.EmpNo = Employee.EmpNo
GROUP BY EmpName, Email
--7
SELECT EmpName
FROM dbo.Employee
WHERE dbo.Employee.EmpNo IN(
				SELECT dbo.Employee.EmpNo FROM dbo.Employee JOIN dbo.Emp_Skill ON Emp_Skill.EmpNo = Employee.EmpNo
				GROUP BY Employee.EmpNo
				HAVING COUNT(SkillNo) > 1
				)
--8
CREATE VIEW list_all_employees as
	SELECT dbo.Employee.EmpName, STRING_AGG(SkillName,',') 'Skill name', dbo.Department.DeptName
	FROM dbo.Employee JOIN dbo.Emp_Skill ON Emp_Skill.EmpNo = Employee.EmpNo
					JOIN dbo.Department ON Department.DeptNo = Employee.DeptNo
					JOIN dbo.Skill ON Skill.SkillNo = Emp_Skill.SkillNo
	GROUP BY dbo.Employee.EmpName, DeptName

SELECT * FROM list_all_employees


SELECT * FROM dbo.Employee
SELECT * FROM dbo.Skill
SELECT * FROM dbo.Department
SELECT * FROM dbo.Emp_Skill




