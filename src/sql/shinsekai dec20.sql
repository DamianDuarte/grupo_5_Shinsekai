CREATE DATABASE  IF NOT EXISTS `shinsekai-db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shinsekai-db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
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
-- Dumping data for table `availablecolors`
--

LOCK TABLES `availablecolors` WRITE;
/*!40000 ALTER TABLE `availablecolors` DISABLE KEYS */;
INSERT INTO `availablecolors` VALUES (1,'Purple',NULL,NULL,NULL),(2,'Red',NULL,NULL,NULL),(3,'Puke',NULL,NULL,NULL),(4,'Pink',NULL,NULL,NULL),(5,'Mauv',NULL,NULL,NULL),(6,'Green',NULL,NULL,NULL),(7,'Crimson',NULL,NULL,NULL),(8,'Goldenrod',NULL,NULL,NULL),(9,'Maroon',NULL,NULL,NULL),(10,'Purple',NULL,NULL,NULL),(11,'Green',NULL,NULL,NULL),(12,'Purple',NULL,NULL,NULL),(13,'Puce',NULL,NULL,NULL),(14,'Teal',NULL,NULL,NULL),(15,'Maroon',NULL,NULL,NULL);
/*!40000 ALTER TABLE `availablecolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Accesorios','product.jpg',NULL,NULL,NULL),(2,'Ropa','product.jpg',NULL,NULL,NULL),(3,'Calzado','product.jpg',NULL,NULL,NULL),(4,'Deportes','product.jpg',NULL,NULL,NULL),(5,'Electrónica','product.jpg',NULL,NULL,NULL),(6,'Hogar','product.jpg',NULL,NULL,NULL),(7,'Juguetes','product.jpg',NULL,NULL,NULL),(8,'Libros','product.jpg',NULL,NULL,NULL),(9,'Música','product.jpg',NULL,NULL,NULL),(10,'Videojuegos','product.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clothessizes`
--

LOCK TABLES `clothessizes` WRITE;
/*!40000 ALTER TABLE `clothessizes` DISABLE KEYS */;
INSERT INTO `clothessizes` VALUES (1,'3XL',NULL,NULL,NULL),(2,'XXL',NULL,NULL,NULL),(3,'XL',NULL,NULL,NULL),(4,'L',NULL,NULL,NULL),(5,'M',NULL,NULL,NULL),(6,'S',NULL,NULL,NULL);
/*!40000 ALTER TABLE `clothessizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `linkedaccounts`
--

LOCK TABLES `linkedaccounts` WRITE;
/*!40000 ALTER TABLE `linkedaccounts` DISABLE KEYS */;
INSERT INTO `linkedaccounts` VALUES (1,'MercadoPago','nusequeponeraquí',1,NULL,NULL,NULL),(2,'MercadoPago','nusequeponeraquí',2,NULL,NULL,NULL),(3,'MercadoPago','nusequeponeraquí',3,NULL,NULL,NULL),(4,'MercadoPago','nusequeponeraquí',4,NULL,NULL,NULL),(5,'MercadoPago','nusequeponeraquí',5,NULL,NULL,NULL),(6,'MercadoPago','nusequeponeraquí',6,NULL,NULL,NULL),(7,'MercadoPago','nusequeponeraquí',7,NULL,NULL,NULL),(8,'MercadoPago','nusequeponeraquí',8,NULL,NULL,NULL),(9,'MercadoPago','nusequeponeraquí',9,NULL,NULL,NULL),(10,'MercadoPago','nusequeponeraquí',10,NULL,NULL,NULL),(11,'MercadoPago','nusequeponeraquí',11,NULL,NULL,NULL),(12,'MercadoPago','nusequeponeraquí',12,NULL,NULL,NULL),(13,'MercadoPago','nusequeponeraquí',13,NULL,NULL,NULL),(14,'MercadoPago','nusequeponeraquí',14,NULL,NULL,NULL),(15,'MercadoPago','nusequeponeraquí',15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `linkedaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `metricsizes`
--

LOCK TABLES `metricsizes` WRITE;
/*!40000 ALTER TABLE `metricsizes` DISABLE KEYS */;
INSERT INTO `metricsizes` VALUES (1,12,NULL,NULL,NULL),(2,26,NULL,NULL,NULL),(3,38,NULL,NULL,NULL),(4,44,NULL,NULL,NULL),(5,53,NULL,NULL,NULL),(6,61,NULL,NULL,NULL),(7,127,NULL,NULL,NULL),(8,68,NULL,NULL,NULL),(9,29,NULL,NULL,NULL),(10,310,NULL,NULL,NULL),(11,411,NULL,NULL,NULL),(12,112,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,45,NULL,NULL,NULL),(15,55,NULL,NULL,NULL);
/*!40000 ALTER TABLE `metricsizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productcomments`
--

LOCK TABLES `productcomments` WRITE;
/*!40000 ALTER TABLE `productcomments` DISABLE KEYS */;
INSERT INTO `productcomments` VALUES (1,'Ame super ame este reloj de shingeki es tan bello uwu',5,3,NULL,NULL,NULL),(2,'Lo pedi de envio al Puyo , me asustaba que no llegara o que llegara dañada, pero llego en perfectas condiciones y bastante rapido ,me alegro mucho tenerla en mis manos , es super comoda, espaciosa y sobretodo se ve hermosa.',4,2,NULL,NULL,NULL),(3,'Me encanta que vino en su empaque original, lo pedi por envio y llego bastante rapido en perfecta condiciones , muchas gracias',2,4,NULL,NULL,NULL),(4,'Me encanto muy simpatico el diseño, y es ajustable super cool',1,1,NULL,NULL,NULL),(5,'Super buena calidad, hace tiempo que lo buscaba para un cosplay , excelente material',4,1,NULL,NULL,NULL),(6,'muy detallado, en verdad un excelente producto y de gran nostalgia',3,4,NULL,NULL,NULL),(7,'Super bien, me encanto todas las latas tienen diseños muy originales y el material me da seguridad, los termos latas son bastantes buenos',3,2,NULL,NULL,NULL),(8,'velit vivamus vel nulla eget eros elementum',3,3,NULL,NULL,NULL),(9,'ipsum primis in faucibus orci luctus et',1,1,NULL,NULL,NULL),(10,'diego gay',3,4,NULL,NULL,NULL),(11,'maecenas rhoncus aliquam lacus morbi quis tortor id nulla',1,1,NULL,NULL,NULL),(12,'turpis elementum liqawgula vehicula consequat morbi a ipsum integer a',4,1,NULL,NULL,NULL),(13,'quisque ut erat curabitur gravida',1,1,NULL,NULL,NULL),(14,'in sagittis dui vel nisl',4,2,NULL,NULL,NULL),(15,'sed ante vivamus tortor duis mattis egestas metus aenean',1,3,NULL,NULL,NULL),(16,'suspendisse potenti in eleifend quam',3,5,NULL,NULL,NULL),(17,'accumsan tortor quis turpis sed ante vivamus tortor duis mattis',4,5,NULL,NULL,NULL),(18,'justo in blandit ultrices',4,2,NULL,NULL,NULL),(19,'donec pharetra magna vestibulum aliquet ultrices erat tortor',3,2,NULL,NULL,NULL),(20,'adipiscing molestie hendrerit at vulputate vitae nisl aenean',2,5,NULL,NULL,NULL),(21,'sodales sed tincidunt eu felis fusce posuere',1,5,NULL,NULL,NULL),(22,'nullam orci pede venenatis non sodales',2,2,NULL,NULL,NULL),(23,'interdum in ante',1,4,NULL,NULL,NULL),(24,'ut volutpat sapien arcu sed augue aliquam erat volutpat',5,2,NULL,NULL,NULL),(25,'justo morbi ut odio cras mi',4,2,NULL,NULL,NULL),(26,'tristique fusce congue diam',2,5,NULL,NULL,NULL),(27,'eget massa tempor convallis nulla neque libero',4,2,NULL,NULL,NULL),(28,'integer ac neque duis bibendum morbi non',1,5,NULL,NULL,NULL),(29,'eleifend pede libero quis orci',1,4,NULL,NULL,NULL),(30,'at velit eu',2,1,NULL,NULL,NULL),(31,'maecenas leo odio condimentum id luctus nec',4,2,NULL,NULL,NULL),(32,'elit proin risus praesent lectus vestibulum',5,3,NULL,NULL,NULL),(33,'erat quisque erat eros viverra eget',2,5,NULL,NULL,NULL),(34,'porttitor lacus at turpis',5,5,NULL,NULL,NULL),(35,'ut dolor morbi vel lectus in',4,4,NULL,NULL,NULL),(36,'amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus',4,5,NULL,NULL,NULL),(37,'vitae consectetuer eget rutrum at lorem integer tincidunt ante vel',4,4,NULL,NULL,NULL),(38,'in congue etiam justo',3,4,NULL,NULL,NULL),(39,'lacinia sapien quis libero nullam sit amet turpis elementum',5,1,NULL,NULL,NULL),(40,'leo odio condimentum id',3,3,NULL,NULL,NULL),(41,'at nunc commodo',5,1,NULL,NULL,NULL),(42,'sit amet eleifend pede libero quis orci',3,2,NULL,NULL,NULL),(43,'rutrum nulla tellus in sagittis dui vel nisl duis',5,2,NULL,NULL,NULL),(44,'sit amet eros suspendisse accumsan',1,3,NULL,NULL,NULL),(45,'diam cras pellentesque volutpat dui',5,5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `productcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (1,'product-noimg.png',1,NULL,NULL,NULL),(2,'product-noimg.png',1,NULL,NULL,NULL),(3,'oro1.png',2,NULL,NULL,NULL),(4,'oro2.png',2,NULL,NULL,NULL),(5,'plata1.png',3,NULL,NULL,NULL),(6,'plata2.png',3,NULL,NULL,NULL),(7,'bronce1.png',4,NULL,NULL,NULL),(8,'bronce2.png',4,NULL,NULL,NULL),(9,'hierro1.png',5,NULL,NULL,NULL),(10,'hierro2.png',5,NULL,NULL,NULL),(11,'product-noimg.png',6,NULL,NULL,NULL),(12,'product-noimg.png',6,NULL,NULL,NULL),(13,'bakugo2.png',7,NULL,NULL,NULL),(14,'bakugo1.png',7,NULL,NULL,NULL),(15,'img-1.png',8,NULL,NULL,NULL),(16,'img-2.png',8,NULL,NULL,NULL),(17,'img-3.png',9,NULL,NULL,NULL),(18,'img-4.png',9,NULL,NULL,NULL),(19,'img-5.png',10,NULL,NULL,NULL),(20,'img-6.png',10,NULL,NULL,NULL),(21,'img-7.png',11,NULL,NULL,NULL),(22,'img-8.png',11,NULL,NULL,NULL),(23,'img-9.png',12,NULL,NULL,NULL),(24,'img-10.png',12,NULL,NULL,NULL),(25,'img-11.png',13,NULL,NULL,NULL),(26,'img-12.png',13,NULL,NULL,NULL),(27,'img-13.png',14,NULL,NULL,NULL),(28,'img-14.png',14,NULL,NULL,NULL),(29,'img-15.png',15,NULL,NULL,NULL),(30,'img-16.png',15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productreviews`
--

LOCK TABLES `productreviews` WRITE;
/*!40000 ALTER TABLE `productreviews` DISABLE KEYS */;
INSERT INTO `productreviews` VALUES (1,1,'curae mauris viverra diam vitae quam',19,3,3,NULL,NULL,NULL),(2,4,'vulputate nonummy maecenas tincidunt lacus at velit vivamus',-23,5,2,NULL,NULL,NULL),(3,10,'pulvinar nulla pede ullamcorper augue a suscipit nulla elit',25,4,2,NULL,NULL,NULL),(4,2,'eu interdum eu tincidunt in leo maecenas',21,5,3,NULL,NULL,NULL),(5,7,'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras',-13,5,1,NULL,NULL,NULL),(6,2,'ac tellus semper interdum',-6,1,4,NULL,NULL,NULL),(7,9,'sociis natoque penatibus et magnis dis parturient montes',-8,4,4,NULL,NULL,NULL),(8,6,'penatibus et magnis dis parturient',-3,3,2,NULL,NULL,NULL),(9,3,'sagittis sapien cum sociis natoque penatibus et',12,2,4,NULL,NULL,NULL),(10,7,'convallis eget eleifend luctus ultricies eu nibh quisque',3,4,1,NULL,NULL,NULL),(11,8,'ante vestibulum ante ipsum primis in faucibus orci luctus et',-10,3,4,NULL,NULL,NULL),(12,8,'feugiat non pretium quis lectus suspendisse',5,4,2,NULL,NULL,NULL),(13,10,'erat vestibulum sed',0,4,3,NULL,NULL,NULL),(14,4,'justo in blandit ultrices enim lorem ipsum dolor sit amet',-24,1,2,NULL,NULL,NULL),(15,5,'ante vestibulum ante ipsum primis in faucibus orci luctus et',-3,1,4,NULL,NULL,NULL),(16,10,'vel accumsan tellus nisi eu orci',-3,5,1,NULL,NULL,NULL),(17,6,'eu interdum eu tincidunt in leo maecenas pulvinar lobortis est',-7,3,5,NULL,NULL,NULL),(18,7,'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing',-6,1,1,NULL,NULL,NULL),(19,3,'faucibus accumsan odio curabitur convallis duis consequat dui',-5,5,1,NULL,NULL,NULL),(20,1,'ac leo pellentesque ultrices mattis odio donec vitae',-6,4,3,NULL,NULL,NULL),(21,6,'in quis justo',-22,4,2,NULL,NULL,NULL),(22,5,'enim blandit mi in porttitor pede justo',-8,1,2,NULL,NULL,NULL),(23,5,'consequat morbi a ipsum integer a nibh in quis',16,5,1,NULL,NULL,NULL),(24,6,'ipsum dolor sit amet consectetuer adipiscing elit',8,4,2,NULL,NULL,NULL),(25,6,'nisi venenatis tristique fusce congue',17,5,4,NULL,NULL,NULL),(26,1,'consectetuer adipiscing elit proin',6,1,1,NULL,NULL,NULL),(27,6,'congue diam id ornare imperdiet sapien urna',16,3,2,NULL,NULL,NULL),(28,3,'sapien cursus vestibulum proin',18,4,1,NULL,NULL,NULL),(29,4,'ut tellus nulla ut erat id mauris vulputate elementum',-24,5,5,NULL,NULL,NULL),(30,7,'mattis pulvinar nulla pede ullamcorper augue',6,4,4,NULL,NULL,NULL),(31,3,'nec molestie sed justo pellentesque viverra',-14,3,5,NULL,NULL,NULL),(32,2,'tellus in sagittis',-7,5,5,NULL,NULL,NULL),(33,3,'orci mauris lacinia sapien quis',-11,2,5,NULL,NULL,NULL),(34,1,'vitae ipsum aliquam non mauris morbi non',2,4,4,NULL,NULL,NULL),(35,5,'purus eu magna vulputate luctus cum sociis',20,4,2,NULL,NULL,NULL),(36,10,'eget massa tempor convallis nulla neque libero convallis',-21,2,5,NULL,NULL,NULL),(37,8,'id ligula suspendisse ornare consequat lectus in est risus auctor',15,2,1,NULL,NULL,NULL),(38,4,'justo maecenas rhoncus aliquam lacus morbi',-24,2,1,NULL,NULL,NULL),(39,3,'ac enim in tempor turpis nec euismod',7,1,1,NULL,NULL,NULL),(40,1,'pede libero quis',22,2,4,NULL,NULL,NULL),(41,6,'faucibus orci luctus et ultrices posuere cubilia curae donec',0,5,2,NULL,NULL,NULL),(42,10,'erat curabitur gravida nisi at nibh in hac habitasse platea',-5,1,2,NULL,NULL,NULL),(43,1,'suscipit a feugiat et eros',-2,5,2,NULL,NULL,NULL),(44,3,'erat id mauris vulputate elementum nullam varius nulla facilisi cras',-24,2,2,NULL,NULL,NULL),(45,2,'in ante vestibulum ante ipsum primis in faucibus orci luctus',-22,5,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `productreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Figura POP Pikachu Pokemon',42,50,'Funko original, distribuidor oficial vendido desde España, muñeco coleccionable ideal para regalos',217,2,4,NULL,NULL,NULL),(2,'Réplica Varita Albus Dumbledore',128,50,'Producto Original, distribuidor oficial vendido desde España, ideal para regalos',461,1,1,NULL,NULL,NULL),(3,'Poster Logo Nirvana',38,0,'Poster The Rolling Stones Logo',382,5,4,NULL,NULL,NULL),(4,'Figura POP Baby Yoda The Mandalorian Star Wars',193,70,'Funko original, distribuidor oficial vendido desde España, muñeco coleccionable ideal para regalos',65,5,3,NULL,NULL,NULL),(5,'Camiseta Logo Punisher',93,30,'Producto Original, distribuidor oficial vendido desde España, ideal para regalos',155,3,3,NULL,NULL,NULL),(6,'Figura Articulada Hulkbuster 21,5 cm Marvel Select',119,70,'Diamond Select Toys, la armadura anti-Hulk favorita de los fanáticos de Iron Man',325,1,2,NULL,NULL,NULL),(7,'Caja regalo coleccionista Star Wars 2022',112,50,'Diario de 2022 tamaño A5.',246,5,2,NULL,NULL,NULL),(8,'Felpudo Star Wars',83,30,'Felpudo Darth Vader Dark Side Star Wars 40 x 60 cm',181,4,5,NULL,NULL,NULL),(9,'Taza Hedwing',141,50,'Taza Hedwing Harry Pottera',217,4,5,NULL,NULL,NULL),(10,'Figura POP Spider-Man (Metálico) Marvel',179,50,'Funko original, distribuidor oficial vendido desde España, muñeco coleccionable ideal para regalos',230,1,5,NULL,NULL,NULL),(11,'PELUCHE PICOLO',112,90,'Peluche Dragon Ball Z 50cm Picolo',400,5,4,NULL,NULL,NULL),(12,'Figura Articulada Eleven Stranger Things Nendoroid Good Smile',166,70,'Figura Nendoroid: Eleven 10 cm',43,4,1,NULL,NULL,NULL),(13,'Figura Super Sailor Moon',64,30,'Figura Super Sailor Moon II Sailor Moon Eternal 23 cm Glitter & Glamours Banpresto',50,5,2,NULL,NULL,NULL),(14,'Hucha Trunks Chibi',181,90,'Hucha Trunks Chibi 15 cm Dragon Ball Plastoy',16,2,3,NULL,NULL,NULL),(15,'Alfombrilla PC Bleach Personajes',159,70,'Alfombrilla de PC de los personajes de Bleach con espuma de espesor de 3 mm.',301,5,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products_availablecolors`
--

LOCK TABLES `products_availablecolors` WRITE;
/*!40000 ALTER TABLE `products_availablecolors` DISABLE KEYS */;
INSERT INTO `products_availablecolors` VALUES (1,1,1,NULL,NULL,NULL),(2,1,2,NULL,NULL,NULL),(3,1,3,NULL,NULL,NULL),(4,1,4,NULL,NULL,NULL),(5,1,5,NULL,NULL,NULL),(6,1,6,NULL,NULL,NULL),(7,1,7,NULL,NULL,NULL),(8,1,8,NULL,NULL,NULL),(9,1,9,NULL,NULL,NULL),(10,1,10,NULL,NULL,NULL),(11,1,11,NULL,NULL,NULL),(12,1,12,NULL,NULL,NULL),(13,1,13,NULL,NULL,NULL),(14,1,14,NULL,NULL,NULL),(15,1,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_availablecolors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products_clothessizes`
--

LOCK TABLES `products_clothessizes` WRITE;
/*!40000 ALTER TABLE `products_clothessizes` DISABLE KEYS */;
INSERT INTO `products_clothessizes` VALUES (1,2,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,2,3,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL),(5,2,5,NULL,NULL,NULL),(6,2,6,NULL,NULL,NULL),(7,3,1,NULL,NULL,NULL),(8,3,2,NULL,NULL,NULL),(9,3,3,NULL,NULL,NULL),(10,3,4,NULL,NULL,NULL),(11,3,5,NULL,NULL,NULL),(12,3,6,NULL,NULL,NULL),(13,4,1,NULL,NULL,NULL),(14,4,2,NULL,NULL,NULL),(15,4,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_clothessizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products_metricsizes`
--

LOCK TABLES `products_metricsizes` WRITE;
/*!40000 ALTER TABLE `products_metricsizes` DISABLE KEYS */;
INSERT INTO `products_metricsizes` VALUES (1,5,1,NULL,NULL,NULL),(2,5,2,NULL,NULL,NULL),(3,5,3,NULL,NULL,NULL),(4,5,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,5,6,NULL,NULL,NULL),(7,5,7,NULL,NULL,NULL),(8,5,8,NULL,NULL,NULL),(9,5,9,NULL,NULL,NULL),(10,5,10,NULL,NULL,NULL),(11,5,11,NULL,NULL,NULL),(12,5,12,NULL,NULL,NULL),(13,5,13,NULL,NULL,NULL),(14,5,14,NULL,NULL,NULL),(15,5,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `products_metricsizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchasedhistories`
--

LOCK TABLES `purchasedhistories` WRITE;
/*!40000 ALTER TABLE `purchasedhistories` DISABLE KEYS */;
INSERT INTO `purchasedhistories` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchasedhistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchasedhistories_products`
--

LOCK TABLES `purchasedhistories_products` WRITE;
/*!40000 ALTER TABLE `purchasedhistories_products` DISABLE KEYS */;
INSERT INTO `purchasedhistories_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchasedhistories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchaseorders`
--

LOCK TABLES `purchaseorders` WRITE;
/*!40000 ALTER TABLE `purchaseorders` DISABLE KEYS */;
INSERT INTO `purchaseorders` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchaseorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchaseorders_products`
--

LOCK TABLES `purchaseorders_products` WRITE;
/*!40000 ALTER TABLE `purchaseorders_products` DISABLE KEYS */;
INSERT INTO `purchaseorders_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchaseorders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'Black Friday','MICArte.jpg',NULL,NULL,NULL),(2,'Cyber Monday','MICArte.jpg',NULL,NULL,NULL),(3,'Navidá','MICArte.jpg',NULL,NULL,NULL),(4,'Carnaval','MICArte.jpg',NULL,NULL,NULL),(5,'Dia del padre','MICArte.jpg',NULL,NULL,NULL),(6,'Dia de la madre','MICArte.jpg',NULL,NULL,NULL),(7,'Dia del niño','MICArte.jpg',NULL,NULL,NULL),(8,'Dia del amigo','MICArte.jpg',NULL,NULL,NULL),(9,'Dia de la mujer','MICArte.jpg',NULL,NULL,NULL),(10,'Dia de la independencia','MICArte.jpg',NULL,NULL,NULL),(11,'Dia de la primavera','MICArte.jpg',NULL,NULL,NULL),(12,'Dia de la patria','MICArte.jpg',NULL,NULL,NULL),(13,'Dia de la tierra','MICArte.jpg',NULL,NULL,NULL),(14,'Dia de la juventud','MICArte.jpg',NULL,NULL,NULL),(15,'Dia de la familia','MICArte.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'Subscripción base','Además de contar con un descuento de suscriptor, tendra la opción de leer los comics o mangas de manera online totalmente grátis.',5,NULL,NULL,NULL),(2,'La caja (Hierro)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 4 artículos.',10,NULL,NULL,NULL),(3,'La caja (Bronce)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 6 artículos.',20,NULL,NULL,NULL),(4,'La caja (Plata)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 8 artículos.',30,NULL,NULL,NULL),(5,'La caja (Oro)','Todos los meses se les enviará a los suscriptores una caja misteriosa que incluirá productos de la tienda. Contiene 12 artículos.',40,NULL,NULL,NULL),(6,'Miembro de honor (Hierro)','En esta suscripcion se obtendran \"La caja\" (Hierro) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',12,NULL,NULL,NULL),(7,'Miembro de honor (Bronce)','En esta suscripcion se obtendran \"La caja\" (Bronce) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',18,NULL,NULL,NULL),(8,'Miembro de honor (Plata)','En esta suscripcion se obtendran \"La caja\" (Plata) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',28,NULL,NULL,NULL),(9,'Miembro de honor (Oro)','En esta suscripcion se obtendran \"La caja\" (Oro) y la suscripcion base. Ademas obtendran acceso a estrenos y mercancia nueva que llegue a nuestro local.',38,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'dragon ball z','tag1.png',NULL,NULL,NULL),(2,'otakus','tag2.png',NULL,NULL,NULL),(3,'manga','tag3.png',NULL,NULL,NULL),(4,'gamer','tag4.png',NULL,NULL,NULL),(5,'pokemon','tag5.png',NULL,NULL,NULL),(6,'comic','tag6.png',NULL,NULL,NULL),(7,'anime',NULL,NULL,NULL,NULL),(8,'juegos','tag8.png',NULL,NULL,NULL),(9,'Eleven Stranger Things','tag9.png',NULL,NULL,NULL),(10,'strat wars','tag10.png',NULL,NULL,NULL),(11,'cosplay','tag11.png',NULL,NULL,NULL),(12,'marvel','tag12.png',NULL,NULL,NULL),(13,'harry potter','tag13.png',NULL,NULL,NULL),(14,'videos juegos','tag14.png',NULL,NULL,NULL),(15,'funko','tag15.png',NULL,NULL,NULL),(16,'rol','tag15.png',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tags_products`
--

LOCK TABLES `tags_products` WRITE;
/*!40000 ALTER TABLE `tags_products` DISABLE KEYS */;
INSERT INTO `tags_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tags_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tags_users`
--

LOCK TABLES `tags_users` WRITE;
/*!40000 ALTER TABLE `tags_users` DISABLE KEYS */;
INSERT INTO `tags_users` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tags_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `userimages`
--

LOCK TABLES `userimages` WRITE;
/*!40000 ALTER TABLE `userimages` DISABLE KEYS */;
INSERT INTO `userimages` VALUES (1,'AvatarDefault.jpeg',1,NULL,NULL,NULL),(2,'AvatarDefault.jpeg',2,NULL,NULL,NULL),(3,'AvatarDefault.jpeg',3,NULL,NULL,NULL),(4,'AvatarDefault.jpeg',4,NULL,NULL,NULL),(5,'AvatarDefault.jpeg',5,NULL,NULL,NULL),(6,'AvatarDefault.jpeg',6,NULL,NULL,NULL),(7,'AvatarDefault.jpeg',7,NULL,NULL,NULL),(8,'AvatarDefault.jpeg',8,NULL,NULL,NULL),(9,'AvatarDefault.jpeg',9,NULL,NULL,NULL),(10,'AvatarDefault.jpeg',10,NULL,NULL,NULL),(11,'AvatarDefault.jpeg',11,NULL,NULL,NULL),(12,'AvatarDefault.jpeg',12,NULL,NULL,NULL),(13,'AvatarDefault.jpeg',13,NULL,NULL,NULL),(14,'AvatarDefault.jpeg',14,NULL,NULL,NULL),(15,'AvatarDefault.jpeg',15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `userimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Grim','Damian','Duarte','grim@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(2,'Sai','Julián','B. Ortega','sai@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(3,'Maga','Magali','Gayoso','maga@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(4,'Mica','Micaela','Vizcarra','mica@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(5,'Anto','Antonella','Pizarro','anto@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(6,'Lula','Luján','Gutierrez','lula@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,5,NULL,NULL,NULL),(7,'Juan','Juan','Licciardi','juan@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,2,NULL,NULL,NULL),(8,'Diego','Diego','Montes','diego@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,2,NULL,NULL,NULL),(9,'Eric','Eric','Mena','eric@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,8,NULL,NULL,NULL),(10,'Juli','Julián','Aquino','juli@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',1,8,NULL,NULL,NULL),(11,'otaku1','Nutenno','Naada','otaku1@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,2,NULL,NULL,NULL),(12,'otaku2','Mekero','Mori','otaku2@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,2,NULL,NULL,NULL),(13,'rolero1','Villero blanco','De ojotas azules','rolero1@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,1,NULL,NULL,NULL),(14,'rolero2','Manco','Oscuro','rolero2@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,1,NULL,NULL,NULL),(15,'MiniEric','Eric','Mini','minieric@gmail.com','$2a$10$wG0yuwvLTnwDN5NCekbS/.9QlIjlJaQQ39HBM3wHFbRF.zrZ81EB6',0,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `viewedhistories`
--

LOCK TABLES `viewedhistories` WRITE;
/*!40000 ALTER TABLE `viewedhistories` DISABLE KEYS */;
INSERT INTO `viewedhistories` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `viewedhistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `viewedhistories_products`
--

LOCK TABLES `viewedhistories_products` WRITE;
/*!40000 ALTER TABLE `viewedhistories_products` DISABLE KEYS */;
INSERT INTO `viewedhistories_products` VALUES (1,1,1,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL),(3,3,3,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,6,6,NULL,NULL,NULL),(7,7,7,NULL,NULL,NULL),(8,8,8,NULL,NULL,NULL),(9,9,9,NULL,NULL,NULL),(10,10,10,NULL,NULL,NULL),(11,11,11,NULL,NULL,NULL),(12,12,12,NULL,NULL,NULL),(13,13,13,NULL,NULL,NULL),(14,14,14,NULL,NULL,NULL),(15,15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `viewedhistories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,3,NULL,NULL,NULL),(4,4,NULL,NULL,NULL),(5,5,NULL,NULL,NULL),(6,6,NULL,NULL,NULL),(7,7,NULL,NULL,NULL),(8,8,NULL,NULL,NULL),(9,9,NULL,NULL,NULL),(10,10,NULL,NULL,NULL),(11,11,NULL,NULL,NULL),(12,12,NULL,NULL,NULL),(13,13,NULL,NULL,NULL),(14,14,NULL,NULL,NULL),(15,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2022-12-20 16:28:11
