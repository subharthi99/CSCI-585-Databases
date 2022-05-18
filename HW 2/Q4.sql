-- SQL Version - SQLite

-- Creating a table for the Enrollment Strength in each class taught by the instructors. A single instructor can teach multiple subjects.
CREATE TABLE Enrollment_Strength(
InstructorName VARCHAR(30) NOT NULL,
Subject VARCHAR(30) NOT NULL,
Enrollments INT NOT NULL
);

--Populating the data with different enrollment strength but keeping the instructor name and subject same from Q5  
INSERT INTO Enrollment_Strength
(InstructorName, Subject, Enrollments)
VALUES
("Aleph","Scratch",20),
("Aleph","Java",20),
("Aleph","Processing",10),
("Bit","Python",20),
("Bit","JavaScript",15),
("Bit","Java",17),
("CRC","Python",15),
("CRC","JavaScript",20),
("Dat","Scratch",15),
("Dat","Python",15),
("Dat","JavaScript",20),
("Emscr","Scratch",20),
("Emscr","Processing",20),
("Emscr","JavaScript",20),
("Emscr","Python",20);

--Query: 
SELECT InstructorName,SUM(Enrollments)*(40*0.1) as Highest_Bonus
FROM Enrollment_Strength
GROUP BY InstructorName
ORDER BY SUM(Enrollments) DESC
LIMIT 1;

-- Query Explaination:
-- Considering the hourly rate to be consistent i.e fixed as stated in the HW 1, so I have set it to 40.
-- Summing all the enrollments for each instructor using the group by function and then ordering by desc order to find the instructor with highest bonus paid. Finding the top bonus paid by using LIMIT 1.