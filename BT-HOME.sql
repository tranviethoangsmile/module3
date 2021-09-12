USE BankingTransactionmanagement;

-- TẠO BẢNG KHÁCH HÀNG
CREATE TABLE Customer 
(
id_cus INT PRIMARY KEY AUTO_INCREMENT,
name_Cus NVARCHAR (30) NOT NULL,
birthday_cus DATE NOT NULL,
address NVARCHAR (100) NOT NULL,
balance FLOAT
);


-- TẠO BẢNG TIỀN GỬI
CREATE TABLE Deposits 
(
id_depos INT PRIMARY KEY AUTO_INCREMENT,
id_Cus INT NOT NULL,
name_Cus NVARCHAR (30) NOT NULL,
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
id_Trans INT PRIMARY KEY AUTO_INCREMENT,Withdraws
time_Trans DATETIME NOT NULL,
money_Trans FLOAT NOT NULL,
id_Cus_send INT NOT NULL,
id_Cus_receiver INT NOT NULL,
FOREIGN KEY (id_Cus_send) REFERENCES Customer (id_Cus),
FOREIGN KEY (id_Cus_receiver) REFERENCES Customer (id_Cus)

);