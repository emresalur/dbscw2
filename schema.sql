-- Part 2.1 schema.sql
--
-- Submitted by: <Emre Salur>, <20082471>
-- 

-- DO NOT use these SQL commands in your submission(they will cause an 
--  error on the NMS database server):
-- CREATE SCHEMA 
-- USE 

-- Emre Salur 20082471 schema.sql

CREATE TABLE Coach (
  name VARCHAR(50) NOT NULL, 
  surname VARCHAR(50) NOT NULL,
  DoB DATE NOT NULL,
  idCoach INTEGER UNIQUE NOT NULL AUTO_INCREMENT CHECK(idCoach > 0),
  phone VARCHAR(50) NOT NULL,
  dailySalary INTEGER NOT NULL,
  gender CHAR(1) NOT NULL,
  PRIMARY KEY(idCoach)
);

CREATE TABLE Contender (
  stageName VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  idContender INTEGER NOT NULL AUTO_INCREMENT CHECK(idContender > 0),
  coach INTEGER,
  PRIMARY KEY(idContender),
  FOREIGN KEY(coach) REFERENCES Coach(idCoach)
);

CREATE TABLE Participant (
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  DoB DATE NOT NULL,
  idParticipant INTEGER UNIQUE NOT NULL AUTO_INCREMENT CHECK(idParticipant > 0),
  phone VARCHAR(50) NOT NULL,
  dailySalary INTEGER NOT NULL,
  gender CHAR(1) NOT NULL,
  contender INTEGER,
  PRIMARY KEY(idParticipant),
  FOREIGN KEY(contender) REFERENCES Contender(idContender)
);

CREATE TABLE TVShow (
  location VARCHAR(50) NOT NULL,
  day DATE NOT NULL,
  idShow INTEGER UNIQUE AUTO_INCREMENT CHECK(idShow > 0),
  startTime TIME NOT NULL,
  endTime TIME NOT NULL,
  PRIMARY KEY(idShow)
);

CREATE TABLE CoachInShow (
  coach INTEGER,
  showID INTEGER,
  PRIMARY KEY(coach, showID),
  FOREIGN KEY(coach) REFERENCES Coach(idCoach),
  FOREIGN KEY(showID) REFERENCES TVShow(idShow) 
);

CREATE TABLE ContenderInShow (
  contender INTEGER,
  showID INTEGER,
  PRIMARY KEY(contender, showID),
  FOREIGN KEY(contender) REFERENCES Contender(idContender),
  FOREIGN KEY(showID) REFERENCES TVShow(idShow)
);

