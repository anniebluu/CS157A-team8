-- MySQL dump 10.13  Distrib 9.0.1, for macos14.4 (arm64)
--
-- Host: localhost    Database: Pet Query
-- Sources: 
-- https://www.w3schools.com/sql/
-- https://atlasgo.io/guides/mysql/check-constraint
-- https://www.geeksforgeeks.org/enumerator-enum-in-mysql/
-- ------------------------------------------------------
-- Server version	9.0.1

CREATE TABLE Users (
-- primary key
Username varchar(50) PRIMARY KEY,
UsrEmail varchar(50) NOT NULL UNIQUE,
UsrName varchar(50) NOT NULL,
UsrPassword varchar(50) NOT NULL,
AccountType int NOT NULL,
-- assuming account types are assigned 0 or 1 with each representing either Adopter or Org Admin
CHECK (AccountType IN (0, 1))
);

CREATE TABLE Pets (
-- primary key
PetID int PRIMARY KEY,
PetName varchar(50) NOT NULL,
Age int NOT NULL,
Category varchar(50),
-- uses id of PetOrg as secondary key
OrgID int,
FOREIGN KEY (OrgID) REFERENCES PetOrganization(OrgID)
);

CREATE TABLE PetOrganization (
-- primary key
OrgID int PRIMARY KEY,
Address varchar(50) NOT NULL,
OrgName varchar(50) NOT NULL,
OrgEmail varchar(50) NOT NULL
);

CREATE TABLE Applications (
AppID int PRIMARY KEY,
Username varchar(50) NOT NULL,
AppStatus ENUM('pending', 'proccessed') DEFAULT 'pending'
);

CREATE TABLE Appointments (
Username varchar(50) NOT NULL,
-- uses username as secondary key
FOREIGN KEY (Username) REFERENCES Users(Username),
Date DATE NOT NULL,
Time TIME NOT NULL,
-- makes sure no two appointments overlapp for users
UNIQUE (Date, Time, OrgID, Username)
);

