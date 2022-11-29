-- Hiển thị Hồ sơ cá nhân của các user (id, name, phone, email, role, thông thẻ tin ngân hàng)
SELECT A.id , A.fullname , A.numberPhone , C.name_role AS Role_Of_You , B.account_num AS STK , B.name_bank AS Bank
FROM (user A JOIN account_banking B ON A.account_banking  = B.id ) Left JOIN Role C ON A.Role_user = C.id_role;

-- Hiển thị lịch khai giảng và thông tin các khóa học trong buổi khai giảng đó
SELECT B.start_date , B.address , C.name_couse , C.type_course 
FROM ( openschedule_course A JOIN Openschedule B ON A.FK_OpenSchedule = B.id ) 
LEFT JOIN course C
ON A.FK_Course = C.id;

-- Hiển thị chi tiết lịch sử gd của các học viên: mã giao dịch(id), tên học viên(name_student),
 -- tên khóa học (name course), ngày đăng ký(registration_date), trạng thái(status)
  SELECT A.id , C.fullname , F.name_couse ,F.prince AS value_course , G.start_date , A.status 
 FROM  
 (
 (((((history_transition A JOIN account_banking B ON A.Account = B.id)
 JOIN  user C ON B.id = C.account_banking )
 JOIN user_course D ON A.id = D.FK_User)
 JOIN course F ON D.FK_Course = F.id)
 JOIN openschedule_course E ON D.FK_Course = E.FK_Course)
 JOIN openschedule G ON E.FK_OpenSchedule = G.id);