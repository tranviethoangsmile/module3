USE QuanLySinhVien;
#Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT SubName,MAX(Credit) FROM Subject
GROUP BY SubName
HAVING MAX(Credit) >= ALL (SELECT Credit FROM Subject);
#Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT SubId,SubName, MAX(Mark) 
FROM Subject JOIN Mark ON Subject.SubId = Mark.SubId
GROUP BY SubId,SubName
HAVING MAX(Mark)


#Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT StudentId,StudentName, Mark 
FROM Student JOIN Mark ON Student.StudentId = Mark.StudentId
Order By Mark ASC