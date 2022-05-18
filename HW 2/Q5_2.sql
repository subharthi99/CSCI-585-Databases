-- SQL Version - SQLite
-- Creating a table with possible candidates who can be selected if they match the required subjects.
CREATE TABLE Possible_Candidates(
Instructor VARCHAR(30) NOT NULL,
Subject VARCHAR(30) NOT NULL
);

-- Creating a table for the subjects that are reuired by the instructor to teach that summer.
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


SELECT Instructor from Possible_Candidates INNER JOIN Subjects ON Subjects.Subject = Possible_Candidates.Subject
group by Instructor HAVING count(*) = (SELECT count(*) FROM Subjects) order by Instructor ASC;

-- Query explaination:

-- The query first does an inner join on the Possible_candidates and Subjects table. From this we get all records from the Subjects table , and the matching records from the Possible_Candidates table i.e. 
-- Thus, it generates a list of instructors where the subjects the instructor teaches matches with the  subjects from the Subjects table.
-- Then the query groups the multiple rows with the same instructors into 1 with the HAVING condition in which we check if no. of rows per instructor is equal to the no. of rows present in the Subjects table. 
-- Only the Instructors satisfying this condition are shown in the output.
