CREATE DATABASE  IF NOT EXISTS `ishop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ishop`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ishop
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (4,4,3,1),(5,5,3,2),(29,14,5,1),(30,11,5,1),(31,13,5,1),(32,12,5,1),(33,15,5,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cartlist`
--

DROP TABLE IF EXISTS `cartlist`;
/*!50001 DROP VIEW IF EXISTS `cartlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cartlist` AS SELECT 
 1 AS `product_id`,
 1 AS `user_id`,
 1 AS `quantity`,
 1 AS `id`,
 1 AS `name`,
 1 AS `short_description`,
 1 AS `price`,
 1 AS `discount`,
 1 AS `sl`,
 1 AS `thumbnail`,
 1 AS `description`,
 1 AS `is_featured`,
 1 AS `status`,
 1 AS `category_id`,
 1 AS `create_at`,
 1 AS `update_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Máy tính'),(2,'Điện thoại'),(3,'Máy ảnh'),(4,'Phụ kiện'),(5,'Tivi'),(6,'Máy giặt');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeback`
--

DROP TABLE IF EXISTS `feeback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feeback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeback`
--

LOCK TABLES `feeback` WRITE;
/*!40000 ALTER TABLE `feeback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galery`
--

DROP TABLE IF EXISTS `galery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(500) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `galery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galery`
--

LOCK TABLES `galery` WRITE;
/*!40000 ALTER TABLE `galery` DISABLE KEYS */;
/*!40000 ALTER TABLE `galery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2024-01-27 00:00:00',2,68180000,4),(2,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2023-11-06 00:00:00',2,25810000,4),(3,'Bùi Văn Bá','buvanba@gmail.com','0983277698','Huế','const','2023-11-05 00:00:00',2,74170000,5),(4,'Bùi Mạnh Đạt','buimanhdat@gmail.com','0942334997','Hải Phòng','const','2023-11-09 00:00:00',2,17000000,6),(12,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2023-11-14 00:00:00',1,185610000,4),(13,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2023-11-17 00:00:00',2,96900000,4),(14,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2023-11-25 00:00:00',2,55870000,4),(15,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2024-01-26 00:00:00',2,99980000,4),(16,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2024-01-27 00:00:00',2,138000000,4),(17,'Đoàn Thị Nga','doanthinga@gmail.com','0984056936','Nam Định','const','2024-01-27 00:00:00',2,73300000,4);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,20000000,1,20000000,1,1,2),(2,24090000,2,48180000,2,1,2),(3,25810000,1,25810000,3,2,2),(4,35300000,1,35300000,4,3,2),(5,38870000,1,38870000,5,3,2),(6,17000000,1,17000000,15,4,2),(39,20000000,3,60000000,1,12,2),(40,24090000,2,48180000,2,12,2),(41,25810000,3,77430000,3,12,2),(42,9900000,1,9900000,11,13,2),(43,12000000,2,24000000,12,13,2),(44,46000000,1,46000000,14,13,2),(45,17000000,1,17000000,15,13,2),(46,38870000,1,38870000,5,14,2),(47,17000000,1,17000000,15,14,2),(48,17000000,2,34000000,15,15,2),(49,26990000,2,53980000,10,15,2),(50,12000000,1,12000000,12,15,2),(51,46000000,2,92000000,14,1,2),(52,17000000,2,34000000,15,1,2),(53,12000000,1,12000000,12,1,2),(54,17000000,2,34000000,15,1,2),(55,12000000,2,24000000,12,1,2),(56,15300000,1,15300000,13,1,2);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `short_description` varchar(500) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `description` longtext,
  `is_featured` tinyint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Apple MacBook Air M1','Apple MacBook Air M1 256GB 2020',21290000,1290000,43,'product01.png','Apple MacBook Air M1 256GB 2020',0,1,1,'2023-04-08 00:00:00','2023-12-09 00:00:00'),(2,'Laptop Asus TUF GAMING F15','Laptop Asus TUF GAMING F15 FX506HF-HN014W',25090000,1000000,70,'product02.png','Laptop Asus TUF GAMING F15 FX506HF-HN014W',0,1,1,'2023-04-03 00:00:00','2023-11-07 00:00:00'),(3,'Laptop Asus VivoBook 14','Laptop Asus VivoBook 14 OLED A1405VA-KM095W',28000000,2190000,82,'product03.png','Laptop Asus VivoBook 14 OLED A1405VA-KM095W',0,1,1,'2023-04-01 00:00:00','2023-10-29 00:00:00'),(4,'Laptop ASUS ZenBook','Laptop ASUS ZenBook UM3402YA-KM074W',37000000,1700000,46,'product04.png','Laptop ASUS ZenBook UM3402YA-KM074W',0,1,1,'2023-04-27 00:00:00','2023-12-12 00:00:00'),(5,'Apple MacBook Pro 13 M2','Apple MacBook Pro 13 M2 2022 8GB 512GB',41990000,3120000,96,'product05.png','Apple MacBook Pro 13 M2 2022 8GB 512GB',0,1,1,'2023-04-12 00:00:00','2023-09-15 00:00:00'),(6,'Laptop Asus Gaming Rog Strix G15','Laptop Asus Gaming Rog Strix G15 G513IH HN015W',15000000,1100000,67,'product06.png','Laptop Asus Gaming Rog Strix G15 G513IH HN015W',0,1,1,'2023-04-19 00:00:00','2023-07-21 00:00:00'),(7,'Laptop MSI Cyborg 15 ','Laptop MSI Cyborg 15 A12UCX-281VN',18800000,1330000,32,'product07.png','Laptop MSI Cyborg 15 A12UCX-281VN',0,1,1,'2023-04-15 00:00:00','2023-06-16 00:00:00'),(8,'Laptop Acer Gaming Rog Strix G11','Laptop Acer Gaming Rog Strix G11 G513IH HN015W',23000000,1000000,27,'product08.png','Laptop Acer Gaming Rog Strix G11 G513IH HN015W',0,1,1,'2023-04-11 00:00:00','2023-09-15 00:00:00'),(9,'Apple MacBook Air M2','Apple MacBook Air M2 128GB 2021',27800000,1700000,52,'product09.png','Apple MacBook Air M2 128GB 2021',0,1,1,'2023-04-16 00:00:00','2023-12-25 00:00:00'),(10,'iPhone 15 Pro 128GB','iPhone 15 Pro 128GB',27990000,1000000,73,'product01.png','iPhone 15 Pro 128GB',0,1,2,'2023-05-17 00:00:00','2023-12-27 00:00:00'),(11,'iPhone 11 64GB Like New','iPhone 11 64GB Like New',11000000,1100000,29,'product03.png','iPhone 11 64GB Like New',0,1,2,'2023-05-12 00:00:00','2023-12-28 00:00:00'),(12,'SAMSUNG Galaxy S22 Ultra 5G Mỹ Likenew','SAMSUNG Galaxy S22 Ultra 5G Mỹ Likenew',13400000,1400000,69,'product04.png','SAMSUNG Galaxy S22 Ultra 5G Mỹ Likenew',0,1,2,'2023-05-24 00:00:00','2023-12-03 00:00:00'),(13,'Máy ảnh Canon EOS 2000D Kit EF-S18-55mm F3.5-5.6 III','Máy ảnh Canon EOS 2000D Kit EF-S18-55mm F3.5-5.6 III',17000000,1700000,45,'product06.png','Máy ảnh Canon EOS 2000D Kit EF-S18-55mm F3.5-5.6 III',0,1,3,'2023-06-16 00:00:00','2023-11-15 00:00:00'),(14,'Máy ảnh Nikon Z6 II + Lens Z 24-70mm f/4 S','Máy ảnh Nikon Z6 II + Lens Z 24-70mm f/4 S',47000000,1000000,77,'product03.png','Máy ảnh Nikon Z6 II + Lens Z 24-70mm f/4 S',0,1,3,'2023-06-12 00:00:00','2023-11-25 00:00:00'),(15,'Máy ảnh Canon Powershot G7 X Mark III/ Đen (nhập khẩu)','Máy ảnh Canon Powershot G7 X Mark III/ Đen (nhập khẩu)',19000000,2000000,26,'product09.png','Máy ảnh Canon Powershot G7 X Mark III/ Đen (nhập khẩu)',0,1,3,'2023-06-03 00:00:00','2023-11-03 00:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản trị'),(2,'Người dùng');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Lê Văn Dũng','dunglv','IOq+XWSw4hZ5boNPUtYf0LcDMvw=','levandung@gmail.com','0987057740','Hà Nội',1,2),(2,'Phạm Văn Duy','duypv','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','phamvanduy@gmail.com','0984056936','Nam Định',1,1),(3,'Nguyễn Văn Phú','phunv','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','nguyenvanphu@gmail.com','0943281775','Hà Tĩnh',2,1),(4,'Đoàn Thị Nga','ngadt','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','doanthinga@gmail.com','0984056936','Nam Định',2,1),(5,'Bùi Văn Bá','babv','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','buvanba@gmail.com','0983277698','Huế',2,1),(6,'Bùi Mạnh Đạt','datbm','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','buimanhdat@gmail.com','0942334997','Hải Phòng',2,1),(7,'Lại Thị Yến My','myly','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','laithiyenmy@gmail.com','0327636651','Hà Nam',1,1),(24,'Nguyễn Thanh Hoa','hoant','fEqNCco3Yq9h5ZUglD3CZJT4lBs=','nguyenthanhhoa@gmail.com','0985325227','Cà Mau',2,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cartlist`
--

/*!50001 DROP VIEW IF EXISTS `cartlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cartlist` AS select `c`.`product_id` AS `product_id`,`c`.`user_id` AS `user_id`,`c`.`quantity` AS `quantity`,`p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`short_description` AS `short_description`,`p`.`price` AS `price`,`p`.`discount` AS `discount`,`p`.`quantity` AS `sl`,`p`.`thumbnail` AS `thumbnail`,`p`.`description` AS `description`,`p`.`is_featured` AS `is_featured`,`p`.`status` AS `status`,`p`.`category_id` AS `category_id`,`p`.`create_at` AS `create_at`,`p`.`update_at` AS `update_at` from (`cart` `c` join `product` `p` on((`c`.`product_id` = `p`.`id`))) */;
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

-- Dump completed on 2024-01-27 11:38:06
