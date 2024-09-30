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
INSERT INTO `adopts` VALUES ('username1','794-7297-002'),('username10','262-2133-001'),('username2','337-2339-001'),('username3','794-7297-006'),('username4','337-2339-006'),('username5','262-2133-003'),('username6','337-2339-002'),('username7','262-2133-005'),('username8','794-7297-003'),('username9','262-2133-006');
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
INSERT INTO `application` VALUES ('A01',0),('A02',0),('A03',0),('A04',0),('A05',0),('A06',0),('A07',0),('A08',0),('A09',0),('A10',0);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AppointmentID` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES ('AP-001','10/01/2024','1:00 PM'),('AP-002','10/01/2024','2:00 PM'),('AP-003','10/01/2024','3:00 PM'),('AP-004','10/01/2024','4:00 PM'),('AP-005','10/02/2024','1:00 PM'),('AP-006','10/02/2024','2:00 PM'),('AP-007','10/02/2024','3:00 PM'),('AP-008','10/02/2024','4:00 PM'),('AP-009','10/03/2024','1:00 PM'),('AP-010','10/03/2024','2:00 PM');
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
  `AppointmentID` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create`
--

LOCK TABLES `create` WRITE;
/*!40000 ALTER TABLE `create` DISABLE KEYS */;
INSERT INTO `create` VALUES ('username1','Oliver Grant','oliver.grant@gmail.com','10/01/2024','1:00 PM','AP-001'),('username10','Grace Mitchell','grace.mitchell@gmail.com','10/03/2024','2:00 PM','AP-010'),('username2','Amelia Collins','amelia.collins@gmail.com','10/01/2024','2:00 PM','AP-002'),('username3','Ethan Reed','ethan.reed@gmail.com','10/01/2024','3:00 PM','AP-003'),('username4','Sophia Bennett','sophia.bennett@gmail.com','10/01/2024','4:00 PM','AP-004'),('username5','Jackson Hayes','jackson.hayes@gmail.com','10/02/2024','1:00 PM','AP-005'),('username6','Lily Carter','lily.carter@gmail.com','10/02/2024','2:00 PM','AP-006'),('username7','Mason Brooks','mason.brooks@gmail.com','10/02/2024','3:00 PM','AP-007'),('username8','Ava Sullivan','ava.sullivan@gmail.com','10/02/2024','4:00 PM','AP-008'),('username9','Liam Turner','liam.turner@gmail.com','10/03/2024','1:00 PM','AP-009');
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
  `AppointmentID` varchar(45) NOT NULL,
  PRIMARY KEY (`OrgID`,`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organized`
--

LOCK TABLES `organized` WRITE;
/*!40000 ALTER TABLE `organized` DISABLE KEYS */;
INSERT INTO `organized` VALUES ('408-262-2133','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','10/02/2024','1:00 PM','AP-005'),('408-262-2133','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','10/02/2024','3:00 PM','AP-007'),('408-262-2133','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','10/03/2024','1:00 PM','AP-009'),('408-262-2133','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','10/03/2024','2:00 PM','AP-010'),('408-337-2339','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','10/01/2024','2:00 PM','AP-002'),('408-337-2339','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','10/01/2024','4:00 PM','AP-004'),('408-337-2339','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','10/02/2024','2:00 PM','AP-006'),('408-794-7297','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','10/01/2024','1:00 PM','AP-001'),('408-794-7297','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','10/01/2024','3:00 PM','AP-003'),('408-794-7297','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','10/02/2024','4:00 PM','AP-008');
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
  `Age` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`OrgID`,`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
INSERT INTO `owns` VALUES ('408-262-2133','262-2133-001','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','Huck','3 Months, 1 Week','Dog & Puppies'),('408-262-2133','262-2133-002','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','Dewey','10 Weeks','Dog & Puppies'),('408-262-2133','262-2133-003','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','Delta','6 Months, 2 Weeks','Cat & Kittens'),('408-262-2133','262-2133-004','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','Kite','5 Months, 4 Weeks','Cat & Kittens'),('408-262-2133','262-2133-005','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','Sir Hopsalot','1 Year, 1 Month','Rabbits'),('408-262-2133','262-2133-006','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','Tawny','10 Weeks','Dog & Puppies'),('408-337-2339','337-2339-001','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','Galen','2 Years','Cat & Kittens'),('408-337-2339','337-2339-002','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','Dora','6 Months','Cat & Kittens'),('408-337-2339','337-2339-003','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','Gogo','1 Year','Cat & Kittens'),('408-337-2339','337-2339-004','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','Benedict','7 Years, 7 Months','Cat & Kittens'),('408-337-2339','337-2339-005','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','Foggy','6 Months','Cat & Kittens'),('408-337-2339','337-2339-006','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','Mercury','2 Years, 9 Months','Cat & Kittens'),('408-794-7297','794-7297-001','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','Maui','7 Years','Dog & Puppies'),('408-794-7297','794-7297-002','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','Kylo','7 Years','Dog & Puppies'),('408-794-7297','794-7297-003','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','Karma','8 Years','Dog & Puppies'),('408-794-7297','794-7297-004','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','Tiny','4 Years','Cat & Kittens'),('408-794-7297','794-7297-005','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','Angelo','1 Year, 11 Months','Cat & Kittens'),('408-794-7297','794-7297-006','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','Emilio','2 Years, 1 Month','Cat & Kittens');
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
INSERT INTO `pet organization` VALUES ('408-262-2133','901 Ames Ave. Milpitas, CA 95035','Humane Society Silicon Valley','adoptions@hssv.org'),('408-337-2339','702 East Julian Street, San Jose, CA, 95112','The Dancing Cat','info@thedancingcat.org'),('408-794-7297','2750 Monterey Road, San Jose, CA 95111','San Jose Animal Care Center','AdoptAPetSJ@sanjoseca.gov');
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
  `Age` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES ('262-2133-001','Huck','3 Months, 1 Week','Dog & Puppies'),('262-2133-002','Dewey','10 Weeks','Dog & Puppies'),('262-2133-003','Delta','6 Months, 2 Weeks','Cat & Kittens'),('262-2133-004','Kite','5 Months, 4 Weeks','Cat & Kittens'),('262-2133-005','Sir Hopsalot','1 Year, 1 Month','Rabbits'),('262-2133-006','Tawny','10 Weeks','Dog & Puppies'),('337-2339-001','Galen','2 Years','Cat & Kittens'),('337-2339-002','Dora','6 Months','Cat & Kittens'),('337-2339-003','Gogo','1 Year','Cat & Kittens'),('337-2339-004','Benedict','7 Years, 7 Months','Cat & Kittens'),('337-2339-005','Foggy','6 Months','Cat & Kittens'),('337-2339-006','Mercury','2 Years, 9 Months','Cat & Kittens'),('794-7297-001','Maui','7 Years','Dog & Puppies'),('794-7297-002','Kylo','7 Years','Dog & Puppies'),('794-7297-003','Karma','8 Years','Dog & Puppies'),('794-7297-004','Tiny','4 Years','Cat & Kittens'),('794-7297-005','Angelo','1 Year, 11 Months','Cat & Kittens'),('794-7297-006','Emilio','2 Years, 1 Month','Cat & Kittens');
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
INSERT INTO `submits` VALUES ('A01','username1','Oliver Grant','oliver.grant@gmail.com'),('A010','username10','Grace Mitchell','grace.mitchell@gmail.com'),('A02','username2','Amelia Collins','amelia.collins@gmail.com'),('A03','username3','Ethan Reed','ethan.reed@gmail.com'),('A04','username4','Sophia Bennett','sophia.bennett@gmail.com'),('A05','username5','Jackson Hayes','jackson.hayes@gmail.com'),('A06','username6','Lily Carter','lily.carter@gmail.com'),('A07','username7','Mason Brooks','mason.brooks@gmail.com'),('A08','username8','Ava Sullivan','ava.sullivan@gmail.com'),('A09','username9','Liam Turner','liam.turner@gmail.com');
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
  `UsrName` varchar(50) NOT NULL,
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

-- Dump completed on 2024-09-29 18:49:00
