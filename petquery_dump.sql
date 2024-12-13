-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: petquery
-- ------------------------------------------------------
-- Server version	8.0.39

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
  `UserID` varchar(45) NOT NULL,
  `PetID` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`,`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopts`
--

LOCK TABLES `adopts` WRITE;
/*!40000 ALTER TABLE `adopts` DISABLE KEYS */;
INSERT INTO `adopts` VALUES ('ameliac','1'),('ameliac','12'),('avas','13'),('avas','2'),('ethanr','3'),('gracem','15'),('jacksonh','16'),('jacksonh','5'),('liamt','6'),('lilyc','18'),('masonb','19'),('masonb','8'),('oliverg','9'),('sophiab','10'),('user','20');
/*!40000 ALTER TABLE `adopts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `ApplicationID` varchar(45) NOT NULL,
  `AppStatus` int NOT NULL,
  PRIMARY KEY (`ApplicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES ('A01',2),('A02',2),('A03',2),('A04',1),('A05',2),('A06',2),('A07',0),('A08',2),('A09',2),('A10',2),('A11',0),('A12',2),('A13',2),('A14',0),('A15',2),('A16',2),('A17',1),('A18',2),('A19',2),('A20',2);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  UNIQUE KEY `AppointmentID_UNIQUE` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES ('AP-001','2024-12-13','11:00'),('AP-002','2024-12-14','12:00'),('AP-003','2024-12-15','13:00'),('AP-004','2024-12-16','14:00'),('AP-005','2024-12-17','15:00'),('AP-006','2024-12-18','16:00'),('AP-007','2024-12-19','11:00'),('AP-008','2024-12-20','12:00'),('AP-009','2024-12-21','13:00'),('AP-010','2024-12-22','14:00'),('AP-011','2024-12-23','15:00'),('AP-012','2024-12-26','16:00'),('AP-013','2024-12-27','11:00'),('AP-014','2024-12-28','12:00'),('AP-015','2024-12-29','13:00');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates`
--

DROP TABLE IF EXISTS `creates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creates` (
  `UserID` varchar(45) NOT NULL,
  `AppointmentID` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`,`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates`
--

LOCK TABLES `creates` WRITE;
/*!40000 ALTER TABLE `creates` DISABLE KEYS */;
INSERT INTO `creates` VALUES ('ameliac','AP-001'),('ameliac','AP-012'),('avas','AP-002'),('ethanr','AP-003'),('ethanr','AP-013'),('gracem','AP-004'),('jacksonh','AP-005'),('jacksonh','AP-014'),('liamt','AP-006'),('lilyc','AP-007'),('masonb','AP-008'),('oliverg','AP-009'),('sophiab','AP-010'),('user','AP-011'),('user','AP-015');
/*!40000 ALTER TABLE `creates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizes`
--

DROP TABLE IF EXISTS `organizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizes` (
  `OrgID` varchar(45) NOT NULL,
  `AppointmentID` varchar(45) NOT NULL,
  PRIMARY KEY (`OrgID`,`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizes`
--

LOCK TABLES `organizes` WRITE;
/*!40000 ALTER TABLE `organizes` DISABLE KEYS */;
INSERT INTO `organizes` VALUES ('209-365-0535','AP-002'),('209-365-0535','AP-003'),('209-831-6364','AP-004'),('209-831-6364','AP-005'),('209-937-7445','AP-006'),('209-937-7445','AP-007'),('408-262-2133','AP-008'),('408-262-2133','AP-009'),('408-337-2339','AP-010'),('408-794-7297','AP-011'),('408-794-7297','AP-012'),('510-621-3493','AP-013'),('510-621-3493','AP-014'),('510-900-2275','AP-015'),('925-608-8400','AP-001');
/*!40000 ALTER TABLE `organizes` ENABLE KEYS */;
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
  PRIMARY KEY (`OrgID`,`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
INSERT INTO `owns` VALUES ('209-365-0535','2'),('209-365-0535','3'),('209-831-6364','21'),('209-831-6364','25'),('209-831-6364','4'),('209-831-6364','5'),('209-937-7445','6'),('209-937-7445','7'),('408-262-2133','22'),('408-262-2133','26'),('408-262-2133','8'),('408-262-2133','9'),('408-337-2339','10'),('408-337-2339','20'),('408-794-7297','11'),('408-794-7297','12'),('510-621-3493','13'),('510-621-3493','14'),('510-621-3493','23'),('510-900-2275','15'),('510-900-2275','16'),('530-668-5287','17'),('530-668-5287','18'),('530-668-5287','24'),('925-608-8400','1'),('925-608-8400','19'),('925-608-8400','27');
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petorganizations`
--

DROP TABLE IF EXISTS `petorganizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petorganizations` (
  `OrgID` varchar(45) NOT NULL,
  `OrgName` varchar(45) NOT NULL,
  `OrgEmail` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Url` varchar(180) NOT NULL,
  PRIMARY KEY (`OrgID`),
  UNIQUE KEY `OrgID_UNIQUE` (`OrgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petorganizations`
--

LOCK TABLES `petorganizations` WRITE;
/*!40000 ALTER TABLE `petorganizations` DISABLE KEYS */;
INSERT INTO `petorganizations` VALUES ('209-365-0535','Animal Friends Connection Humane Society','office@animalfriendsconnect.org','933 S. Cherokee Lane, Lodi, CA 95240','https://animalfriendsconnect.org/'),('209-604-2649','ASTRO Foundation','info@astrofoundation.org','157 N. Fifth Street, Oakdale, CA 95361','http://astrofoundation.org/'),('209-831-6364','City of Tracy Animal Services','animalservices@tracypd.com','2375 Paradise Ave., Tracy, CA 95304','https://tracypd.com/bureau-of-support-services/animal-services'),('209-937-7445','City of Stockton Animal Shelter','animalservices@stocktonca.gov','1575 S. Lincoln Street, Stockton, CA 95206','https://www.stocktonca.gov/services/animal_services/adoptions.php'),('408-262-2133','Humane Society Silicon Valley','adoptions@hssv.org','901 Ames Ave. Milpitas, CA 95035','https://www.hssv.org/'),('408-337-2339','The Dancing Cat','info@thedancingcat.org','702 East Julian Street, San Jose, CA, 95112','https://www.thedancingcat.org/'),('408-794-7297','San Jose Animal Care Center','adoptapetsj@sanjoseca.gov','2750 Monterey Road, San Jose, CA 95111','https://www.sanjoseca.gov/your-government/departments-offices/animal-care-services'),('510-337-8565','Friends of the Alameda Animal Shelter','cthornton@alamedaanimalshelter.org','1590 Fortmann Way, Alameda, CA 94501','http://www.alamedaanimalshelter.org/'),('510-621-3493','Jelly\'s Place','adopt@jellysplace.org','2905 San Pablo Dam Road, San Pablo, CA 94803','https://jellysplace.org/'),('510-900-2275','Milo Foundation','info@milofoundation.org','220 S Garrard Blvd, Pt. Richmond, CA 94801','https://www.milofoundation.org/'),('530-668-5287','Yolo County Animal Services','adoptycas@gmail.com','140C Tony Diaz Drive, Woodland, CA 95776','https://www.yolocounty.gov/government/general-government-departments/community-services/animal-services'),('831-239-7119','The Rabbit Haven','ava_haven@comcast.net','PO Box 66594, Scotts Valley, CA 95067','http://www.therabbithaven.org/'),('831-333-0722','Animal Friends Rescue Project','info@animalfriendsrescue.org','161 Fountain Ave\nPacific Grove, CA 93950','http://www.animalfriendsrescue.org/'),('831-373-2631','The SPCA for Monterey County','bbrookhouser@spcamc.org','1002 Highway 68, Monterey, CA 93942','http://www.spcamc.org/'),('925-608-8400','Contra Costa Animal Services Martinez','asdweb@asd.cccounty.us','4800 Imhoff Place, Martinez, CA 94553','https://www.contracosta.ca.gov/9974/Animal-Services'),('925-829-9098','Feral Cat Foundation','feralhelp@feralcatfoundation.org','PO Box 1173, Alamo, CA 94507','http://feralcatfoundation.org/');
/*!40000 ALTER TABLE `petorganizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `PetID` varchar(45) NOT NULL,
  `PetName` varchar(45) NOT NULL,
  `Age` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PetID`),
  UNIQUE KEY `PetID_UNIQUE` (`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES ('1','Chubbs','1 Year','Dogs & Puppies','images/Chubbs.jpg'),('10','Norris','2 years','Rabbits & Bunnies','images/Norris.png'),('11','Lewis','2 years','Rabbits & Bunnies','images/Lewis.png'),('12','Galen','2 Years','Cats & Kittens','images/Galen.png'),('13','Dora','6 Months','Cats & Kittens','images/Dora.png'),('14','Gogo','1 Year','Cats & Kittens','images/Gogo.png'),('15','Benedict','7 Years, 7 Months','Cats & Kittens','images/Benedict.png'),('16','Foggy','6 Months','Cats & Kittens','images/Foggy.png'),('17','Mercury','2 Years, 9 Months','Cats & Kittens','images/Mercury.png'),('18','Maui','7 Years','Dogs & Puppies','images/Maui.png'),('19','Kylo','7 Years','Dogs & Puppies','images/Kylo.png'),('2','Max','1 Year','Dogs & Puppies','images/puppy.jpg'),('20','Karma','8 Years','Dogs & Puppies','images/Karma.png'),('21','Tiny','4 Years','Cats & Kittens','images/Tiny.png'),('22','Angelo','1 Year, 11 Months','Cats & Kittens','images/Angelo.png'),('23','Emilio','2 Years, 1 Month','Cats & Kittens','images/Emilio.png'),('24','Riceball','3 years','Rabbits & Bunnies','images/bunny.jpg'),('25','Kevin','2 Years','Dogs & Puppies','images/puppy.jpg'),('26','Potato','2 Years','Dogs & Puppies','images/Potato.jpg'),('27','Bunbun','2 Years','Rabbits & Bunnies','images/bunny.jpg'),('3','Huck','3 Months, 1 Week','Dogs & Puppies','images/Huck.png'),('4','Dewey','10 Weeks','Dogs & Puppies','images/Dewey.png'),('5','Delta','6 Months, 2 Weeks','Cats & Kittens','images/Delta.png'),('6','Kite','5 Months, 4 Weeks','Cats & Kittens','images/Kite.png'),('7','Sir Hopsalot','1 Year, 1 Month','Rabbits & Bunnies','images/Hopsalot.png'),('8','Tawny','10 Weeks','Dogs & Puppies','images/Tawny.png'),('9','Hamilton','3 years','Rabbits & Bunnies','images/Hamilton.png');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submits`
--

DROP TABLE IF EXISTS `submits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submits` (
  `ApplicationID` varchar(45) NOT NULL,
  `UserID` varchar(45) NOT NULL,
  `PetID` varchar(45) NOT NULL,
  PRIMARY KEY (`ApplicationID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submits`
--

LOCK TABLES `submits` WRITE;
/*!40000 ALTER TABLE `submits` DISABLE KEYS */;
INSERT INTO `submits` VALUES ('A01','ameliac','1'),('A02','avas','2'),('A03','ethanr','3'),('A04','gracem','4'),('A05','jacksonh','5'),('A06','liamt','6'),('A07','lilyc','7'),('A08','masonb','8'),('A09','oliverg','9'),('A10','sophiab','10'),('A11','user','11'),('A12','ameliac','12'),('A13','avas','13'),('A14','ethanr','14'),('A15','gracem','15'),('A16','jacksonh','16'),('A17','liamt','17'),('A18','lilyc','18'),('A19','masonb','19'),('A20','user','20');
/*!40000 ALTER TABLE `submits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` varchar(50) NOT NULL,
  `UserEmail` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `AccountType` int NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UsrEmail_UNIQUE` (`UserEmail`),
  UNIQUE KEY `Username_UNIQUE` (`UserID`),
  CONSTRAINT `users_chk_1` CHECK ((`AccountType` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin@petquery.com','admin','password',1),('ameliac','amelia.collins@gmail.com','Amelia Collins','Password2',0),('avas','ava.sullivan@gmail.com','Ava Sullivan','Password8',0),('bobs','bob.smith@gmail.com','Bob Smith','Password13',1),('ethanr','ethan.reed@gmail.com','Ethan Reed','Password3',0),('gracem','grace.mitchell@gmail.com','Grace Mitchell','Password10',0),('jacksonh','jackson.hayes@gmail.com','Jackson Hayes','Password5',0),('janed','jane.doe@gmail.com','Jane Doe','Password 12',1),('johnd','john.doe@gmail.com','John Doe','Password11',1),('liamt','liam.turner@gmail.com','Liam Turner','Password9',0),('lilyc','lily.carter@gmail.com','Lily Carter','Password6',0),('masonb','mason.brooks@gmail.com','Mason Brooks','Password7',0),('oliverg','oliver.grant@gmail.com','Oliver Grant','Password1',0),('sophiab','sophia.bennett@gmail.com','Sophia Bennett','Password4',1),('user','user@email.com','name','password',0);
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

-- Dump completed on 2024-12-12 18:04:12
