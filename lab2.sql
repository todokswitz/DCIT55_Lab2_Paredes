CREATE DATABASE studentdb;

-- 1
USE studentdb;

-- 2
CREATE TABLE tblStudent(
	studentNumber INT(11) PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100),
    lastName VARCHAR(100) NOT NULL,
    middleName VARCHAR(100),
    birthdate VARCHAR(20),
    citizenship VARCHAR(50) COMMENT 'Example: Filipino, Nigerian, Korean',
    gender VARCHAR(100) COMMENT 'Male or Female'
);

-- 3
SHOW FULL COLUMNS FROM tblStudent;

-- 4
INSERT INTO tblStudent (studentNumber, firstName, lastName, middleName, birthdate, citizenship, gender) VALUES ('202014912', 'STEVEN', 'ESPEDIDO', 'ROSALDO', '2000-01-01', 'FILIPINO', 'MALE');
INSERT INTO tblStudent (studentNumber, firstName, lastName, middleName, birthdate, citizenship, gender) VALUES ('202014165', 'NINA KLARISSE', 'ULANGKAY', 'AMBROSIO', '2000-01-02', 'FILIPINO', 'FEMALE');
INSERT INTO tblStudent (studentNumber, firstName, lastName, middleName, birthdate, citizenship, gender) VALUES ('202011535', 'ADRIAN', 'CARRANZA', 'RUBIA', '2000-01-03', 'FILIPINO', 'MALE');
INSERT INTO tblStudent (studentNumber, firstName, lastName, middleName, birthdate, citizenship, gender) VALUES ('202011818', 'JEAN', 'DACLES', 'RICO', '2000-01-04', 'FILIPINO', 'FEMALE');
INSERT INTO tblStudent (studentNumber, firstName, lastName, middleName, birthdate, citizenship, gender) VALUES ('202012336', 'GILLIAN KYLE', 'CATAHAN', 'DIMAALA', '2000-01-05', 'FILIPINO', 'MALE');

-- 5
ALTER TABLE tblStudent CHANGE gender sex VARCHAR(6);
ALTER TABLE tblStudent CHANGE birthdate birthdate DATE;
ALTER TABLE tblStudent CHANGE citizenship citizenship VARCHAR(20);

-- 6
ALTER TABLE tblStudent ADD age INT(3) AFTER birthdate;

-- 7
ALTER TABLE tblStudent RENAME studentinfo;

-- 8a
SELECT UPPER(firstName), UPPER(lastName), UPPER(middleName) FROM studentinfo;

-- 8b
SELECT 
	studentNumber, 
    firstName, 
    lastName, 
    middleName, 
    birthdate, 
    REPLACE(citizenship, 'FILIPINO', 'PINOY') AS citizenship, 
    sex 
FROM studentinfo;

-- 8c
SELECT 
	studentNumber, 
    CONCAT(firstName, ' ', middleName, ' ', lastName) AS fullName 
FROM studentinfo;

-- 8d
SELECT REPEAT(lastName, 5) AS repeatedLastName FROM studentinfo;

-- 9
UPDATE studentinfo SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());
SELECT AVG(age) AS studentsAverageAge FROM studentinfo;

-- 10
SELECT 
	studentNumber, 
    firstName, 
    lastName, 
    middleName, 
    DATE_FORMAT(birthdate, '%D %M %Y') AS birthdate, 
    age,
    citizenship, 
    sex 
FROM studentinfo;

-- 11
SELECT sex, COUNT(studentNumber) AS sexTotalNumber FROM studentinfo GROUP BY sex;

-- 12
SELECT 
	studentNumber, 
    lastName, 
    firstName, 
    middleName, 
    birthdate, 
    age,
    citizenship, 
    sex 
FROM studentinfo ORDER BY lastName ASC;
