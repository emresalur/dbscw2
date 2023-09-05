-- Part 2.3 select.sql
--
-- Submitted by: <Emre Salur>, <20082471>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- Emre Salur 20082471 select.sql

-- 1. Average Female Salary

SELECT AVG(dailySalary) AS femaleAverageSalary
FROM Participant
WHERE (gender = 'F');

-- 2. Coaching Report.

SELECT Coach.*, COUNT(idContender)
FROM Coach LEFT JOIN Contender ON idCoach=coach
GROUP BY idCoach;

-- 3. Coach Monthly Attendance Report

SELECT coach, COUNT(Month(day)) AS March 
FROM CoachInShow LEFT JOIN TVShow ON showID = idShow
WHERE Month(day) = 3
GROUP BY coach;
SELECT coach, COUNT(Month(day)) AS April
FROM CoachInShow LEFT JOIN TVShow ON showID = idShow
WHERE Month(day) = 4
GROUP BY coach;

-- 4. Most Expensive Contender

SELECT stageName, (SUM(dailySalary))
FROM Contender INNER JOIN Participant
WHERE idContender = contender
GROUP BY stageName
ORDER BY SUM(dailySalary) DESC;

-- 5. March Payment Report

--Worked on this for hours but could not do it the way I wanted do.
--Looking forward to improve from this part :)

-- 6. Well Formed Groups!

SELECT CASE WHEN EXISTS
(SELECT Contender.*, COUNT(idParticipant)
 FROM Contender LEFT JOIN Participant ON idContender = contender 
 WHERE type = 'Group' 
 HAVING COUNT(idParticipant) = 1)
THEN FALSE
ELSE TRUE
END;