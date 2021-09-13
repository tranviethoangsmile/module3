USE QuanLySinhVien;
#Hiển thị số lượng sinh viên ở từng nơi
SELECT Address, COUNT(StudentId) AS 'số lượng' 
	FROM Student
	GROUP BY Address;
#Tính điểm trung bình các môn học của mỗi học viên
SELECT StudentName,StudentId,AVG(Mark) 
FROM Student JOIN Mark ON Student.StudentId = Mark.StudentId
GROUP BY StudentId,StudentName;
#Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT StudentName,AVG(Mark) FROM Student JOIN Mark ON Student.StudentId = Mark.StudentId
GROUP BY StudentName
HAVING AVG(Mark) > 5;
#Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT StudentName,MAX(Mark) 
FROM Student JOIN Mark ON Student.StudentId = Mark.StudentId
GROUP BY StudentName
HAVING MAX(Mark) >= ALL (SELECT MAX(Mark) FROM Mark GROUP BY Mark.StudentId);
