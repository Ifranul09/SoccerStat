-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (x86_64)
--
-- Host: localhost    Database: SoccerStat
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `beststrikers_view`
--

DROP TABLE IF EXISTS `beststrikers_view`;
/*!50001 DROP VIEW IF EXISTS `beststrikers_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `beststrikers_view` AS SELECT 
 1 AS `Player_Name`,
 1 AS `Club_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `booking_report_view`
--

DROP TABLE IF EXISTS `booking_report_view`;
/*!50001 DROP VIEW IF EXISTS `booking_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `booking_report_view` AS SELECT 
 1 AS `Player_Id`,
 1 AS `Player_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clean_sheets_view`
--

DROP TABLE IF EXISTS `clean_sheets_view`;
/*!50001 DROP VIEW IF EXISTS `clean_sheets_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clean_sheets_view` AS SELECT 
 1 AS `Player_Name`,
 1 AS `Club_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `CLUB`
--

DROP TABLE IF EXISTS `CLUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLUB` (
  `Club_ID` int NOT NULL,
  `Club_Name` varchar(20) NOT NULL,
  `Championship_Name` varchar(30) DEFAULT NULL,
  `Title_Number` int DEFAULT '0',
  PRIMARY KEY (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLUB`
--

LOCK TABLES `CLUB` WRITE;
/*!40000 ALTER TABLE `CLUB` DISABLE KEYS */;
INSERT INTO `CLUB` VALUES (1,'Arsenal','English Premiere League',3),(2,'Manchester United','English Premiere League',13),(3,'Chelsea','English Premiere League',5),(4,'West Ham United','English Premiere League',0),(5,'Barcelona ','La Liga',27),(6,'Sevilla','La Liga',1),(7,'Villareal','La Liga',0),(8,'Borussia Dortmund','Bundesliga',5),(9,'Wolfsburg','Bundesliga',1),(10,'Leipzig','Bundesliga',6),(11,'PSG','Ligue 1',46),(12,'Marseille','Ligue 1',25),(13,'Lyon','Ligue 1',20);
/*!40000 ALTER TABLE `CLUB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CURRENT_SEASON`
--

DROP TABLE IF EXISTS `CURRENT_SEASON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CURRENT_SEASON` (
  `club_ID` int NOT NULL,
  `club_standing` int NOT NULL,
  `games_won` int DEFAULT NULL,
  `games_lost` int DEFAULT NULL,
  `games_drew` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `last_five_games` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`club_ID`),
  CONSTRAINT `current_season_ibfk_1` FOREIGN KEY (`club_ID`) REFERENCES `CLUB` (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURRENT_SEASON`
--

LOCK TABLES `CURRENT_SEASON` WRITE;
/*!40000 ALTER TABLE `CURRENT_SEASON` DISABLE KEYS */;
INSERT INTO `CURRENT_SEASON` VALUES (1,3,8,3,1,27,'W L W D W'),(2,6,7,0,5,21,'W W L W W'),(3,10,4,4,4,16,'D W L D W'),(4,9,5,2,5,17,'W L L L D'),(5,3,9,3,1,30,'W W L W D'),(6,13,2,6,4,12,'D D D D D'),(7,3,9,3,1,30,'W W L W D'),(8,3,9,3,1,30,'W W L W D'),(9,3,9,3,1,30,'W W L W D'),(10,4,7,2,2,23,'W L W W D'),(11,1,8,3,1,27,'W W W W W'),(12,10,3,4,4,13,'L D L W L'),(13,18,1,4,6,7,'W D L D L');
/*!40000 ALTER TABLE `CURRENT_SEASON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER`
--

DROP TABLE IF EXISTS `MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MANAGER` (
  `Manager_ID` int NOT NULL,
  `Club_ID` int NOT NULL,
  `Manager_Name` varchar(30) NOT NULL,
  `Nationality` varchar(20) NOT NULL,
  `Current_Club_Years` int NOT NULL,
  `Titles` int DEFAULT '0',
  `Individual_Awards` int DEFAULT '0',
  PRIMARY KEY (`Manager_ID`,`Club_ID`),
  KEY `Club_ID` (`Club_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Club_ID`) REFERENCES `CLUB` (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER`
--

LOCK TABLES `MANAGER` WRITE;
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` VALUES (101,1,'Mikel Arteta','Spanish',4,0,6),(102,2,'Erik ten Hag','Dutch',1,0,2),(103,3,'Mauricio Pochettino','Argentine',0,0,5),(104,4,'David Moyes','Scottish',3,0,14),(105,5,'Xavi Hernández','Spanish',2,2,3),(106,6,'Diego Alonso','Uruguayan',0,2,1),(107,7,'Juan Jose Rojo Martin','Spanish',0,0,0),(108,8,'Edin Terzic','German',1,5,2),(109,9,'Niko Kovač ','Croatian',1,4,2),(110,10,'Marco Rose','German',1,2,5),(111,11,'Luis Enrique','Spanish',1,10,7),(112,12,'Gennaro Ivan Gattuso','Italian',1,14,9),(113,13,'Fabio Grosso','Italian',1,8,7);
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER_PREVIOUS_TEAMS`
--

DROP TABLE IF EXISTS `MANAGER_PREVIOUS_TEAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MANAGER_PREVIOUS_TEAMS` (
  `Manager_ID` int NOT NULL,
  `Club_ID` int NOT NULL,
  `Previous_Club_Years` int NOT NULL,
  PRIMARY KEY (`Manager_ID`,`Club_ID`),
  CONSTRAINT `manager_previous_teams_ibfk_1` FOREIGN KEY (`Manager_ID`) REFERENCES `MANAGER` (`Manager_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER_PREVIOUS_TEAMS`
--

LOCK TABLES `MANAGER_PREVIOUS_TEAMS` WRITE;
/*!40000 ALTER TABLE `MANAGER_PREVIOUS_TEAMS` DISABLE KEYS */;
INSERT INTO `MANAGER_PREVIOUS_TEAMS` VALUES (101,1,0),(102,2,5),(103,3,1),(104,4,1),(111,5,3);
/*!40000 ALTER TABLE `MANAGER_PREVIOUS_TEAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER`
--

DROP TABLE IF EXISTS `PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER` (
  `Player_ID` int NOT NULL,
  `Club_ID` int NOT NULL,
  `Player_Name` varchar(30) NOT NULL,
  `Current_Club_Years` int DEFAULT '0',
  `Nationality` varchar(20) NOT NULL,
  `Price` varchar(20) DEFAULT NULL,
  `Individual_Awards` int DEFAULT '0',
  PRIMARY KEY (`Player_ID`,`Club_ID`),
  KEY `Club_ID` (`Club_ID`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`Club_ID`) REFERENCES `CLUB` (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER`
--

LOCK TABLES `PLAYER` WRITE;
/*!40000 ALTER TABLE `PLAYER` DISABLE KEYS */;
INSERT INTO `PLAYER` VALUES (1101,1,'Martin Ødegaard',3,'Norwegian','€ 35,000,000',8),(1102,1,'Bukayo Saka',5,'English','Academy',7),(1201,2,'Marcus Rashford',8,'English','€ 120,000,000',22),(1202,2,'André Onana Onana ',1,'Cameroonian','€ 47,200,000',5),(1301,3,'Thiago Silva',3,'Brazilian','€ 42,000,000',37),(1302,3,'Raheem Sterling',1,'English','€ 47,500,000',14),(1401,4,'Michail Antonio',8,'Jamaican','€ 9,500,000',5),(1402,4,'Saïd Benrahma',2,'Algerian','€ 25,000,000',5),(3001,10,'Xavi Simons',1,'Dutch','€ 70,000,000',7),(3002,10,'Péter Gulácsi',8,'Hungarian','€ 3,500,000',7),(3101,11,'Kylian Mbappé',6,'French','€ 180,000,000',37),(3102,11,'Gianluigi Donnarumma',2,'Italian','€ 45,000,000',5),(3201,12,'Pierre-Emerick Aubameyang',1,'French','€ 4,000,000',10),(3202,12,'Joaquin Correa',1,'Argentine','€ 12,000,000',7),(3301,13,'Alexandre Lacazette',8,'French','€ 12,000,000',8),(3302,13,'Dejan Lovren',4,'Croatian','€ 2,500,000',13),(6776,5,'Robert Lewandowski',1,'Polish','€ 45,000,000',37),(6777,5,'Marc Andre Ter Stegen',9,'German','€ 75,000,000',10),(6778,6,'Sergio Ramos',1,'Spanish','€ 4,000,000',24),(6779,6,'Ivan Rakitic',1,'Croatian','€ 4,000,000',7),(6780,7,'Gerard Moreno',11,'Spanish','€ 15,000,000',3),(6781,7,'Juan Foyth',7,'Argentine','€ 42,000,000',9),(6782,8,'Marco Reus',11,'German','€ 7,000,000',17),(6783,8,'Mats Hummels',4,'German','€ 36,000,000',14),(6784,9,'Maximilian Arnold',12,'German','€ 14,000,000',7),(6785,9,'Koen Casteels',8,'Belgian','€ 8,000,000',3);
/*!40000 ALTER TABLE `PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER_PREVIOUS_CLUBS`
--

DROP TABLE IF EXISTS `PLAYER_PREVIOUS_CLUBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER_PREVIOUS_CLUBS` (
  `Player_ID` int NOT NULL,
  `Club_ID` int NOT NULL,
  `Previous_Club_Years` int NOT NULL,
  PRIMARY KEY (`Player_ID`,`Club_ID`),
  CONSTRAINT `player_previous_clubs_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `PLAYER` (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_PREVIOUS_CLUBS`
--

LOCK TABLES `PLAYER_PREVIOUS_CLUBS` WRITE;
/*!40000 ALTER TABLE `PLAYER_PREVIOUS_CLUBS` DISABLE KEYS */;
INSERT INTO `PLAYER_PREVIOUS_CLUBS` VALUES (1101,1,1),(1201,2,8),(1301,3,2),(1401,4,1),(3001,5,9),(3001,11,3),(3201,1,4),(3201,5,1),(3201,8,5),(3202,6,2),(3301,1,5),(6776,8,2),(6778,11,2),(6779,5,6);
/*!40000 ALTER TABLE `PLAYER_PREVIOUS_CLUBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `player_price_report_view`
--

DROP TABLE IF EXISTS `player_price_report_view`;
/*!50001 DROP VIEW IF EXISTS `player_price_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `player_price_report_view` AS SELECT 
 1 AS `Player_ID`,
 1 AS `Player_Name`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `PLAYER_SEASONAL_STATS`
--

DROP TABLE IF EXISTS `PLAYER_SEASONAL_STATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER_SEASONAL_STATS` (
  `Player_ID` int NOT NULL,
  `Player_Position` varchar(15) NOT NULL,
  `Games_Played` int DEFAULT '0',
  `Goals` int DEFAULT '0',
  `Assist` int DEFAULT '0',
  `Goals_Ratio` decimal(1,1) DEFAULT '0.0',
  `Yellow_Cards` int DEFAULT '0',
  `Red_Cards` int DEFAULT '0',
  `Clean_Sheets` int DEFAULT '0',
  `Health_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`Player_ID`),
  CONSTRAINT `player_seasonal_stats_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `PLAYER` (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_SEASONAL_STATS`
--

LOCK TABLES `PLAYER_SEASONAL_STATS` WRITE;
/*!40000 ALTER TABLE `PLAYER_SEASONAL_STATS` DISABLE KEYS */;
INSERT INTO `PLAYER_SEASONAL_STATS` VALUES (1101,'midfielder',9,3,1,0.4,1,0,0,'Good'),(1102,'Right-Winger',11,4,4,0.7,1,0,0,'Good'),(1201,'Forward',11,1,0,0.0,0,0,0,'Good'),(1202,'Goalkeeper',12,0,0,0.0,3,0,4,'Good'),(1301,'Centre-Back',12,1,0,0.0,2,0,0,'Good'),(1302,'Winger',12,4,1,0.4,1,0,0,'Good'),(1401,'Forward',12,2,2,0.3,2,0,0,'Good'),(1402,'Left-Winger',9,0,1,0.1,1,0,0,'Good'),(3001,'Midfielder',11,4,7,0.0,1,0,0,'Good'),(3002,'Goalkeeper',5,0,0,0.0,0,0,0,'Good'),(3101,'Forward',11,13,1,0.3,2,0,0,'Good'),(3102,'Goalkeeper',12,0,0,0.0,2,0,6,'Good'),(3201,'Forward',11,1,3,0.4,1,0,0,'Good'),(3202,'Forward',6,0,0,0.0,2,0,0,'Good'),(3301,'Forward',8,3,0,0.4,1,1,0,'Good'),(3302,'Defender',3,0,0,0.0,1,0,0,'Good'),(6776,'Forward',11,7,3,0.9,3,0,0,'Good'),(6777,'Goalkeeper',13,0,0,0.0,1,0,4,'Good'),(6778,'Defender',4,0,0,0.0,2,0,0,'Good'),(6779,'Midliefler',11,2,1,0.3,3,0,0,'Good'),(6780,'Forward',11,8,1,0.8,0,0,0,'Good'),(6781,'Defender',9,1,0,0.1,1,0,0,'Good'),(6782,'Midfielder',9,3,1,0.4,1,0,0,'Good'),(6783,'Defender',10,2,0,0.2,3,0,0,'Good'),(6784,'Midfielder',10,0,0,0.0,4,0,0,'Good'),(6785,'Goalkeeper',8,0,0,0.0,0,0,2,'Good');
/*!40000 ALTER TABLE `PLAYER_SEASONAL_STATS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `beststrikers_view`
--

/*!50001 DROP VIEW IF EXISTS `beststrikers_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `beststrikers_view` AS select `player`.`Player_Name` AS `Player_Name`,`club`.`Club_Name` AS `Club_Name` from (`player` join `club` on((`player`.`Club_ID` = `club`.`Club_ID`))) where `player`.`Player_ID` in (select `player_seasonal_stats`.`Player_ID` from `player_seasonal_stats` where (`player_seasonal_stats`.`Goals_Ratio` >= 0.6)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `booking_report_view`
--

/*!50001 DROP VIEW IF EXISTS `booking_report_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booking_report_view` AS select `player`.`Player_ID` AS `Player_Id`,`player`.`Player_Name` AS `Player_Name` from `player` where `player`.`Player_ID` in (select `player_seasonal_stats`.`Player_ID` from `player_seasonal_stats` where ((`player_seasonal_stats`.`Red_Cards` = 0) and (`player_seasonal_stats`.`Yellow_Cards` <= 1))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clean_sheets_view`
--

/*!50001 DROP VIEW IF EXISTS `clean_sheets_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clean_sheets_view` AS select `player`.`Player_Name` AS `Player_Name`,`club`.`Club_Name` AS `Club_Name` from (`player` join `club` on((`player`.`Club_ID` = `club`.`Club_ID`))) where `player`.`Player_ID` in (select `player_seasonal_stats`.`Player_ID` from `player_seasonal_stats` where ((`player_seasonal_stats`.`Player_Position` = 'Goalkeeper') and (`player_seasonal_stats`.`Clean_Sheets` > 0))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `player_price_report_view`
--

/*!50001 DROP VIEW IF EXISTS `player_price_report_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `player_price_report_view` AS select `player`.`Player_ID` AS `Player_ID`,`player`.`Player_Name` AS `Player_Name`,`player`.`Price` AS `Price` from `player` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 12:42:10
