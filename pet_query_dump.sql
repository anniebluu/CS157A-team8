-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: chu
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adopts`
--

DROP TABLE IF EXISTS `adopts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopts` (
  `Username` varchar(45) NOT NULL,
  `PetID` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`,`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopts`
--

LOCK TABLES `adopts` WRITE;
/*!40000 ALTER TABLE `adopts` DISABLE KEYS */;
/*!40000 ALTER TABLE `adopts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `AppID` varchar(45) NOT NULL,
  `App Status` int NOT NULL,
  PRIMARY KEY (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `Username` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `create`
--

DROP TABLE IF EXISTS `create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `create` (
  `Username` varchar(45) NOT NULL,
  `UsrName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create`
--

LOCK TABLES `create` WRITE;
/*!40000 ALTER TABLE `create` DISABLE KEYS */;
/*!40000 ALTER TABLE `create` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organized`
--

DROP TABLE IF EXISTS `organized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organized` (
  `OrgID` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Org Name` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`OrgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organized`
--

LOCK TABLES `organized` WRITE;
/*!40000 ALTER TABLE `organized` DISABLE KEYS */;
/*!40000 ALTER TABLE `organized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owns` (
  `OrgID` varchar(45) NOT NULL,
  `PetID` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Org Name` varchar(45) NOT NULL,
  `Pet Name` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`OrgID`,`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet organization`
--

DROP TABLE IF EXISTS `pet organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet organization` (
  `OrgID` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Org Name` varchar(45) NOT NULL,
  `Org Email` varchar(45) NOT NULL,
  PRIMARY KEY (`OrgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet organization`
--

LOCK TABLES `pet organization` WRITE;
/*!40000 ALTER TABLE `pet organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `PetID` varchar(45) NOT NULL,
  `Pet Name` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submits`
--

DROP TABLE IF EXISTS `submits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submits` (
  `AppID` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `UsrName` varchar(45) NOT NULL,
  `UsrEmail` varchar(45) NOT NULL,
  PRIMARY KEY (`AppID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submits`
--

LOCK TABLES `submits` WRITE;
/*!40000 ALTER TABLE `submits` DISABLE KEYS */;
/*!40000 ALTER TABLE `submits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Username` varchar(50) NOT NULL,
  `UsrEmail` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UsrPassword` varchar(50) NOT NULL,
  `AccountType` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `UsrEmail_UNIQUE` (`UsrEmail`),
  CONSTRAINT `users_chk_1` CHECK ((`AccountType` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('username1','oliver.grant@gmail.com','Oliver Grant','password1','0'),('username10','grace.mitchell@gmail.com','Grace Mitchell','password10','0'),('username2','amelia.collins@gmail.com','Amelia Collins','password2','0'),('username3','ethan.reed@gmail.com','Ethan Reed','password3','0'),('username4','sophia.bennett@gmail.com','Sophia Bennett','password4','0'),('username5','jackson.hayes@gmail.com','Jackson Hayes','password5','0'),('username6','lily.carter@gmail.com','Lily Carter','password6','0'),('username7','mason.brooks@gmail.com','Mason Brooks','password7','0'),('username8','ava.sullivan@gmail.com','Ava Sullivan','password8','0'),('username9','liam.turner@gmail.com','Liam Turner','password9','0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-29 16:27:48
