-- SQL Version - SQLite
-- Creating an enrollment table and populating it using insert.
CREATE TABLE Enrollment (
sid INT NOT NULL,
ClassName VARCHAR(30) NOT NULL,
Grade CHAR(8) NOT NULL
);
INSERT INTO Enrollment
(sid, ClassName, Grade)
VALUES
(123, "Processing", 'A'),
(123, "Python", 'B'),
(123, "Scratch", 'B'),
(662, "Java", 'B'),
(662, "Python", 'A'),
(662, "JavaScript", 'A'),
(662, "Scratch", 'B'),
(345, "Scratch", 'A'),
(345, "JavaScript", 'B'),
(345, "Python", 'A'),
(555, "Python", 'B'),
(555, "JavaScript", 'B'),
(213, "JavaScript", 'A');

-- Query:
SELECT ClassName,count(*) AS Total from Enrollment
GROUP BY ClassName ORDER BY Total DESC,ClassName DESC;

-- Query Explaination:
-- Counting the number of student per class using the count(*) function and grouping them by ClassName. 
-- Then as per the required order in the question we order them by descending order of number of students enrolled in a class.
-- As per the output of the query in the question the ClassName are also ordered by DESC, so we add that in the query.
