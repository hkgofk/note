CREATE DATABASE EmployeeManagementSystem
USE EmployeeManagementSystem
CREATE TABLE DEPARTMENT
(
	DeptNo INT IDENTITY PRIMARY KEY,
	DeptName NVARCHAR(500) NOT NULL,
	Note TEXT
)
CREATE TABLE SKILL
(
	SkillNo INT IDENTITY PRIMARY KEY,
	SkillName NVARCHAR(100) NOT NULL,
	Note TEXT)
CREATE TABLE EMPLOYEE(
	EmpNo INT IDENTITY PRIMARY KEY,
	EmpName NVARCHAR(100) NOT NULL,
	BirthDay DATE NOT NULL,
	DeptNo INT NOT NULL,
	MgrNo INT NOT NULL,
	StartDate DATE NOT NULL,
	Salary MONEY NOT NULL,
	Level INT CHECK(Level BETWEEN 1 AND 7) NOT NULL,
	Status INT CHECK(Status BETWEEN 0 AND 2) NOT NULL,
	Note TEXT
	
)
CREATE TABLE EMP_SKILL(
	SkillNo INT NOT NULL,
	EmpNo INT NOT NULL,
	SkillLevel INT CHECK(SkillLevel  BETWEEN 1 AND 3) NOT NULL,
	RegDate DATE NOT NULL,
	Description TEXT,
	PRIMARY KEY(skillno,empno),
	CONSTRAINT fk_emp_sk FOREIGN KEY(SkillNo) REFERENCES dbo.SKILL(SkillNo),
	CONSTRAINT fk_emp_emp FOREIGN KEY(EmpNo) REFERENCES dbo.EMPLOYEE(EmpNo)
)
--q2
--1
ALTER TABLE dbo.EMPLOYEE ADD Email VARCHAR(100)
ALTER TABLE dbo.EMPLOYEE ADD CONSTRAINT ct_email UNIQUE (Email)
--2
ALTER TABLE dbo.EMPLOYEE
ADD CONSTRAINT df_MgrNo
DEFAULT 0 FOR MgrNo;
ALTER TABLE dbo.EMPLOYEE
ADD CONSTRAINT df_Status
DEFAULT 0 FOR Status;
--q3
--1
ALTER TABLE dbo.EMPLOYEE ADD CONSTRAINT fk_employee_DeptNo FOREIGN KEY(DeptNo) REFERENCES dbo.DEPARTMENT(DeptNo)
--2
ALTER TABLE dbo.EMP_SKILL DROP COLUMN Description
--q4
INSERT INTO dbo.DEPARTMENT
(
    DeptName,
    Note
)
VALUES
(   N'Phòng 1', -- DeptName - nvarchar(100)
    N'Note 1'  -- Note - ntext
    ),
(   N'Phòng 2', -- DeptName - nvarchar(100)
    N'Note 2'  -- Note - ntext
    ),
	(   N'Phòng 3', -- DeptName - nvarchar(100)
    N'Note 3'  -- Note - ntext
    ),
	(   N'Phòng 4', -- DeptName - nvarchar(100)
    N'Note 4'  -- Note - ntext
    ),
	(   N'Phòng 5', -- DeptName - nvarchar(100)
    N'Note 5'  -- Note - ntext
    );
INSERT INTO dbo.SKILL
(
    SkillName,
    Note
)
VALUES
(   N'Skill 1', -- SkillName - nvarchar(100)
    N'Note 1'  -- Note - ntext
    ),
(   N'Skill 2', -- SkillName - nvarchar(100)
    N'Note 1'  -- Note - ntext
    ),
(   N'Skill 3', -- SkillName - nvarchar(100)
    N'Note 1'  -- Note - ntext
    ),
(   N'Skill 4', -- SkillName - nvarchar(100)
    N'Note 1'  -- Note - ntext
    ),
(   N'Skill 5', -- SkillName - nvarchar(100)
    N'Note 1'  -- Note - ntext
    )
INSERT INTO dbo.EMPLOYEE
(
    
    EmpName,
    BirthDay,
    DeptNo,
    MgrNo,
    StartDate,
    Salary,
    Level,
    Status,
    Note,
    Email
)
VALUES
(   
    N'Nhân viên 1',       -- EmpName - nvarchar(100)
    '20000225', -- BirthDay - date
    1,         -- DeptNo - int
    2,         -- MgrNo - int
    '20211228', -- StartDate - date
    1000,      -- Salary - money
    1,         -- Level - int
    0,         -- Status - int
    N'Note 1',       -- Note - ntext
    N'emp1@gmail.com'        -- Email - nvarchar(50)
    ),
(   
    N'Nhân viên 2',       -- EmpName - nvarchar(100)
    '20120131', -- BirthDay - date
    2,         -- DeptNo - int
    0,         -- MgrNo - int
    GETDATE(), -- StartDate - date
    2000,      -- Salary - money
    2,         -- Level - int
    0,         -- Status - int
    N'Note 2',       -- Note - ntext
    N'emp2@gmail.com'        -- Email - nvarchar(50)
    ),
(   
    N'Nhân viên 3',       -- EmpName - nvarchar(100)
    '20000326', -- BirthDay - date
    3,         -- DeptNo - int
    0,         -- MgrNo - int
    GETDATE(), -- StartDate - date
    2000,      -- Salary - money
    6,         -- Level - int
    0,         -- Status - int
    N'Note 3',       -- Note - ntext
    N'emp3@gmail.com'        -- Email - nvarchar(50)
    ),
(   
    N'Nhân viên 4',       -- EmpName - nvarchar(100)
    '19950902', -- BirthDay - date
    5,         -- DeptNo - int
    0,         -- MgrNo - int
    GETDATE(), -- StartDate - date
    4000,      -- Salary - money
    4,         -- Level - int
    0,         -- Status - int
    N'Note 4',       -- Note - ntext
    N'emp4@gmail.com'        -- Email - nvarchar(50)
    ),
(   
    N'Nhân viên 5',       -- EmpName - nvarchar(100)
    GETDATE(), -- BirthDay - date
    3,         -- DeptNo - int
    0,         -- MgrNo - int
    GETDATE(), -- StartDate - date
    5000,      -- Salary - money
    4,         -- Level - int
    0,         -- Status - int
    N'Note 5',       -- Note - ntext
    N'emp5@gmail.com'        -- Email - nvarchar(50)
    )
INSERT INTO dbo.EMP_SKILL
(
    SkillNo,
    EmpNo,
    SkillLevel,
    RegDate
)
VALUES
(   1,         -- SkillNo - int
    1,         -- EmpNo - int
    1,         -- SkillLevel - int
    GETDATE() -- RegDate - date
    ),
(   1,         -- SkillNo - int
    2,         -- EmpNo - int
    1,         -- SkillLevel - int
    GETDATE() -- RegDate - date
    ),
(   2,         -- SkillNo - int
    1,         -- EmpNo - int
    2,         -- SkillLevel - int
    GETDATE() -- RegDate - date
    ),
(   5,         -- SkillNo - int
    4,         -- EmpNo - int
    3,         -- SkillLevel - int
    GETDATE() -- RegDate - date
    ),
(   3,         -- SkillNo - int
    3,         -- EmpNo - int
    2,         -- SkillLevel - int
    GETDATE() -- RegDate - date
    )

CREATE VIEW EMPLOYEE_TRACKING AS
	SELECT EmpNo,EmpName,Level FROM dbo.EMPLOYEE
	WHERE Level BETWEEN 3 AND 5
SELECT * FROM dbo.EMPLOYEE
SELECT * FROM EMPLOYEE_TRACKING


