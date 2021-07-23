CREATE DATABASE  IF NOT EXISTS `biblio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblio`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 192.168.1.175    Database: biblio
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
-- Table structure for table `Autor`
--

DROP TABLE IF EXISTS `Autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autor` (
  `claveAutor` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`claveAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autor`
--

LOCK TABLES `Autor` WRITE;
/*!40000 ALTER TABLE `Autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editorial`
--

DROP TABLE IF EXISTS `Editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Editorial` (
  `claveEditorial` smallint NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`claveEditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editorial`
--

LOCK TABLES `Editorial` WRITE;
/*!40000 ALTER TABLE `Editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejemplar`
--

DROP TABLE IF EXISTS `Ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ejemplar` (
  `claveEjemplar` int NOT NULL,
  `claveLibro` int DEFAULT NULL,
  `numeroOrden` smallint DEFAULT NULL,
  `edicion` smallint DEFAULT NULL,
  `ubicacion` varchar(15) DEFAULT NULL,
  `vategoria` char(1) DEFAULT NULL,
  PRIMARY KEY (`claveEjemplar`),
  KEY `claveLibro` (`claveLibro`),
  CONSTRAINT `Ejemplar_ibfk_1` FOREIGN KEY (`claveLibro`) REFERENCES `Libro` (`claveLibro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejemplar`
--

LOCK TABLES `Ejemplar` WRITE;
/*!40000 ALTER TABLE `Ejemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EscritoPor`
--

DROP TABLE IF EXISTS `EscritoPor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EscritoPor` (
  `claveLibro` int NOT NULL,
  `claveAutor` int NOT NULL,
  KEY `claveLibro` (`claveLibro`),
  KEY `claveAutor` (`claveAutor`),
  CONSTRAINT `EscritoPor_ibfk_1` FOREIGN KEY (`claveLibro`) REFERENCES `Libro` (`claveLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EscritoPor_ibfk_2` FOREIGN KEY (`claveAutor`) REFERENCES `Autor` (`claveAutor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EscritoPor`
--

LOCK TABLES `EscritoPor` WRITE;
/*!40000 ALTER TABLE `EscritoPor` DISABLE KEYS */;
/*!40000 ALTER TABLE `EscritoPor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libro`
--

DROP TABLE IF EXISTS `Libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libro` (
  `claveLibro` int NOT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `idioma` varchar(15) DEFAULT NULL,
  `formato` varchar(16) DEFAULT NULL,
  `claveEditorial` smallint DEFAULT NULL,
  PRIMARY KEY (`claveLibro`),
  KEY `claveEditorial` (`claveEditorial`),
  CONSTRAINT `Libro_ibfk_1` FOREIGN KEY (`claveEditorial`) REFERENCES `Editorial` (`claveEditorial`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libro`
--

LOCK TABLES `Libro` WRITE;
/*!40000 ALTER TABLE `Libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prestamo`
--

DROP TABLE IF EXISTS `Prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prestamo` (
  `claveSocio` int DEFAULT NULL,
  `claveEjemplar` int DEFAULT NULL,
  `numeroOrden` smallint DEFAULT NULL,
  `fechaPrestamo` date DEFAULT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  `notas` blob,
  KEY `claveSocio` (`claveSocio`),
  KEY `claveEjemplar` (`claveEjemplar`),
  CONSTRAINT `Prestamo_ibfk_1` FOREIGN KEY (`claveSocio`) REFERENCES `Socio` (`claveSocio`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Prestamo_ibfk_2` FOREIGN KEY (`claveEjemplar`) REFERENCES `Ejemplar` (`claveEjemplar`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prestamo`
--

LOCK TABLES `Prestamo` WRITE;
/*!40000 ALTER TABLE `Prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socio`
--

DROP TABLE IF EXISTS `Socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Socio` (
  `claveSocio` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `categoria` char(1) DEFAULT NULL,
  PRIMARY KEY (`claveSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socio`
--

LOCK TABLES `Socio` WRITE;
/*!40000 ALTER TABLE `Socio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tema`
--

DROP TABLE IF EXISTS `Tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tema` (
  `claveTema` smallint NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`claveTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tema`
--

LOCK TABLES `Tema` WRITE;
/*!40000 ALTER TABLE `Tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrataSobre`
--

DROP TABLE IF EXISTS `TrataSobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TrataSobre` (
  `claveLibro` int NOT NULL,
  `claveTema` smallint NOT NULL,
  KEY `claveLibro` (`claveLibro`),
  KEY `claveTema` (`claveTema`),
  CONSTRAINT `TrataSobre_ibfk_1` FOREIGN KEY (`claveLibro`) REFERENCES `Libro` (`claveLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TrataSobre_ibfk_2` FOREIGN KEY (`claveTema`) REFERENCES `Tema` (`claveTema`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrataSobre`
--

LOCK TABLES `TrataSobre` WRITE;
/*!40000 ALTER TABLE `TrataSobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `TrataSobre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-23 10:58:27
