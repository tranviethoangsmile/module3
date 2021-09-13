#TẠO DATABASE 
CREATE DATABASE BankingTransactionmanagement;
USE BankingTransactionmanagement;
-- TẠO BẢNG KHÁCH HÀNG
CREATE TABLE Customer 
(
id_cus INT PRIMARY KEY AUTO_INCREMENT,
name_Cus NVARCHAR (30) NOT NULL,
birthday_cus DATE NOT NULL,
address NVARCHAR (100) NOT NULL,
balance FLOAT default 0
);

-- TẠO BẢNG TIỀN GỬI
CREATE TABLE Deposits 
(
id_depos INT PRIMARY KEY AUTO_INCREMENT,
id_Cus INT NOT NULL,
time DATETIME NOT NULL,
money_send FLOAT NOT NULL,
FOREIGN KEY (id_Cus) REFERENCES Customer(id_Cus)
);

-- TẠO BẢNG RÚT TIỀN

CREATE TABLE Withdraws
(
 id_WD INT PRIMARY KEY AUTO_INCREMENT,
 time_WD DATETIME NOT NULL,
 money_WD FLOAT NOT NULL,
 id_Cus INT NOT NULL,
 FOREIGN KEY (id_Cus) REFERENCES Customer (id_Cus)
);

-- TẠO BẢNG CHUYỂN KHOẢNG

CREATE TABLE Transfers
(
id INT PRIMARY KEY AUTO_INCREMENT,
times DATETIME NOT NULL,
money_Trans FLOAT NOT NULL,
id_Cus_send INT NOT NULL,
id_Cus_receiver INT NOT NULL,
FOREIGN KEY (id_Cus_send) REFERENCES Customer (id_Cus),
FOREIGN KEY (id_Cus_receiver) REFERENCES Customer (id_Cus)
);

#TẠO PROCEDURE GỬI TIỀN
DELIMITER $$
CREATE PROCEDURE sp_add_Deposits (IN id INT,IN money FLOAT)
BEGIN
UPDATE Customer SET balance = balance + money WHERE id_cus = id;
INSERT INTO Deposits (id_Cus,time,money_send)
VALUES(id,sysdate(),money);
END;
DELIMITER;
#TEST 
CALL sp_add_Deposits (1,10000);

#thêm khách hàng vào Customer
DELIMITER $$
CREATE PROCEDURE sp_addCustomer (IN fullName VARCHAR (30), IN birthday DATE,IN address VARCHAR (100))
BEGIN
INSERT INTO Customer (name_Cus,birthday_cus,address)
VALUES (fullName,birthday,address);
END;
DELIMITER;

#TEST 
CALL sp_addCustomer ('Trần Viết Hoàng','19930629','Thừa Thiên Huế');
CALL sp_addCustomer ('Hoàng Chương','19940720','Thừa Thiên Huế');
CALL sp_addCustomer ('Huỳnh Hoà','19830728','Thừa Thiên Huế');

#TẠO PROCEDURE CHUYỂN TIỀN.

DELIMITER $$
CREATE PROCEDURE sp_Transfers (IN id_Trans INT,IN money FLOAT, IN id_rec INT)
BEGIN
DECLARE cusOFmoney FLOAT;
SET cusOFmoney = (SELECT balance FROM Customer WHERE id_cus = id_Trans );
IF (cusOFmoney >= money AND money > 0) THEN
UPDATE Customer SET balance = balance - money WHERE (id_cus = id_Trans AND balance >= money);
UPDATE Customer SET balance = balance + money WHERE id_cus = id_rec;
INSERT INTO Transfers(times,money_Trans,id_Cus_send,id_Cus_receiver)
VALUES (sysdate(),money,id_Trans,id_rec);
END IF;
END;
DELIMITER;

#TEST 
CALL sp_Transfers(1,-100,2)
CALL sp_Transfers(2,1000,1)

#TẠO PROCEDURE RÚT TIỀN
DELIMITER $$
CREATE PROCEDURE sp_Withdraws (IN id INT, IN money FLOAT)
BEGIN
DECLARE cusOFmoney FLOAT;
SET cusOFmoney = (SELECT balance FROM Customer WHERE id_cus = id);
IF (cusOFmoney >= money AND money > 0) 
THEN
UPDATE Customer SET balance = balance - money WHERE id_cus = id;
INSERT INTO Withdraws (time_WD,money_WD,id_Cus)
VALUES(sysdate(),money,id);
END IF;
END;
DELIMITER;

#TEST
CALL sp_Withdraws(1,3800);