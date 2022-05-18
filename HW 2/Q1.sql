-- SQLite 
CREATE TABLE Room
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL CHECK (startTime >=7 and startTime <18),
endTime INTEGER NOT NULL CHECK (endTime > 7 and endTime <=18),
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime),
CONSTRAINT CHK_Time CHECK (startTime<endTime));


-- Query Explaination:

-- The first issue is fixed by adding a check constraint which will make sure that the start time is smaller than the endtime otherwise it will not insert that value into the table.

-- Textual explaination for the second issue:
-- The second issue can be fixed if we assume that all the time slots are for 1 hour duration and if a group wants to book for 3 hours then they would have to make 3 separate bookings for 1 hr each. 
-- The startTime and endTime are also given a check condition as per the question 'on the hour'.
