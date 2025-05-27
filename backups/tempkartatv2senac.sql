-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.2    Database: tempkart
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `idequipe` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `patrocinio` int DEFAULT NULL,
  PRIMARY KEY (`idequipe`),
  KEY `fk_patrocinio` (`patrocinio`),
  CONSTRAINT `fk_patrocinio` FOREIGN KEY (`patrocinio`) REFERENCES `patrocinio` (`idpatrocinio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Escuderia Veloz',1),(2,'Rápidos & Furiosos',3),(3,' Fênix Racing ',4),(4,'Equipe Tempestade',5),(5,'Corredores de Aço',NULL);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapa`
--

DROP TABLE IF EXISTS `etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa` (
  `idETAPA` int NOT NULL AUTO_INCREMENT,
  `localizacao` varchar(100) DEFAULT NULL,
  `dat` date DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `temporada` int DEFAULT NULL,
  PRIMARY KEY (`idETAPA`),
  KEY `fk_temporada` (`temporada`),
  CONSTRAINT `fk_temporada` FOREIGN KEY (`temporada`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa`
--

LOCK TABLES `etapa` WRITE;
/*!40000 ALTER TABLE `etapa` DISABLE KEYS */;
INSERT INTO `etapa` VALUES (1,'Sao Paulo ','2024-01-15','14:00:00',1),(2,'Rio de Janeiro ','2024-02-20','16:00:00',1),(3,'Salvador','2024-03-18','15:00:00',1),(4,'Goiânia','2024-04-22','13:00:00',1),(5,'Porto alegre ','2024-05-10','10:00:00',1);
/*!40000 ALTER TABLE `etapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapa_has_piloto`
--

DROP TABLE IF EXISTS `etapa_has_piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa_has_piloto` (
  `etapa_idtapa` int NOT NULL,
  `piloto_idpilot` int NOT NULL,
  PRIMARY KEY (`etapa_idtapa`,`piloto_idpilot`),
  KEY `FK_pilotoetapa` (`piloto_idpilot`),
  CONSTRAINT `FK_etapapiloto` FOREIGN KEY (`etapa_idtapa`) REFERENCES `etapa` (`idETAPA`),
  CONSTRAINT `FK_pilotoetapa` FOREIGN KEY (`piloto_idpilot`) REFERENCES `piloto` (`idpiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa_has_piloto`
--

LOCK TABLES `etapa_has_piloto` WRITE;
/*!40000 ALTER TABLE `etapa_has_piloto` DISABLE KEYS */;
INSERT INTO `etapa_has_piloto` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);
/*!40000 ALTER TABLE `etapa_has_piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrocinio`
--

DROP TABLE IF EXISTS `patrocinio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrocinio` (
  `idpatrocinio` int NOT NULL AUTO_INCREMENT,
  `nomepatrocinio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpatrocinio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrocinio`
--

LOCK TABLES `patrocinio` WRITE;
/*!40000 ALTER TABLE `patrocinio` DISABLE KEYS */;
INSERT INTO `patrocinio` VALUES (1,'MotorTech Brasil '),(3,' Velocidade Extrema '),(4,' Alta Performance  '),(5,'  Turbo Racing '),(6,'   Pneus ProDrive ');
/*!40000 ALTER TABLE `patrocinio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piloto` (
  `idpiloto` int NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `capitao` tinyint DEFAULT NULL,
  `equipe` int NOT NULL,
  `nacionalidade` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idpiloto`),
  KEY `fk_equipe` (`equipe`),
  CONSTRAINT `fk_equipe` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`idequipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES (1,'Lucas Andrade',70.5,1,1,'Brasil'),(2,'Renato Figueiredo',75,0,1,'Brasil'),(3,'Mateus Silva',68,0,2,'Brasil'),(4,'Burno Almeida',78.3,1,2,'Brasil'),(5,'Carla Pereira',60,1,3,'Brasil'),(6,'Gabriela Torres',58.5,0,3,'Brasil'),(7,'João Costa',80.5,0,4,'Brasil'),(8,'Thiago Santos',72.5,0,4,'Brasil'),(9,'Mariana Gomes ',62,1,5,'Brasil'),(10,'Beatriz Lopes',63.2,1,5,'Brasil');
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporada`
--

DROP TABLE IF EXISTS `temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporada`
--

LOCK TABLES `temporada` WRITE;
/*!40000 ALTER TABLE `temporada` DISABLE KEYS */;
INSERT INTO `temporada` VALUES (1,1);
/*!40000 ALTER TABLE `temporada` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-27 17:19:16
