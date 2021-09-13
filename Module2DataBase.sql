CREATE DATABASE restaurantDatabase;
USE restaurantDatabase;

#Tạo bảng Hoá đơn

CREATE TABLE bill 
(
id INT AUTO_INCREMENT PRIMARY KEY,
nameFood NVARCHAR (30) NOT NULL,
unitPrice INT NOT NULL,
times DATE
);

#CREATE ADMIN TABLE
CREATE TABLE admin
(
id INT AUTO_INCREMENT PRIMARY KEY,
names NVARCHAR (20) NOT NULL default 'NV',
password INT (6) NOT NULL,
birthday DATE NULL
);

#Tạo bảng món rừng
CREATE TABLE monRung 
(
id INT AUTO_INCREMENT PRIMARY KEY,
names NVARCHAR (30) NOT NULL DEFAULT 'Món Rừng',
prices INT NOT NULL DEFAULT 0
);
#tạo bảng món hải sản
CREATE TABLE monHaiSan 
(
id INT AUTO_INCREMENT PRIMARY KEY,
names NVARCHAR (30) NOT NULL DEFAULT 'Món Hải Sản',
prices INT NOT NULL DEFAULT 0
);
#tạo bảng món lẫu
CREATE TABLE monLau 
(
id INT AUTO_INCREMENT PRIMARY KEY,
names NVARCHAR (30) NOT NULL DEFAULT 'Món Lẫu',
prices INT NOT NULL DEFAULT 0
);
#tạo bảng khai vị
CREATE TABLE monKhaiVi 
(
id INT AUTO_INCREMENT PRIMARY KEY,
names NVARCHAR (30) NOT NULL DEFAULT 'Món Khai Vị',
prices INT NOT NULL DEFAULT 0
);
#toạ bảng đồ uống
CREATE TABLE doUong 
(
id INT AUTO_INCREMENT PRIMARY KEY,
names NVARCHAR (30) NOT NULL DEFAULT 'Đồ Uống',
prices INT NOT NULL DEFAULT 0
);
#tạo view cho các bảng
CREATE VIEW monRung_tb 
AS 
SELECT * FROM monRung;

CREATE VIEW monHaiSan_tb 
AS 
SELECT * FROM monHaiSan;

CREATE VIEW monLau_tb 
AS 
SELECT * FROM monLau;

CREATE VIEW monKhaiVi_tb 
AS 
SELECT * FROM monKhaiVi;

CREATE VIEW doUong_tb 
AS 
SELECT * FROM doUong;


#Tạo hàm nhập đồ uống
DELIMITER $$
CREATE PROCEDURE input_DoUong (names NVARCHAR(30), price INT)
BEGIN
	INSERT INTO doUong (names,prices) 
    VALUES (names,price);
END;
DELIMITER;

CALL input_DoUong ('bia hơi', 20);
CALL input_DoUong ('Nước Ngọt', 25);
CALL input_DoUong ('Nước lọc', 10);

#Tạo hàm nhập món Hải sản
DELIMITER $$
CREATE PROCEDURE input_HaiSan (names NVARCHAR(30), price INT)
BEGIN
	INSERT INTO monHaiSan (names,prices) 
    VALUES (names,price);
END;
DELIMITER;

CALL input_HaiSan ('Mực', 200);
CALL input_HaiSan ('Hàu', 250);
CALL input_HaiSan ('Cua', 400);

#Tạo hàm nhập món Khai Vị
DELIMITER $$
CREATE PROCEDURE input_KhaiVi (names NVARCHAR(30), price INT)
BEGIN
	INSERT INTO monKhaiVi (names,prices) 
    VALUES (names,price);
END;
DELIMITER;

CALL input_KhaiVi  ('Rau Muốn', 200);
CALL input_KhaiVi  ('Đậu Hũ', 250);
CALL input_KhaiVi  ('Dưa Leo', 400);

#Tạo hàm nhập món Lẫu
DELIMITER $$
CREATE PROCEDURE input_Lau (names NVARCHAR(30), price INT)
BEGIN
	INSERT INTO monLau (names,prices) 
    VALUES (names,price);
END;
DELIMITER;

CALL input_Lau  ('Lẫu Gà', 200);
CALL input_Lau  ('Lẫu Bò', 250);
CALL input_Lau  ('Lẫu Dê', 400);

#Tạo hàm nhập món Rừng
DELIMITER $$
CREATE PROCEDURE input_Rung (names NVARCHAR(30), price INT)
BEGIN
	INSERT INTO monRung (names,prices) 
    VALUES (names,price);
END;
DELIMITER;

CALL input_Rung  ('Dê Nướng', 200);
CALL input_Rung  ('Nai Hon', 250);
CALL input_Rung  ('Bò tót', 400);
