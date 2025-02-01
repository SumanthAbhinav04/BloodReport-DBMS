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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AppointmentID` int NOT NULL,
  `AppointmentDate` datetime NOT NULL,
  `Purpose` varchar(45) NOT NULL,
  `PID` int NOT NULL,
  `DoctID` int NOT NULL,
  PRIMARY KEY (`AppointmentID`,`PID`,`DoctID`),
  KEY `fk_app_patient_idx` (`PID`),
  KEY `fk_app_doc_idx` (`DoctID`),
  CONSTRAINT `fk_app_patient` FOREIGN KEY (`PID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `kf_app_doc` FOREIGN KEY (`DoctID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (151,'2024-12-03 10:30:00','Appointment',1001,101),(151,'2024-12-03 16:00:00','Treatment',1002,101),(152,'2024-12-10 10:00:00','Followup',1003,102),(152,'2024-12-14 17:30:00','Appointment',1005,102),(153,'2024-12-14 10:00:00','Appointment',1004,103),(154,'2024-12-16 16:00:00','Appointment',1004,104),(154,'2024-12-17 12:00:00','Appointment',1006,104),(155,'2024-12-17 18:00:00','Appointment',1007,105),(155,'2024-12-19 10:00:00','Appointment',1009,105),(156,'2024-12-18 10:00:00','Followup',1006,106),(158,'2024-12-18 15:00:00','Appointment',1009,108),(159,'2024-12-20 14:00:00','Appointment',1008,109),(160,'2024-12-21 18:00:00','Followup',1010,110);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_appointment_conflict` BEFORE INSERT ON `appointment` FOR EACH ROW BEGIN
    DECLARE conflict_count INT;

    -- Check if there's a conflict with any existing appointment
    SELECT COUNT(*) INTO conflict_count
    FROM Appointment
    WHERE AppointmentDate = NEW.AppointmentDate
      AND DoctID = NEW.DoctID;

    IF conflict_count > 0 THEN
        -- Raise an error if there's a conflict
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Not Available';
    END IF;
    -- No ELSE clause needed; if no conflict, insertion will proceed normally
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 21:18:52
