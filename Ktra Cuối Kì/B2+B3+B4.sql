CREATE DATABASE SubQuery;
-- Em viết các bài còn lại ở đây ạ :3 

CREATE TABLE Emloyee(
id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(30),
salary INT,
managerID INT
);

INSERT INTO Emloyee(NAME,salary)
VALUE
('Joe', 70000),('Henry', 80000),('Sam', 60000),('MAX',90000);

UPDATE Emloyee A SET A.managerID = 3 WHERE A.id = 1; 
UPDATE Emloyee A SET A.managerID = 4 WHERE A.id = 2; 


-- Lấy ra tên những người có mức lương cao hơn quản lý của họ (quản lý là managerId)
SELECT A.NAME AS 'Tên Nhân Viên' 
FROM emloyee A LEFT join emloyee B ON A.managerID = B.id
WHERE A.salary > B.salary AND A.managerID IS NOT NULL;


-- Bài 03:  Tạo bảng và dữ liệu như sau bằng câu lệnh

CREATE TABLE Person(
id INT PRIMARY KEY,
email VARCHAR(50)
);

INSERT INTO Person
VALUE
(1,'a@b.com'),(2,'c@d.com'),(3,'a@b.com');

-- Lấy ra danh sách email nào trùng lặp
SELECT A.email 
FROM Person A
GROUP BY A.email 
HAVING COUNT( A.email) > 1; 




-- Bài 4  Tạo bảng và dữ liệu như sau bằng câu lệnh
CREATE TABLE Customer(
id INT PRIMARY KEY,
fullname VARCHAR(30)
);
INSERT INTO Customer
VALUE
(1,'Joe'),(2,'Henry'),(3,'Sam'),(4,'Max');

CREATE table Orders(
id INT PRIMARY KEY,
id_customer INT,
CONSTRAINT FK_Customer FOREIGN KEY (id_customer) REFERENCES Customer(id)
);
INSERT INTO Orders
VALUE
(1,3),(2,1);
-- Lấy ra danh sách những khách hàng chưa bào giờ order
SELECT A.fullname AS 'Khách Hàng Chưa Mua Bao Giờ ' 
FROM Customer A LEFT JOIN orders B ON A.id = B.id_customer
WHERE B.id_customer IS NULL;


