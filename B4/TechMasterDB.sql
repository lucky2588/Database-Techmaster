CREATE TABLE USER(
id INT PRIMARY KEY,
fullname VARCHAR(50),
NumberPhone INT,
email VARCHAR(50),
Role_user INT,
account_banking INT UNIQUE
);
CREATE TABLE ROLE(
id_role INT PRIMARY KEY,
name_role VARCHAR(50)
);

INSERT INTO ROLE(id_role,name_role)
VALUE
(1,'User'),(2,'Manager'),(3,'Admin');

ALTER TABLE USER
ADD FOREIGN KEY (role_user) REFERENCES Role(id_role);

INSERT INTO USER(id,fullname,NumberPhone,email,Role_user)
VALUE 
(1,'Nguyễn Đức Thắng','0833200135','DuwcsThang@gmal.com',1),
(2,'Nguyễn Văn A','0329238233','Abc123@gmail.com',1),
(3,'Nguyễn Văn C','06823723','Xyz@gmail.com',1),
(4,'Trần Văn D','012312355','Qwert@gmail.com',1),
(5,'Đặng Anh E','073434311','Zxcvbn@gmal.com',1);

Create table Account_Banking(
 id_bank int PRIMARY KEY,
 name_bank VARCHAR(50), 
 account_num varchar,
 history_transion INT
 );
 INSERT INTO Account_Banking(id_bank,name_bank,account_num)
  value
(1,'Vietcombank','12000000'), (2,'MbBank','38888800'), (3,'SCBank','5888566'), (4,'TPbank','8665666'),(5,'VPBank','9999999');
ALTER TABLE USER 
ADD FOREIGN KEY (account_banking) REFERENCES Account_Banking(id);

UPDATE USER SET account_banking = 1 WHERE id = 1;
UPDATE USER SET account_banking = 2 WHERE id = 2;
UPDATE USER SET account_banking = 3 WHERE id = 3;
UPDATE USER SET account_banking = 4 WHERE id = 4;
UPDATE USER SET account_banking = 5 WHERE id = 5;

CREATE table History_Transition(
id INT PRIMARY KEY,
registration_date DATE,
STATUS VARCHAR(20)
);
ALTER TABLE history_transition
ADD FOREIGN KEY(id) REFERENCES Account_Banking(history_transion);
-- //

CREATE TABLE Course(
id INT PRIMARY KEY,
name_couse VARCHAR(50),
prince DOUBLE,
type_course VARCHAR(20),
vote DOUBLE,
blogs int
);
CREATE TABLE BLOG(
id INT PRIMARY KEY,
title VARCHAR(30),
description VARCHAR(1000),
create_at date
);
INSERT INTO BLOG
VALUE 
(1,'Khóa Học Java Develop ', 'Tại đây sẽ cung cấp cho bạn tất cả các kiến thức về java Core','2022-08-08'),
(2,'ngôn ngữ PHP và các tiện ích khi code ', 'PHP và các tiện ích mang lại .......blog','2022-08-08'),
(3,'tại sao Develop ios đang là nghề phổ biến hiện nay ', 'Quá nhiều ĐT sử dụng hệ ĐH IOS','2022-08-08'),
(4,' cách thức hoạt động của 1 app thông thường ', 'có đôi chút giống với develop Web ...','2022-08-08');
(5,'Chứng chỉ AWS ', 'Amazon Web Service','2022-08-08');
ALTER table BLOG
ADD FOREIGN KEY (id) REFERENCES Course(blogs);
  
INSERT INTO  course(id,name_couse,prince,type_course,vote)
VALUE
 (1,'Java Develop Web',24.5,'Online',5.0),
 (2,'PHP Fullstack',12.5,'Offline',4.7),
 (3,'Develop IOS',3.3,'Online',3.8),
 (4,'Develop App',5.5,'Offline',4.7),
 (5,'AWS',8.8,'Offline',5.0);
UPDATE course SET blogs =1 WHERE id = 1;
UPDATE course SET blogs =2 WHERE id = 2;
UPDATE course SET blogs =3 WHERE id = 3;
UPDATE course SET blogs =4 WHERE id = 4;
UPDATE course SET blogs =5 WHERE id = 5;
  
CREATE TABLE OpenSchedule(
id INT PRIMARY KEY,
start_date DATE,
study_day DATE,
study_time DATE,
address VARCHAR(50)
);
INSERT INTO OpenSchedule
VALUE 
(1,'2022--05--05','2022--06--06','2022--12--12','48 Tố Hữu'),
(2,'2022--02--02','2022--03--03','2022--12--12','125 Cầu Giấy'),
(3,'2022--03--03','2022--04--04','2022--12--12','48 Tố Hữu '),
(4,'2022--04--04','2022--05--25','2022--12--12','48 Tố Hữu'),
(5,'2022--01--01','2022--02--02','2022--12--12','48 Tố Hữu');

CREATE table OpenSchedule_Course(
id INT PRIMARY KEY,
FK_Course INT,
FK_OpenSchedule INT,
 FOREIGN KEY (FK_Course) REFERENCES Course(id),
 FOREIGN KEY (FK_OpenSchedule) REFERENCES OpenSchedule(id)
);

INSERT INTO  OpenSchedule_Course
VALUE 
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);



CREATE TABLE user_course(
id_Courses INT PRIMARY KEY,
FK_User INT,
FK_Course INT,
 FOREIGN KEY (FK_User) REFERENCES User(id),
 FOREIGN KEY (FK_Course) REFERENCES Course(id)
)
INSERT INTO user_course
VALUE
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
-- Tìm kiếm tất cả các học viên đăng ký học online
SELECT C.fullname , C.numberPhone , B.type_course FROM ( user_course A JOIN course B ON A.FK_Course = B.id ) 
JOIN user C 
ON A.FK_User = C.id
WHERE B.type_course = 'Online'; 
INSERT INTO history_transition(id,STATUS)
VALUE
(1,'Thành Công'),(2,'Thành Công'),(3,'Thành Công'),(4,'Thành Công'),(5,'Thành Công');

ALTER TABLE history_transition
ADD FOREIGN KEY (ACCOUNT) REFERENCES account_banking(id);
UPDATE history_transition SET ACCOUNT = 1 WHERE id =1;
UPDATE history_transition SET ACCOUNT = 2 WHERE id =2;
UPDATE history_transition SET ACCOUNT = 3 WHERE id =3;
UPDATE history_transition SET ACCOUNT = 4 WHERE id =4;
UPDATE history_transition SET ACCOUNT = 5 WHERE id =5;
 
 








