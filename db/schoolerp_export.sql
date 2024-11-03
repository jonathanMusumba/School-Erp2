-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: schoolerp
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  `ShortName` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(255) NOT NULL,
  `SchoolId` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ShortName` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `SchoolId` (`SchoolId`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`SchoolId`) REFERENCES `schools` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Senior One',3,'2024-11-03 10:11:23','2024-11-03 10:11:23','S.1'),(2,'Senior Two',3,'2024-11-03 10:11:23','2024-11-03 10:11:23','S.2'),(3,'Senior Three',3,'2024-11-03 10:11:23','2024-11-03 10:11:23','S.3'),(4,'Senior Four',3,'2024-11-03 10:11:23','2024-11-03 10:11:23','S.4'),(5,'Senior Five',3,'2024-11-03 10:11:23','2024-11-03 10:11:23','S.5'),(6,'Senior Six',3,'2024-11-03 10:11:23','2024-11-03 10:11:23','S.6');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Kampala'),(2,'Luuka');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `houses` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `HouseName` varchar(255) NOT NULL,
  `SchoolId` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `SchoolId` (`SchoolId`),
  CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`SchoolId`) REFERENCES `schools` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `LevelName` varchar(50) NOT NULL,
  `ShortName` varchar(10) DEFAULT NULL,
  `Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `LevelName` (`LevelName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Primary','Pri','2024-11-02 17:30:35'),(2,'Secondary','Sec','2024-11-02 17:34:05');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schools` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `District_Id` int NOT NULL,
  `LocalAddress` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `SchoolCode` varchar(50) NOT NULL,
  `ExamCenterNumber` varchar(50) NOT NULL,
  `ThemeColor` varchar(50) NOT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `HeadTeacher` varchar(255) NOT NULL,
  `Motto` varchar(255) NOT NULL,
  `Logo` varchar(255) DEFAULT NULL,
  `Level_Id` int NOT NULL,
  `Status` enum('Active','Not Active') NOT NULL DEFAULT 'Active',
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `District_Id` (`District_Id`),
  KEY `fk_level` (`Level_Id`),
  CONSTRAINT `fk_level` FOREIGN KEY (`Level_Id`) REFERENCES `levels` (`id`),
  CONSTRAINT `schools_ibfk_2` FOREIGN KEY (`District_Id`) REFERENCES `districts` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (3,'NILE HIGH SCHOOL','jmprossy@gmail.com',2,'236 Iganga','0787842061','50001','U2173','Green','https://www.nhs.ac.ug','Musumba Jonathan','For Education we treasure','',2,'Active','2024-11-02 18:28:12','2024-11-02 18:28:12');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streams` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StreamName` varchar(255) NOT NULL,
  `ClassId` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `streams_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams`
--

LOCK TABLES `streams` WRITE;
/*!40000 ALTER TABLE `streams` DISABLE KEYS */;
/*!40000 ALTER TABLE `streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SchoolId` int NOT NULL,
  `Surname` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `DateOfBirth` date NOT NULL,
  `YearOfJoining` date NOT NULL,
  `Type` enum('Day','Boarding') NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `FormerSchool` varchar(255) DEFAULT NULL,
  `GradeAtJoining` varchar(50) DEFAULT NULL,
  `ClassId` int NOT NULL,
  `StreamId` int NOT NULL,
  `StudentPicture` varchar(255) DEFAULT NULL,
  `HouseId` int DEFAULT NULL,
  `ParentName` varchar(255) DEFAULT NULL,
  `ParentPhoneNumber` varchar(15) DEFAULT NULL,
  `NIN` varchar(50) DEFAULT NULL,
  `InternalNumber` varchar(50) DEFAULT NULL,
  `Religion` varchar(50) DEFAULT NULL,
  `SchoolpayNumber` varchar(50) DEFAULT NULL,
  `StudentNumberLIN` varchar(50) DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `SchoolId` (`SchoolId`),
  KEY `ClassId` (`ClassId`),
  KEY `StreamId` (`StreamId`),
  KEY `HouseId` (`HouseId`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`SchoolId`) REFERENCES `schools` (`Id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`Id`),
  CONSTRAINT `students_ibfk_3` FOREIGN KEY (`StreamId`) REFERENCES `streams` (`Id`),
  CONSTRAINT `students_ibfk_4` FOREIGN KEY (`HouseId`) REFERENCES `houses` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(255) NOT NULL,
  `ClassId` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SchoolId` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('Director','Headteacher','Class Teacher','Director of Studies','Bursar','Secretary') NOT NULL,
  `RoleShort` varchar(50) NOT NULL,
  `LoginCode` varchar(50) NOT NULL,
  `Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `LoggedIn` tinyint NOT NULL DEFAULT '0',
  `LastLogin` datetime DEFAULT NULL,
  `Attempts` int NOT NULL DEFAULT '0',
  `Locked` tinyint NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `SchoolId` (`SchoolId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`SchoolId`) REFERENCES `schools` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,3,'Jonathan Musumba','jonathan@system','jmprossy@gmail.com','0787842061','9cc3e5abdfaee198a6b74b97ea91e306e1744ddf49876d3dcf6cb936dfd5c9d7','Director','DIR','DIR1.50001','Active',1,NULL,0,0,'2024-11-03 11:58:47','2024-11-03 13:08:15'),(2,3,'KINTU ALEX','alex@system','alex@gmail.com','0777978697','9cc3e5abdfaee198a6b74b97ea91e306e1744ddf49876d3dcf6cb936dfd5c9d7','Headteacher','HM','HM1.50001','Active',1,NULL,0,0,'2024-11-03 11:58:47','2024-11-03 13:22:33'),(4,3,'KINTU ALEX','alex2@system','alex2@gmail.com','0777978697','9cc3e5abdfaee198a6b74b97ea91e306e1744ddf49876d3dcf6cb936dfd5c9d7','Bursar','BUR','BUR1.50001','Active',0,NULL,0,0,'2024-11-03 11:58:47','2024-11-03 13:21:27'),(5,3,'KAAKO MICHEAL','micheal@system','micheal@gmail.com','0787842061','9cc3e5abdfaee198a6b74b97ea91e306e1744ddf49876d3dcf6cb936dfd5c9d7','Secretary','SEC','SEC1.50001','Active',0,NULL,0,0,'2024-11-03 11:58:47','2024-11-03 13:20:11');
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

-- Dump completed on 2024-11-03 13:38:43
