-- Tạo Bảng Nhà Cung Cấp : ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, phone
-- Tạo bảng Thuốc : ma_thuoc, ten_thuoc, don_vi_tin, so_luong
-- Bảng Nhân Viên : ma_nhan_vien (số, tự tăng), ten_nhan_vien, chuc_vu, score (Điểm chuyên cần), Salary

  -- Các Câu truy vấn tạo bảng 
-- CREATE TABLE NCC(
-- id_NCC int PRIMARY KEY,
-- Name_NCC VARCHAR(50),
-- address_NCC VARCHAR(50),
-- numberPhone INT
-- );
-- CREATE TABLE Thuốc(
-- Mã_thuốc INT PRIMARY KEY AUTO_INCREMENT,
-- Tên_thuốc VARCHAR(50),
-- Don_vi CHAR(10),
-- SL int
-- );
-- CREATE TABLE Nhan_Vien(
-- id_nv INT PRIMARY KEY AUTO_INCREMENT,
-- name_NV VARCHAR(50),
-- chuc_vu VARCHAR(20),
-- score INT,
-- salary DOUBLE
-- );


 
-- Tính tổng trung bình điểm chuyên cần của nhân viên và tiền lương phải trả cho tất cả nhân viên trong 1 tháng
-- 
                  -- Mỗi bảng tạo 10 dòng dữ liệu
-- INSERT INTO ncc
-- VALUE 
-- (1,'FPT Long Châu','Hà Nội',0332588),
-- (2,'Pharmacity','Huế',0332888),
-- (3,'An Khang ','TP HCM',0336888),
-- (4,'Pharmacity','Hà Nội',0332888),
-- (5,'An Huy','Hà Nội',0336888),
-- (6,'FPT Long Châu','Hà Nội',036632888),
-- (7,'Pharmacity','Quảng Ninh',033286688),
-- (8,'FPT Long Châu','Long An',033266888),
-- (9,'Hùng Vương','Nha Trang',033288568),
-- (10,'Thành Nam','Đà Nẵng',033288458);
                         
-- INSERT INTO nhan_vien( name_NV,chuc_vu,score,salary)
-- VALUE
-- ('Nguyễn Đức Thắng','Giám Đốc',10,88.888),
-- ('Nguyễn Văn A','Nhân Viên',20,6.888),
-- ('Nguyễn Toàn B','Nhân Viên',30,5.888),
-- ('Vũ Đức Long','Nhân Viên',40,5.888),
-- ('Nguyễn Văn C','Nhân Viên',50,5.888),
-- ('Đội tuyển anh','Phó Giám Đốc',60,6.888),
-- ('Raheam Stealing','Nhân Viên',70,3.580),
-- ('Harry Kane','Nhân Viên',80,5.888),
-- ('Rashorf','trưởng Phòng',90,8.866),
-- ('Văn Quang','Thư Kí',100,8.688);

-- INSERT INTO thuốc (Tên_thuốc,Don_vi,SL)
-- VALUE
-- ('Bổ Thận Dương','15.000đ',3),
-- ('Thuốc Tẩy Giun','25.000đ',6),
-- ('Rocket 1h','35.000đ',6),
-- ('Bổ Phế Nam Hà','45.000đ',8),
-- ('Thuốc An Thần','55.000đ',8),
-- ('Thuốc Bổ Gan','65.000đ',8),
-- ('Panaldo','55.000đ',5),
-- ('Extraxl','55.000đ',2),
-- ('Vitamin C','65.000đ',2),
-- ('Vitamin A','55.000đ',2),
-- ('Vitamin D','85.000đ',2);


--  -- Tìm tất cả các nhà cung cấp có địa chỉ ở HN 
            -- SELECT * FROM ncc WHERE address_NCC = 'Hà Nội';
            
   
-- Đếm số lượng loại thuốc có của cửa hàng
-- SELECT Tên_thuốc , SL  AS SL_in_CH FROM thuốc GROUP BY tên_thuốc;

 -- Tính tổng trung bình điểm chuyên cần của nhân viên và tiền lương phải trả cho tất cả nhân viên trong 1 tháng
           -- SELECT AVG(score) AS point_TB FROM nhan_vien;
           -- SELECT SUM(salary) AS Total_Salary FROM nhan_vien;
