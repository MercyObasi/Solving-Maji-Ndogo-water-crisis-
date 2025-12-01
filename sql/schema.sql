DROP DATABASE IF EXISTS `md_water_services`;
CREATE DATABASE IF NOT EXISTS `md_water_services` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `md_water_services`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: md_water_services
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `data_dictionary`
--

DROP TABLE IF EXISTS `data_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_dictionary` (
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `description` text,
  `datatype` varchar(50) DEFAULT NULL,
  `related_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `assigned_employee_id` int NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  `town_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`assigned_employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `global_water_access`
--

DROP TABLE IF EXISTS `global_water_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_water_access` (
  `name` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `pop_n` float DEFAULT NULL,
  `pop_u` float DEFAULT NULL,
  `wat_bas_n` float DEFAULT NULL,
  `wat_lim_n` float DEFAULT NULL,
  `wat_unimp_n` float DEFAULT NULL,
  `wat_sur_n` float DEFAULT NULL,
  `wat_bas_r` float DEFAULT NULL,
  `wat_lim_r` float DEFAULT NULL,
  `wat_unimp_r` float DEFAULT NULL,
  `wat_sur_r` float DEFAULT NULL,
  `wat_bas_u` float DEFAULT NULL,
  `wat_lim_u` float DEFAULT NULL,
  `wat_unimp_u` float DEFAULT NULL,
  `wat_sur_u` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  `town_name` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `record_id` int NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `source_id` varchar(510) DEFAULT NULL,
  `time_of_record` datetime DEFAULT NULL,
  `visit_count` int DEFAULT NULL,
  `time_in_queue` int DEFAULT NULL,
  `assigned_employee_id` int DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `location_id` (`location_id`),
  KEY `source_id` (`source_id`),
  KEY `assigned_employee_id` (`assigned_employee_id`),
  CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `water_source` (`source_id`),
  CONSTRAINT `visits_ibfk_3` FOREIGN KEY (`assigned_employee_id`) REFERENCES `employee` (`assigned_employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `water_quality`
--

DROP TABLE IF EXISTS `water_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `water_quality` (
  `record_id` int NOT NULL,
  `subjective_quality_score` int DEFAULT NULL,
  `visit_count` int DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  CONSTRAINT `water_quality_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `visits` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `water_source`
--

DROP TABLE IF EXISTS `water_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `water_source` (
  `source_id` varchar(510) NOT NULL,
  `type_of_water_source` varchar(255) DEFAULT NULL,
  `number_of_people_served` int DEFAULT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `well_pollution`
--

DROP TABLE IF EXISTS `well_pollution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `well_pollution` (
  `source_id` varchar(258) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pollutant_ppm` float DEFAULT NULL,
  `biological` float DEFAULT NULL,
  `results` varchar(255) DEFAULT NULL,
  KEY `source_id` (`source_id`),
  CONSTRAINT `well_pollution_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `water_source` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

