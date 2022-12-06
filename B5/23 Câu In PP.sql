-- Các giá trị nối 3 bảng Orders , Orders_product ,Products 
UPDATE orders_product A JOIN products B ON A.id_Productss = B.id SET A.`Unit Price` = B.standard_cost;
UPDATE orders_product A SET A.Valuee = A.Quatily * A.`Unit Price`;
-- Nối giá trị hóa đơn của bảng Orders_product sang Bảng Orders , 
UPDATE orders A 
JOIN  (SELECT id_Orderss AS'Y' , Sum(Valuee) AS'X' FROM orders_product  
GROUP BY id_Orderss) B
 ON A.id = B.Y 
SET A.Total_price = B.X

-- Câu 1. Tìm số hóa đơn đã mua các sản phẩm do Singapore sản xuất.
SELECT A.id AS 'Số Hóa Đơn'
FROM ( orders A JOIN orders_product B ON A.id = B.id_Orderss ) 
JOIN products C ON B.id_Productss = C.id
WHERE C.country ='SIN_GA_PO';

-- Câu 2 Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(A.id) AS 'Số Hóa Đơn '
FROM orders A
WHERE A.id_customerss IS NULL;

-- Câu 3 : Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006 
SELECT COUNT( DISTINCT B.id_Productss)
FROM orders A JOIN orders_product B ON A.id = B.id_Orderss
WHERE year(A.paid_date) = '2006';

-- Câu 4 : Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
UPDATE orders_product A JOIN products B ON A.id_Productss = B.id SET A.`Unit Price` = B.standard_cost;
UPDATE orders_product A SET A.Valuee = A.Quatily * A.`Unit Price`;

SELECT A.id_Orderss AS'Mã Hóa Đơn' , SUM(A.Valuee) AS' Value Max ' FROM orders_product A 
GROUP BY A.id_Orderss
ORDER BY A.Valuee
LIMIT 1;

SELECT A.id_Orderss AS'Mã Hóa Đơn' , SUM(A.Valuee) AS' Value Min ' FROM orders_product A 
GROUP BY A.id_Orderss
ORDER BY A.Valuee DESC
LIMIT 1;

-- Câu 5 :Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu
UPDATE orders A 
JOIN  (SELECT id_Orderss AS'Y' , AVG(Valuee) AS'X' FROM orders_product  
GROUP BY id_Orderss) B
 ON A.id = B.Y 
SET A.Total_price = B.X
WHERE YEAR(A.paid_date) = '2006';
SELECT A.id AS'Mã Hóa Đơn' , A.Total_price 'Giá trị Trung Bình ' FROM orders A WHERE YEAR(A.paid_date) = '2006';

-- Câu 6. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(A.Total_price) AS 'Tổng Doanh Thu 2006 ' FROM orders A WHERE YEAR(A.paid_date) = 2006;

-- Câu 7 Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT A.id AS'Mã Hóa Đơn' , A.Total_price AS 'Value ' 
FROM orders A
WHERE A.Total_price = (SELECT MAX(A.Total_price) FROM orders A);

-- Câu 8 :  Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT A.username AS 'fullName' from customers A 
JOIN (SELECT id_Customerss, Total_price
FROM orders 
WHERE Total_price =
 (SELECT MAX(Total_price) FROM orders) AND YEAR(orders.paid_date) ='2006') B 
ON A.id =B.id_Customerss;

-- Câu 9 : In ra danh sách các sản phẩm (MASP, TENSP) có giá bán  bằng 1 trong 3 mức giá cao nhất.
SELECT A.id , A.product_name , A.standard_cost
FROM  products A ;
SET @X = (SELECT standard_cost FROM products A WHERE A.standard_cost = (SELECT MAX(DISTINCT A.standard_cost) FROM products A));
SET @Y = (SELECT standard_cost FROM products WHERE standard_cost = (SELECT  MAX(standard_cost) FROM products WHERE standard_cost NOT IN (SELECT standard_cost FROM products WHERE standard_cost =@X)));
SET @Z = (SELECT standard_cost FROM products WHERE standard_cost = (SELECT MAX(DISTINCT standard_cost) FROM products WHERE standard_cost NOT IN (SELECT standard_cost FROM products WHERE standard_cost =@Y OR standard_cost =@X )));

SELECT A.product_name  from products A  WHERE A.standard_cost = @X;
SELECT A.product_name  from products A  WHERE A.standard_cost = @Y;
SELECT A.product_name  from products A  WHERE A.standard_cost = @Z;
 SELECT A.product_name  from products A WHERE standard_cost IN (@X , @Y , @Z);
-- Câu 10 : . In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
 SELECT A.product_name  from products A WHERE standard_cost IN (@X , @Y , @Z) AND A.country ='THÁI_LAN';
 
-- Câu 12 : In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT A.id_customerss, SUM(A.Total_price) FROM orders A JOIN customers B ON A.id_customerss = B.id
WHERE A.id_customerss IS NOT NULL 
GROUP BY A.id_customerss
ORDER BY SUM(A.Total_price) DESC
LIMIT 3;
  
-- Câu 13 : Tính tổng số sản phẩm của từng nước sản xuất
SELECT A.country , COUNT(A.country) FROM products A 
GROUP BY A.country;

-- Câu 14 : Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.


-- Câu 15 : Tính doanh thu bán hàng mỗi ngày.
SELECT DATE_FORMAT(A.paid_date,'%d  %m  %Y') AS 'Ngày', A.Total_price FROM orders A;


-- Câu 16 : Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT A.product_name AS 'Sản Phẩm ', COUNT(A.product_name) AS 'Số Lượng bán trong 10/2006' 
FROM products A 
JOIN ( 
SELECT orders_product.id_Productss 
from orders_product  JOIN orders  ON orders_product.id_Orderss = orders.id 
WHERE YEAR(orders.paid_date) = '2006' AND MONTH(orders.paid_date) = '10'
) D ON A.id = D.id_Productss
GROUP BY A.product_name;

-- Câu 17 : Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.

SELECT A.id_Orderss AS'Mã Hóa Đơn', Count( DISTINCT  A.id_Productss) AS'Số Lượng'
FROM  orders_product A 
GROUP BY A.id_Orderss
HAVING COUNT(DISTINCT  A.id_Productss) > 3;

-- Câu 18 : Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT A.id_customerss AS 'Mã Khách Hàng' , COUNT(A.id_customerss) AS ' Số Lần Mua '
FROM orders A
GROUP BY A.id_customerss
order BY COUNT(A.id_customerss) DESC
LIMIT 1;

-- Câu 19 : Tháng mấy trong năm 2006, doanh số bán hàng cao nhất 
SELECT MONTH(A.paid_date) AS 'Tháng Doanh Thu Cao Nhất năm 2006' , A.Total_price 
FROM orders A 
WHERE YEAR(A.paid_date) = '2006'
GROUP BY MONTH(A.paid_date)
ORDER BY A.Total_price DESC
LIMIT 1;

-- Câu 20 : Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT A.product_name , B.id_Productss , COUNT(B.id_Productss) FROM products A JOIN orders_product B ON A.id = B.id_Productss 
GROUP BY B.id_Productss
ORDER BY COUNT(B.id_Productss) ASC, B.Valuee asc
LIMIT 1;

-- Câu 21 : Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất 
SELECT A.country AS' Tên Quốc Gia' , MAX(A.standard_cost) 'Giá Cao Nhất của SP ' FROM products A 
GROUP BY A.country;

-- Câu 22 : Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT A.country AS' Tên Quốc Gia' , COUNT(DISTINCT A.product_name) AS 'Số SP ' FROM products A 
GROUP BY A.country
HAVING COUNT(DISTINCT A.product_name) > 2;

-- Câu 23 : Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất
SELECT A.id_customerss,SUM(A.Total_price) AS 'Tổng Doanh Thu'
FROM  orders A
GROUP BY A.id_customerss
ORDER BY  SUM(A.Total_price)
LIMIT 10;








































