CREATE TABLE Country1 (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT);
-- Create the Persons table
CREATE TABLE Persons1 (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50));
    -- Insert rows into the Country table
INSERT INTO Country1 (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9834000),
(2, 'Canada', 38000000, 9985000),
(3, 'UK', 67800000, 243000),
(4, 'India', 1393000000, 3287000),
(5, 'Australia', 25600000, 7692000),
(6, 'Germany', 83200000, 357000),
(7, 'France', 65400000, 551000),
(8, 'Brazil', 213000000, 8516000),
(9, 'Japan', 126000000, 377975),
(10, 'South Korea', 52000000, 100210);
-- Insert rows into the Persons table
INSERT INTO Persons1 (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 38000000, 3.8, 2, 'Canada'),
(3, 'Alice', 'Johnson', 67800000, 4.2, 3, 'UK'),
(4, 'Rahul', 'Verma', 1393000000, 3.6, 4, 'India'),
(5, 'Emily', 'Davis', 25600000, 4.8, 5, 'Australia'),
(6, 'Carlos', 'Garcia', 213000000, 4.1, 8, 'Brazil'),
(7, 'Sophie', 'Miller', 65400000, 3.9, 6, 'France'),
(8, 'Akira', 'Tanaka', 126000000, 4.7, 9, 'Japan'),
(9, 'Min', 'Choi', 52000000, 3.5, 10, 'South Korea'),
(10, 'Anna', 'Brown', 38000000, 4.6,5,'france');
-- 1Add a new column DOB to the Persons table
alter table persons1 add DOB date;
-- Update DOB for existing records
UPDATE Persons1 SET DOB = '1990-01-15' WHERE ID = 1;
UPDATE Persons1 SET DOB = '1985-02-20' WHERE ID = 2;
UPDATE Persons1 SET DOB = '1980-07-10' WHERE ID = 3;
UPDATE Persons1 SET DOB = '1975-05-30' WHERE ID = 4;
UPDATE Persons1 SET DOB = '1992-08-25' WHERE ID = 5;
UPDATE Persons1 SET DOB = '1988-09-17' WHERE ID = 6;
UPDATE Persons1 SET DOB = '1991-12-04' WHERE ID = 7;
UPDATE Persons1 SET DOB = '1986-03-22' WHERE ID = 8;
UPDATE Persons1 SET DOB = '1993-06-11' WHERE ID = 9;
UPDATE Persons1 SET DOB = '1989-11-09' WHERE ID = 10;

-- 2Create a user-defined function to calculate age using DOB
select*from persons1;
DELIMITER $$
CREATE FUNCTION CalculateAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END $$;
DELIMITER ;
 -- 3Write a SELECT query to fetch the age of all persons using the function
 SELECT ID,Fname ,Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons1;
-- 4Find the length of each country name in the Country table
select Country_name , length(Country_name)from country1;
-- 5Extract the first three characters of each country's name in the Country table
select substring(Country_name,1,3)as Fiest_three_letters from country1;
-- 6Convert all country names to uppercase and lowercase in the Country table
sELECT Country_name , 
       UPPER(Country_name) AS UppercaseName, 
       LOWER(Country_name) AS LowercaseName
FROM Country1;
























 











