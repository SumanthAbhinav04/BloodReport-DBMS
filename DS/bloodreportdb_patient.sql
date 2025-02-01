-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bloodreportdb
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` int NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `DOB` date NOT NULL,
  `BloodType` varchar(45) NOT NULL,
  `PresentStatus` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `AssocDoctorID` int NOT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `fk_patient_Assdoc_idx` (`AssocDoctorID`),
  CONSTRAINT `fk_patient_Assdoc` FOREIGN KEY (`AssocDoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1001,'Virat','Kohli','M',35,'1989-12-07','O-positive','Waiting for Appointment','vk18@gmail.com','Begumpet',101),(1002,'Chris','Gayle','M',47,'1977-08-23','B-positive','Admitted','boss@gmail.com','Khairtabad',101),(1003,'Marie','Smith','F',55,'1969-07-21','AB-negative','Waiting for follow up','maries@gmail.com','Jubliee Hills',102),(1004,'Axar','Patel','M',40,'1984-11-05','B-negative','Waiting for Appointment','AxarP@gmail.com','Uppal',103),(1005,'Zareen','Khan','F',65,'1959-01-01','A-positive','Waiting for Appointment','ZarKh@gmiail.com','Kachiguda',102),(1006,'Jake','Neel','M',85,'1939-07-22','O-negative','Waiting for follow up','Jake@gmail.com','Hi-Tech City',106),(1007,'John','Carter','M',28,'1996-09-08','B-positive','Waiting for Appointment','JOhn@gmail.com','Shamirpet',105),(1008,'Ram','Charan','M',40,'1984-10-19','A-negative','Admitted','Ram@gmail.com','Alwal',109),(1009,'Priya','Singh','F',56,'1968-02-02','A-positive','Waiting for Appointment','Priya@gmail.com','Secundrabad',108),(1010,'Amjad','Khan','M',76,'1948-09-10','B-negative','Waiting for follow up','mjad@gmail.com','Balapur',110);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 21:18:54
