CREATE TABLE Categories(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
category_code VARCHAR(20) NOT null,
category_name VARCHAR(59) NOT null,
created_date DATE NOT null,
update_date DATE NOT null
);
CREATE TABLE suppliers(
id  BIGINT PRIMARY KEY AUTO_INCREMENT,
supplier_name VARCHAR(50) NOT null,
image VARCHAR(50),
created_date DATE NOT NULL,
update_date DATE NOT null
);
CREATE TABLE products(
id  BIGINT  PRIMARY KEY  AUTO_INCREMENT,
product_code VARCHAR(20) NOT NULL,
product_name VARCHAR(30) NOT NULL,
image VARCHAR(20),
`DESCRIPTION` VARCHAR(100),
standard_cost DOUBLE NOT NULL,
quantity VARCHAR(50) NOT NULL,
country VARCHAR(50),
product_unit  ENUM('cái','bộ','quyển','kg'),
is_new ENUM('New','NOT_NEW') DEFAULT NULL,
CONSTRAINT DK_country CHECK (country NOT LIKE '% %' AND country LIKE '%_%' AND BINARY country = BINARY UPPER(country))
);
CREATE TABLE product_discount(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
 Promotions VARCHAR(50) NOT NULL,
 discount_amount DOUBLE,
 start_date DATE,
 end_date date
);
CREATE TABLE product_reviews(
id int PRIMARY KEY AUTO_INCREMENT,
rating DOUBLE  NOT null,
`comment` VARCHAR(50) NOT null,
created_date DATE NOT NULL,
CHECK(0 < rating <= 5.0)
);
CREATE TABLE customers(
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) NOT NULL,
`password` VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('MAlE','FEMALE') DEFAULT NULL,
email VARCHAR(50),
bithday DATE,
avatar VARCHAR(30),
address VARCHAR(50),
`status` ENUM('Enable','Unable'),
created_date DATE NOT null,
update_date DATE NOT null
);
CREATE TABLE orders(
id INT PRIMARY KEY AUTO_INCREMENT,
quantity INT NOT NULL,
Total_price DOUBLE NOT NULL,
paid_date date 
);
-- thêm khóa thể hiện mối quan hệ product N - 1 Categories  
ALTER TABLE products
ADD id_Categorie BIGINT;

ALTER TABLE products
ADD CONSTRAINT FK_Categorie
FOREIGN KEY (id_Categorie) REFERENCES Categories(id);
-- thêm khóa thể hiện mối quan hệ product N - 1  
ALTER TABLE products
ADD id_supplier BIGINT;
ALTER TABLE products
ADD CONSTRAINT FK_Supplier
FOREIGN KEY (id_supplier) REFERENCES suppliers(id);
-- thêm khóa product_discounts
ALTER TABLE product_discount
ADD id_product BIGINT;
ALTER TABLE product_discount
ADD CONSTRAINT FK_Product
FOREIGN KEY (id_product) REFERENCES products(id);
-- thêm khóa vào bảng product review để tạo mối quan hệ product 1 - N product_reviews
ALTER TABLE product_reviews
ADD id_product BIGINT;
ALTER TABLE product_reviews
ADD CONSTRAINT FK_Productss
FOREIGN KEY (id_product) REFERENCES products(id);
-- thêm khóa vào bảng product review để tạo mối quan hệ product_reviews N - 1 Customer
ALTER TABLE product_reviews
ADD id_Customer INT;

ALTER TABLE product_reviews
ADD CONSTRAINT FK_Customerss
FOREIGN KEY (id_Customer) REFERENCES Customers(id);


CREATE TABLE orders(
id INT PRIMARY KEY AUTO_INCREMENT,
quantity INT NOT NULL,
Total_price DOUBLE NOT NULL,
paid_date date 
);

ALTER TABLE orders
ADD id_customerss INT;
ALTER TABLE orders
ADD CONSTRAINT FK_Customersss FOREIGN KEY (id_customerss) REFERENCES customers(id);


CREATE TABLE Orders_product(
id_Orderss INT,
id_Productss BIGINT,
 CONSTRAINT FK_Orderssss FOREIGN KEY(id_Orderss) REFERENCES orders(id),
 CONSTRAINT FK_Productsss FOREIGN KEY(id_Productss) REFERENCES products(id)
);


