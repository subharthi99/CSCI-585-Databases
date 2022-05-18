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

-- If there is an existing view with the name 'ideal_prof' dropping it and creating a new one in the next query
drop view if exists ideal_prof;

-- Creating a view 'ideal_prof' which makes the CROSS JOIN (also known as the cartesian product) of Possible_Candidates and Subjects tables.
CREATE VIEW ideal_prof as SELECT Instructor,Possible_Candidates.subject as instr_sub, Subjects.subject as req_sub from Possible_Candidates CROSS JOIN Subjects;

-- Selecting rows from the view 'ideal_prof' and comparing the Possible_Candidates.subject data value = Subjects.subject value and then to group similar instructors, then we display the instructors that satisfy the condition.
SELECT Instructor from ideal_prof where instr_sub = req_sub group by Instructor HAVING count(*) = (SELECT COUNT(*) FROM Subjects);

-- Query Explaination:
-- In this method a view (virtual table) 'ideal_prof' is created which contains the columns InstrutorName, Possible_Candidates.subject and Subjects.subject by CROSS JOINING (Cartesian Product) Possible_Candidates and Subjects tables.
-- Then the query compares the values of the 2 columns of subject from each table to check which row has the same values for both.
-- Then using group by to group all the instructors where the no. of rows per instructor is equal to the no. of rows present in the Subjects table. 
