-- Part 2.5 delete.sql
--
-- Submitted by: <Emre Salur>, <20082471>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- Emre Salur 20082471 delete.sql

-- Deleting participants from the deleted contender
ALTER TABLE Participant
ADD CONSTRAINT
FOREIGN KEY (contender)
REFERENCES Contender (idContender)
ON DELETE CASCADE;

--Deleting the contender with the lowest total salary 
DELETE FROM Participant
WHERE contender = 5;

