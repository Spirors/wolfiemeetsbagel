-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wolfiemeetsbagel
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `OwnerSSN` char(11) NOT NULL,
  `CardNumber` char(16) NOT NULL,
  `AcctNum` char(30) NOT NULL,
  `AcctCreateDate` date DEFAULT NULL,
  PRIMARY KEY (`OwnerSSN`,`CardNumber`,`AcctNum`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`OwnerSSN`) REFERENCES `user` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('555-55-5555','5186330464994532','12345',NULL),('666-66-6666','5192383525185287','34567',NULL),('777-77-7777','5144751168293870','45678',NULL),('888-88-8888','5167593514262698','56789',NULL),('999-99-9999','4482704287348312','67891',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blinddate`
--

DROP TABLE IF EXISTS `blinddate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blinddate` (
  `ProfileA` char(20) NOT NULL,
  `ProfileB` char(20) NOT NULL,
  `ProfileC` char(20) NOT NULL,
  `Date_Time` datetime NOT NULL,
  PRIMARY KEY (`ProfileA`,`ProfileB`,`ProfileC`,`Date_Time`),
  KEY `ProfileB` (`ProfileB`),
  KEY `ProfileC` (`ProfileC`),
  CONSTRAINT `blinddate_ibfk_1` FOREIGN KEY (`ProfileA`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `blinddate_ibfk_2` FOREIGN KEY (`ProfileB`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `blinddate_ibfk_3` FOREIGN KEY (`ProfileC`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blinddate`
--

LOCK TABLES `blinddate` WRITE;
/*!40000 ALTER TABLE `blinddate` DISABLE KEYS */;
INSERT INTO `blinddate` VALUES ('Isabelle2014','Fletcher2013','VazquezFromAlajuela','2014-10-07 09:56:08'),('DesiraeBerg','VazquezFromAlajuela','Fletcher_Trujillo','2014-10-04 13:59:20');
/*!40000 ALTER TABLE `blinddate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date` (
  `DateID` int NOT NULL AUTO_INCREMENT,
  `Profile1` char(20) NOT NULL,
  `Profile2` char(20) NOT NULL,
  `CustRep` char(11) DEFAULT NULL,
  `Date_Time` datetime NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `BookingFee` int DEFAULT NULL,
  `Comments` text,
  `User1Rating` int DEFAULT NULL,
  `User2Rating` int DEFAULT NULL,
  PRIMARY KEY (`DateID`),
  KEY `date_ibfk_1` (`Profile1`),
  KEY `date_ibfk_2` (`Profile2`),
  KEY `date_ibfk_3` (`CustRep`),
  CONSTRAINT `date_ibfk_1` FOREIGN KEY (`Profile1`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `date_ibfk_2` FOREIGN KEY (`Profile2`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `date_ibfk_3` FOREIGN KEY (`CustRep`) REFERENCES `employee` (`SSN`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,'Brenna_Berlin','DesiraeBerg','333-33-3333','2014-10-06 12:21:06','The Mall',36,'Comments Here',2,3),(2,'Fletcher2013','VazquezFromAlajuela','333-33-3333','2014-10-06 04:30:52','Ruvos Restaurant',43,'Comments Here',3,1),(3,'Isabelle2013','DesiraeBerg','222-22-2222','2014-10-04 21:39:42','Port Jeff Cinema',65,'Comments Here',4,5),(4,'Isabelle2014','VazquezFromAlajuela','222-22-2222','2014-10-06 21:49:30','The Mall',91,'Comments Here',3,3),(5,'VazquezFromAlajuela','Brenna_Berlin','444-44-4444','2014-10-06 05:34:04','Turkish Restaurant',69,'Comments Here',4,4),(6,'Isabelle2014','Brenna_Berlin',NULL,'2021-10-06 00:00:00','The Mall',NULL,NULL,3,3),(7,'Brenna_Berlin','Isabelle2013','333-33-3333','2021-10-06 00:00:00','The Mall',20,'yeeeeet',2,5);
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `SSN` char(11) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `HourlyRate` float DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('111-11-1111','Manager','2014-10-04',250),('222-22-2222','CustRep','2014-10-04',150),('333-33-3333','CustRep','2014-10-04',100),('444-44-4444','CustRep','2014-10-04',75);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `Liker` char(20) NOT NULL,
  `Likee` char(20) NOT NULL,
  `Date_Time` datetime NOT NULL,
  PRIMARY KEY (`Liker`,`Likee`,`Date_Time`),
  KEY `Likee` (`Likee`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`Liker`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`Likee`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES ('VazquezFromAlajuela','Brenna_Berlin','2014-10-06 21:13:02'),('Brenna_Berlin','DesiraeBerg','2014-10-05 05:05:08'),('Brenna_Berlin','DesiraeBerg','2014-10-05 11:02:05'),('Isabelle2013','DesiraeBerg','2014-10-06 23:06:12'),('Isabelle2014','DesiraeBerg','2014-10-07 21:04:09'),('Fletcher2013','VazquezFromAlajuela','2014-10-06 03:46:48'),('Isabelle2013','VazquezFromAlajuela','2014-10-08 09:15:49'),('Isabelle2014','VazquezFromAlajuela','2014-10-06 05:28:39');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `SSN` char(11) NOT NULL,
  `Password` char(20) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zipcode` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('111-11-1111','111@11','Veronica','Alvarado','45 Rockefeller Plaza','New York','New York',10111,'Fusce@velitPellentesque.net','(612) 506-2244',NULL),('222-22-2222','222@22','Bo','Osborne','45 Rockefeller Plaza','New York','New York',10111,'mattis.Integer.eu@elit.org','(592) 765-8277',NULL),('333-33-3333','333@33','Hashim','Ross',' 350 5th Ave',' New York',' New York',10118,'vulputate@Curae.co.uk','(276) 634-6949',NULL),('444-44-4444','444@44','Shaine','Terrell','350 5th Ave','New York','New York',10118,'tincidunt.nibh@risus.com','(600) 803-9508',NULL),('555-55-5555','555@55','Isabelle','Odonnell','Schomburg Apartments, 350 Circle Road ','Stony Brook','New York',11790,'magna.tellus.faucibus@amet.edu','(934) 241-3862',NULL),('666-66-6666','666@66','Fletcher','Trujillo',' 700 Health Sciences Dr','Stony Brook','New York',11790,'elementum.dui.quis@utlacus.net','(990) 760-1480',NULL),('777-77-7777','777@77','Malachi','Vazquez','700 Health Sciences Dr','Stony Brook','New York',11790,'tellus.lorem.eu@atlacus.org','(226) 193-8257',NULL),('888-88-8888','888@88','Brenna','Cross','Schomburg Apartments, 350 Circle Road','Stony Brook','New York',11790,'sed.turpis@vehiculaaliquet.com','(968) 409-7641',NULL),('999-99-9999','999@99','Desirae','Berg',' 116th St & Broadway','New York','New York',10027,'vitae@magnased.com','(237) 321-3189',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `ProfileID` char(20) NOT NULL,
  `OwnerSSN` char(11) DEFAULT NULL,
  `DatingAgeRangeStart` int DEFAULT NULL,
  `DatingAgeRangeEnd` int DEFAULT NULL,
  `DatinGeoRange` int DEFAULT NULL,
  `M_F` varchar(10) DEFAULT NULL,
  `Hobbies` varchar(1000) DEFAULT NULL,
  `Height` int DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `HairColor` varchar(20) DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  `LastModDate` datetime NOT NULL,
  `Photo` char(50) DEFAULT NULL,
  `PhyChar` char(50) DEFAULT NULL,
  PRIMARY KEY (`ProfileID`),
  KEY `OwnerSSN` (`OwnerSSN`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`OwnerSSN`) REFERENCES `user` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('Brenna_Berlin','888-88-8888',19,21,8,'Female','Dance, Acting ',6,180,'Blonde','2014-10-04 20:20:55','2014-10-07 12:21:58',NULL,NULL),('DesiraeBerg','999-99-9999',17,25,5,'Male','Water sports, Football',6,200,'Red','2014-10-04 19:13:18','2014-10-04 15:54:48',NULL,NULL),('Fletcher_Trujillo','666-66-6666',19,30,8,'Female','Shopping, Volleyball',6,150,'Brown','2014-10-04 18:26:49','2014-10-05 00:42:03',NULL,NULL),('Fletcher2013','666-66-6666',20,28,18,'Female','Reading, Basketball',6,150,'Brown','2014-10-04 19:21:37','2014-10-07 01:25:55',NULL,NULL),('Isabelle2013','555-55-5555',20,22,29,'Female','Shopping, Dance, Mountain Claiming',6,120,'Black','2014-10-04 00:37:12','2014-10-04 17:08:38',NULL,NULL),('Isabelle2014','555-55-5555',20,25,5,'Female','Shopping, Cooking',6,110,'Black','2014-10-04 22:43:25','2014-10-09 11:51:19',NULL,NULL),('VazquezFromAlajuela','777-77-7777',20,28,15,'Male','Hunting, Running',6,170,'Black','2014-10-04 17:13:30','2014-10-07 04:16:43',NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `SSN` char(11) NOT NULL,
  `PPP` varchar(50) DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `DateOfLastAct` datetime DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('555-55-5555','Super-User',3,'2014-10-07 05:53:13'),('666-66-6666','Good-User',3,'2014-10-05 05:27:28'),('777-77-7777','Good-User',4,'2014-10-08 22:37:07'),('888-88-8888','User-User',3,'2014-10-04 09:10:12'),('999-99-9999','User-User',2,'2014-10-05 18:28:02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-06 19:21:50
