CREATE DATABASE UserData;
USE UserData;

CREATE TABLE Users (
	SNo INT AUTO_INCREMENT UNIQUE,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) PRIMARY KEY,
    Phone VARCHAR(20) NOT NULL,
    Password VARCHAR(64) NOT NULL,
    INDEX(Phone)
);


INSERT INTO Users (FullName, Email, Phone, Password)
VALUES 	("A Yogi", "Yogi@moder.com", "1234565590", SHA2("Yogi.com@1234", 256)),
		("Yogi yo", "Yogi@gomoder.com", "1234565599", SHA2("Yogi.com@1234", 256));

CREATE TABLE Log(
	LogID INT AUTO_INCREMENT PRIMARY KEY,
    Operation VARCHAR(10) NOT NULL,
	SNo INT,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    OperationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------Inset_Log-----------------------------

DELIMITER $$
CREATE TRIGGER 
after_user_insert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
	INSERT INTO Log (Operation, SNo, FullName, Email, Phone)
    VALUES('INSERT',New.SNo, New.FullName, NEW.Email, NEW.Phone);
    END;
	$$
DELIMITER ;



-- INSERT INTO Users (FullName, Email, Phone, Password)
-- VALUES 	("A Yogi", "Yogeswaran@moder.com", "1234565590", SHA2("Yogi.com@1234", 256));

-- UPDATE Users
-- SET FullName ='A Yo'
-- WHERE Phone =  "1234565590";
-- DELETE FROM Users WHERE Phone = '1234565590';

SELECT * FROM Users ORDER BY SNo;
SELECT * FROM Log;



--  DROP DATABASE userdata;
-- 	SHOW INDEX FROM Users;
--  SET SQL_SAFE_UPDATES = 0/1; To turn off/on safe mode (For Manual COMMIT & ROOLBACK)
--  Drop Trigger after_user_insert;




















