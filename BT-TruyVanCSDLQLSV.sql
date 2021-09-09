#Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
USE QuanLySinhVien;
SELECT StudentName
FROM Student
WHERE StudentName LIKE "h%";

#Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT StartDate, ClassName
FROM Class 
WHERE StartDate like  "%12%";

#Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 5-10.
SELECT SubName, Credit
 FROM Subject
 WHERE Credit BETWEEN 5 AND 10;
#WHERE Credit >=5 AND Credit <= 10;

#Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE Student
SET ClassId = 2
WHERE StudentName = 'Hung';

#Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT ClassName, StudentName, Mark
FROM Class, Student,Mark
ORDER BY Mark.Mark ASC;



 





