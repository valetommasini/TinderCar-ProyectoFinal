CREATE DATABASE  IF NOT EXISTS `pruebaback` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pruebaback`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: pruebaback
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add adm',7,'add_adm'),(26,'Can change adm',7,'change_adm'),(27,'Can delete adm',7,'delete_adm'),(28,'Can view adm',7,'view_adm'),(29,'Can add usuario',8,'add_usuario'),(30,'Can change usuario',8,'change_usuario'),(31,'Can delete usuario',8,'delete_usuario'),(32,'Can view usuario',8,'view_usuario'),(33,'Can add cochera',9,'add_cochera'),(34,'Can change cochera',9,'change_cochera'),(35,'Can delete cochera',9,'delete_cochera'),(36,'Can view cochera',9,'view_cochera'),(37,'Can add tiempo alquiler',10,'add_tiempoalquiler'),(38,'Can change tiempo alquiler',10,'change_tiempoalquiler'),(39,'Can delete tiempo alquiler',10,'delete_tiempoalquiler'),(40,'Can view tiempo alquiler',10,'view_tiempoalquiler'),(41,'Can add servicio',11,'add_servicio'),(42,'Can change servicio',11,'change_servicio'),(43,'Can delete servicio',11,'delete_servicio'),(44,'Can view servicio',11,'view_servicio');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$gDM6DM6YoEnAXEkN5MlaFj$wHdgD2Gq0sNzsQfq6t1XPUceq4+8F69eskw/9DqbVcI=','2023-06-21 04:40:26.123530',1,'Valentina','','','vale@gmail.com',1,1,'2023-06-20 15:02:56.752876'),(2,'pbkdf2_sha256$600000$xb2f3GFVQiyNFRfUOwoUuV$vZjDK59WT0vkLG1kRgG/2ENrtdICq2ktPgCm43bf9Js=','2023-06-21 02:40:50.345424',0,'Juan','','','juan@gmail.com',0,1,'2023-06-20 15:09:33.906825'),(3,'pbkdf2_sha256$600000$pT4phlFNShFrjeGnHoqX1c$RH+v3uOWTvB8KXWzIO/61gqC6ZC9FmwRC9QOQtELY/0=',NULL,0,'Juliana','','','Juliana@gmail.com',0,1,'2023-06-20 16:30:34.696347'),(4,'pbkdf2_sha256$600000$GKMJnGDMSWBmvpTyijmpRI$i8Sb8T7QkFekVSgqerRfyll4udK4WjnnzS0YYYn0Ttw=',NULL,0,'Lorena','','','lore@gmail.com',0,1,'2023-06-20 16:31:29.757811'),(5,'pbkdf2_sha256$600000$ZKJkgA58Pdx78dgHrMgJib$y0+uM14fFmgexKhVF/A3Xcyn3yHBNxdF7CpqyMFvHJY=',NULL,0,'Leticia','','','leti@gmail.com',0,1,'2023-06-20 16:32:13.664793'),(6,'pbkdf2_sha256$600000$sqanqcOWgeBvXMBI0Ggz7q$KJbjcZODt913FzGdGHducbx6tzPlMfsjYpUURGgZBH8=','2023-06-21 04:57:40.274043',1,'Daniel','','','dani@gmail.com',1,1,'2023-06-20 18:52:36.657284'),(7,'pbkdf2_sha256$600000$EyFrr5e6YeFB5FQU8uO2n6$lEpeOr+E+Jha7ryhZnA14+C3n4UB0fymU23kEMZFvWo=',NULL,0,'Hernan','','','hernan@gmail.com',0,1,'2023-06-20 23:41:33.436021'),(8,'pbkdf2_sha256$600000$waL1I8H8wYh9kNsQTNccj5$JVVX8U+ihrNbi405Dm5HbG4C2RZvonVQqfTwzgQ6gsA=',NULL,0,'Martin','','','martin@gmail.com',0,1,'2023-06-20 23:42:50.631156'),(9,'pbkdf2_sha256$600000$JTxnIrPuTX9uIo9Fufrlag$oDLiwtxl8+gZX1eKaIHFoj8V7Azn5u/UdW/LhZw14EI=',NULL,0,'Nadia','','','nadia@gmail.com',0,1,'2023-06-20 23:43:53.935089'),(13,'pbkdf2_sha256$600000$xPjXVmj8S4uv1tUSX3XtHW$7G6aqx9xGw1GsnLIimAhXilvf/HOt/CWEXQdBJLEotQ=','2023-06-21 03:06:15.361053',1,'Leandro','','','lean@gmail.com',1,1,'2023-06-21 03:00:47.730098');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend1_adm`
--

DROP TABLE IF EXISTS `backend1_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend1_adm` (
  `id_adm` int NOT NULL,
  `nom_adm` varchar(50) NOT NULL,
  `apell_adm` varchar(50) NOT NULL,
  `rol_adm` varchar(50) NOT NULL,
  PRIMARY KEY (`id_adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend1_adm`
--

LOCK TABLES `backend1_adm` WRITE;
/*!40000 ALTER TABLE `backend1_adm` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend1_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend1_cochera`
--

DROP TABLE IF EXISTS `backend1_cochera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend1_cochera` (
  `id_cochera` int NOT NULL AUTO_INCREMENT,
  `nombre_cochera` varchar(225) NOT NULL,
  `img_cochera` varchar(255) NOT NULL,
  `descripcion_cochera` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cochera`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend1_cochera`
--

LOCK TABLES `backend1_cochera` WRITE;
/*!40000 ALTER TABLE `backend1_cochera` DISABLE KEYS */;
INSERT INTO `backend1_cochera` VALUES (2,'Cochera San Francisco','https://i.ibb.co/HTjWxDx/c2.jpg','Dirección: Fueraza Aerea 2020. Cochera de alquiler por día, techada.'),(3,'Cochera Martinelli','https://i.ibb.co/8rsTwv0/c6.jpg','Direcció: Gral Paz, Pedro Goyena 3010. Alquilamos mensual, por mes y semestral. Cochera totalmente techada'),(4,'Cochera La Rueda','https://i.ibb.co/tJ772q8/c5.jpg','Direcció: Gral Paz, Pedro Goyena 3010. Alquilamos mensual, por mes y semestral. Cochera totalmente techada'),(5,'Cochera Nazareno','https://i.ibb.co/fQWT8gZ/c4.jpg','Dirección: Villa allende, Pellegrini 1580. Alquilamos mensual, semestral y anual. Cochera con techo.'),(6,'Cochera Balcarce','https://i.ibb.co/HTjWxDx/c2.jpg ','Dirección: Av Libertador 1985. Ofrecemos servicio de lavado, no alquilamos por día.'),(8,'Cochera Don Ernesto','https://i.ibb.co/k58w6cm/c3.jpg','Dirección: Av libertador 2550. Cochera con disponibilidad, se alquila por día, no se alquila mensual.');
/*!40000 ALTER TABLE `backend1_cochera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend1_servicio`
--

DROP TABLE IF EXISTS `backend1_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend1_servicio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `servicio` varchar(10) NOT NULL,
  `precio` int NOT NULL,
  `cochera_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend1_servicio_cochera_id_1174c3f5_fk_backend1_` (`cochera_id`),
  CONSTRAINT `backend1_servicio_cochera_id_1174c3f5_fk_backend1_` FOREIGN KEY (`cochera_id`) REFERENCES `backend1_cochera` (`id_cochera`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend1_servicio`
--

LOCK TABLES `backend1_servicio` WRITE;
/*!40000 ALTER TABLE `backend1_servicio` DISABLE KEYS */;
INSERT INTO `backend1_servicio` VALUES (3,'servicio1',400,2),(4,'servicio2',600,2),(5,'servicio3',1500,2),(6,'servicio1',600,3),(7,'servicio1',500,2),(8,'servicio2',1500,2),(9,'servicio1',1500,3),(10,'servicio2',2500,3),(11,'servicio1',1000,5),(12,'servicio1',1500,6),(13,'servicio2',3000,6),(14,'servicio3',5000,6),(15,'servicio1',1000,8);
/*!40000 ALTER TABLE `backend1_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend1_tiempoalquiler`
--

DROP TABLE IF EXISTS `backend1_tiempoalquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend1_tiempoalquiler` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(10) NOT NULL,
  `precio` int NOT NULL,
  `cochera_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend1_tiempoalqui_cochera_id_616da164_fk_backend1_` (`cochera_id`),
  CONSTRAINT `backend1_tiempoalqui_cochera_id_616da164_fk_backend1_` FOREIGN KEY (`cochera_id`) REFERENCES `backend1_cochera` (`id_cochera`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend1_tiempoalquiler`
--

LOCK TABLES `backend1_tiempoalquiler` WRITE;
/*!40000 ALTER TABLE `backend1_tiempoalquiler` DISABLE KEYS */;
INSERT INTO `backend1_tiempoalquiler` VALUES (5,'15 dias',6000,2),(6,'1 mes',20000,2),(7,'6 meses',55000,2),(8,'15 dias',5000,3),(9,'1 mes',9000,3),(10,'15 dias',4000,4),(11,'1 mes',7500,4),(12,'6 meses',45000,4),(13,'1 dia',2000,5),(14,'15 dias',6000,5),(15,'1 mes',11000,5),(16,'6 meses',60000,6),(17,'1 año',100000,6),(18,'1 dia',3000,8),(19,'15 dias',7000,8);
/*!40000 ALTER TABLE `backend1_tiempoalquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend1_usuario`
--

DROP TABLE IF EXISTS `backend1_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend1_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasenia_usuario` varchar(9) NOT NULL,
  `aceptar_terminos` tinyint(1) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `correo_usuario` varchar(254) NOT NULL,
  `telefono_usuario` int NOT NULL,
  `rol` varchar(13) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend1_usuario`
--

LOCK TABLES `backend1_usuario` WRITE;
/*!40000 ALTER TABLE `backend1_usuario` DISABLE KEYS */;
INSERT INTO `backend1_usuario` VALUES (1,'Carlos','carlos',1,'Rodriguez','carlos@gmail.com',2147483647,'usuario'),(2,'Fernando','fernando',1,'Alonso','fernando@gmail.com',1147483647,'usuario'),(3,'Ruben','ruben',1,'Ruben','ruben@gmail.com',1147483647,'usuario'),(4,'Hernan','hernan',1,'perez','hernan@gmail.com',1234567890,'Usuario'),(6,'Lucas','lucas',1,'Ordoñez','lucas@gmail.com',1234567895,'usuario'),(7,'Ezequiel','eze',1,'Hernandez','eze@gmail.com',1234569870,'usuario'),(8,'Patricio','pato',1,'Perez','pato@gmail.com',2147483647,'usuario'),(9,'Liliana','lili',1,'Llorentes','lili@gmail.com',2147483647,'usuario');
/*!40000 ALTER TABLE `backend1_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-20 18:54:50.867524','1','TiempoAlquiler object (1)',1,'[{\"added\": {}}]',10,1),(2,'2023-06-20 18:55:02.090411','2','TiempoAlquiler object (2)',1,'[{\"added\": {}}]',10,1),(3,'2023-06-20 18:55:18.861072','3','TiempoAlquiler object (3)',1,'[{\"added\": {}}]',10,1),(4,'2023-06-20 18:55:27.147846','4','TiempoAlquiler object (4)',1,'[{\"added\": {}}]',10,1),(5,'2023-06-20 18:55:41.524152','5','TiempoAlquiler object (5)',1,'[{\"added\": {}}]',10,1),(6,'2023-06-20 18:55:55.964646','6','TiempoAlquiler object (6)',1,'[{\"added\": {}}]',10,1),(7,'2023-06-20 18:56:08.886916','7','TiempoAlquiler object (7)',1,'[{\"added\": {}}]',10,1),(8,'2023-06-20 18:58:29.959160','1','Usuario object (1)',1,'[{\"added\": {}}]',8,1),(9,'2023-06-20 18:59:34.104073','2','Usuario object (2)',1,'[{\"added\": {}}]',8,1),(10,'2023-06-20 19:00:15.699455','3','Usuario object (3)',1,'[{\"added\": {}}]',8,1),(11,'2023-06-20 22:13:00.277517','1','Servicio object (1)',1,'[{\"added\": {}}]',11,1),(12,'2023-06-20 22:13:18.101146','2','Servicio object (2)',1,'[{\"added\": {}}]',11,1),(13,'2023-06-20 22:14:08.051969','3','Servicio object (3)',1,'[{\"added\": {}}]',11,1),(14,'2023-06-20 22:14:16.408445','4','Servicio object (4)',1,'[{\"added\": {}}]',11,1),(15,'2023-06-20 22:14:25.004023','5','Servicio object (5)',1,'[{\"added\": {}}]',11,1),(16,'2023-06-20 22:14:56.965675','6','Servicio object (6)',1,'[{\"added\": {}}]',11,1),(17,'2023-06-20 22:19:36.206713','7','Cochera object (7)',1,'[{\"added\": {}}]',9,1),(18,'2023-06-21 02:55:34.072865','5','Usuario object (5)',1,'[{\"added\": {}}]',8,1),(19,'2023-06-21 02:56:09.116675','6','Usuario object (6)',1,'[{\"added\": {}}]',8,1),(20,'2023-06-21 02:56:43.690083','7','Usuario object (7)',1,'[{\"added\": {}}]',8,1),(21,'2023-06-21 02:57:34.876116','8','Usuario object (8)',1,'[{\"added\": {}}]',8,1),(22,'2023-06-21 02:58:25.893358','9','Usuario object (9)',1,'[{\"added\": {}}]',8,1),(23,'2023-06-21 03:05:52.757962','5','Usuario object (5)',3,'',8,1),(24,'2023-06-21 03:08:04.833777','10','Usuario object (10)',3,'',8,1),(25,'2023-06-21 04:52:11.627645','8','TiempoAlquiler object (8)',1,'[{\"added\": {}}]',10,1),(26,'2023-06-21 04:52:30.311790','9','TiempoAlquiler object (9)',1,'[{\"added\": {}}]',10,1),(27,'2023-06-21 04:53:06.053731','10','TiempoAlquiler object (10)',1,'[{\"added\": {}}]',10,1),(28,'2023-06-21 04:53:16.499323','11','TiempoAlquiler object (11)',1,'[{\"added\": {}}]',10,1),(29,'2023-06-21 04:53:34.073469','12','TiempoAlquiler object (12)',1,'[{\"added\": {}}]',10,1),(30,'2023-06-21 04:53:46.649704','13','TiempoAlquiler object (13)',1,'[{\"added\": {}}]',10,1),(31,'2023-06-21 04:53:55.243695','14','TiempoAlquiler object (14)',1,'[{\"added\": {}}]',10,1),(32,'2023-06-21 04:54:36.449405','15','TiempoAlquiler object (15)',1,'[{\"added\": {}}]',10,1),(33,'2023-06-21 04:54:48.807200','16','TiempoAlquiler object (16)',1,'[{\"added\": {}}]',10,1),(34,'2023-06-21 04:54:58.846909','17','TiempoAlquiler object (17)',1,'[{\"added\": {}}]',10,1),(35,'2023-06-21 04:55:05.556675','18','TiempoAlquiler object (18)',1,'[{\"added\": {}}]',10,1),(36,'2023-06-21 04:55:19.505517','19','TiempoAlquiler object (19)',1,'[{\"added\": {}}]',10,1),(37,'2023-06-21 04:55:45.103329','7','Servicio object (7)',1,'[{\"added\": {}}]',11,1),(38,'2023-06-21 04:55:52.468984','8','Servicio object (8)',1,'[{\"added\": {}}]',11,1),(39,'2023-06-21 04:56:07.362249','9','Servicio object (9)',1,'[{\"added\": {}}]',11,1),(40,'2023-06-21 04:56:15.745457','10','Servicio object (10)',1,'[{\"added\": {}}]',11,1),(41,'2023-06-21 04:56:26.903134','11','Servicio object (11)',1,'[{\"added\": {}}]',11,1),(42,'2023-06-21 04:56:34.187504','12','Servicio object (12)',1,'[{\"added\": {}}]',11,1),(43,'2023-06-21 04:56:40.661467','13','Servicio object (13)',1,'[{\"added\": {}}]',11,1),(44,'2023-06-21 04:56:50.788633','14','Servicio object (14)',1,'[{\"added\": {}}]',11,1),(45,'2023-06-21 04:56:57.993688','15','Servicio object (15)',1,'[{\"added\": {}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'backend1','adm'),(9,'backend1','cochera'),(11,'backend1','servicio'),(10,'backend1','tiempoalquiler'),(8,'backend1','usuario'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-18 20:53:41.216101'),(2,'auth','0001_initial','2023-06-18 20:53:42.427762'),(3,'admin','0001_initial','2023-06-18 20:53:42.710216'),(4,'admin','0002_logentry_remove_auto_add','2023-06-18 20:53:42.721677'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-18 20:53:42.735796'),(6,'contenttypes','0002_remove_content_type_name','2023-06-18 20:53:42.925818'),(7,'auth','0002_alter_permission_name_max_length','2023-06-18 20:53:43.408557'),(8,'auth','0003_alter_user_email_max_length','2023-06-18 20:53:43.449263'),(9,'auth','0004_alter_user_username_opts','2023-06-18 20:53:43.463804'),(10,'auth','0005_alter_user_last_login_null','2023-06-18 20:53:43.571138'),(11,'auth','0006_require_contenttypes_0002','2023-06-18 20:53:43.577490'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-18 20:53:43.588726'),(13,'auth','0008_alter_user_username_max_length','2023-06-18 20:53:43.706007'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-18 20:53:43.815027'),(15,'auth','0010_alter_group_name_max_length','2023-06-18 20:53:43.849283'),(16,'auth','0011_update_proxy_permissions','2023-06-18 20:53:43.860890'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-18 20:53:43.966494'),(18,'backend1','0001_initial','2023-06-18 20:53:44.009015'),(19,'backend1','0002_usuario','2023-06-18 20:53:44.054976'),(20,'backend1','0003_cochera','2023-06-18 20:53:44.104110'),(21,'backend1','0004_cochera_img_cochera','2023-06-18 20:53:44.152680'),(22,'backend1','0005_alter_cochera_capacidad_cochera','2023-06-18 20:53:44.162810'),(23,'backend1','0006_cochera_descripcion_cochera','2023-06-18 20:53:44.207960'),(24,'backend1','0007_tiempoalquiler_servicio','2023-06-18 20:53:44.665257'),(25,'backend1','0008_alter_tiempoalquiler_cochera','2023-06-18 20:53:44.674151'),(26,'backend1','0009_alter_tiempoalquiler_tiempo','2023-06-18 20:53:44.682723'),(27,'backend1','0010_alter_servicio_cochera','2023-06-18 20:53:44.691174'),(28,'backend1','0011_alter_servicio_cochera','2023-06-18 20:53:44.701150'),(29,'sessions','0001_initial','2023-06-18 20:53:44.785184'),(30,'backend1','0012_remove_cochera_capacidad_cochera_and_more','2023-06-20 13:58:19.184827'),(31,'backend1','0013_usuario_aceptar_terminos_usuario_apellido_usuario_and_more','2023-06-20 13:58:19.419384'),(32,'backend1','0014_usuario_rol','2023-06-20 13:58:19.463753');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00lqggay599v5qaq12gdjynvd4b9koa0','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBnZq:YM38f9VHDcoYddMbrfkG8ll59x9TYcORj7WCyD88N80','2023-07-05 02:28:10.268030'),('12gglunwkygm0to0ajdq4a8iuborypjd','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBjR4:q-iqB4WmuDB7X-rDJSMQ4ErRdMcfZ8oNLJUui-6dY8M','2023-07-04 22:02:50.315519'),('1cmocd74111x8k8204tcvzk3ehdnwrml','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBnZF:ZP_UxcqOVTW8A_TNe6UFDJ2Ei25GrPuP82sEEu1dnMI','2023-07-05 02:27:33.105021'),('1g7nzuhrvmcq9xv1jc9jsvsnc91fm31j','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBjmo:OsIaPKNAKWhAi6HcAJc4c2t1aY4u9GQQRdcnjg3Bh-o','2023-07-04 22:25:18.439571'),('32h56a0pbsqlngmoya1bjs1czhz98ckq','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBnm6:z3UmXbT3l73ESdXMjYuUiEgSWbPyOg6VmRM24mwQXms','2023-07-05 02:40:50.351707'),('3oplwp9r3oya87zvjx18dvkt2qbixfdn','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBgTF:nxTxYVKOuJcn9bEGjKavbOLN7o9MC9A7RETi7D7woD4','2023-07-04 18:52:53.589381'),('4qy74u95kd6gchyzzg5ej026n5v1kbzv','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBkUP:cLdbznRnVLcdRbhupOhT2e0NGGi3KJ4j9QHd6BCeW_M','2023-07-04 23:10:21.371523'),('737wioetwkt63iuw7uilak2dstg7hd0r','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBn9W:apg7WunH-KtPoBiOH5UmGW6C-81qBH63zBCw1bcgFlo','2023-07-05 02:00:58.849327'),('7m1me5sxf04vo0pd636gssaow2lyk284','.eJxVjDsOwjAQBe_iGlnrbxxKes5g7XptHECOFCcV4u4QKQW0b2beS0Tc1hq3npc4sTgLZcTpdyRMj9x2wndst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3Lg6TQeNJG7IGgmIqEACHMbhkB62Ly2PQhBYBiIG99WxUQutd8JTE-wMDwDfs:1qBoAh:4IH2zvCl3YCTW8O7os2VXrv0OhexR7isGaEsyHvH5L8','2023-07-05 03:06:15.376266'),('974vw439faqkni7cw5qvrnvx6y8vlath','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBjn6:MtKFqrlVoj5Nu0NKrwuiVRelC_nycUTmguqWaRisAaw','2023-07-04 22:25:36.678416'),('9qfvrwzlzuiwmgq22f7ty2663sgw37nb','.eJxVjDsOwjAQBe_iGlnrbxxKes5g7XptHECOFCcV4u4QKQW0b2beS0Tc1hq3npc4sTgLZcTpdyRMj9x2wndst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3Lg6TQeNJG7IGgmIqEACHMbhkB62Ly2PQhBYBiIG99WxUQutd8JTE-wMDwDfs:1qBo5h:u_8IWmdReZra58WY3oVU2qS3FpbzhKt3XlhQJnqx0uc','2023-07-05 03:01:05.246196'),('ag1bttn9i10gjo2um9tfl84hb0vc7fd9','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBgTa:qlfHANiRwYFCfA46rmPP6NYM0eu0KqL7dzkNrr6t2AU','2023-07-04 18:53:14.419067'),('b1s2ynl297grauauqae8dlu9aj7z3w61','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBnaM:dNnRedGUUL6X8oI0PXnUqWbgDenhuHpEYjvTGAMcppA','2023-07-05 02:28:42.395241'),('fj02rykieh44pwa3n0vmr1e6f76212jq','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBf1V:mCh5Ll1htbtFkLiOSnYM0LJ1TrNrsd27zoFRLSBjmq4','2023-07-04 17:20:09.148035'),('fksgn0cxezzjznb4x9yzih0j90xg97h0','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBoPk:scl1pHuS2XcSbmKZfESfznBNG4bUhXqMGI6LfCYHNoA','2023-07-05 03:21:48.809223'),('fn0mxz8icb03c8uiev2ibehdv2kt4ptl','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBmLz:56n3a5BfVjqJWPgzC6uvbxGc9qnQ-e1_e2ah37HZB04','2023-07-05 01:09:47.592060'),('iwwwrqfv2fwow2xw5aq0hsho8y50bnig','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBczO:wZ4TIyvPh6-PJp_KGfh_r32fuI0HvyOGnTfJfutQsQ4','2023-07-04 15:09:50.633315'),('kfjl7oepjb3zedi8rsha9s3xd0i9ge84','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBcuM:79pJp8RIH0TVp9L5VUxcwK4a-iYkDg62G5OAj91rX5E','2023-07-04 15:04:38.175457'),('kqp4iiahqogj99ek9o6ya8o62v7qb909','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBkrC:dUcrvBwsH3EOaCh-FtC1B8_rHTXWAT_JXxz-uuUMiEQ','2023-07-04 23:33:54.948642'),('ku097rrggpvk96gnpscvulp25i17pweb','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBjjV:kulDGHqw6sReKUBvcDNEo0ctL_wa_HTsQ6TIWR4kmv4','2023-07-04 22:21:53.482380'),('mp0h0tpj0ox948epuycrwkvk78bgk5z1','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBjmo:OsIaPKNAKWhAi6HcAJc4c2t1aY4u9GQQRdcnjg3Bh-o','2023-07-04 22:25:18.042569'),('nsllr0yqwma3kig8i4xpghrlnreobwdt','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBnXT:N-hTbHaFgbvrwLiz2b4ePDBmXEzKJyZzB7I6C6HGXRM','2023-07-05 02:25:43.172063'),('otwojsorhnpppmzcgqvt3o7i5npva1f5','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBnxG:Z5I2Y9E8g517tSkuz_quys5kNdgzPwywsaaoKb1p8eg','2023-07-05 02:52:22.628838'),('qlepaxd6p2zwqjk7ot4tgkwzsqria7dq','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBpdq:2_f9u_8U_FVH-UadhkCqziDKB_V17Ced_9PTwIgD9Qs','2023-07-05 04:40:26.123530'),('qp7talncfoltyy1hmuu9t617x9xit7mv','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBjQV:o458fvMsI4ryLTzEFQtHxmooSamAYkk8PMB087n0cQ4','2023-07-04 22:02:15.056014'),('re8fbbp24725c5uk5o3g25i38d1bu074','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBdxg:-2BoQdAVVzF_8XL4x1mwKi_QXItrJA5vl45mNPPohYQ','2023-07-04 16:12:08.837445'),('s6fr0jcm55ktrlf7k4gsbgx8m2753vhm','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBoC1:vMwHMRYdKITAcmk9F0Q3LVZg16x9YvZ8e8nAV0YIP0g','2023-07-05 03:07:37.741483'),('se313ey7pqgiywo056cg83wl2homb181','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBn2u:8aY7RWrABN92OF1-mcuDIP2j1AmWFv0JyWFH_4McB04','2023-07-05 01:54:08.007010'),('tq94s0r50i8lzdm9h1jtfjgoiz3ie0yd','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBkNy:F3ppcwEpsZi7yrW7MyytbBWED0LUUBKSUZ1Y8sCqb1c','2023-07-04 23:03:42.140708'),('u61gu1u4kj8jcqam7ghb85446r6ccv0c','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBe7s:1Z8Tb4apgXMSMZk6Vnf0WALXdRhqHE_LhjnhT-4Wbzw','2023-07-04 16:22:40.267418'),('w8lbmv7iiv7xyr79ipkd86nnf737yqr8','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBkTn:OxC5V-TugjbESaW6R0C8OHKyWc1eVqa_HY_uFkEWEA8','2023-07-04 23:09:43.108835'),('wbnq7mikzois6nvcut30sjwzbpiw1jda','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBpdO:S0x6xKCTPSJSMNjii5jdp140ABH76iu8WXgX6jHM4b4','2023-07-05 04:39:58.525190'),('wm01x5jrt4nqnucoirom8vlhsk3fm6ak','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBkU3:iyHnSu7PH-SI4uEST-QjYAoDTud2ZFAjqAkolBhfG2A','2023-07-04 23:09:59.419320'),('xg6xdu272kw6y7twsgjyndoi3jq75bj8','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBgUe:pSoVba33ysnzWBkT0aJSMTypP5qt7emjL-A3NGVH3JU','2023-07-04 18:54:20.836262'),('za5qaex398fvvzu7uk1fp5k6mvgvrw33','.eJxVjEEOwiAQAP_C2RAoZSkevfcNDQu7UjWQlPZk_Lsh6UGvM5N5iyUce16ORtuyJnEVWlx-GYb4pNJFeoRyrzLWsm8ryp7I0zY510Sv29n-DXJouW8BkL1yCMBoCcKU7ATGRpfYaIiKlR5IO0to3eBpNGj8yF4nbwiYxecL2zg3vw:1qBl15:ojf5QZ0S1i_mU4-P55wxXHGI3FMpSuIOBEMEE1yhuG8','2023-07-04 23:44:07.819430'),('zlez4uux9fi2mz8bf902gtkvvmjy2qp2','.eJxVjDsOwjAQBe_iGln-x6ak5wzW7nqDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWdhxOl3Q6AHtx2UO7TbLGlu6zKh3BV50C6vc-Hn5XD_Dir0-q0VU2BwTpHzIaBPMQWtx0TFeBycc36I1iQumKyC4MeIyKCVsWSBNIv3B8_iN6A:1qBnb8:9eKVwEAtjThinqk4oIRsMFKzGBabXeMw3daTl9tbefk','2023-07-05 02:29:30.787897'),('zn9tgq7ogomn72b4fr66pyloj5n0clcy','.eJxVjDsOwjAQBe_iGlmL5S8lPWewdtdeHECxlE8VcXeIlALaNzNvUxnXpeV1rlMeiroor06_GyE_67iD8sDx3jX3cZkG0ruiDzrrWy_1dT3cv4OGc_vWKOTYmioGHCQyhWyQ6oPECAglAEMVF88UowteGG0CMp5L8ogsrN4f_iw4yA:1qBpuW:hWMBH8t1S2mnQ5Qr7LgFLPbfzSyWdjnqljfrxm-bLFs','2023-07-05 04:57:40.284455');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pruebaback'
--

--
-- Dumping routines for database 'pruebaback'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21  1:58:25
