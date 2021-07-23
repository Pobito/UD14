CREATE DATABASE  IF NOT EXISTS `directores` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `directores`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 192.168.1.175    Database: directores
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
-- Table structure for table `Despachos`
--

DROP TABLE IF EXISTS `Despachos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Despachos` (
  `numero` int NOT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Despachos`
--

LOCK TABLES `Despachos` WRITE;
/*!40000 ALTER TABLE `Despachos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Despachos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Directores`
--

DROP TABLE IF EXISTS `Directores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Directores` (
  `dni` varchar(8) NOT NULL,
  `nomApels` varchar(255) DEFAULT NULL,
  `dniJefe` varchar(8) NOT NULL,
  `despacho` int DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `dniJefe` (`dniJefe`),
  KEY `despacho` (`despacho`),
  CONSTRAINT `Directores_ibfk_1` FOREIGN KEY (`dniJefe`) REFERENCES `Directores` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Directores_ibfk_2` FOREIGN KEY (`despacho`) REFERENCES `Despachos` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Directores`
--

LOCK TABLES `Directores` WRITE;
/*!40000 ALTER TABLE `Directores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Directores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-23 11:45:51
