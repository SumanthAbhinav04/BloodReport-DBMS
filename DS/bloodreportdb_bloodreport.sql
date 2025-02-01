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
-- Table structure for table `bloodreport`
--

DROP TABLE IF EXISTS `bloodreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodreport` (
  `ReportID` int NOT NULL,
  `DateOfReport` date NOT NULL,
  `ReportStatus` varchar(45) NOT NULL,
  `Diagnosis` varchar(45) NOT NULL,
  `HaemoglobinLevel(g/dL)` int DEFAULT NULL,
  `WBCCount(cells/muL)` int DEFAULT NULL,
  `PlateletCount(/muL)` int DEFAULT NULL,
  `CholestrolLevel(mg/dL)` int DEFAULT NULL,
  `BloodSugarLevel(mg/dL)` int DEFAULT NULL,
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `fk_br_patient_idx` (`Patient_ID`),
  KEY `fk_br_doc_idx` (`Doctor_ID`),
  CONSTRAINT `fk_br_doc` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`DoctorID`),
  CONSTRAINT `fk_br_patient` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodreport`
--

LOCK TABLES `bloodreport` WRITE;
/*!40000 ALTER TABLE `bloodreport` DISABLE KEYS */;
INSERT INTO `bloodreport` VALUES (111,'2024-10-10','Not Reviewed','Not Completed',NULL,NULL,NULL,150,90,1001,101),(112,'2024-10-12','Reviewed','Completed',13,8000,100000,220,115,1002,101),(113,'2024-10-12','Reviewed','Not Completed',11,7500,175000,100,100,1003,102),(114,'2024-10-14','Not Reviewed','Not Completed',14,NULL,200000,540,120,1004,103),(115,'2024-10-18','Not Reviewed','Not Completed',9,5000,150000,200,220,1005,102),(116,'2024-10-19','Reviewd','Completed',10,NULL,NULL,270,225,1006,106),(117,'2024-10-20','Not Reviewed','Not Completed',17,NULL,NULL,180,95,1007,105),(118,'2024-10-24','Reviewed','Not Completed',16,5500,260000,170,100,1008,109),(119,'2024-10-16','Not Reviewed','Not Completed',12,7000,240000,120,110,1009,108),(120,'2024-10-29','Reviewed','Completed',NULL,12000,NULL,155,NULL,1010,110);
/*!40000 ALTER TABLE `bloodreport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 21:18:53
