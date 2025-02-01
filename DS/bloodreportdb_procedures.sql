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
-- Dumping events for database 'bloodreportdb'
--

--
-- Dumping routines for database 'bloodreportdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `CheckHealthRanges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckHealthRanges`(
    IN input_haemoglobin FLOAT,
    IN input_WBCCount FLOAT,
    IN input_plateletCount FLOAT,
    IN input_cholesterol FLOAT,
    IN input_bloodSugar FLOAT
)
BEGIN
    DECLARE min_val FLOAT;
    DECLARE max_val FLOAT;

    -- Create a temporary table to store results
    CREATE TEMPORARY TABLE IF NOT EXISTS HealthCheckResults (
        TestName VARCHAR(50),
        Status VARCHAR(50),
        NormalRange VARCHAR(50)
    );

    -- Check Haemoglobin
SELECT Minimum, Maximum INTO min_val, max_val FROM Test WHERE TestName = 'Hemoglobin';
    IF input_haemoglobin IS NULL THEN
        INSERT INTO HealthCheckResults VALUES ('Hemoglobin', 'Incomplete Info',CONCAT(min_val, '-', max_val) );
    ELSE
        
        IF input_haemoglobin BETWEEN min_val AND max_val THEN
            INSERT INTO HealthCheckResults VALUES ('Hemoglobin', 'Normal', CONCAT(min_val, '-', max_val));
        ELSE
            INSERT INTO HealthCheckResults VALUES ('Hemoglobin', 'Abnormal', CONCAT(min_val, '-', max_val));
        END IF;
    END IF;

    -- Check WBC Count
SELECT Minimum, Maximum INTO min_val, max_val FROM Test WHERE TestName = 'WBCCount';
    IF input_WBCCount IS NULL THEN
        INSERT INTO HealthCheckResults VALUES ('WBC Count', 'Incomplete Info',CONCAT(min_val, '-', max_val) );
    ELSE
        
        IF input_WBCCount BETWEEN min_val AND max_val THEN
            INSERT INTO HealthCheckResults VALUES ('WBC Count', 'Normal', CONCAT(min_val, '-', max_val));
        ELSE
            INSERT INTO HealthCheckResults VALUES ('WBC Count', 'Abnormal', CONCAT(min_val, '-', max_val));
        END IF;
    END IF;

    -- Check Platelet Count
SELECT Minimum, Maximum INTO min_val, max_val FROM Test WHERE TestName = 'Platelet';
    IF input_plateletCount IS NULL THEN
        INSERT INTO HealthCheckResults VALUES ('Platelet Count', 'Incomplete Info', CONCAT(min_val, '-', max_val));
    ELSE
        
        IF input_plateletCount BETWEEN min_val AND max_val THEN
            INSERT INTO HealthCheckResults VALUES ('Platelet Count', 'Normal', CONCAT(min_val, '-', max_val));
        ELSE
            INSERT INTO HealthCheckResults VALUES ('Platelet Count', 'Abnormal', CONCAT(min_val, '-', max_val));
        END IF;
    END IF;

    -- Check Cholesterol
SELECT Minimum, Maximum INTO min_val, max_val FROM Test WHERE TestName = 'Cholesterol';
    IF input_cholesterol IS NULL THEN
        INSERT INTO HealthCheckResults VALUES ('Cholesterol', 'Incomplete Info', CONCAT(min_val, '-', max_val));
    ELSE
        
        IF input_cholesterol BETWEEN min_val AND max_val THEN
            INSERT INTO HealthCheckResults VALUES ('Cholesterol', 'Normal', CONCAT(min_val, '-', max_val));
        ELSE
            INSERT INTO HealthCheckResults VALUES ('Cholesterol', 'Abnormal', CONCAT(min_val, '-', max_val));
        END IF;
    END IF;

    -- Check Blood Sugar Level
SELECT Minimum, Maximum INTO min_val, max_val FROM Test WHERE TestName = 'Blood Sugar';
    IF input_bloodSugar IS NULL THEN
        INSERT INTO HealthCheckResults VALUES ('Blood Sugar Level', 'Incomplete Info',CONCAT(min_val, '-', max_val) );
    ELSE
        
        IF input_bloodSugar BETWEEN min_val AND max_val THEN
            INSERT INTO HealthCheckResults VALUES ('Blood Sugar Level', 'Normal', CONCAT(min_val, '-', max_val));
        ELSE
            INSERT INTO HealthCheckResults VALUES ('Blood Sugar Level', 'Abnormal', CONCAT(min_val, '-', max_val));
        END IF;
    END IF;

    -- Display the results
    SELECT * FROM HealthCheckResults;
    
     -- Clean up: Drop the temporary table
    DROP TEMPORARY TABLE HealthCheckResults;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAppointmentDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentDetails`(
    IN p_patient_id INT
    
    
)
BEGIN
    SELECT D.DName AS DoctorName,
           D.Specialization AS DoctorSpecialization,
           A.AppointmentDate AS AppointmentDate
           
	FROM Doctor D
    JOIN Appointment A ON D.DoctorID = A.DoctID
    WHERE A.PID = p_patient_id;
      
       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLabsByTests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLabsByTests`(IN test_ids TEXT)
BEGIN
    -- Create a temporary table to hold the result
    CREATE TEMPORARY TABLE IF NOT EXISTS LabResults (
        LabID INT,
        LabName VARCHAR(255)
    );

    -- Insert matching labs into the temporary table
    INSERT INTO LabResults (LabID, LabName)
    SELECT Lab.LabID, Lab.LabName
    FROM Lab
    JOIN conducts ON Lab.LabID = conducts.LID
    WHERE FIND_IN_SET(conducts.TID, test_ids) > 0
    GROUP BY Lab.LabID, Lab.LabName
    HAVING COUNT(DISTINCT conducts.TID) = (SELECT COUNT(*) FROM (SELECT DISTINCT TID FROM conducts WHERE FIND_IN_SET(TID, test_ids) > 0) AS subquery);

    -- Return the results
    SELECT * FROM LabResults;
    
     -- Clean up: Drop the temporary table
    DROP TEMPORARY TABLE LabResults;


END ;;
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

-- Dump completed on 2024-11-14 21:18:54
