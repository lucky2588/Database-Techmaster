-- Bài 1 :
-- Câu A)
-- CREATE TABLE nhanvien(
-- id INT,
-- fullName VARCHAR(50),
-- Ngay_Bat_Dau DATE,
-- So_Chiec int
-- );
-- --
-- INSERT INTO nhanvien(id,fullname,Ngay_bat_dau,So_chiec)
-- VALUE 
-- (1,'Hoang','2007-01-24',250),(2,'Nam','2007-05-27',220),(3,'Viet','2007-05-06',170),(3,'Viet','2007-04-06',100),
-- (4,'Huong','2007-04-06',220),
-- (5,'Xuan','2007-06-06',300),(5,'Xuan','2007-02-06',350);
-- 

   -- Câu B) : SELECT CONCAT (id,": ",fullname," ,",Ngay_bat_dau) AS Thong_tin FROM nhanvien;



-- Bài 2 : Câu A:
-- CREATE TABLE Employee(
-- Employee_id INT,
-- Employee_name VARCHAR(50),
-- Salary INT
-- );
-- INSERT INTO employee(Employee_id,Employee_name,Salary) 
-- VALUE
-- (12,'Finch',15000),(22,'Peter',25000),(32,'Warner',5600),(42,'Watson',90000);

-- Câu B) 
-- SELECT Employee_id,Employee_name ,(Salary * 2) FROM employee;



-- Câu 3 : Câu A ) 
-- CREATE TABLE infor(
-- frist_name VARCHAR(50),
-- last_name VARCHAR(50),
-- birdayth date
-- );
-- INSERT INTO infor(frist_name,last_name,birdayth)
-- VALUE
-- ('Le Thi','Thu','1996-12-12'),('Vu Thi','Nga','1997-11-17'),
-- ('Nguyen Van','C','2000-12-17'),('Pham Van','D','1998-10-11'),
-- ('Tran Dinh','Trong','1997-04-25'),('Bui Tien','Dung','1997-02-28');

-- Câu B :
-- SET @X = (SELECT NOW());
-- SELECT CONCAT(frist_name," ",last_name) AS FullName ,DATEDIFF(@X,birdayth) AS SoNgay  FROM infor;