CREATE DATABASE  IF NOT EXISTS `shinsekai-db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shinsekai-db`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: shinsekai-db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `availablecolors`
--

DROP TABLE IF EXISTS `availablecolors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availablecolors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `colorName` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availablecolors`
--

LOCK TABLES `availablecolors` WRITE;
/*!40000 ALTER TABLE `availablecolors` DISABLE KEYS */;
INSERT INTO `availablecolors` VALUES (1,'Purple',NULL,NULL,NULL),(2,'Red',NULL,NULL,NULL),(3,'Puke',NULL,NULL,NULL),(4,'Pink',NULL,NULL,NULL),(5,'Mauv',NULL,NULL,NULL),(6,'Green',NULL,NULL,NULL),(7,'Crimson',NULL,NULL,NULL),(8,'Goldenrod',NULL,NULL,NULL),(9,'Maroon',NULL,NULL,NULL),(10,'Purple',NULL,NULL,NULL),(11,'Green',NULL,NULL,NULL),(12,'Purple',NULL,NULL,NULL),(13,'Puce',NULL,NULL,NULL),(14,'Teal',NULL,NULL,NULL),(15,'Maroon',NULL,NULL,NULL);
/*!40000 ALTER TABLE `availablecolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `imageFilename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Accesorios','product.jpg',NULL,NULL,NULL),(2,'Ropa','product.jpg',NULL,NULL,NULL),(3,'Calzado','product.jpg',NULL,NULL,NULL),(4,'Deportes','product.jpg',NULL,NULL,NULL),(5,'Electrónica','product.jpg',NULL,NULL,NULL),(6,'Hogar','product.jpg',NULL,NULL,NULL),(7,'Juguetes','product.jpg',NULL,NULL,NULL),(8,'Libros','product.jpg',NULL,NULL,NULL),(9,'Música','product.jpg',NULL,NULL,NULL),(10,'Videojuegos','product.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothessizes`
--

DROP TABLE IF EXISTS `clothessizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothessizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothessizes`
--

LOCK TABLES `clothessizes` WRITE;
/*!40000 ALTER TABLE `clothessizes` DISABLE KEYS */;
INSERT INTO `clothessizes` VALUES (1,'3XL',NULL,NULL,NULL),(2,'XXL',NULL,NULL,NULL),(3,'XL',NULL,NULL,NULL),(4,'L',NULL,NULL,NULL),(5,'M',NULL,NULL,NULL),(6,'S',NULL,NULL,NULL);
/*!40000 ALTER TABLE `clothessizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linkedaccounts`
--

DROP TABLE IF EXISTS `linkedaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linkedaccounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `auth` varchar(255) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_linkedAccounts_users_idx` (`user_id`),
  CONSTRAINT `fk_linkedAccounts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkedaccounts`
--

LOCK TABLES `linkedaccounts` WRITE;
/*!40000 ALTER TABLE `linkedaccounts` DISABLE KEYS */;
INSERT INTO `linkedaccounts` VALUES (1,'MercadoPago','nusequeponeraquí',1,NULL,NULL,NULL),(2,'MercadoPago','nusequeponeraquí',2,NULL,NULL,NULL),(3,'MercadoPago','nusequeponeraquí',3,NULL,NULL,NULL),(4,'MercadoPago','nusequeponeraquí',4,NULL,NULL,NULL),(5,'MercadoPago','nusequeponeraquí',5,NULL,NULL,NULL),(6,'MercadoPago','nusequeponeraquí',6,NULL,NULL,NULL),(7,'MercadoPago','nusequeponeraquí',7,NULL,NULL,NULL),(8,'MercadoPago','nusequeponeraquí',8,NULL,NULL,NULL),(9,'MercadoPago','nusequeponeraquí',9,NULL,NULL,NULL),(10,'MercadoPago','nusequeponeraquí',10,NULL,NULL,NULL),(11,'MercadoPago','nusequeponeraquí',11,NULL,NULL,NULL),(12,'MercadoPago','nusequeponeraquí',12,NULL,NULL,NULL),(13,'MercadoPago','nusequeponeraquí',13,NULL,NULL,NULL),(14,'MercadoPago','nusequeponeraquí',14,NULL,NULL,NULL),(15,'MercadoPago','nusequeponeraquí',15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `linkedaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metricsizes`
--

DROP TABLE IF EXISTS `metricsizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricsizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metricsizes`
--

LOCK TABLES `metricsizes` WRITE;
/*!40000 ALTER TABLE `metricsizes` DISABLE KEYS */;
INSERT INTO `metricsizes` VALUES (1,12,NULL,NULL,NULL),(2,26,NULL,NULL,NULL),(3,38,NULL,NULL,NULL),(4,44,NULL,NULL,NULL),(5,53,NULL,NULL,NULL),(6,61,NULL,NULL,NULL),(7,127,NULL,NULL,NULL),(8,68,NULL,NULL,NULL),(9,29,NULL,NULL,NULL),(10,310,NULL,NULL,NULL),(11,411,NULL,NULL,NULL),(12,112,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,45,NULL,NULL,NULL),(15,55,NULL,NULL,NULL);
/*!40000 ALTER TABLE `metricsizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcomments`
--

DROP TABLE IF EXISTS `productcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcomments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_productComments_users_idx` (`user_id`),
  KEY `fk_productComments_products_idx` (`product_id`),
  CONSTRAINT `fk_productComments_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_productComments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcomments`
--

LOCK TABLES `productcomments` WRITE;
/*!40000 ALTER TABLE `productcomments` DISABLE KEYS */;
INSERT INTO `productcomments` VALUES (1,'eget elit sodales scelerisque mauris sit amet',5,3,NULL,NULL,NULL),(2,'pellentesque quisque porta volutpat erat quisque erat eros viverra',4,2,NULL,NULL,NULL),(3,'condimentum neque sapien placerat ante nulla',2,4,NULL,NULL,NULL),(4,'curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor',1,1,NULL,NULL,NULL),(5,'elementum ligula vehicula consequat morbi a ipsum integer a',4,1,NULL,NULL,NULL),(6,'duis bibendum morbi non quam nec dui luctus rutrum nulla',3,4,NULL,NULL,NULL),(7,'venenatis turpis enim blandit mi in porttitor',3,2,NULL,NULL,NULL),(8,'velit vivamus vel nulla eget eros elementum',3,3,NULL,NULL,NULL),(9,'ipsum primis in faucibus orci luctus et',1,1,NULL,NULL,NULL),(10,'diego gay',3,4,NULL,NULL,NULL),(11,'maecenas rhoncus aliquam lacus morbi quis tortor id nulla',1,1,NULL,NULL,NULL),(12,'turpis elementum ligula vehicula consequat morbi a ipsum integer a',4,1,NULL,NULL,NULL),(13,'quisque ut erat curabitur gravida',1,1,NULL,NULL,NULL),(14,'in sagittis dui vel nisl',4,2,NULL,NULL,NULL),(15,'sed ante vivamus tortor duis mattis egestas metus aenean',1,3,NULL,NULL,NULL),(16,'suspendisse potenti in eleifend quam',3,5,NULL,NULL,NULL),(17,'accumsan tortor quis turpis sed ante vivamus tortor duis mattis',4,5,NULL,NULL,NULL),(18,'justo in blandit ultrices',4,2,NULL,NULL,NULL),(19,'donec pharetra magna vestibulum aliquet ultrices erat tortor',3,2,NULL,NULL,NULL),(20,'adipiscing molestie hendrerit at vulputate vitae nisl aenean',2,5,NULL,NULL,NULL),(21,'sodales sed tincidunt eu felis fusce posuere',1,5,NULL,NULL,NULL),(22,'nullam orci pede venenatis non sodales',2,2,NULL,NULL,NULL),(23,'interdum in ante',1,4,NULL,NULL,NULL),(24,'ut volutpat sapien arcu sed augue aliquam erat volutpat',5,2,NULL,NULL,NULL),(25,'justo morbi ut odio cras mi',4,2,NULL,NULL,NULL),(26,'tristique fusce congue diam',2,5,NULL,NULL,NULL),(27,'eget massa tempor convallis nulla neque libero',4,2,NULL,NULL,NULL),(28,'integer ac neque duis bibendum morbi non',1,5,NULL,NULL,NULL),(29,'eleifend pede libero quis orci',1,4,NULL,NULL,NULL),(30,'at velit eu',2,1,NULL,NULL,NULL),(31,'maecenas leo odio condimentum id luctus nec',4,2,NULL,NULL,NULL),(32,'elit proin risus praesent lectus vestibulum',5,3,NULL,NULL,NULL),(33,'erat quisque erat eros viverra eget',2,5,NULL,NULL,NULL),(34,'porttitor lacus at turpis',5,5,NULL,NULL,NULL),(35,'ut dolor morbi vel lectus in',4,4,NULL,NULL,NULL),(36,'amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus',4,5,NULL,NULL,NULL),(37,'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel',4,4,NULL,NULL,NULL),(38,'in congue etiam justo',3,4,NULL,NULL,NULL),(39,'lacinia sapien quis libero nullam sit amet turpis elementum',5,1,NULL,NULL,NULL),(40,'leo odio condimentum id',3,3,NULL,NULL,NULL),(41,'at nunc commodo',5,1,NULL,NULL,NULL),(42,'sit amet eleifend pede libero quis orci',3,2,NULL,NULL,NULL),(43,'rutrum nulla tellus in sagittis dui vel nisl duis',5,2,NULL,NULL,NULL),(44,'sit amet eros suspendisse accumsan',1,3,NULL,NULL,NULL),(45,'diam cras pellentesque volutpat dui',5,5,NULL,NULL,NULL),(87,'dasdasd asdd a',2,31,'2022-12-20 04:14:29','2022-12-20 04:14:29',NULL);
/*!40000 ALTER TABLE `productcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_productImages_product_idx` (`product_id`),
  CONSTRAINT `fk_productImages_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (1,'product-noimg.png',1,NULL,NULL,'2022-11-23 23:43:59'),(2,'product-noimg.png',1,NULL,NULL,'2022-11-23 23:43:59'),(3,'oro1.png',2,NULL,NULL,NULL),(4,'oro2.png',2,NULL,NULL,NULL),(5,'plata1.png',3,NULL,NULL,NULL),(6,'plata2.png',3,NULL,NULL,NULL),(7,'bronce1.png',4,NULL,NULL,NULL),(8,'bronce2.png',4,NULL,NULL,NULL),(9,'hierro1.png',5,NULL,NULL,NULL),(10,'hierro2.png',5,NULL,NULL,NULL),(11,'product-noimg.png',6,NULL,NULL,'2022-10-26 19:28:02'),(12,'product-noimg.png',6,NULL,NULL,'2022-10-26 19:28:02'),(13,'bakugo2.png',7,NULL,NULL,'2022-10-26 19:00:54'),(14,'bakugo1.png',7,NULL,NULL,'2022-10-26 19:00:54'),(15,'img-1.png',8,NULL,NULL,'2022-10-26 19:04:04'),(16,'img-2.png',8,NULL,NULL,'2022-10-26 19:04:04'),(17,'img-3.png',9,NULL,NULL,NULL),(18,'img-4.png',9,NULL,NULL,NULL),(19,'img-5.png',10,NULL,NULL,NULL),(20,'img-6.png',10,NULL,NULL,NULL),(21,'img-7.png',11,NULL,NULL,'2022-11-23 23:31:44'),(22,'img-8.png',11,NULL,NULL,'2022-11-23 23:31:44'),(23,'img-9.png',12,NULL,NULL,NULL),(24,'img-10.png',12,NULL,NULL,NULL),(25,'img-11.png',13,NULL,NULL,NULL),(26,'img-12.png',13,NULL,NULL,NULL),(27,'img-13.png',14,NULL,NULL,NULL),(28,'img-14.png',14,NULL,NULL,NULL),(29,'img-15.png',15,NULL,NULL,NULL),(30,'img-16.png',15,NULL,NULL,NULL),(33,'product-1666809265841.png',19,'2022-10-26 18:34:25','2022-10-26 18:34:25',NULL),(34,'product-1666809265844.png',19,'2022-10-26 18:34:25','2022-10-26 18:34:25',NULL),(35,'product-1666810786743.png',16,'2022-10-26 18:59:46','2022-10-26 18:59:46','2022-10-26 19:05:18'),(36,'product-1666811044198.jpg',8,'2022-10-26 19:04:04','2022-10-26 19:04:04',NULL),(37,'product-1666811044200.png',8,'2022-10-26 19:04:04','2022-10-26 19:04:04',NULL),(38,'product-1666811118615.png',16,'2022-10-26 19:05:18','2022-10-26 19:05:18','2022-10-26 19:05:40'),(39,'product-1666811118634.png',16,'2022-10-26 19:05:18','2022-10-26 19:05:18','2022-10-26 19:05:40'),(40,'product-1666811140341.png',16,'2022-10-26 19:05:40','2022-10-26 19:05:40','2022-10-26 19:05:50'),(41,'product-1666811140346.png',16,'2022-10-26 19:05:40','2022-10-26 19:05:40','2022-10-26 19:05:50'),(42,'product-1666811150307.png',16,'2022-10-26 19:05:50','2022-10-26 19:05:50',NULL),(43,'product-1666811150314.png',16,'2022-10-26 19:05:50','2022-10-26 19:05:50',NULL),(44,'product-1666812482239.png',6,'2022-10-26 19:28:02','2022-10-26 19:28:02',NULL),(45,'product-1666812482250.png',6,'2022-10-26 19:28:02','2022-10-26 19:28:02',NULL),(46,'product-1669246304705.png',11,'2022-11-23 23:31:45','2022-11-23 23:31:45',NULL),(47,'product-1669246304844.jpg',11,'2022-11-23 23:31:45','2022-11-23 23:31:45',NULL),(48,'product-1669247016410.jpg',7,'2022-11-23 23:43:36','2022-11-23 23:43:36',NULL),(49,'product-1669247016412.jpg',7,'2022-11-23 23:43:36','2022-11-23 23:43:36',NULL),(50,'product-1669247039854.jpeg',1,'2022-11-23 23:43:59','2022-11-23 23:43:59','2022-12-05 22:35:55'),(51,'product-1669247039876.jpeg',1,'2022-11-23 23:43:59','2022-11-23 23:43:59','2022-12-05 22:35:55'),(52,'product-1670129433408.png',21,'2022-12-04 04:50:33','2022-12-04 04:50:33',NULL),(53,'product-1670198612027.png',22,'2022-12-05 00:03:32','2022-12-05 00:03:32',NULL),(54,'product-1670198612028.jpg',22,'2022-12-05 00:03:32','2022-12-05 00:03:32',NULL),(55,'product-1670198612029.jpg',22,'2022-12-05 00:03:32','2022-12-05 00:03:32',NULL),(56,'product-1670271691494.jpg',23,'2022-12-05 20:21:31','2022-12-05 20:21:31',NULL),(57,'product-1670279754874.png',1,'2022-12-05 22:35:55','2022-12-05 22:35:55',NULL),(58,'product-1670279754985.png',1,'2022-12-05 22:35:55','2022-12-05 22:35:55',NULL),(59,'product-1670363407041.png',24,'2022-12-06 21:50:08','2022-12-06 21:50:08',NULL),(60,'product-1670363620232.png',25,'2022-12-06 21:53:40','2022-12-06 21:53:40',NULL),(61,'product-1670363688019.jpg',26,'2022-12-06 21:54:48','2022-12-06 21:54:48',NULL),(62,'product-1670363962169.mp4',27,'2022-12-06 21:59:22','2022-12-06 21:59:22',NULL),(63,'product-1671508876939.jpg',28,'2022-12-20 04:01:17','2022-12-20 04:01:17',NULL),(64,'product-1671509024276.jpg',29,'2022-12-20 04:03:44','2022-12-20 04:03:44',NULL),(65,'product-1671509483486.jpg',30,'2022-12-20 04:11:23','2022-12-20 04:11:23',NULL),(66,'product-1671509648808.jpg',31,'2022-12-20 04:14:09','2022-12-20 04:14:09',NULL),(67,'product-1671510050539.jpg',32,'2022-12-20 04:20:50','2022-12-20 04:20:50','2022-12-20 06:17:47'),(68,'product-1671517067421.png',32,'2022-12-20 06:17:47','2022-12-20 06:17:47',NULL),(69,'product-1671517067465.png',32,'2022-12-20 06:17:47','2022-12-20 06:17:47',NULL),(70,'product-1671517067467.jpg',32,'2022-12-20 06:17:47','2022-12-20 06:17:47',NULL),(71,'product-1671519533115.png',33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 07:00:18'),(72,'product-1671519533115.png',33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 07:00:18'),(73,'product-1671519533123.png',33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 07:00:18'),(74,'product-1671519533139.jpg',33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 07:00:18'),(75,'product-1671519533140.jpg',33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 07:00:18'),(76,'product-1671519533141.jpg',33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 07:00:18'),(77,'product-1671519533142.jpeg',33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 07:00:18'),(78,'product-1671519618104.png',33,'2022-12-20 07:00:18','2022-12-20 07:00:18','2022-12-20 07:01:01'),(79,'product-1671519618104.png',33,'2022-12-20 07:00:18','2022-12-20 07:00:18','2022-12-20 07:01:01'),(80,'product-1671519618118.png',33,'2022-12-20 07:00:18','2022-12-20 07:00:18','2022-12-20 07:01:01'),(81,'product-1671519618132.jpg',33,'2022-12-20 07:00:18','2022-12-20 07:00:18','2022-12-20 07:01:01'),(82,'product-1671519618134.jpg',33,'2022-12-20 07:00:18','2022-12-20 07:00:18','2022-12-20 07:01:01'),(83,'product-1671519618136.jpeg',33,'2022-12-20 07:00:18','2022-12-20 07:00:18','2022-12-20 07:01:01'),(84,'product-1671519661627.png',33,'2022-12-20 07:01:01','2022-12-20 07:01:01',NULL),(85,'product-1671519661631.png',33,'2022-12-20 07:01:01','2022-12-20 07:01:01',NULL),(86,'product-1671519661637.jpg',33,'2022-12-20 07:01:01','2022-12-20 07:01:01',NULL),(87,'product-1671519661640.jpg',33,'2022-12-20 07:01:01','2022-12-20 07:01:01',NULL),(88,'product-1671519661640.png',33,'2022-12-20 07:01:01','2022-12-20 07:01:01',NULL),(89,'product-1671519661676.png',33,'2022-12-20 07:01:01','2022-12-20 07:01:01',NULL);
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productreviews`
--

DROP TABLE IF EXISTS `productreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productreviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `points` int NOT NULL DEFAULT '5',
  `content` text NOT NULL,
  `karma` int NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_productReviews_users_idx` (`user_id`),
  KEY `fk_productReviews_products_idx` (`product_id`),
  CONSTRAINT `fk_productReviews_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_productReviews_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productreviews`
--

LOCK TABLES `productreviews` WRITE;
/*!40000 ALTER TABLE `productreviews` DISABLE KEYS */;
INSERT INTO `productreviews` VALUES (1,1,'curae mauris viverra diam vitae quam',19,3,3,NULL,NULL,NULL),(2,4,'vulputate nonummy maecenas tincidunt lacus at velit vivamus',-23,5,2,NULL,NULL,NULL),(3,10,'pulvinar nulla pede ullamcorper augue a suscipit nulla elit',25,4,2,NULL,NULL,NULL),(4,2,'eu interdum eu tincidunt in leo maecenas',21,5,3,NULL,NULL,NULL),(5,7,'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras',-13,5,1,NULL,NULL,NULL),(6,2,'ac tellus semper interdum',-6,1,4,NULL,NULL,NULL),(7,9,'sociis natoque penatibus et magnis dis parturient montes',-8,4,4,NULL,NULL,NULL),(8,6,'penatibus et magnis dis parturient',-3,3,2,NULL,NULL,NULL),(9,3,'sagittis sapien cum sociis natoque penatibus et',12,2,4,NULL,NULL,NULL),(10,7,'convallis eget eleifend luctus ultricies eu nibh quisque',3,4,1,NULL,NULL,NULL),(11,8,'ante vestibulum ante ipsum primis in faucibus orci luctus et',-10,3,4,NULL,NULL,NULL),(12,8,'feugiat non pretium quis lectus suspendisse',5,4,2,NULL,NULL,NULL),(13,10,'erat vestibulum sed',0,4,3,NULL,NULL,NULL),(14,4,'justo in blandit ultrices enim lorem ipsum dolor sit amet',-24,1,2,NULL,NULL,NULL),(15,5,'ante vestibulum ante ipsum primis in faucibus orci luctus et',-3,1,4,NULL,NULL,NULL),(16,10,'vel accumsan tellus nisi eu orci',-3,5,1,NULL,NULL,NULL),(17,6,'eu interdum eu tincidunt in leo maecenas pulvinar lobortis est',-7,3,5,NULL,NULL,NULL),(18,7,'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing',-6,1,1,NULL,NULL,NULL),(19,3,'faucibus accumsan odio curabitur convallis duis consequat dui',-5,5,1,NULL,NULL,NULL),(20,1,'ac leo pellentesque ultrices mattis odio donec vitae',-6,4,3,NULL,NULL,NULL),(21,6,'in quis justo',-22,4,2,NULL,NULL,NULL),(22,5,'enim blandit mi in porttitor pede justo',-8,1,2,NULL,NULL,NULL),(23,5,'consequat morbi a ipsum integer a nibh in quis',16,5,1,NULL,NULL,NULL),(24,6,'ipsum dolor sit amet consectetuer adipiscing elit',8,4,2,NULL,NULL,NULL),(25,6,'nisi venenatis tristique fusce congue',17,5,4,NULL,NULL,NULL),(26,1,'consectetuer adipiscing elit proin',6,1,1,NULL,NULL,NULL),(27,6,'congue diam id ornare imperdiet sapien urna',16,3,2,NULL,NULL,NULL),(28,3,'sapien cursus vestibulum proin',18,4,1,NULL,NULL,NULL),(29,4,'ut tellus nulla ut erat id mauris vulputate elementum',-24,5,5,NULL,NULL,NULL),(30,7,'mattis pulvinar nulla pede ullamcorper augue',6,4,4,NULL,NULL,NULL),(31,3,'nec molestie sed justo pellentesque viverra',-14,3,5,NULL,NULL,NULL),(32,2,'tellus in sagittis',-7,5,5,NULL,NULL,NULL),(33,3,'orci mauris lacinia sapien quis',-11,2,5,NULL,NULL,NULL),(34,1,'vitae ipsum aliquam non mauris morbi non',2,4,4,NULL,NULL,NULL),(35,5,'purus eu magna vulputate luctus cum sociis',20,4,2,NULL,NULL,NULL),(36,10,'eget massa tempor convallis nulla neque libero convallis',-21,2,5,NULL,NULL,NULL),(37,8,'id ligula suspendisse ornare consequat lectus in est risus auctor',15,2,1,NULL,NULL,NULL),(38,4,'justo maecenas rhoncus aliquam lacus morbi',-24,2,1,NULL,NULL,NULL),(39,3,'ac enim in tempor turpis nec euismod',7,1,1,NULL,NULL,NULL),(40,1,'pede libero quis',22,2,4,NULL,NULL,NULL),(41,6,'faucibus orci luctus et ultrices posuere cubilia curae donec',0,5,2,NULL,NULL,NULL),(42,10,'erat curabitur gravida nisi at nibh in hac habitasse platea',-5,1,2,NULL,NULL,NULL),(43,1,'suscipit a feugiat et eros',-2,5,2,NULL,NULL,NULL),(44,3,'erat id mauris vulputate elementum nullam varius nulla facilisi cras',-24,2,2,NULL,NULL,NULL),(45,2,'in ante vestibulum ante ipsum primis in faucibus orci luctus',-22,5,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `productreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `price` float unsigned NOT NULL,
  `discount` int unsigned DEFAULT '0',
  `description` text,
  `views` int unsigned NOT NULL DEFAULT '0',
  `category_id` int unsigned DEFAULT NULL,
  `sale_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_products_sales_idx` (`sale_id`),
  KEY `fk_products_categories_idx` (`category_id`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_sales` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Xi Jinping',333,50,'El dictador de china más amado por todos.\r\n动态网自由门 天安門 天安门 法輪功 李洪志 Free Tibet 六四天安門事件 The Tiananmen Square protests of 1989 天安門大屠殺 The Tiananmen Square Massacre 反右派鬥爭 The Anti-Rightist Struggle 大躍進政策 The Great Leap Forward 文化大革命 The Great Proletarian Cultural Revolution 人權 Human Rights 民運 Democratization 自由 Freedom 獨立 Independence 多黨制 Multi-party system 台灣 臺灣 Taiwan Formosa 中華民國 Republic of China 西藏 土伯特 唐古特 Tibet 達賴喇嘛 Dalai Lama 法輪功 Falun Dafa 新疆維吾爾自治區 The Xinjiang Uyghur Autonomous Region 諾貝爾和平獎 Nobel Peace Prize 劉暁波 Liu Xiaobo 民主 言論 思想 反共 反革命 抗議 運動 騷亂 暴亂 騷擾 擾亂 抗暴 平反 維權 示威游行 李洪志 法輪大法 大法弟子 強制斷種 強制堕胎 民族淨化 人體實驗 肅清 胡耀邦 趙紫陽 魏京生 王丹 還政於民 和平演變 激流中國 北京之春 大紀元時報 九評論共産黨 獨裁 專制 壓制 統一 監視 鎮壓 迫害 侵略 掠奪 破壞 拷問 屠殺 活摘器官 誘拐 買賣人口 遊進 走私 毒品 賣淫 春畫 賭博 六合彩 天安門 天安门 法輪功 李洪志 Winnie the Pooh 劉曉波动态网自由门',217,2,4,NULL,'2022-12-20 08:21:09',NULL),(2,'Saskatoon Berries - Frozen',128,50,'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna',461,1,1,NULL,NULL,NULL),(3,'Sole - Iqf',38,0,'mi integer ac neque duis bibendum morbi non quam nec',382,5,4,NULL,NULL,NULL),(4,'Syrup - Golden, Lyles',193,70,'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante',65,5,3,NULL,NULL,NULL),(5,'Muffin Chocolate Individual Wrap',93,30,'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae',155,3,3,NULL,NULL,NULL),(6,'Marjoram - Dried, Rubbed',119,70,'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis',325,1,2,NULL,'2022-10-26 19:28:02',NULL),(7,'ERIC-X-BAKUGO Limited Edition',112,50,'eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo',246,5,2,NULL,'2022-11-23 23:43:36',NULL),(8,'Veal - Insides Provini editing',83,30,'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat',181,4,5,NULL,'2022-10-26 19:04:04',NULL),(9,'Veal - Chops, Split, Frenched',141,50,'hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla',217,4,5,NULL,NULL,NULL),(10,'Noodles - Cellophane, Thin',179,50,'congue eget semper rutrum nulla nunc purus phasellus in felis donec',230,1,5,NULL,NULL,NULL),(11,'Ice Cream Bar - Rolo Cone',112,90,'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate',400,5,4,NULL,'2022-12-17 08:23:17','2022-12-17 08:23:17'),(12,'Nantucket Orange Juice',166,70,'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae',43,4,1,NULL,NULL,NULL),(13,'Wine - Semi Dry Riesling Vineland',64,30,'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit',50,5,2,NULL,NULL,NULL),(14,'Mushroom - Enoki, Fresh',181,90,'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum',16,2,3,NULL,NULL,NULL),(15,'Oil - Olive Bertolli',159,70,'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla',301,5,4,NULL,NULL,NULL),(16,'asdds',2,2,'asd',0,NULL,NULL,'2022-10-24 20:24:59','2022-12-18 20:13:35','2022-12-18 20:13:35'),(17,'testproduct',12312,12,'sdas',0,NULL,NULL,'2022-10-26 03:18:50','2022-10-26 03:19:00','2022-10-26 03:19:00'),(19,'Based dog',123123,1,'Not too fond of gay people',0,NULL,NULL,'2022-10-26 18:34:25','2022-10-26 18:34:25',NULL),(20,'asd',231,1,'sadasd',0,NULL,NULL,'2022-11-26 03:11:45','2022-12-06 22:02:12','2022-12-06 22:02:12'),(21,'amogus',999,10,'amogusksodaskda odkadopa jasod askd aslkdñasdoaskas ñ',0,1,NULL,'2022-12-04 04:50:33','2022-12-20 18:42:53',NULL),(22,'Chihuahua',1,100,'Chihuahua de mascota, sirve para no hacerte sentir solo pero se pone demasiado pesado. Bozal, fernet y pastillas para dormir incluidas.',0,NULL,NULL,'2022-12-05 00:03:32','2022-12-20 07:01:22','2022-12-20 07:01:22'),(23,'dasdad',32,3,'22423rfas das ad  a dasdad asd ad',0,NULL,NULL,'2022-12-05 20:21:31','2022-12-05 20:21:31',NULL),(24,'',2,122,'23',0,NULL,NULL,'2022-12-06 21:50:07','2022-12-06 21:51:14','2022-12-06 21:51:14'),(25,'',1,1222,'',0,NULL,NULL,'2022-12-06 21:53:40','2022-12-06 21:54:19','2022-12-06 21:54:19'),(26,'',12222,11111,'a',0,NULL,NULL,'2022-12-06 21:54:48','2022-12-06 21:54:54','2022-12-06 21:54:54'),(27,'',3,12,'asd',0,NULL,NULL,'2022-12-06 21:59:22','2022-12-06 22:00:20','2022-12-06 22:00:20'),(28,'zaboomafoo',12,2,'ssaasd asd asd asd asd adasd asd as dasd as',0,NULL,NULL,'2022-12-20 04:01:17','2022-12-20 04:01:26','2022-12-20 04:01:26'),(29,'asdasd',122,2,'djasd koasdoaskd oasd oakd oaskd oakd oaoak oak okoa skdoad ksaod ja doasp dkaso jaso asdk as doasjd asod askd oa',0,NULL,NULL,'2022-12-20 04:03:44','2022-12-20 04:04:02','2022-12-20 04:04:02'),(30,'dsadsadasdas',123,2,'asdasdasdav vasdasdasdaasdasdasdaasdasdasdaasdas dasdaasdasdasdaasda sdasdaasdasdasdaasdasdasdaasdasdasda',0,NULL,NULL,'2022-12-20 04:11:23','2022-12-20 04:11:38','2022-12-20 04:11:38'),(31,'zaboomafoo',122,2,'sadadssdadasdas dada sad ad a sad asad dasdasdasd adsa asd asd asd a dasd asd sad ad s sdsa asd asd asd s',0,4,NULL,'2022-12-20 04:14:08','2022-12-20 04:14:38','2022-12-20 04:14:38'),(32,'dasdasdasdsssssssss',123,1,'asdasdasdasdasddasdasddadasdadas ad add  da ds',0,10,NULL,'2022-12-20 04:20:50','2022-12-20 06:17:57','2022-12-20 06:17:57'),(33,'Diego gay',1,0,'gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay gay',0,3,NULL,'2022-12-20 06:58:53','2022-12-20 07:01:09','2022-12-20 07:01:09');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_availablecolors`
--

DROP TABLE IF EXISTS `products_availablecolors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_availablecolors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `availableColor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_products_availableColors_products_idx` (`product_id`),
  KEY `fk_products_availableColors_availableColors_idx` (`availableColor_id`),
  CONSTRAINT `fk_products_availableColors_availableColors` FOREIGN KEY (`availableColor_id`) REFERENCES `availablecolors` (`id`),
  CONSTRAINT `fk_products_availableColors_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_availablecolors`
--

LOCK TABLES `products_availablecolors` WRITE;
/*!40000 ALTER TABLE `products_availablecolors` DISABLE KEYS */;
INSERT INTO `products_availablecolors` VALUES (1,1,1,NULL,NULL,NULL),(2,1,2,NULL,NULL,NULL),(3,1,3,NULL,NULL,NULL),(4,1,4,NULL,NULL,NULL),(5,1,5,NULL,NULL,NULL),(6,1,6,NULL,NULL,NULL),(7,1,7,NULL,NULL,NULL),(8,1,8,NULL,NULL,NULL),(9,1,9,NULL,NULL,NULL),(10,1,10,NULL,NULL,NULL),(11,1,11,NULL,NULL,NULL),(12,1,12,NULL,NULL,NULL),(13,1,13,NULL,NULL,NULL),(14,1,14,NULL,NULL,NULL),(15,1,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_availablecolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_clothessizes`
--

DROP TABLE IF EXISTS `products_clothessizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_clothessizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `clothesSize_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_products_clothesSizes_clothesSizes_idx` (`clothesSize_id`),
  KEY `fk_products_clothesSizes_products_idx` (`product_id`),
  CONSTRAINT `fk_products_clothesSizes_clothesSizes` FOREIGN KEY (`clothesSize_id`) REFERENCES `clothessizes` (`id`),
  CONSTRAINT `fk_products_clothesSizes_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_clothessizes`
--

LOCK TABLES `products_clothessizes` WRITE;
/*!40000 ALTER TABLE `products_clothessizes` DISABLE KEYS */;
INSERT INTO `products_clothessizes` VALUES (1,2,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,2,3,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL),(5,2,5,NULL,NULL,NULL),(6,2,6,NULL,NULL,NULL),(7,3,1,NULL,NULL,NULL),(8,3,2,NULL,NULL,NULL),(9,3,3,NULL,NULL,NULL),(10,3,4,NULL,NULL,NULL),(11,3,5,NULL,NULL,NULL),(12,3,6,NULL,NULL,NULL),(13,4,1,NULL,NULL,NULL),(14,4,2,NULL,NULL,NULL),(15,4,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_clothessizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_metricsizes`
--

DROP TABLE IF EXISTS `products_metricsizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_metricsizes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `metricSize_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_products_metricSizes_product_idx` (`product_id`),
  KEY `fk_products_metricSizes_metricSizes_idx` (`metricSize_id`),
  CONSTRAINT `fk_products_metricSizes_metricSizes` FOREIGN KEY (`metricSize_id`) REFERENCES `metricsizes` (`id`),
  CONSTRAINT `fk_products_metricSizes_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_metricsizes`
--

LOCK TABLES `products_metricsizes` WRITE;
/*!40000 ALTER TABLE `products_metricsizes` DISABLE KEYS */;
INSERT INTO `products_metricsizes` VALUES (1,5,1,NULL,NULL,NULL),(2,5,2,NULL,NULL,NULL),(3,5,3,NULL,NULL,NULL),(4,5,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,5,6,NULL,NULL,NULL),(7,5,7,NULL,NULL,NULL),(8,5,8,NULL,NULL,NULL),(9,5,9,NULL,NULL,NULL),(10,5,10,NULL,NULL,NULL),(11,5,11,NULL,NULL,NULL),(12,5,12,NULL,NULL,NULL),(13,5,13,NULL,NULL,NULL),(14,5,14,NULL,NULL,NULL),(15,5,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_metricsizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasedhistories`
--

DROP TABLE IF EXISTS `purchasedhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasedhistories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_purchasedHistories_users_idx` (`user_id`),
  CONSTRAINT `fk_purchasedHistories_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasedhistories`
--

LOCK TABLES `purchasedhistories` WRITE;
/*!40000 ALTER TABLE `purchasedhistories` DISABLE KEYS */;
INSERT INTO `purchasedhistories` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchasedhistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasedhistories_products`
--

DROP TABLE IF EXISTS `purchasedhistories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasedhistories_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchasedHistory_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_purchasedHistories_products_purchasedHistories_idx` (`purchasedHistory_id`),
  KEY `fk_purchasedHistories_products_products_idx` (`product_id`),
  CONSTRAINT `fk_purchasedHistories_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_purchasedHistories_products_purchasedHistories` FOREIGN KEY (`purchasedHistory_id`) REFERENCES `purchasedhistories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasedhistories_products`
--

LOCK TABLES `purchasedhistories_products` WRITE;
/*!40000 ALTER TABLE `purchasedhistories_products` DISABLE KEYS */;
INSERT INTO `purchasedhistories_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchasedhistories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorders`
--

DROP TABLE IF EXISTS `purchaseorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_purchaseOrders_users_idx` (`user_id`),
  CONSTRAINT `fk_purchaseOrders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorders`
--

LOCK TABLES `purchaseorders` WRITE;
/*!40000 ALTER TABLE `purchaseorders` DISABLE KEYS */;
INSERT INTO `purchaseorders` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchaseorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorders_products`
--

DROP TABLE IF EXISTS `purchaseorders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorders_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchaseOrder_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_purchaseOrders_products_purchaseOrders_idx` (`purchaseOrder_id`),
  KEY `fk_purchaseOrders_products_products_idx` (`product_id`),
  CONSTRAINT `fk_purchaseOrders_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_purchaseOrders_products_purchaseOrders` FOREIGN KEY (`purchaseOrder_id`) REFERENCES `purchaseorders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorders_products`
--

LOCK TABLES `purchaseorders_products` WRITE;
/*!40000 ALTER TABLE `purchaseorders_products` DISABLE KEYS */;
INSERT INTO `purchaseorders_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchaseorders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `imageFilename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'Black Friday','MICArte.jpg',NULL,NULL,NULL),(2,'Cyber Monday','MICArte.jpg',NULL,NULL,NULL),(3,'Navidá','MICArte.jpg',NULL,NULL,NULL),(4,'Carnaval','MICArte.jpg',NULL,NULL,NULL),(5,'Dia del padre','MICArte.jpg',NULL,NULL,NULL),(6,'Dia de la madre','MICArte.jpg',NULL,NULL,NULL),(7,'Dia del niño','MICArte.jpg',NULL,NULL,NULL),(8,'Dia del amigo','MICArte.jpg',NULL,NULL,NULL),(9,'Dia de la mujer','MICArte.jpg',NULL,NULL,NULL),(10,'Dia de la independencia','MICArte.jpg',NULL,NULL,NULL),(11,'Dia de la primavera','MICArte.jpg',NULL,NULL,NULL),(12,'Dia de la patria','MICArte.jpg',NULL,NULL,NULL),(13,'Dia de la tierra','MICArte.jpg',NULL,NULL,NULL),(14,'Dia de la juventud','MICArte.jpg',NULL,NULL,NULL),(15,'Dia de la familia','MICArte.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'Subscripción base','Además de contar con un descuento de suscriptor, tendra la opción de leer los comics o mangas de manera online totalmente grátis.',5,NULL,NULL,NULL),(2,'La caja (Hierro)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 4 artículos.',10,NULL,NULL,NULL),(3,'La caja (Bronce)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 6 artículos.',20,NULL,NULL,NULL),(4,'La caja (Plata)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 8 artículos.',30,NULL,NULL,NULL),(5,'La caja (Oro)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 12 artículos.',40,NULL,NULL,NULL),(6,'Miembro de honor (Hierro)','En esta suscripcion se obtendran \"La caja\" (Hierro) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',12,NULL,NULL,NULL),(7,'Miembro de honor (Bronce)','En esta suscripcion se obtendran \"La caja\" (Bronce) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',18,NULL,NULL,NULL),(8,'Miembro de honor (Plata)','En esta suscripcion se obtendran \"La caja\" (Plata) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',28,NULL,NULL,NULL),(9,'Miembro de honor (Oro)','En esta suscripcion se obtendran \"La caja\" (Oro) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',38,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `imageFilename` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'anime','anime.jpeg',NULL,NULL,NULL),(2,'ratt','tag2.png',NULL,NULL,NULL),(3,'niggrem','tag3.png',NULL,NULL,NULL),(4,'diegum gae','tag4.png',NULL,NULL,NULL),(5,'clothes','clothes.jpg',NULL,NULL,NULL),(6,'comics','comics.jpg',NULL,NULL,NULL),(7,'nibbha','tag5.png',NULL,NULL,NULL),(8,'games','games.png',NULL,NULL,NULL),(9,'rol','rol.jpg',NULL,NULL,NULL),(10,'tortor','tag10.png',NULL,NULL,NULL),(11,'cum','tag11.png',NULL,NULL,NULL),(12,'nunc','tag12.png',NULL,NULL,NULL),(13,'aliquam','tag13.png',NULL,NULL,NULL),(14,'mhni herik','tag14.png',NULL,NULL,NULL),(15,'varius ut','tag15.png',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_products`
--

DROP TABLE IF EXISTS `tags_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tags_products_tags_idx` (`tag_id`),
  KEY `fk_tags_products_products_idx` (`product_id`),
  CONSTRAINT `fk_tags_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_tags_products_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_products`
--

LOCK TABLES `tags_products` WRITE;
/*!40000 ALTER TABLE `tags_products` DISABLE KEYS */;
INSERT INTO `tags_products` VALUES (1,1,1,NULL,NULL,'2022-12-20 08:21:09'),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL),(16,5,30,'2022-12-20 04:11:23','2022-12-20 04:11:23',NULL),(17,6,30,'2022-12-20 04:11:23','2022-12-20 04:11:23',NULL),(18,8,30,'2022-12-20 04:11:23','2022-12-20 04:11:23',NULL),(19,10,30,'2022-12-20 04:11:23','2022-12-20 04:11:23',NULL),(20,3,31,'2022-12-20 04:14:09','2022-12-20 04:14:09',NULL),(21,6,31,'2022-12-20 04:14:09','2022-12-20 04:14:09',NULL),(22,7,31,'2022-12-20 04:14:09','2022-12-20 04:14:09',NULL),(23,14,31,'2022-12-20 04:14:09','2022-12-20 04:14:09',NULL),(24,3,32,'2022-12-20 04:20:50','2022-12-20 04:20:50','2022-12-20 06:03:38'),(25,6,32,'2022-12-20 04:20:50','2022-12-20 04:20:50','2022-12-20 06:03:38'),(26,7,32,'2022-12-20 04:20:50','2022-12-20 04:20:50','2022-12-20 06:03:38'),(27,8,32,'2022-12-20 04:20:50','2022-12-20 04:20:50','2022-12-20 06:03:38'),(28,13,32,'2022-12-20 06:03:38','2022-12-20 06:03:38','2022-12-20 06:04:27'),(29,14,32,'2022-12-20 06:03:38','2022-12-20 06:03:38','2022-12-20 06:04:27'),(30,15,32,'2022-12-20 06:03:38','2022-12-20 06:03:38','2022-12-20 06:04:27'),(31,10,32,'2022-12-20 06:04:28','2022-12-20 06:04:28','2022-12-20 06:07:46'),(32,11,32,'2022-12-20 06:04:28','2022-12-20 06:04:28','2022-12-20 06:07:46'),(33,15,32,'2022-12-20 06:04:28','2022-12-20 06:04:28','2022-12-20 06:07:46'),(34,14,32,'2022-12-20 06:07:52','2022-12-20 06:07:52','2022-12-20 06:12:06'),(35,15,32,'2022-12-20 06:07:52','2022-12-20 06:07:52','2022-12-20 06:12:06'),(36,3,32,'2022-12-20 06:13:52','2022-12-20 06:13:52','2022-12-20 06:17:47'),(37,14,32,'2022-12-20 06:13:52','2022-12-20 06:13:52','2022-12-20 06:17:47'),(38,3,32,'2022-12-20 06:17:47','2022-12-20 06:17:47',NULL),(39,14,32,'2022-12-20 06:17:47','2022-12-20 06:17:47',NULL),(40,3,33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 06:59:31'),(41,4,33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 06:59:31'),(42,11,33,'2022-12-20 06:58:53','2022-12-20 06:58:53','2022-12-20 06:59:31'),(43,4,33,'2022-12-20 06:59:31','2022-12-20 06:59:31','2022-12-20 06:59:44'),(44,4,33,'2022-12-20 06:59:44','2022-12-20 06:59:44','2022-12-20 07:00:18'),(45,4,33,'2022-12-20 07:00:18','2022-12-20 07:00:18','2022-12-20 07:01:01'),(46,4,33,'2022-12-20 07:01:01','2022-12-20 07:01:01',NULL),(47,1,1,'2022-12-20 08:21:09','2022-12-20 08:21:09',NULL),(48,4,21,'2022-12-20 18:42:53','2022-12-20 18:42:53',NULL),(49,5,21,'2022-12-20 18:42:53','2022-12-20 18:42:53',NULL);
/*!40000 ALTER TABLE `tags_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_users`
--

DROP TABLE IF EXISTS `tags_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tags_users_tags_idx` (`tag_id`),
  KEY `fk_tags_users_users_idx` (`user_id`),
  CONSTRAINT `fk_tags_users_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `fk_tags_users_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_users`
--

LOCK TABLES `tags_users` WRITE;
/*!40000 ALTER TABLE `tags_users` DISABLE KEYS */;
INSERT INTO `tags_users` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,'2022-12-20 03:37:35'),(3,3,3,NULL,NULL,'2022-12-20 03:37:35'),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL),(19,3,2,'2022-12-20 03:27:44','2022-12-20 03:27:44','2022-12-20 03:38:55'),(20,1,2,'2022-12-20 03:37:35','2022-12-20 03:37:35','2022-12-20 03:38:55'),(21,11,2,'2022-12-20 03:38:55','2022-12-20 03:38:55','2022-12-20 03:39:13'),(22,9,2,'2022-12-20 03:39:13','2022-12-20 03:39:13','2022-12-20 03:39:21'),(23,7,2,'2022-12-20 03:39:21','2022-12-20 03:39:21','2022-12-20 03:39:21'),(24,5,2,'2022-12-20 03:39:59','2022-12-20 03:39:59','2022-12-20 03:40:06'),(25,8,2,'2022-12-20 03:40:59','2022-12-20 03:40:59','2022-12-20 03:41:08'),(26,6,2,'2022-12-20 03:41:08','2022-12-20 03:41:08','2022-12-20 03:41:28'),(27,12,2,'2022-12-20 03:41:28','2022-12-20 03:41:28','2022-12-20 03:56:31'),(28,4,2,'2022-12-20 03:56:31','2022-12-20 03:56:31','2022-12-20 03:56:43'),(29,5,2,'2022-12-20 03:56:31','2022-12-20 03:56:31','2022-12-20 03:56:43'),(30,13,2,'2022-12-20 03:56:31','2022-12-20 03:56:31','2022-12-20 03:56:43'),(31,4,2,'2022-12-20 03:56:43','2022-12-20 03:56:43','2022-12-20 04:41:08'),(32,5,2,'2022-12-20 03:56:43','2022-12-20 03:56:43','2022-12-20 04:41:08'),(33,9,2,'2022-12-20 03:56:43','2022-12-20 03:56:43','2022-12-20 04:41:08'),(34,13,2,'2022-12-20 03:56:43','2022-12-20 03:56:43','2022-12-20 04:41:08'),(35,15,2,'2022-12-20 03:56:43','2022-12-20 03:56:43','2022-12-20 04:41:08'),(36,4,2,'2022-12-20 04:41:08','2022-12-20 04:41:08','2022-12-20 04:41:33'),(37,5,2,'2022-12-20 04:41:08','2022-12-20 04:41:08','2022-12-20 04:41:33'),(38,9,2,'2022-12-20 04:41:08','2022-12-20 04:41:08','2022-12-20 04:41:33'),(39,13,2,'2022-12-20 04:41:08','2022-12-20 04:41:08','2022-12-20 04:41:33'),(40,15,2,'2022-12-20 04:41:08','2022-12-20 04:41:08','2022-12-20 04:41:33'),(41,4,2,'2022-12-20 04:41:33','2022-12-20 04:41:33',NULL),(42,5,2,'2022-12-20 04:41:33','2022-12-20 04:41:33',NULL),(43,9,2,'2022-12-20 04:41:33','2022-12-20 04:41:33',NULL),(44,13,2,'2022-12-20 04:41:33','2022-12-20 04:41:33',NULL),(45,15,2,'2022-12-20 04:41:33','2022-12-20 04:41:33',NULL);
/*!40000 ALTER TABLE `tags_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userimages`
--

DROP TABLE IF EXISTS `userimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userimages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_userImages_users_idx` (`user_id`),
  CONSTRAINT `fk_userImages_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages`
--

LOCK TABLES `userimages` WRITE;
/*!40000 ALTER TABLE `userimages` DISABLE KEYS */;
INSERT INTO `userimages` VALUES (1,'AvatarDefault.jpeg',1,NULL,NULL,NULL),(2,'user-1671503886815.gif',2,NULL,'2022-12-20 02:38:06',NULL),(3,'user-1671422693907.png',3,NULL,'2022-12-19 04:04:53',NULL),(4,'AvatarDefault.jpeg',4,NULL,NULL,NULL),(5,'AvatarDefault.jpeg',5,NULL,NULL,NULL),(6,'AvatarDefault.jpeg',6,NULL,NULL,NULL),(7,'user-1670970330434.png',7,NULL,'2022-12-13 22:25:30',NULL),(8,'AvatarDefault.jpeg',8,NULL,NULL,NULL),(9,'user-1666812259706.jpg',9,NULL,'2022-10-26 19:24:19',NULL),(10,'user-1667249577012.jpg',10,NULL,'2022-10-31 20:52:57',NULL),(11,'AvatarDefault.jpeg',11,NULL,NULL,NULL),(12,'user-1666389271502.png',12,NULL,'2022-10-21 21:54:31',NULL),(13,'user-1667250461169.png',13,NULL,'2022-10-31 21:07:41',NULL),(14,'AvatarDefault.jpeg',14,NULL,NULL,NULL),(15,'user-1666404672254.png',15,NULL,'2022-10-22 02:11:12',NULL),(16,'user-1666812285456.jpg',18,'2022-10-26 19:24:45','2022-10-26 19:24:45',NULL),(17,'user-1666812361601.jpg',19,'2022-10-26 19:26:01','2022-10-26 19:26:01',NULL);
/*!40000 ALTER TABLE `userimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint DEFAULT '0',
  `subscription_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_users_subscriptions_idx` (`subscription_id`),
  CONSTRAINT `fk_users_subscriptions` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Grim','Damian','Duarte','grim@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(2,'Sai','Julián','B. Ortega','sai@gmail.com','$2a$10$/8JfvrL25e6I3.XT6mdpHOshueqUoAfHOgTQCSAr/0HRtJOK6E6d.',1,5,NULL,'2022-12-20 03:56:43',NULL),(3,'Maga','Magali','Gayoso','maga@gmail.com','$2a$10$0WyNkJoat2A6g6KzE2x7DekG56usXNIXnQv05ILO/nu./CxodtVN6',1,5,NULL,'2022-12-19 04:04:54',NULL),(4,'Mica','Micaela','Vizcarra','mica@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(5,'Anto','Antonella','Pizarro','anto@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(6,'Lula','Luján','Gutierrez','lula@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(7,'Juan','Juan','Licciardi','juan@gmail.com','$2a$10$0tYYBBg/8EGZCIQRzl.Ig.xetOn/pdGWWPZ9tWLqZ6IMM6nV8rnKS',0,2,NULL,'2022-12-13 22:25:31',NULL),(8,'Diego','Diego','Montes','diego@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,2,NULL,NULL,'2022-10-21 19:52:03'),(9,'Eric','Eric','Mena','eric@gmail.com','$2a$10$6RkC/SgekZwbRp6LToBDBO.6unGa4kmFo/0kWf7tPdcpMwGyPRkJ.',1,8,NULL,'2022-10-26 19:24:19',NULL),(10,'Juli','Julián','Aquino','juli@gmail.com','$2a$10$N2EZg3.aFzArfm/2OQGBzOI7NONVa9rCGayeK9CCj1eEQJuegg0B6',1,8,NULL,'2022-10-31 20:52:57',NULL),(11,'otaku1','Nutenno','Naada','otaku1@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,2,NULL,NULL,'2022-10-21 19:54:07'),(12,'otaku2','testname','testname2','otaku2@gmail.com','$2a$10$Kmry2Bxr8XrZYOrHz88FOeF/JpQjPrDJ0aKIUNABYkTCvSY5BEnxS',0,2,NULL,'2022-10-21 21:59:50',NULL),(13,'rolero1','Villero blanco','De ojotas azules','rolero1@gmail.com','$2a$10$wdsUFQg.tuW67zy/1r.NKOVyU.rt/1yc0XkirI7HOODkoLY8e.a0m',0,1,NULL,'2022-10-31 21:07:41',NULL),(14,'rolero2','Manco','Oscuro','rolero2@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,1,NULL,NULL,NULL),(15,'MiniEric','Eric','Mini','minieric@gmail.com','$2a$10$hzLpQoBEXx6E6hzGM6jX3.TY7ADiiQp8HSwzjiUnWuiEgb9tIe9Tq',0,3,NULL,'2022-10-22 02:12:03',NULL),(16,'testuser','Sin nombre','Sin apellido','testuser@gmail.com','$2a$10$ttdiFpuMwC.mLO4DXOtx8uOjJUdh6LE7/59EFde8JnJZaub3Vu/WG',0,NULL,'2022-10-21 22:57:31','2022-10-21 22:57:31',NULL),(17,'dev','Sin nombre','Sin apellido','dev@gmail.com','$2a$10$bFGTG6XL1Idgn.DaCEPoSeZLYj70oqPt.t2siYkGfnfaS8YL.25I.',0,NULL,'2022-10-21 23:17:14','2022-10-21 23:17:14',NULL),(18,'asdasd','un nombre','un apellido','asdasd@gmail.com','$2a$10$tVDwL3i3n/Q0bUN1EdieAeYjgycA4V2rCscEzFxQ268mhbH6dFF2.',0,NULL,'2022-10-22 02:07:14','2022-10-26 19:24:45',NULL),(19,'tstuser','Sin nombre','Sin apellido','tstuser@gmail.com','$2a$10$CShyJ2WZc5uRfKMlMe4wjOaPJvAyysmBDBCl2I5n/X6089qCoSmMS',0,NULL,'2022-10-26 19:25:32','2022-10-26 19:26:01',NULL),(20,'diegito',NULL,NULL,'chihuahua@gmail.com','$2a$10$vtChwJAUYCPxgAuwRhMEMu3t7fov3kh/QCDQrJfe6OAojLGWU3aQe',0,NULL,'2022-12-02 23:39:35','2022-12-02 23:39:35',NULL),(21,'Isis','Sin nombre','Sin apellido','isis@gmail.com','$2a$10$EVixboEG3hgTLuz3ynlk1eSz.JJO8/tp0tAQxuUXvJaPvh3W2Q1E2',0,NULL,'2022-12-07 01:30:56','2022-12-07 01:30:56',NULL),(22,'Isisss','Sin nombre','Sin apellido','isisss@gmail.com','$2a$10$5vcf6sz0fLra.goLBDQ8C.4.7SnFM4vdUNjj.iLqKUYrdx5E1UvnG',0,NULL,'2022-12-07 01:32:19','2022-12-07 01:32:19',NULL),(23,'ElfoNegro','Sin nombre','Sin apellido','elfohot22@gmail.com','$2a$10$pOii1rT6c7H/rGPaLgNbVOROYhUUKC9xXVFeiflyep8o0Uk7Ij5uG',0,NULL,'2022-12-13 22:27:57','2022-12-13 22:27:57',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewedhistories`
--

DROP TABLE IF EXISTS `viewedhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewedhistories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_viewedHistories_users_idx` (`user_id`),
  CONSTRAINT `fk_viewedHistories_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewedhistories`
--

LOCK TABLES `viewedhistories` WRITE;
/*!40000 ALTER TABLE `viewedhistories` DISABLE KEYS */;
INSERT INTO `viewedhistories` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `viewedhistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewedhistories_products`
--

DROP TABLE IF EXISTS `viewedhistories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewedhistories_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `viewedHistory_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_viewedHistories_products_viewedHistories_idx` (`viewedHistory_id`),
  KEY `fk_viewedHistories_products_products_idx` (`product_id`),
  CONSTRAINT `fk_viewedHistories_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_viewedHistories_products_viewedHistories` FOREIGN KEY (`viewedHistory_id`) REFERENCES `viewedhistories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewedhistories_products`
--

LOCK TABLES `viewedhistories_products` WRITE;
/*!40000 ALTER TABLE `viewedhistories_products` DISABLE KEYS */;
INSERT INTO `viewedhistories_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `viewedhistories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_wishLists_users_idx` (`user_id`),
  CONSTRAINT `fk_wishLists_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists_products`
--

DROP TABLE IF EXISTS `wishlists_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `wishList_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_wishLists_products_wishLists_idx` (`wishList_id`),
  KEY `fk_wishLists_products_products_idx` (`product_id`),
  CONSTRAINT `fk_wishLists_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_wishLists_products_wishLists` FOREIGN KEY (`wishList_id`) REFERENCES `wishlists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists_products`
--

LOCK TABLES `wishlists_products` WRITE;
/*!40000 ALTER TABLE `wishlists_products` DISABLE KEYS */;
INSERT INTO `wishlists_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wishlists_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-20 16:49:45
