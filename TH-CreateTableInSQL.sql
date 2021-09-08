CREATE database QuanLyDiemThi;
USE QuanLyDiemThi;
CREATE table HocSinh (
MaHS varchar (20) primary key,
TenHS varchar(50),
NgaySinh datetime,
Lop varchar(20),
GT varchar(20)
);

CREATE TABLE MonHoc (
MaMH varchar (20) primary key,
TenMH varchar(20)
);

create table BangDiem (
MaHS varchar (20),
MaMH varchar (20),
DiemThi int,
NgayKT DATETIME,
primary key (MaHS,MaHS),
FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

CREATE TABLE GiaoVien (
MaGV varchar (20) primary KEY,
TenGV varchar (20),
SDT varchar (10)
);

ALTER TABLE MonHoc ADD MaGV VARCHAR(20);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);