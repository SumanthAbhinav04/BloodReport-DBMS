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
-- Table structure for table `containstest`
--

DROP TABLE IF EXISTS `containstest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `containstest` (
  `Report_ID` int NOT NULL,
  `Test` int NOT NULL,
  PRIMARY KEY (`Report_ID`,`Test`),
  KEY `fk_testID_idx` (`Test`),
  CONSTRAINT `fk_reportID` FOREIGN KEY (`Report_ID`) REFERENCES `bloodreport` (`ReportID`),
  CONSTRAINT `fk_testID` FOREIGN KEY (`Test`) REFERENCES `test` (`TestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containstest`
--

LOCK TABLES `containstest` WRITE;
/*!40000 ALTER TABLE `containstest` DISABLE KEYS */;
INSERT INTO `containstest` VALUES (112,131),(113,131),(114,131),(115,131),(116,131),(117,131),(118,131),(119,131),(112,132),(113,132),(115,132),(118,132),(119,132),(120,132),(112,133),(113,133),(114,133),(115,133),(118,133),(119,133),(111,134),(112,134),(113,134),(114,134),(115,134),(116,134),(117,134),(118,134),(119,134),(111,135),(112,135),(113,135),(114,135),(115,135),(116,135),(117,135),(118,135),(119,135),(120,135);
/*!40000 ALTER TABLE `containstest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 21:18:52
