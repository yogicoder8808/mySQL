CREATE DATABASE UserData_V1;
USE USerData_V1;
CREATE TABLE USERS (
	SNo INT AUTO_INCREMENT UNIQUE,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) PRIMARY KEY,
    Phone VARCHAR(20) NOT NULL,
    Password VARCHAR(64) NOT NULL
);

INSERT INTO Users (FullName, Email, Phone, Password)
VALUES 	("Yogi A", "Yogi@moder.com", "1234567890", SHA2("Yogi@1234", 256)),
		("Yogi Yo", "Yogi@Gomoder.com", "1234567899", SHA2("Yogi@4321", 256));

SELECT * FROM Users ORDER BY SNo;



--  SET SQL_SAFE_UPDATES = 0/1; To turn off/on safe mode


