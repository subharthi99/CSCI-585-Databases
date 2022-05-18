-- SQL Version - SQLite
-- Creating a table with possible candidates who can be selected if they match the required subjects.
CREATE TABLE Possible_Candidates(
Instructor VARCHAR(30) NOT NULL,
Subject VARCHAR(30) NOT NULL
);

-- Creating a table for the subjects that are required by the instructor to teach that summer.
CREATE TABLE Subjects(
Subject VARCHAR(30) NOT NULL
);

--Populating both the tables
INSERT INTO Possible_Candidates
(Instructor, Subject)
VALUES
("Aleph","Scratch"),
("Aleph","Java"),
("Aleph","Processing"),
("Bit","Python"),
("Bit","JavaScript"),
("Bit","Java"),
("CRC","Python"),
("CRC","JavaScript"),
("Dat","Scratch"),
("Dat","Python"),
("Dat","JavaScript"),
("Emscr","Scratch"),
("Emscr","Processing"),
("Emscr","JavaScript"),
("Emscr","Python");

INSERT INTO Subjects
(Subject)
VALUES
("JavaScript"),
("Scratch"),
("Python");



SELECT Instructor from Possible_Candidates where Subject IN 
(SELECT Subject from Subjects) group by Instructor HAVING count(*) = (SELECT COUNT(*) FROM Subjects);

-- Query explaination:
-- Using the IN operator by taking every subject the instructor teaches to compare the subject in the subjects table(required subjects for that semester).
-- Then using the HAVING we group the same instructor together and we check if the number of rows per instructor is equal to the number of rows/subjects present in the Subjects table. The Instructors satisfying this condition will pass through.
-- This method is an implementation of division (relational algebra operation) in SQL.