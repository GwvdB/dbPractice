/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: VampireCity
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `VampireCity`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `VampireCity` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `VampireCity`;

--
-- Table structure for table `Domains`
--

DROP TABLE IF EXISTS `Domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Domains` (
  `domain_id` char(36) NOT NULL DEFAULT uuid(),
  `domain_name` varchar(50) NOT NULL,
  `ruler_id` varchar(50) NOT NULL,
  `population` varchar(4) NOT NULL,
  `controlled_by_id` varchar(36) NOT NULL,
  PRIMARY KEY (`domain_id`),
  KEY `fk_ruler_id` (`ruler_id`),
  KEY `fk_controlled_by_id` (`controlled_by_id`),
  CONSTRAINT `fk_controlled_by_id` FOREIGN KEY (`controlled_by_id`) REFERENCES `VampireClan`.`Clans` (`clan_id`),
  CONSTRAINT `fk_ruler_id` FOREIGN KEY (`ruler_id`) REFERENCES `VampireClan`.`Members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Domains`
--

LOCK TABLES `Domains` WRITE;
/*!40000 ALTER TABLE `Domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `Domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `location_id` char(36) NOT NULL DEFAULT uuid(),
  `location_name` varchar(50) NOT NULL,
  `domain_id` char(36) NOT NULL,
  `type` enum('Haven','Elysium','Hunting Ground') NOT NULL,
  `description` tinytext NOT NULL,
  `security_level` enum('Low','Medium','High') NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_domain_id` (`domain_id`),
  CONSTRAINT `fk_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `Domains` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `VampireClan`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `VampireClan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `VampireClan`;

--
-- Table structure for table `Clans`
--

DROP TABLE IF EXISTS `Clans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clans` (
  `clan_id` char(36) NOT NULL DEFAULT uuid(),
  `clan_name` enum('Caitiff','Brujah','Gangrel','Malkavian','Nosferatu','Toreador','Tremere','Ventrue') DEFAULT 'Caitiff',
  `discipline_1` enum('Animalism','Auspex','Celerity','Dementation','Dominate','Fortitude','Obfuscate','Potence','Presence','Proteam','Thaumaturgy') NOT NULL,
  `discipline_2` enum('Animalism','Auspex','Celerity','Dementation','Dominate','Fortitude','Obfuscate','Potence','Presence','Proteam','Thaumaturgy') NOT NULL,
  `discipline_3` enum('Animalism','Auspex','Celerity','Dementation','Dominate','Fortitude','Obfuscate','Potence','Presence','Proteam','Thaumaturgy') NOT NULL,
  `weakness` enum('Uncontrolled Temper','Bestial Features','Madness','Horrible Appearance','Beauty Obsessed','Deficient Bond','Refined Palate') DEFAULT NULL,
  PRIMARY KEY (`clan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clans`
--

LOCK TABLES `Clans` WRITE;
/*!40000 ALTER TABLE `Clans` DISABLE KEYS */;
INSERT INTO `Clans` VALUES
('07cd5ef3-8168-11ef-8ff5-0242ac270002','Tremere','Auspex','Dominate','Thaumaturgy','Deficient Bond'),
('b9d0c09a-8169-11ef-8ff5-0242ac270002','Toreador','Auspex','Celerity','Presence','Beauty Obsessed'),
('b9d0c47f-8169-11ef-8ff5-0242ac270002','Brujah','Celerity','Potence','Presence','Uncontrolled Temper'),
('b9d0c4e9-8169-11ef-8ff5-0242ac270002','Nosferatu','Animalism','Obfuscate','Potence','Horrible Appearance'),
('b9d0c54c-8169-11ef-8ff5-0242ac270002','Ventrue','Dominate','Fortitude','Presence','Refined Palate'),
('b9d0c59d-8169-11ef-8ff5-0242ac270002','Malkavian','Auspex','Obfuscate','Dominate','Madness');
/*!40000 ALTER TABLE `Clans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Members` (
  `member_id` char(36) NOT NULL DEFAULT uuid(),
  `member_name` varchar(50) NOT NULL,
  `clan_id` char(36) NOT NULL,
  `generation` enum('10th & 11th','12th & 13th','14th & 15th','16th') NOT NULL,
  `sire` varchar(50) DEFAULT NULL,
  `age` varchar(5) NOT NULL,
  `haven` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `fk_clan_id` (`clan_id`),
  CONSTRAINT `fk_clan_id` FOREIGN KEY (`clan_id`) REFERENCES `Clans` (`clan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
INSERT INTO `Members` VALUES
('7cf1d5d4-816b-11ef-8ff5-0242ac270002','Eva','07cd5ef3-8168-11ef-8ff5-0242ac270002','12th & 13th','Katya','77','Griffith Observatory'),
('c5290093-816e-11ef-8ff5-0242ac270002','Annabelle Li','b9d0c47f-8169-11ef-8ff5-0242ac270002','12th & 13th','Carver','28',NULL),
('c5290541-816e-11ef-8ff5-0242ac270002','Nelli G','b9d0c09a-8169-11ef-8ff5-0242ac270002','10th & 11th','Chaz Prince','???','Golden Age Jewelry'),
('c52905e4-816e-11ef-8ff5-0242ac270002','Jasper Heartwood','b9d0c4e9-8169-11ef-8ff5-0242ac270002','12th & 13th','Unknown','???','Griffith Park Labyrinth'),
('c5290673-816e-11ef-8ff5-0242ac270002','Victor Temple','b9d0c54c-8169-11ef-8ff5-0242ac270002','10th & 11th','Unknown','80s','Club Maharani'),
('c52906f8-816e-11ef-8ff5-0242ac270002','X','b9d0c59d-8169-11ef-8ff5-0242ac270002','10th & 11th','Therese','???','The Asylum');
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-10-03 10:04:18
