# LEARN SQL
<details>
<summary><b>1. Cú pháp SQL cơ bản</b></summary>

## 1.1. Lệnh SELECT trong SQL
```sql
SELECT cot1, cot2, cot3,... cotN
FROM ten_bang;
```
## 1.2. Mệnh đề DISTINCT trong SQL
```sql
SELECT DISTINCT cot1, cot2, cot3,....cotN
FROM   ten_bang;
```
## 1.3. Mệnh đề WHERE trong SQL
```sql
SELECT cot1, cot2, cot3,... cotN
FROM   ten_bang
WHERE  DIEU_KIEN;
```
## 1.4. Mệnh đề AND/OR trong SQL
```sql
SELECT cot1, cot2, cot3,... cotN
FROM   ten_bang
WHERE  DIEU_KIEN_1 {AND|OR} DIEU_KIEN_2;
```
## 1.5. Mệnh đề IN trong SQL
```sql
SELECT cot1, cot2, cot3,... cotN
FROM   ten_bang
WHERE  ten_cot IN (giatri_1, giatri_2,...giatri_N);
```
## 1.6. Mệnh đề LIKE trong SQL
```sql
SELECT cot1, cot2, cot3,... cotN
FROM   ten_bang
WHERE  ten_cot LIKE { PATTERN };
```
## 1.7. Mệnh đề ORDER BY trong SQL
```sql
SELECT cot1, cot2, cot3,... cotN
FROM   ten_bang
WHERE  DIEU_KIEN
ORDER BY ten_cot {ASC|DESC};
```
## 1.8. Mệnh đề GROUP BY trong SQL
```sql
SELECT SUM(ten_cot)
FROM   ten_bang
WHERE  DIEU_KIEN
GROUP BY ten_cot;
```
## 1.9. Mệnh đề COUNT trong SQL
```sql
SELECT COUNT(ten_cot)
FROM   ten_bang
WHERE  DIEU_KIEN;
```
## 1.10. Mệnh đề HAVING trong SQL
```sql
SELECT SUM(ten_cot)
FROM   ten_bang
WHERE  DIEU_KIEN
GROUP BY ten_cot
HAVING (dieu kien la ham so hoc);
```
## 1.11. Lệnh CREATE TABLE trong SQL
```sql
CREATE TABLE ten_bang(
cot1 kieu_du_lieu,
cot2 kieu_du_lieu,
cot3 kieu_du_lieu,
.....
cotN kieu_du_lieu,
PRIMARY KEY(mot hoac nhieu cot)
);
```
## 1.12. Lệnh DROP TABLE trong SQL
```sql
DROP TABLE ten_bang;
```
## 1.13. Lệnh CREATE INDEX trong SQL
```sql
CREATE UNIQUE INDEX ten_chi_muc
ON ten_bang ( cot1, cot2,...cotN);
```
## 1.14. Lệnh DROP INDEX trong SQL
```sql
ALTER TABLE ten_bang
DROP INDEX ten_chi_muc;
```
## 1.15. Lệnh DESC trong SQL
```sql
DESC ten_bang;
```
## 1.16. Lệnh TRUNCATE TABLE trong SQL
```sql
TRUNCATE TABLE ten_bang;
```
## 1.17. Lệnh ALTER TABLE trong SQL
```sql
ALTER TABLE ten_bang {ADD|DROP|MODIFY} ten_cot {kieu_du_lieu};
```
## 1.18. Lệnh ALTER TABLE (Rename) trong SQL
```sql
ALTER TABLE ten_bang RENAME TO ten_bang_moi;
```
## 1.19. Lệnh INSERT INTO trong SQL
```sql
INSERT INTO ten_bang( cot1, cot2,....cotN)
VALUES ( giatri_1, giatri_2,....giatri_N);
```
## 1.20. Lệnh UPDATE trong SQL
```sql
UPDATE ten_bang
SET cot1 = giatri_1, cot2 = giatri_2,....cotN=giatri_N
[ WHERE  DIEU_KIEN ];
```
## 1.21. Lệnh DELETE trong SQL
```sql
DELETE FROM ten_bang
WHERE  {DIEU_KIEN};
```
## 1.22. Lệnh CREATE DATABASE trong SQL
```sql
CREATE DATABASE ten_database;
```
## 1.23. Lệnh DROP DATABASE trong SQL
```sql
DROP DATABASE ten_database;
```
## 1.24. Lệnh USE trong SQL
```sql
USE ten_database;
```
## 1.25. Lệnh COMMIT trong SQL
```sql
COMMIT;
```
## 1.26. Lệnh ROLLBACK trong SQL
```sql
ROLLBACK;
```
</details>

# Exercise sql

<details>
<summary><b>Bài 1</b></summary>

## Question c: Password = 'Secret@1234!' cho khách hàng có Email = 'rick@raven.com' và IsPasswordChanged = 0 
## Question d: hiển thị full name của khách hàng có last name bắt đầu bằng M đến Z sắp xếp tăng dần theo last name
## Question e: truy vấn ProductName, UnitPrice, DateAdded từ bảng products với unitprice > 500 và < 2000 

</details>

<details>
<summary><b>Bài 2</b></summary>

## Question 2: 
+ Thêm cột email và đảm bảo không được trùng lặp
+ Đặt giá trị default cho cột MgrNo và Status là 0
## Question 3: 
+ DeptNo là khóa ngoài của table employee
+ Bỏ cột description của table EMP_SKILL
## Question 4: Xem thông tin nhân viên có level từ 3 đến 5

</details>

<details>
<summary><b>Bài 3</b></summary>

## Question 3: 
+ Truy vấn Actor có tuổi lớn hơn 50
+ Truy vấn ActorName,AVGsalary từ bảng Actor sắp xếp theo AVGsalary giảm dần
+ Truy vấn Movie Name có ActorName là `Franzen Gazey`
+ Hiển thị movie name thể loại hành động gộp nhóm theo movie name và có số lượng diễn viên lớn hơn 3

</details>

<details>
<summary><b>Bài 4</b></summary>

## Question 2: Truy vấn nhân viên có số tháng làm việc lớn hơn hoặc bằng 6
## Question 3: Truy vẫn nhân viên có 1 trong 2 kĩ năng C# hoặc C++
## Question 4: Truy vấn tên nhân viên, tên và email của người quản lý của nhân viên đó
## Question 5: Truy vấn tên phòng và danh sách nhân viên của phòng đó (phòng có từ 2 nhân viên trở lên)
## Question 6: Truy vấn tên nhân viên, email nhân viên và số kĩ năng nhân viên đó có
## Question 7: Truy vấn nhân viên có nhiều hơn 1 kỹ năng
## Question 8: Create view list_all_employees Hiển thị nhân viên và các kỹ năng của nhân viên đó



</details>
<details>
<summary><b>Bài 5</b></summary>

## Question 1: Tạo view Order_Slip hiển thị tên khách hàng, ngày đặt hàng, tên sản phẩm, số lượng và thành tiền
## Question 2: 
+ Hiển thị tên nhân viên có skill là java bằng 2 cách
+ Hiển thị phòng có số nhân viên >= 3 và danh sách nhân viên của phòng đó
+ Hiển thị thông tin nhân viên có nhiều hơn 1 kỹ năng
+ Hiển thị mã nhân viên, tên nhân viên, tên phòng của nhân viên có nhiều hơn 1 kỹ năng


</details>
<details>
<summary><b>record_company</b></summary>

## Question 1: Select only the Names of all the Bands
## Question 2: Select the Oldest Album
## Question 3: Get all Bands that have Albums
## Question 4: Get all Bands that have No Albums
## Question 5: Get the Longest Album
## Question 6: Update the Release Year of the Album with no Release Year
## Question 7: Insert a record for your favorite Band and one of their Albums
## Question 8: Delete the Band and Album you added in #8
## Question 9: Get the Average Length of all Songs
## Question 10: Select the longest Song off each Album
## Question 11: Get the number of Songs for each Band
</details>











