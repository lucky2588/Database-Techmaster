CREATE DATABASE Ktra;
CREATE TABLE Categories(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
category_code VARCHAR(20) NOT null,
category_name VARCHAR(59) NOT null,
created_date DATE NOT null,
update_date DATE NOT null
);
INSERT INTO categories(category_code,category_name,created_date,update_date)
VALUE
('A1','Áo','2022--10--12','2022--12--12'),('Q1','Quần','2022--10--12','2022--12--12'),('K1','Kính','2022--10--12','2022--12--12'),
('AC1','Phụ Kiện','2022--10--12','2022--12--12'),('M1','Mũ','2022--10--12','2022--12--12'),('T1','Túi','2022--10--12','2022--12--12');

CREATE TABLE products(
id  BIGINT  PRIMARY KEY  AUTO_INCREMENT,
product_code VARCHAR(20) NOT NULL,
product_name VARCHAR(30) NOT NULL,
image VARCHAR(20),
`DESCRIPTION` VARCHAR(100),
price DOUBLE NOT NULL,
quantity INT,
country VARCHAR(50),
is_new ENUM('New','NOT_NEW') DEFAULT NULL,
CONSTRAINT DK_country CHECK (country NOT LIKE '% %' AND country LIKE '%_%' AND BINARY country = BINARY UPPER(country))
);

ALTER TABLE products
ADD id_Categorie BIGINT;
ALTER TABLE products
ADD CONSTRAINT FK_Categorie
FOREIGN KEY (id_Categorie) REFERENCES Categories(id);
INSERT INTO products (product_code ,  product_name , image , `DESCRIPTION` , price ,    quantity ,  country  , is_new ,  id_Categorie   )
VALUE 
('A1', 'Áo Dài', 'Áo Dài Xám' , 'SlimFit' , 5.5 , 2 , 'VIỆT_NAM','NEW',1),
('Q1', 'Quần Bò', 'Quần xanh' , 'SlimFit' , 3.5 ,  2 , 'SIN_GA_PO','NEW',1),
('K1', 'Kính Râm', 'Kính Đen' , 'On Face fit' , 6.5 ,2, 'Good' , 'TRUNG_QUỐC','NEW',3),
('AC1', 'Tất Đôi', 'Tất Dài' , 'Skinny' , 0.01 , 3 , 'HÀN_QUỐC','NEW',4),
('M1', 'Mũ Vải', 'Mũ Dệt' , 'From Standard' , 1.5 , 3 , 'SIN_GA_PO','NEW',5),
('T1', 'Túi Da', 'Túi Đỏ' , 'Oversize' , 8.5 , 3 , 'NHẬT_BẢN','NEW',6),
('A2', 'Áo Khoắc ', 'Áo Lông Vũ' , 'Fit' , 4.5 , 3 , 'VIỆT_NAM','NEW',1),
('T2', 'Túi Vải ', 'Túi Đen' , 'Standard' , 1.5 , 5 , 'ĐAN_MẠCH','NEW',5),
('K2', 'Kính Cận', 'Kính Mắt' , 'Fit Face' , 0.5 , 21 , 'THÁI_LAN','NEW',3),
('Q2', 'Quần Vải', 'Quần xanh' , 'SlimFit' , 3.5 , 22 , 'SIN_GA_PO','NEW',2);


CREATE TABLE orders(
id INT PRIMARY KEY AUTO_INCREMENT,
Total_price DOUBLE,
quantity INT,
paid_date date 
);

INSERT INTO orders (paid_date)
VALUE
('2006--12--12'),('2006--10--12'),('2006--08--12'),('2006--06--12'),('2007--06--12'),
('2007--12--12'),('2008--10--12'),('2008--05--12'),('2008--12--12');


CREATE TABLE product_order(
id_order INT,
id_product BIGINT,
`value` DOUBLE,
until INT,
CONSTRAINT FK_Order FOREIGN KEY (id_order) REFERENCES Orders(id),
CONSTRAINT FK_Product FOREIGN KEY (id_product) REFERENCES Products(id)
);

INSERT INTO product_order(id_order , id_product , until)
VALUE
(1,2,3),(2,1,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(6,5,1),(7,8,1),(8,6,1),(8,8,1),(9,9,1);

-- Set Giá trị hóa đơn , giá trị đơn của từng sản phẩm 
UPDATE product_order A JOIN products B ON A.id_product = B.id SET A.Value = A.`Until` * B.price;
-- Set Tổng giá trị của mỗi hóa đơn sang Bảng orders
UPDATE orders A JOIN 
(SELECT id_order AS'X', SUM(VALUE) AS'Y' FROM product_order  
GROUP BY id_order) B ON A.id = B.X SET A.Total_price = B.Y;
-- Set Tổng sản phảm  của mỗi hóa đơn từ bảng Product_Order sang Bảng Orders
UPDATE orders A JOIN 
(SELECT id_order AS'X', SUM(Until) AS'Y' FROM product_order  
GROUP BY id_order) B ON A.id = B.X SET A.quantity = B.Y;


-- Thực hiện Câu truy Vấn 


-- Câu 1 : Hiển thị danh sách sản phẩm gồm: product_code, product_name, country, category_name
SELECT A.product_code AS 'Mã SP' , A.product_name AS 'Tên SP' , A.country AS 'Quốc Gia' ,   B.category_name AS 'Thể Loại'
FROM  products A join categories B  ON A.id_Categorie = B.id;


-- Câu 2 : Tìm ra những sản phẩm có chứa kĩ tự ‘g’ .. Do sản phẩm em thêm ko có G nên e đổi thành A nhé thầy !!! 
SELECT A.product_name AS 'Tên SP Chứa 'A'' 
FROM  products A 
WHERE A.product_name LIKE '%A%';

-- Câu 3 : Tìm ra những sản phẩm có chứa kĩ tự ‘g’ và có số lượng lớn hơn 20
SELECT A.product_name AS'Tên SP', A.quantity AS 'SL '
FROM  products A 
WHERE A.product_name LIKE '%A%' AND A.quantity > 20;


-- Câu 4 :  Thống kê số lượng đơn hàng theo ngày
SELECT A.paid_date AS'Date' , COUNT(A.id) AS ' Số Đơn'
FROM orders A
GROUP by A.paid_date;







