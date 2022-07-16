CREATE DATABASE GuitarShopDB
USE GuitarShopDB
GO
CREATE TABLE Categories(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName NVARCHAR(100) NOT NULL UNIQUE
)
CREATE TABLE Products(
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductCode CHAR(10) NOT NULL UNIQUE,
	ProductName VARCHAR(200) NOT NULL,
	Description CHAR(500) NOT NULL,
	UnitPrice MONEY NOT NULL,
	DiscountPercent DECIMAL(3,2) DEFAULT 0.00,
	DateAdded DATE,
	CategoryID INT,
	CONSTRAINT fk_Pro_CteID FOREIGN KEY(CategoryID) REFERENCES dbo.Categories(CategoryID)
)
CREATE TABLE Customers(
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Password CHAR(50) NOT NULL,
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	Address NVARCHAR(100) NULL,
	IsPasswordChanged BIT DEFAULT 0
)
CREATE TABLE Orders(
	OrderID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE NOT NULL,
	ShipAddress NVARCHAR(500),
	CONSTRAINT fk_Ord_CusID  FOREIGN KEY(CustomerID) REFERENCES dbo.Customers(CustomerID)
)
CREATE TABLE OrderItems(
	OrderID INT,
	ProductID INT,
	Quantity INT NOT NULL,
	UnitPrice MONEY NOT NULL,
	DiscountPercent DECIMAL(5,2) NOT NULL,
	PRIMARY KEY(OrderID, ProductID),
	CONSTRAINT fk_OrI_OrID FOREIGN KEY (OrderID) REFERENCES dbo.Orders(OrderID),
	CONSTRAINT fk_OrI_ProID FOREIGN KEY(ProductID) REFERENCES dbo.Products(ProductID)
)
INSERT INTO dbo.Categories
(
    CategoryName
)
VALUES
(N'Classical' -- CategoryName - nvarchar(100)
    ),
(N'Flat-top' -- CategoryName - nvarchar(100)
    ),
(N'Archtop' -- CategoryName - nvarchar(100)
    ),
(N'Steel guitar' -- CategoryName - nvarchar(100)
    )
INSERT INTO dbo.Products
(
    ProductCode,
    ProductName,
    Description,
    UnitPrice,
    DiscountPercent,
    DateAdded,
    CategoryID
)
VALUES
(   'G104','Honey Amber','Giai dieu tuyet voi',10000,1.1,'11/6/2012',1),
(   'G105','Taylor','Giai dieu tuyet voi',20000,2.1,'11/6/2012',1),
(   'G106','Martin','Giai dieu tuyet voi',30000,3.1,'11/6/2012',3),
(   'G107','Takamine','Giai dieu tuyet voi',45000,3.1,'11/6/2012',4),
(   'G108','Fender','Giai dieu tuyet voi',10500,9.1,'11/6/2012',2),
(   'G109','Ibanez','Giai dieu tuyet voi',16000,1.1,'11/6/2012',4),
(   'G100','Gibson','Giai dieu tuyet voi',15670,6.1,'11/6/2012',3),
(   'G101','Washburn','Giai dieu tuyet voi',10000,8.1,'11/6/2012',2),
(   'G102','Samick','Giai dieu tuyet voi',10340,1.1,'11/6/2012',3),
(   'G103','Yamaha','Giai dieu tuyet voi',14540,1.0,'11/6/2012',3)
INSERT INTO dbo.Customers
(
    Email,
    Password,
    FirstName,
    LastName,
    Address,
    IsPasswordChanged
)
VALUES
(   'rick@raven.com','123',N'Tom',N'Jerry',N'Số 1 Tố Hữu',0),
(   'rick2@raven.com','123',N'Iron',N'Man',N'Số 1 Tố Hữu',0),
(   'rick3@raven.com','123',N'Hulk',N'Ngu',N'Số 1 Tố Hữu',0),
(   'rick4@raven.com','123',N'Caption',N'American',N'Số 1 Tố Hữu',0),
(   'rick5@raven.com','123',N'Thor',N'Ngo',N'Số 1 Tố Hữu',0),
(   'ric6k@raven.com','123',N'Spider',N'Man',N'Số 1 Tố Hữu',0),
(   'ric7k@raven.com','123',N'Black',N'Window',N'Số 1 Tố Hữu',0),
(   'ric8k@raven.com','123',N'Halk',N'Eye',N'Số 1 Tố Hữu',0),
(   'ric9k@raven.com','123',N'Loki',N'Lua',N'Số 1 Tố Hữu',0),
(   'ric0k@raven.com','123',N'Superman',N'Batman',N'Số 1 Tố Hữu',0)
INSERT INTO dbo.Orders
(
    CustomerID,
    OrderDate,
    ShipAddress
)
VALUES
(   1,GETDATE(),N'Nha Trang'),
(   2,GETDATE(),N'Khánh Hòa'),
(   3,GETDATE(),N'Tuyên Quang'),
(   1,GETDATE(),N'Hà Nội'),
(   4,GETDATE(),N'Hà Nam'),
(   5,GETDATE(),N'Sài Gòn'),
(   6,GETDATE(),N'Cần Thơ'),
(   10,GETDATE(),N'Đồng Nai'),
(   8,GETDATE(),N'Trung Quốc'),
(   7,GETDATE(),N'Mỹ')
INSERT INTO
 dbo.OrderItems
 (
     OrderID,
     ProductID,
     Quantity,
     UnitPrice,
     DiscountPercent
 )
 VALUES
 (   1,2,10,10000,1),
 (   2,2,10,10000,1),
 (   3,2,10,10000,1),
 (   4,2,10,10000,1),
 (   1,3,10,10000,1),
 (   1,4,10,10000,1),
 (   1,5,10,10000,1),
 (   4,4,10,10000,1),
 (   7,6,10,10000,1),
 (   5,5,10,10000,1)
UPDATE dbo.Products
SET DiscountPercent = 0.35
WHERE DATEDIFF(MONTH,DateAdded, GETDATE()) > 12

SELECT * FROM dbo.Products
--c
UPDATE dbo.Customers
SET Password = 'Secret@1234!'
WHERE Email = 'rick@raven.com' AND IsPasswordChanged = 0

SELECT * FROM dbo.Customers
--d
SELECT LastName + ', ' + FirstName 'Full name'
FROM dbo.Customers
WHERE CustomerID IN (SELECT CustomerID
					 FROM dbo.Customers
					 WHERE  LastName LIKE '[M-Z]%')
ORDER BY LastName ASC
--e
SELECT ProductName, UnitPrice, DateAdded
FROM dbo.Products
WHERE UnitPrice > 500 and UnitPrice < 2000
ORDER BY DateAdded DESC
--f
SELECT c.CustomerID, c.FirstName + ' ' + c.LastName 'Name', c.Email, c.Address, SUM((oi.Quantity * oi.UnitPrice)*(1 - oi.DiscountPercent/100)) 'Total amount'
FROM dbo.Customers c JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
					 JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Address, c.Email


SELECT * FROM dbo.Categories
SELECT * FROM dbo.Products
SELECT * FROM dbo.Customers
SELECT * FROM dbo.Orders
SELECT * FROM dbo.OrderItems



















