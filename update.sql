-- Part 2.4 update.sql
--
-- Submitted by: <Emre Salur>, <20082471>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- Emre Salur 20082471 update.sql

-- Hourly Payment

UPDATE Coach SET dailySalary = dailySalary/4;
UPDATE Participant SET dailySalary = dailySalary/4;

-- Arrive and Leave Shows

ALTER TABLE CoachInShow ADD(arriveTime TIME, leaveTime TIME);
ALTER TABLE ContenderInShow ADD(arriveTime TIME, leaveTime TIME);

-- Attendance

UPDATE CoachInShow SET
arriveTime = (SELECT DATE_SUB(startTime,INTERVAL 1 HOUR) FROM TVShow WHERE idShow = showID),
leaveTime = (SELECT DATE_ADD(endTime,INTERVAL 1 HOUR) FROM TVShow WHERE idShow = showID)
WHERE showID IN (SELECT idShow FROM TVShow WHERE idShow = showID);
UPDATE ContenderInShow SET
arriveTime = (SELECT DATE_SUB(startTime,INTERVAL 1 HOUR) FROM TVShow WHERE idShow = showID),
leaveTime = (SELECT DATE_ADD(endTime,INTERVAL 1 HOUR)  FROM TVShow WHERE idShow = showID)
WHERE showID IN (SELECT idShow FROM TVShow WHERE idShow = showID);
