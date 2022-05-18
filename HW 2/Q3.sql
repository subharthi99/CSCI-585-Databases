-- SQL Version - SQLite

-- Creating a table for the project status so that supervisor can monitor the progress of students' projects.
CREATE TABLE Project_Status (
PID VARCHAR(30) NOT NULL,
Step INT NOT NULL,
Status CHAR(8) NOT NULL
);

--Populating the table from the data given in the question.
INSERT INTO Project_Status
(PID, Step, Status)
VALUES
("P100", 0, 'C'),
("P100", 1, 'W'),
("P100", 2, 'W'),
("P201", 0, 'C'),
("P201", 1, 'C'),
("P333", 0, 'W'),
("P333", 1, 'W'),
("P333", 2, 'W'),
("P333", 3, 'W');

-- Query:
SELECT PID from Project_Status where Step = 0 and Status = 'C' and PID IN 
(SELECT PID from Project_Status where Step = 1 and Status = 'W');


-- Query Explaination:
-- As per the question, the query only outputs the Projects where only step 0 has been completed.
-- First we find all the pid's where its step = 0 and status = C. 
-- Then we run a nested query to filter out the pid's where its step = 1 and status = W.
-- We do so only for step = 1 as the question mentiones that steps are completed in order like P333 will never have C,W,C,W.
-- Then, using IN we compare the pid's that we get from the inner and outer queries and return only those that match.
