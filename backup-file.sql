-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: ebaydb
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auction',7,'add_auction'),(26,'Can change auction',7,'change_auction'),(27,'Can delete auction',7,'delete_auction'),(28,'Can view auction',7,'view_auction'),(29,'Can add brand',8,'add_brand'),(30,'Can change brand',8,'change_brand'),(31,'Can delete brand',8,'delete_brand'),(32,'Can view brand',8,'view_brand'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add customer',10,'add_customer'),(38,'Can change customer',10,'change_customer'),(39,'Can delete customer',10,'delete_customer'),(40,'Can view customer',10,'view_customer'),(41,'Can add deliveryman',11,'add_deliveryman'),(42,'Can change deliveryman',11,'change_deliveryman'),(43,'Can delete deliveryman',11,'delete_deliveryman'),(44,'Can view deliveryman',11,'view_deliveryman'),(45,'Can add hub',12,'add_hub'),(46,'Can change hub',12,'change_hub'),(47,'Can delete hub',12,'delete_hub'),(48,'Can view hub',12,'view_hub'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add order_ status',14,'add_order_status'),(54,'Can change order_ status',14,'change_order_status'),(55,'Can delete order_ status',14,'delete_order_status'),(56,'Can view order_ status',14,'view_order_status'),(57,'Can add transaction',15,'add_transaction'),(58,'Can change transaction',15,'change_transaction'),(59,'Can delete transaction',15,'delete_transaction'),(60,'Can view transaction',15,'view_transaction'),(61,'Can add user type',16,'add_usertype'),(62,'Can change user type',16,'change_usertype'),(63,'Can delete user type',16,'delete_usertype'),(64,'Can view user type',16,'view_usertype'),(65,'Can add user',17,'add_user'),(66,'Can change user',17,'change_user'),(67,'Can delete user',17,'delete_user'),(68,'Can view user',17,'view_user'),(69,'Can add seller',18,'add_seller'),(70,'Can change seller',18,'change_seller'),(71,'Can delete seller',18,'delete_seller'),(72,'Can view seller',18,'view_seller'),(73,'Can add return',19,'add_return'),(74,'Can change return',19,'change_return'),(75,'Can delete return',19,'delete_return'),(76,'Can view return',19,'view_return'),(77,'Can add product',20,'add_product'),(78,'Can change product',20,'change_product'),(79,'Can delete product',20,'delete_product'),(80,'Can view product',20,'view_product'),(81,'Can add order_ set',21,'add_order_set'),(82,'Can change order_ set',21,'change_order_set'),(83,'Can delete order_ set',21,'delete_order_set'),(84,'Can view order_ set',21,'view_order_set'),(85,'Can add inventory',22,'add_inventory'),(86,'Can change inventory',22,'change_inventory'),(87,'Can delete inventory',22,'delete_inventory'),(88,'Can view inventory',22,'view_inventory'),(89,'Can add hubman',23,'add_hubman'),(90,'Can change hubman',23,'change_hubman'),(91,'Can delete hubman',23,'delete_hubman'),(92,'Can view hubman',23,'view_hubman'),(93,'Can add bid',24,'add_bid'),(94,'Can change bid',24,'change_bid'),(95,'Can delete bid',24,'delete_bid'),(96,'Can view bid',24,'view_bid'),(97,'Can add auction_ order',25,'add_auction_order'),(98,'Can change auction_ order',25,'change_auction_order'),(99,'Can delete auction_ order',25,'delete_auction_order'),(100,'Can view auction_ order',25,'view_auction_order'),(101,'Can add package item',26,'add_packageitem'),(102,'Can change package item',26,'change_packageitem'),(103,'Can delete package item',26,'delete_packageitem'),(104,'Can view package item',26,'view_packageitem');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$iXUdD5BfihRlUilcjKM06D$/GUO+8KVfNAYrYs8Q7THkBzsL6YyhsmlPgpy71Qh6yI=','2022-08-28 19:47:14.268199',1,'user','','','',1,1,'2022-07-18 08:27:21.778415');
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-07-18 08:27:48.336896','1','Hub object (1)',1,'[{\"added\": {}}]',12,1),(2,'2022-07-26 14:02:45.658684','1','customer',1,'[{\"added\": {}}]',16,1),(3,'2022-07-26 14:02:49.620736','2','employee',1,'[{\"added\": {}}]',16,1),(4,'2022-07-26 14:02:55.458475','3','deliveryman',1,'[{\"added\": {}}]',16,1),(5,'2022-07-26 14:03:15.399160','alice','customer | alice',1,'[{\"added\": {}}]',17,1),(6,'2022-07-27 08:35:42.911321','4','seller',1,'[{\"added\": {}}]',16,1),(7,'2022-07-27 08:53:06.602666','2','Hub object (2)',1,'[{\"added\": {}}]',12,1),(8,'2022-07-27 09:04:41.538034','1','ASUS',1,'[{\"added\": {}}]',8,1),(9,'2022-07-27 09:04:44.548151','2','HP',1,'[{\"added\": {}}]',8,1),(10,'2022-07-27 09:05:06.021425','1','Monitor',1,'[{\"added\": {}}]',9,1),(11,'2022-07-27 09:05:10.160514','2','Mouse',1,'[{\"added\": {}}]',9,1),(12,'2022-07-27 09:05:14.872682','3','Keyboard',1,'[{\"added\": {}}]',9,1),(13,'2022-07-27 09:06:12.711840','1','Asus VQ27W1B',1,'[{\"added\": {}}]',20,1),(14,'2022-07-27 09:06:42.062519','2','HP Hero',1,'[{\"added\": {}}]',20,1),(15,'2022-07-27 09:38:51.130319','1','Hub object (1)',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',12,1),(16,'2022-07-27 09:38:54.887490','2','Hub object (2)',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',12,1),(17,'2022-07-27 09:38:57.707836','1','Hub object (1)',2,'[]',12,1),(18,'2022-07-27 09:43:23.366893','Zahin Islam','seller | Zahin Islam',3,'',17,1),(19,'2022-07-27 09:43:52.282320','1','Nasif | abc | 20',1,'[{\"added\": {}}]',22,1),(20,'2022-07-27 09:44:02.407712','2','Nasif | abc | 33',1,'[{\"added\": {}}]',22,1),(21,'2022-07-27 09:44:11.077794','2','Nasif | abc | 33',2,'[]',22,1),(22,'2022-07-27 11:49:47.387474','alice','customer | alice',3,'',17,1),(23,'2022-07-27 11:49:52.903223','irshad','customer | irshad',2,'[]',17,1),(24,'2022-07-27 11:49:58.174452','1','irshad | 123',2,'[]',10,1),(25,'2022-07-27 13:59:01.151795','1','irshad | 123',2,'[{\"changed\": {\"fields\": [\"Wallet\"]}}]',10,1),(26,'2022-07-27 14:08:23.449222','1','In shop',1,'[{\"added\": {}}]',14,1),(27,'2022-07-27 14:10:22.794551','1','Kamal | DK 22001',1,'[{\"added\": {}}]',11,1),(28,'2022-07-27 14:35:08.340294','2','Delivered',1,'[{\"added\": {}}]',14,1),(29,'2022-08-07 15:26:34.380227','kamal','deliveryman | kamal',1,'[{\"added\": {}}]',17,1),(30,'2022-08-07 15:27:00.482915','Kamal','deliveryman | Kamal',2,'[{\"changed\": {\"fields\": [\"Username\", \"Password\"]}}]',17,1),(31,'2022-08-07 15:30:13.804572','Kamal','deliveryman | Kamal',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(32,'2022-08-07 15:30:24.030425','Kamal','deliveryman | Kamal',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(33,'2022-08-07 15:30:32.849501','kamal','deliveryman | kamal',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',17,1),(34,'2022-08-07 15:30:43.828856','1','kamal | DK 22001',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(35,'2022-08-13 13:58:31.586371','1','kamal | DK 22001',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',11,1),(36,'2022-08-13 13:58:45.250608','401','deliveryman | 401',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(37,'2022-08-13 13:59:08.536970','1','irshad | 101',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',10,1),(38,'2022-08-13 13:59:32.557750','1','Nasif | abc',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',18,1),(39,'2022-08-13 13:59:54.800427','101','customer | 101',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(40,'2022-08-13 14:01:43.777327','201','seller | 201',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(41,'2022-08-13 15:58:30.366685','401','deliveryman | 401',2,'[]',17,1),(42,'2022-08-13 16:17:43.328823','kamal','deliveryman | kamal',3,'',17,1),(43,'2022-08-13 16:17:50.487768','<script>alert(\"hello\")</script>','customer | <script>alert(\"hello\")</script>',3,'',17,1),(44,'2022-08-13 16:43:57.107682','1','Nasif | abc | Asus VQ27W1B | 1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(45,'2022-08-14 12:46:22.694099','Nasif','seller | Nasif',3,'',17,1),(46,'2022-08-15 04:44:44.848894','1','Nasif | abc',2,'[{\"changed\": {\"fields\": [\"Coord\"]}}]',18,1),(47,'2022-08-15 06:24:32.378335','3','GIGABYTE',1,'[{\"added\": {}}]',8,1),(48,'2022-08-15 06:24:36.489972','4','LOGITECH',1,'[{\"added\": {}}]',8,1),(49,'2022-08-15 06:24:47.258141','5','VIEWSONIC',1,'[{\"added\": {}}]',8,1),(50,'2022-08-15 06:25:23.835967','3','Gigabyte G24F',1,'[{\"added\": {}}]',20,1),(51,'2022-08-15 06:28:03.123349','4','Logitech G PRO',1,'[{\"added\": {}}]',20,1),(52,'2022-08-15 06:28:18.015061','3','Abrar | Abrar Electronics | 55',1,'[{\"added\": {}}]',22,1),(53,'2022-08-15 06:28:27.698292','4','Abrar | Abrar Electronics | 69',1,'[{\"added\": {}}]',22,1),(54,'2022-08-15 06:29:41.089305','2','Abrar | Abrar Electronics',2,'[{\"changed\": {\"fields\": [\"Coord\"]}}]',18,1),(55,'2022-08-15 09:07:13.050325','1','Nasif | abc | 7',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(56,'2022-08-15 09:21:10.612664','2','Nasif | abc | -2',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(57,'2022-08-15 09:21:34.102939','1','Nasif | abc | 7',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(58,'2022-08-15 09:22:13.376862','4','Abrar | Abrar Electronics | 67',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(59,'2022-08-15 09:22:51.375470','3','Abrar | Abrar Electronics | 53',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(60,'2022-08-15 09:23:28.077292','1','Nasif | abc | 7',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(61,'2022-08-15 09:55:11.436197','1','Nasif | abc | 4',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(62,'2022-08-15 09:55:20.928856','2','Nasif | abc | -3',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(63,'2022-08-15 09:55:29.622532','4','Abrar | Abrar Electronics | 67',2,'[]',22,1),(64,'2022-08-15 11:44:03.000507','3','Picked Up',1,'[{\"added\": {}}]',14,1),(65,'2022-08-15 11:44:24.700712','31','Abrar | Abrar Electronics | Logitech G PRO | 1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(66,'2022-08-15 11:44:52.287098','23','Nasif | abc | HP Hero | 1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(67,'2022-08-15 11:44:58.743711','28','Abrar | Abrar Electronics | Logitech G PRO | 1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(68,'2022-08-15 11:49:32.340730','6','Nasif | abc | Asus VQ27W1B | 3',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(69,'2022-08-15 11:49:39.436880','1','Nasif | abc | Asus VQ27W1B | 1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(70,'2022-08-15 11:49:48.454396','10','Nasif | abc | HP Hero | 1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(71,'2022-08-15 11:50:44.905715','37','Abrar | Abrar Electronics | Gigabyte G24F | 2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(72,'2022-08-15 11:50:52.543308','36','Abrar | Abrar Electronics | Gigabyte G24F | 2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(73,'2022-08-15 11:53:05.521470','5','Nasif | abc | HP Hero | 4',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(74,'2022-08-15 12:23:53.513979','3','Abrar | Abrar Electronics | 51',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(75,'2022-08-15 14:56:54.654364','3','Abrar | Abrar Electronics | 49',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(76,'2022-08-17 02:56:46.650470','1','Nasif | abc | 3',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(77,'2022-08-17 02:58:11.381870','1','Nasif | abc | 2',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(78,'2022-08-17 03:29:26.239673','5','Nasif | abc | HP Hero | 4',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(79,'2022-08-17 03:42:29.070468','2','Picked Up-2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(80,'2022-08-17 03:42:35.219021','3','Delivered',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(81,'2022-08-17 03:42:38.894223','2','Picked Up',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(82,'2022-08-17 03:45:08.913072','3','Delivered-2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(83,'2022-08-17 03:45:14.950042','2','Picked Up-2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(84,'2022-08-17 03:45:18.170309','1','In shop-2',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(85,'2022-08-17 03:45:25.348368','3','In Shop',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(86,'2022-08-17 03:45:28.978984','2','Picked Up',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(87,'2022-08-17 03:45:35.097565','1','Delivered',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(88,'2022-08-17 03:47:42.756757','3','Delivered',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(89,'2022-08-17 03:47:48.846682','1','In Shop',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(90,'2022-08-18 01:26:36.440300','5','Rahim | Computer Fair',3,'',18,1),(91,'2022-08-18 01:26:54.884255','203','seller | 203',3,'',17,1),(92,'2022-08-18 01:33:12.229367','1','Nasif | abc | -5',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(93,'2022-08-18 01:33:15.474450','4','Abrar | Abrar Electronics | 67',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(94,'2022-08-18 01:33:28.639337','4','Abrar | Abrar Electronics | 67',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(95,'2022-08-18 01:33:32.853283','3','Abrar | Abrar Electronics | 49',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(96,'2022-08-18 01:33:43.195263','3','Abrar | Abrar Electronics | 49',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(97,'2022-08-18 01:33:47.358801','2','Nasif | abc | -7',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(98,'2022-08-18 01:33:54.210208','2','Nasif | abc | -7',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(99,'2022-08-18 01:34:05.942432','1','Nasif | abc | -5',2,'[{\"changed\": {\"fields\": [\"Inventory image\"]}}]',22,1),(100,'2022-08-18 02:41:26.179373','6','Optical Budget Mouse',3,'',20,1),(101,'2022-08-18 02:41:26.183493','5','Optical Budget Mouse',3,'',20,1),(102,'2022-08-18 02:54:39.135880','7','Optical Budget Mouse',3,'',20,1),(103,'2022-08-18 04:08:05.429965','7','বাংলা',1,'[{\"added\": {}}]',8,1),(104,'2022-08-18 04:08:45.702423','9','বাংলা অভিধান',1,'[{\"added\": {}}]',20,1),(105,'2022-08-18 04:09:42.111968','8','Shuvo | Spark Gear | 10',1,'[{\"added\": {}}]',22,1),(106,'2022-08-18 06:04:17.843117','4','<script>alert(\"hello\")</script> | 01706363005',3,'',10,1),(107,'2022-08-18 06:04:17.858538','3','<script>alert(\"h\")</script> | 21379183789',3,'',10,1),(108,'2022-08-18 06:04:17.862969','2','<script>alert(\"h\")</script> | 21379183789',3,'',10,1),(109,'2022-08-18 06:04:23.548638','1','irshad | 101',2,'[]',10,1),(110,'2022-08-18 06:10:24.284781','1','irshad | 101',2,'[{\"changed\": {\"fields\": [\"Mail\"]}}]',10,1),(111,'2022-08-18 06:37:12.330389','1','irshad | 101',2,'[{\"changed\": {\"fields\": [\"Wallet\"]}}]',10,1),(112,'2022-08-18 07:11:13.254001','5','Abrar Shahriare | 102',2,'[{\"changed\": {\"fields\": [\"Mail\"]}}]',10,1),(113,'2022-08-18 08:13:07.512163','1','irshad | 101',2,'[]',10,1),(114,'2022-08-18 08:39:35.984718','5','Abrar Shahriare | 102',2,'[{\"changed\": {\"fields\": [\"Mail\"]}}]',10,1),(115,'2022-08-18 08:48:02.661955','1','Nasif | abc | 80',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',22,1),(116,'2022-08-18 08:48:13.089723','2','Nasif | abc | 56',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',22,1),(117,'2022-08-18 09:44:51.732834','5','Abrar Shahriare | 102',2,'[{\"changed\": {\"fields\": [\"Mail\"]}}]',10,1),(118,'2022-08-18 09:44:57.702708','5','Abrar Shahriare | 102',2,'[{\"changed\": {\"fields\": [\"Wallet\"]}}]',10,1),(119,'2022-08-22 06:25:48.651158','5','Nasif | abc | 15',2,'[{\"changed\": {\"fields\": [\"Start time\"]}}]',7,1),(120,'2022-08-22 06:25:54.882410','3','Nasif | abc | 10',2,'[{\"changed\": {\"fields\": [\"Start time\"]}}]',7,1),(121,'2022-08-22 06:26:03.226913','1','Nasif | abc | 1',2,'[{\"changed\": {\"fields\": [\"Start time\"]}}]',7,1),(122,'2022-08-22 06:28:23.813505','5','Nasif | abc | 15',2,'[{\"changed\": {\"fields\": [\"Start time\", \"End time\"]}}]',7,1),(123,'2022-08-24 10:32:10.874654','4','In Hubnear',1,'[{\"added\": {}}]',14,1),(124,'2022-08-24 10:32:56.991925','4','In HubCustomer',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',14,1),(125,'2022-08-24 10:33:09.913999','5','In HubSeller',1,'[{\"added\": {}}]',14,1),(126,'2022-08-24 10:55:49.211193','301','employee | 301',1,'[{\"added\": {}}]',17,1),(127,'2022-08-24 10:59:46.454691','1','nazmul',1,'[{\"added\": {}}]',23,1),(128,'2022-08-24 11:11:26.314163','1','nazmul',2,'[{\"changed\": {\"fields\": [\"Hub\"]}}]',23,1),(129,'2022-08-24 13:03:25.603200','3','keyboard',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(130,'2022-08-24 13:03:31.114949','2','mouse',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(131,'2022-08-24 13:03:35.761925','1','monitor',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(132,'2022-08-24 13:03:47.977488','4','17',3,'',9,1),(133,'2022-08-25 03:26:34.504086','12','Nasif | abc | 12000',3,'',7,1),(134,'2022-08-25 03:26:34.517499','11','Nasif | abc | 10000',3,'',7,1),(135,'2022-08-25 03:26:34.520059','10','Nasif | abc | 45621',3,'',7,1),(136,'2022-08-25 03:26:34.532753','9','Nasif | abc | 30000',3,'',7,1),(137,'2022-08-25 03:26:34.546195','7','Shuvo | Spark Gear | 10000',3,'',7,1),(138,'2022-08-25 03:26:34.559862','5','Nasif | abc | 40000',3,'',7,1),(139,'2022-08-25 03:26:34.573968','3','Nasif | abc | 1000',3,'',7,1),(140,'2022-08-25 03:26:34.577632','1','Nasif | abc | 5000',3,'',7,1),(141,'2022-08-25 04:59:08.443028','13','Nasif | abc | 32000',2,'[{\"changed\": {\"fields\": [\"Auction name\", \"Start time\", \"Bid\"]}}]',7,1),(142,'2022-08-25 05:00:28.816113','13','Nasif | abc | 32000',2,'[{\"changed\": {\"fields\": [\"End time\"]}}]',7,1),(143,'2022-08-25 05:13:15.959842','13','Nasif | abc | 32000',2,'[{\"changed\": {\"fields\": [\"Start time\", \"End time\"]}}]',7,1),(144,'2022-08-25 09:18:11.296821','15','Nasif | abc | 45000',2,'[{\"changed\": {\"fields\": [\"End time\"]}}]',7,1),(145,'2022-08-26 08:49:40.620655','2','Dhrubo | LA 34-3455',1,'[{\"added\": {}}]',11,1),(146,'2022-08-26 08:49:54.603504','302','deliveryman | 302',1,'[{\"added\": {}}]',17,1),(147,'2022-08-28 13:45:07.403235','1','kamal | Local | dhaka',2,'[{\"changed\": {\"fields\": [\"Current hub\", \"Designation\"]}}]',11,1),(148,'2022-08-28 13:45:27.605762','2','Dhrubo | Inter District | rajshahi',2,'[{\"changed\": {\"fields\": [\"Current hub\", \"Designation\", \"Phone\"]}}]',11,1),(149,'2022-08-28 13:45:40.052593','402','deliveryman | 402',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(150,'2022-08-28 13:45:56.256186','110','seller | 110',3,'',17,1),(151,'2022-08-28 13:46:14.438935','302','deliveryman | 302',3,'',17,1),(152,'2022-08-28 13:46:55.863560','3','zahin | Local | rajshahi',1,'[{\"added\": {}}]',11,1),(153,'2022-08-28 13:47:33.161857','4','Mofiz | Inter District | dhaka',1,'[{\"added\": {}}]',11,1),(154,'2022-08-28 13:47:47.413147','403','deliveryman | 403',1,'[{\"added\": {}}]',17,1),(155,'2022-08-28 13:47:59.393788','404','deliveryman | 404',1,'[{\"added\": {}}]',17,1),(156,'2022-08-28 13:48:35.606410','5','In HubSeller',3,'',14,1),(157,'2022-08-28 13:48:35.615389','4','In HubCustomer',3,'',14,1),(158,'2022-08-28 13:48:48.092625','6','In Hub2',1,'[{\"added\": {}}]',14,1),(159,'2022-08-28 13:48:53.341282','7','In Hub',1,'[{\"added\": {}}]',14,1),(160,'2022-08-28 13:49:47.556850','8','Out To Delivery',1,'[{\"added\": {}}]',14,1),(161,'2022-08-28 13:50:00.243208','9','On Highway',1,'[{\"added\": {}}]',14,1),(162,'2022-08-28 13:51:14.531439','2','ghatak',1,'[{\"added\": {}}]',23,1),(163,'2022-08-28 13:51:43.239446','302','employee | 302',1,'[{\"added\": {}}]',17,1),(164,'2022-08-28 13:53:11.358782','108','Nasif | abc | rajshahi | HP Hero | 1 | Picked Up',2,'[{\"changed\": {\"fields\": [\"Deliveryman\"]}}]',13,1),(165,'2022-08-28 13:53:20.498403','107','Nasif | abc | rajshahi | Asus VQ27W1B | 1 | Picked Up',2,'[{\"changed\": {\"fields\": [\"Deliveryman\"]}}]',13,1),(166,'2022-08-28 16:37:21.931805','3','1211',3,'',12,1),(167,'2022-08-28 17:31:53.886877','106','Nasif | abc | rajshahi | Logitech M910 | 4 | In Shop',2,'[{\"changed\": {\"fields\": [\"Deliveryman\"]}}]',13,1),(168,'2022-08-28 17:32:02.320261','106','Nasif | abc | rajshahi | Logitech M910 | 12 | In Shop',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',13,1),(169,'2022-08-28 17:33:11.379702','106','Nasif | abc | rajshahi | Logitech M910 | 12 | Picked Up',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',13,1),(170,'2022-08-28 18:12:02.757559','6','nafiz | 103',2,'[{\"changed\": {\"fields\": [\"Delivery address hub\"]}}]',10,1),(171,'2022-08-28 18:12:11.268263','6','nafiz | 103',2,'[{\"changed\": {\"fields\": [\"Wallet\"]}}]',10,1),(172,'2022-08-28 19:11:29.448474','1','Nasif | Computer World | rajshahi',2,'[{\"changed\": {\"fields\": [\"Shop name\"]}}]',18,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'global_controller','auction'),(25,'global_controller','auction_order'),(24,'global_controller','bid'),(8,'global_controller','brand'),(9,'global_controller','category'),(10,'global_controller','customer'),(11,'global_controller','deliveryman'),(12,'global_controller','hub'),(23,'global_controller','hubman'),(22,'global_controller','inventory'),(13,'global_controller','order'),(21,'global_controller','order_set'),(14,'global_controller','order_status'),(26,'global_controller','packageitem'),(20,'global_controller','product'),(19,'global_controller','return'),(18,'global_controller','seller'),(15,'global_controller','transaction'),(17,'global_controller','user'),(16,'global_controller','usertype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-07-17 14:52:24.148804'),(2,'auth','0001_initial','2022-07-17 14:52:26.280829'),(3,'admin','0001_initial','2022-07-17 14:52:26.729785'),(4,'admin','0002_logentry_remove_auto_add','2022-07-17 14:52:26.759588'),(5,'admin','0003_logentry_add_action_flag_choices','2022-07-17 14:52:26.780079'),(6,'contenttypes','0002_remove_content_type_name','2022-07-17 14:52:26.990303'),(7,'auth','0002_alter_permission_name_max_length','2022-07-17 14:52:27.203076'),(8,'auth','0003_alter_user_email_max_length','2022-07-17 14:52:27.270767'),(9,'auth','0004_alter_user_username_opts','2022-07-17 14:52:27.288713'),(10,'auth','0005_alter_user_last_login_null','2022-07-17 14:52:27.462472'),(11,'auth','0006_require_contenttypes_0002','2022-07-17 14:52:27.489983'),(12,'auth','0007_alter_validators_add_error_messages','2022-07-17 14:52:27.508770'),(13,'auth','0008_alter_user_username_max_length','2022-07-17 14:52:27.734111'),(14,'auth','0009_alter_user_last_name_max_length','2022-07-17 14:52:27.945190'),(15,'auth','0010_alter_group_name_max_length','2022-07-17 14:52:28.008291'),(16,'auth','0011_update_proxy_permissions','2022-07-17 14:52:28.027077'),(17,'auth','0012_alter_user_first_name_max_length','2022-07-17 14:52:28.215883'),(18,'global_controller','0001_initial','2022-07-17 14:52:34.808249'),(19,'sessions','0001_initial','2022-07-17 14:52:34.961684'),(20,'global_controller','0002_alter_order_deliveryman','2022-07-27 14:30:06.734747'),(21,'global_controller','0003_alter_order_product','2022-07-27 14:32:06.128401'),(22,'global_controller','0004_alter_customer_name','2022-08-01 10:27:01.040971'),(23,'global_controller','0005_alter_user_username','2022-08-01 10:28:09.775201'),(24,'global_controller','0006_seller_coord','2022-08-15 04:43:08.705998'),(25,'global_controller','0007_inventory_inventory_image','2022-08-15 09:05:15.724353'),(26,'global_controller','0008_alter_inventory_inventory_image','2022-08-18 02:22:03.015538'),(27,'global_controller','0009_alter_inventory_inventory_image','2022-08-18 02:30:19.166769'),(28,'global_controller','0010_customer_mail','2022-08-18 06:09:42.769222'),(29,'global_controller','0011_remove_auction_product_auction_inventory','2022-08-18 07:50:14.323707'),(30,'global_controller','0012_auction_is_package_packageitem','2022-08-24 02:56:54.613846'),(31,'global_controller','0013_remove_packageitem_end_time_alter_auction_quantity','2022-08-24 02:56:54.931269'),(32,'global_controller','0014_alter_auction_inventory_alter_packageitem_auction_and_more','2022-08-24 02:56:56.426726'),(33,'global_controller','0015_remove_bid_auction_auction_bid','2022-08-24 03:59:49.146842'),(34,'global_controller','0016_remove_hubman_designation','2022-08-24 10:59:21.702931'),(35,'global_controller','0017_remove_auction_order_auction_auction_auction_order','2022-08-24 14:22:24.461701'),(36,'global_controller','0018_auction_auction_name','2022-08-25 03:25:54.978860'),(37,'global_controller','0019_remove_auction_auction_order_and_more','2022-08-25 03:25:56.124292'),(38,'global_controller','0018_remove_deliveryman_current_hub_and_more','2022-08-28 13:43:24.934759');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_auction`
--

DROP TABLE IF EXISTS `global_controller_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_auction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `base_price` int NOT NULL,
  `seller_id` bigint NOT NULL,
  `bid_id` bigint DEFAULT NULL,
  `auction_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bid_id` (`bid_id`),
  KEY `global_controller_au_seller_id_7f2d9cf9_fk_global_co` (`seller_id`),
  CONSTRAINT `global_controller_au_bid_id_8d48c5e4_fk_global_co` FOREIGN KEY (`bid_id`) REFERENCES `global_controller_bid` (`id`),
  CONSTRAINT `global_controller_au_seller_id_7f2d9cf9_fk_global_co` FOREIGN KEY (`seller_id`) REFERENCES `global_controller_seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_auction`
--

LOCK TABLES `global_controller_auction` WRITE;
/*!40000 ALTER TABLE `global_controller_auction` DISABLE KEYS */;
INSERT INTO `global_controller_auction` VALUES (13,'2022-08-25 05:13:02.000000','2022-08-25 05:14:30.000000',32000,1,1,'Super Offer'),(14,'2022-08-25 16:03:00.000000','2022-08-25 16:07:00.000000',36000,1,NULL,'Hyper Offer'),(15,'2022-08-25 15:00:00.000000','2022-08-25 15:19:00.000000',45000,1,2,'Hyper Offer 1'),(16,'2022-08-25 15:00:00.000000','2022-08-25 16:00:00.000000',50000,1,3,'Test Auction');
/*!40000 ALTER TABLE `global_controller_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_bid`
--

DROP TABLE IF EXISTS `global_controller_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_bid` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bid_amount` int NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_bi_customer_id_8fb64d04_fk_global_co` (`customer_id`),
  CONSTRAINT `global_controller_bi_customer_id_8fb64d04_fk_global_co` FOREIGN KEY (`customer_id`) REFERENCES `global_controller_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_bid`
--

LOCK TABLES `global_controller_bid` WRITE;
/*!40000 ALTER TABLE `global_controller_bid` DISABLE KEYS */;
INSERT INTO `global_controller_bid` VALUES (1,32002,1),(2,45002,1),(3,50001,1);
/*!40000 ALTER TABLE `global_controller_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_brand`
--

DROP TABLE IF EXISTS `global_controller_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_brand`
--

LOCK TABLES `global_controller_brand` WRITE;
/*!40000 ALTER TABLE `global_controller_brand` DISABLE KEYS */;
INSERT INTO `global_controller_brand` VALUES (1,'ASUS'),(2,'HP'),(3,'GIGABYTE'),(4,'LOGITECH'),(5,'VIEWSONIC'),(6,'A4tech'),(7,'বাংলা'),(8,'Keychron');
/*!40000 ALTER TABLE `global_controller_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_category`
--

DROP TABLE IF EXISTS `global_controller_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_category`
--

LOCK TABLES `global_controller_category` WRITE;
/*!40000 ALTER TABLE `global_controller_category` DISABLE KEYS */;
INSERT INTO `global_controller_category` VALUES (1,'monitor'),(2,'mouse'),(3,'keyboard'),(5,'fish'),(6,'indoor');
/*!40000 ALTER TABLE `global_controller_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_customer`
--

DROP TABLE IF EXISTS `global_controller_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `wallet` int NOT NULL,
  `delivery_address_hub_id` bigint NOT NULL,
  `mail` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_cu_delivery_address_hub_c4e7ade3_fk_global_co` (`delivery_address_hub_id`),
  CONSTRAINT `global_controller_cu_delivery_address_hub_c4e7ade3_fk_global_co` FOREIGN KEY (`delivery_address_hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_customer`
--

LOCK TABLES `global_controller_customer` WRITE;
/*!40000 ALTER TABLE `global_controller_customer` DISABLE KEYS */;
INSERT INTO `global_controller_customer` VALUES (1,'irshad','dhaka','123','101',19080,2,'1705109@ugrad.cse.buet.ac.bd'),(5,'Abrar Shahriare','Dhaka','6137813691123','102',20400,2,'nasif.car@gmail.com'),(6,'nafiz','dhaka','198273','103',399450,1,'nafiz@gmail.com');
/*!40000 ALTER TABLE `global_controller_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_deliveryman`
--

DROP TABLE IF EXISTS `global_controller_deliveryman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_deliveryman` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `vehicle_no` varchar(20) NOT NULL,
  `current_hub_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_de_current_hub_id_b62dee69_fk_global_co` (`current_hub_id`),
  CONSTRAINT `global_controller_de_current_hub_id_b62dee69_fk_global_co` FOREIGN KEY (`current_hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_deliveryman`
--

LOCK TABLES `global_controller_deliveryman` WRITE;
/*!40000 ALTER TABLE `global_controller_deliveryman` DISABLE KEYS */;
INSERT INTO `global_controller_deliveryman` VALUES (1,'kamal','Dhaka','Local','126386172368','401','DK 22001',2),(2,'Dhrubo','Lalmatia, Dhaka','Inter District','109283122','402','LA 34-3455',2),(3,'zahin','Noakhali','Local','123456789','404','LA 99-2354',1),(4,'Mofiz','Rampura','Inter District','98765432','403','LA 57-3764',2);
/*!40000 ALTER TABLE `global_controller_deliveryman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_hub`
--

DROP TABLE IF EXISTS `global_controller_hub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_hub` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_hub`
--

LOCK TABLES `global_controller_hub` WRITE;
/*!40000 ALTER TABLE `global_controller_hub` DISABLE KEYS */;
INSERT INTO `global_controller_hub` VALUES (1,'rajshahi'),(2,'dhaka');
/*!40000 ALTER TABLE `global_controller_hub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_hubman`
--

DROP TABLE IF EXISTS `global_controller_hubman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_hubman` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `hub_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_hu_hub_id_f1bf938e_fk_global_co` (`hub_id`),
  CONSTRAINT `global_controller_hu_hub_id_f1bf938e_fk_global_co` FOREIGN KEY (`hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_hubman`
--

LOCK TABLES `global_controller_hubman` WRITE;
/*!40000 ALTER TABLE `global_controller_hubman` DISABLE KEYS */;
INSERT INTO `global_controller_hubman` VALUES (1,'nazmul','mohammadpur','234435456','301',2),(2,'ghatak','aula','345','302',1);
/*!40000 ALTER TABLE `global_controller_hubman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_inventory`
--

DROP TABLE IF EXISTS `global_controller_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `inventory_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_in_product_id_97aa3032_fk_global_co` (`product_id`),
  KEY `global_controller_in_seller_id_3f88a5c9_fk_global_co` (`seller_id`),
  CONSTRAINT `global_controller_in_product_id_97aa3032_fk_global_co` FOREIGN KEY (`product_id`) REFERENCES `global_controller_product` (`id`),
  CONSTRAINT `global_controller_in_seller_id_3f88a5c9_fk_global_co` FOREIGN KEY (`seller_id`) REFERENCES `global_controller_seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_inventory`
--

LOCK TABLES `global_controller_inventory` WRITE;
/*!40000 ALTER TABLE `global_controller_inventory` DISABLE KEYS */;
INSERT INTO `global_controller_inventory` VALUES (1,73,1,1,'vg249q-1-500x500.jpg'),(2,51,2,1,'g502-hero-1-500x500.jpg'),(3,41,3,2,'g24f-23-8-2-500x500.jpg'),(4,65,4,2,'logitech-g-pro.jpg'),(7,37,8,6,'op-720-01-500x500.jpg'),(9,150,10,1,'logitech_m910.jpg'),(10,50,11,1,'keychron_c1.jpg');
/*!40000 ALTER TABLE `global_controller_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_order`
--

DROP TABLE IF EXISTS `global_controller_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `OTP` varchar(6) NOT NULL,
  `quantity` int NOT NULL,
  `deliveryman_id` bigint NOT NULL,
  `order_set_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_or_order_set_id_f5a73a01_fk_global_co` (`order_set_id`),
  KEY `global_controller_or_seller_id_deb7b332_fk_global_co` (`seller_id`),
  KEY `global_controller_or_status_id_45ce9c63_fk_global_co` (`status_id`),
  KEY `global_controller_order_deliveryman_id_cb8a6853` (`deliveryman_id`),
  KEY `global_controller_order_product_id_860427b7` (`product_id`),
  CONSTRAINT `global_controller_or_deliveryman_id_cb8a6853_fk_global_co` FOREIGN KEY (`deliveryman_id`) REFERENCES `global_controller_deliveryman` (`id`),
  CONSTRAINT `global_controller_or_order_set_id_f5a73a01_fk_global_co` FOREIGN KEY (`order_set_id`) REFERENCES `global_controller_order_set` (`id`),
  CONSTRAINT `global_controller_or_product_id_860427b7_fk_global_co` FOREIGN KEY (`product_id`) REFERENCES `global_controller_product` (`id`),
  CONSTRAINT `global_controller_or_seller_id_deb7b332_fk_global_co` FOREIGN KEY (`seller_id`) REFERENCES `global_controller_seller` (`id`),
  CONSTRAINT `global_controller_or_status_id_45ce9c63_fk_global_co` FOREIGN KEY (`status_id`) REFERENCES `global_controller_order_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_order`
--

LOCK TABLES `global_controller_order` WRITE;
/*!40000 ALTER TABLE `global_controller_order` DISABLE KEYS */;
INSERT INTO `global_controller_order` VALUES (1,'qqwwee',1,1,2,1,1,3),(4,'qqwwee',1,1,4,1,1,3),(5,'qqwwee',4,1,4,2,1,3),(6,'qqwwee',3,1,5,1,1,3),(7,'qqwwee',2,1,5,2,1,6),(8,'qqwwee',1,1,6,1,1,1),(9,'qqwwee',1,1,6,1,1,1),(10,'qqwwee',1,1,6,2,1,6),(11,'qqwwee',1,1,7,1,1,1),(12,'qqwwee',1,1,7,1,1,1),(13,'qqwwee',1,1,7,2,1,1),(14,'qqwwee',1,1,8,2,1,1),(15,'qqwwee',1,1,9,2,1,6),(16,'LHqYCZ',1,1,10,2,1,1),(17,'LHqYCZ',1,1,10,2,1,1),(18,'FVRWiM',1,1,11,2,1,1),(19,'FVRWiM',1,1,11,2,1,1),(20,'ewBbcE',1,1,12,2,1,1),(21,'zBZKYG',1,1,13,2,1,1),(22,'VyufiF',1,1,14,2,1,1),(23,'WmSslA',1,1,15,2,1,3),(24,'oIEHGS',1,1,16,3,2,1),(25,'VtDCaW',1,1,17,3,2,1),(26,'oIEHGS',1,1,16,3,2,1),(27,'VtDCaW',1,1,17,3,2,1),(28,'oIEHGS',1,1,16,4,2,3),(29,'VtDCaW',1,1,17,4,2,1),(30,'oIEHGS',1,1,16,4,2,1),(31,'VtDCaW',1,1,17,4,2,3),(32,'XmWviA',3,1,18,1,1,1),(33,'lSTfJb',3,1,19,1,1,1),(34,'XmWviA',1,1,18,2,1,1),(35,'lSTfJb',1,1,19,2,1,1),(36,'yNajvy',2,1,20,3,2,3),(37,'UKIWCM',2,1,21,3,2,3),(38,'fLbIus',1,1,22,1,1,1),(39,'cjBICV',1,1,23,1,1,1),(40,'fLbIus',2,1,22,3,2,1),(41,'cjBICV',2,1,23,3,2,1),(42,'mPkDCA',1,1,24,1,1,1),(43,'DaBFoF',1,1,25,1,1,1),(44,'ULQKAJ',5,1,26,1,1,3),(45,'CAUqJp',1,1,27,1,1,1),(46,'MoNyJI',4,1,28,2,1,1),(47,'pdZFWE',3,1,29,8,6,1),(48,'qAqArK',4,1,30,8,6,1),(49,'kxnjFI',1,1,31,1,1,1),(50,'kxnjFI',1,1,31,2,1,1),(51,'kxnjFI',1,1,31,3,2,1),(52,'kxnjFI',1,1,31,4,2,1),(53,'kxnjFI',1,1,31,8,6,1),(55,'NYfGiH',1,1,32,1,1,1),(56,'NYfGiH',1,1,32,2,1,1),(57,'WexWJq',1,1,33,2,1,1),(58,'WexWJq',1,1,33,3,2,1),(59,'HBbcdd',1,1,34,3,2,1),(60,'PaDewG',1,1,35,3,2,1),(61,'oXQAey',1,1,36,3,2,1),(62,'IpGJse',2,1,37,8,6,1),(63,'cKAlYF',2,1,38,8,6,1),(64,'FuCDik',1,1,39,3,2,1),(65,'FuCDik',1,1,39,4,2,1),(66,'HJVeWp',1,1,40,3,2,1),(67,'HJVeWp',1,1,40,2,1,1),(68,'RckoXj',1,1,41,1,1,3),(69,'cSwPOk',1,1,42,1,1,1),(70,'cSwPOk',2,1,42,2,1,3),(71,'fwNKGB',1,1,43,2,1,1),(72,'d9ftZN',1,1,44,2,1,1),(73,'d9ftZN',1,1,44,3,2,1),(75,'JqG174',5,1,46,2,1,1),(76,'ehHeWk',3,1,46,10,1,1),(77,'2dfzhr',5,1,47,2,1,1),(78,'uCe6Af',3,1,47,10,1,1),(79,'HnT4Ok',5,1,48,2,1,1),(80,'eYenda',3,1,48,10,1,1),(81,'OIHEW5',5,1,49,2,1,1),(82,'jfYpQA',3,1,49,10,1,1),(83,'4Y67zE',5,1,50,2,1,1),(84,'I13ivl',3,1,50,10,1,1),(85,'QuBrYP',5,1,51,2,1,1),(86,'mmGeWB',3,1,51,10,1,1),(87,'bbm3ec',5,1,52,2,1,1),(88,'ZTKeXs',3,1,52,10,1,1),(89,'sqP6od',5,1,53,2,1,1),(90,'8u0yvg',3,1,53,10,1,1),(91,'k1L0Lr',5,1,54,2,1,1),(92,'O55LaX',3,1,54,10,1,1),(93,'BEvVGz',5,1,55,2,1,1),(94,'brCcBG',3,1,55,10,1,1),(95,'Jgy7yJ',5,1,56,2,1,1),(96,'BAZkB5',3,1,56,10,1,1),(97,'Wkf3ui',5,1,57,2,1,1),(98,'nRIK3E',3,1,57,10,1,1),(99,'MzR8M7',5,1,58,2,1,1),(100,'FO1ELJ',3,1,58,10,1,1),(101,'5y0tU9',5,1,59,2,1,1),(102,'ZiaH8u',3,1,59,10,1,1),(103,'VasNk5',1,1,60,2,1,1),(104,'TX1km6',35,1,60,10,1,1),(105,'qd3OCG',3,1,61,2,1,1),(106,'uaS1cZ',12,1,61,10,1,3),(107,'D9DUDK',1,3,62,1,1,2),(108,'gR8Bzz',1,1,62,2,1,6),(109,'fdGjRL',1,3,64,8,6,1);
/*!40000 ALTER TABLE `global_controller_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_order_set`
--

DROP TABLE IF EXISTS `global_controller_order_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_order_set` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` bigint NOT NULL,
  `transaction_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `global_controller_or_customer_id_c521f71a_fk_global_co` (`customer_id`),
  CONSTRAINT `global_controller_or_customer_id_c521f71a_fk_global_co` FOREIGN KEY (`customer_id`) REFERENCES `global_controller_customer` (`id`),
  CONSTRAINT `global_controller_or_transaction_id_e74fcd28_fk_global_co` FOREIGN KEY (`transaction_id`) REFERENCES `global_controller_transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_order_set`
--

LOCK TABLES `global_controller_order_set` WRITE;
/*!40000 ALTER TABLE `global_controller_order_set` DISABLE KEYS */;
INSERT INTO `global_controller_order_set` VALUES (1,'2022-07-27',1,3),(2,'2022-07-27',1,4),(3,'2022-07-27',1,5),(4,'2022-07-27',1,6),(5,'2022-07-28',1,7),(6,'2022-08-13',1,8),(7,'2022-08-13',1,9),(8,'2022-08-13',1,10),(9,'2022-08-13',1,11),(10,'2022-08-14',1,12),(11,'2022-08-14',1,13),(12,'2022-08-14',1,14),(13,'2022-08-14',1,15),(14,'2022-08-14',1,16),(15,'2022-08-14',1,17),(16,'2022-08-15',1,18),(17,'2022-08-15',1,19),(18,'2022-08-15',1,20),(19,'2022-08-15',1,21),(20,'2022-08-15',1,22),(21,'2022-08-15',1,23),(22,'2022-08-15',1,24),(23,'2022-08-15',1,25),(24,'2022-08-17',1,26),(25,'2022-08-17',1,27),(26,'2022-08-17',1,28),(27,'2022-08-17',1,29),(28,'2022-08-17',1,30),(29,'2022-08-18',1,31),(30,'2022-08-18',1,32),(31,'2022-08-18',1,33),(32,'2022-08-18',1,34),(33,'2022-08-18',1,35),(34,'2022-08-18',1,36),(35,'2022-08-18',1,37),(36,'2022-08-18',1,38),(37,'2022-08-18',1,39),(38,'2022-08-18',1,40),(39,'2022-08-18',5,41),(40,'2022-08-18',5,42),(41,'2022-08-28',1,43),(42,'2022-08-18',1,44),(43,'2022-08-18',1,45),(44,'2022-08-24',1,46),(45,'2022-08-24',1,47),(46,'2022-08-25',1,48),(47,'2022-08-25',1,49),(48,'2022-08-25',1,50),(49,'2022-08-25',1,51),(50,'2022-08-25',1,52),(51,'2022-08-25',1,53),(52,'2022-08-25',1,54),(53,'2022-08-25',1,55),(54,'2022-08-25',1,56),(55,'2022-08-25',1,57),(56,'2022-08-25',1,58),(57,'2022-08-25',1,59),(58,'2022-08-25',1,60),(59,'2022-08-25',1,61),(60,'2022-08-25',1,62),(61,'2022-08-25',1,63),(62,'2022-08-26',1,64),(63,'2022-08-28',1,65),(64,'2022-08-28',6,66),(65,'2022-08-28',1,67),(66,'2022-08-28',1,68),(67,'2022-08-28',1,69),(68,'2022-08-28',1,70);
/*!40000 ALTER TABLE `global_controller_order_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_order_status`
--

DROP TABLE IF EXISTS `global_controller_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_order_status`
--

LOCK TABLES `global_controller_order_status` WRITE;
/*!40000 ALTER TABLE `global_controller_order_status` DISABLE KEYS */;
INSERT INTO `global_controller_order_status` VALUES (1,'In Shop'),(2,'Picked Up'),(3,'Delivered'),(6,'In Hub2'),(7,'In Hub'),(8,'Out To Delivery'),(9,'On Highway');
/*!40000 ALTER TABLE `global_controller_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_packageitem`
--

DROP TABLE IF EXISTS `global_controller_packageitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_packageitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `auction_id` bigint DEFAULT NULL,
  `inventory_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_packageitem_auction_id_62d28f2b` (`auction_id`),
  KEY `global_controller_packageitem_inventory_id_8e1849b5` (`inventory_id`),
  KEY `global_controller_pa_order_id_4031be3e_fk_global_co` (`order_id`),
  CONSTRAINT `global_controller_pa_auction_id_62d28f2b_fk_global_co` FOREIGN KEY (`auction_id`) REFERENCES `global_controller_auction` (`id`),
  CONSTRAINT `global_controller_pa_inventory_id_8e1849b5_fk_global_co` FOREIGN KEY (`inventory_id`) REFERENCES `global_controller_inventory` (`id`),
  CONSTRAINT `global_controller_pa_order_id_4031be3e_fk_global_co` FOREIGN KEY (`order_id`) REFERENCES `global_controller_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_packageitem`
--

LOCK TABLES `global_controller_packageitem` WRITE;
/*!40000 ALTER TABLE `global_controller_packageitem` DISABLE KEYS */;
INSERT INTO `global_controller_packageitem` VALUES (4,5,13,2,101),(5,3,13,9,102),(6,3,14,2,NULL),(7,5,14,9,NULL),(8,1,15,2,103),(9,35,15,9,104),(10,3,16,2,105),(11,4,16,9,106);
/*!40000 ALTER TABLE `global_controller_packageitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_product`
--

DROP TABLE IF EXISTS `global_controller_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `warranty` int NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` int NOT NULL,
  `brand_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_pr_brand_id_a532b16e_fk_global_co` (`brand_id`),
  KEY `global_controller_pr_category_id_ef5fb261_fk_global_co` (`category_id`),
  CONSTRAINT `global_controller_pr_brand_id_a532b16e_fk_global_co` FOREIGN KEY (`brand_id`) REFERENCES `global_controller_brand` (`id`),
  CONSTRAINT `global_controller_pr_category_id_ef5fb261_fk_global_co` FOREIGN KEY (`category_id`) REFERENCES `global_controller_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_product`
--

LOCK TABLES `global_controller_product` WRITE;
/*!40000 ALTER TABLE `global_controller_product` DISABLE KEYS */;
INSERT INTO `global_controller_product` VALUES (1,'Asus VQ27W1B',3,'27 inch gaming monitor',44500,1,1),(2,'HP Hero',2,'Gaming Mouse',5200,2,2),(3,'Gigabyte G24F',3,'24\' inch gaming monitor',27500,3,1),(4,'Logitech G PRO',1,'Tenkeyless RGB Mechanical Gaming Keyboard',10200,4,3),(8,'Optical Budget Mouse',1,'A4Tech budget optical mouse with 800 DPI',550,6,2),(10,'Logitech M910',3,'Wireless Mouse',1300,4,2),(11,'Keychron Keyboard',3,'Keychron C1 mechanical keyboard',8900,8,3);
/*!40000 ALTER TABLE `global_controller_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_return`
--

DROP TABLE IF EXISTS `global_controller_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_return` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `global_controller_re_status_id_d42abf29_fk_global_co` (`status_id`),
  CONSTRAINT `global_controller_re_order_id_9dee45e4_fk_global_co` FOREIGN KEY (`order_id`) REFERENCES `global_controller_order` (`id`),
  CONSTRAINT `global_controller_re_status_id_d42abf29_fk_global_co` FOREIGN KEY (`status_id`) REFERENCES `global_controller_order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_return`
--

LOCK TABLES `global_controller_return` WRITE;
/*!40000 ALTER TABLE `global_controller_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_controller_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_seller`
--

DROP TABLE IF EXISTS `global_controller_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_seller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  `bank_acc` varchar(40) NOT NULL,
  `wallet` int NOT NULL,
  `hub_id` bigint NOT NULL,
  `coord` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_se_hub_id_5b0ed730_fk_global_co` (`hub_id`),
  CONSTRAINT `global_controller_se_hub_id_5b0ed730_fk_global_co` FOREIGN KEY (`hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_seller`
--

LOCK TABLES `global_controller_seller` WRITE;
/*!40000 ALTER TABLE `global_controller_seller` DISABLE KEYS */;
INSERT INTO `global_controller_seller` VALUES (1,'Nasif','New Market, Rajshahi','123123','201','Computer World','ABC Bank','91239108209',255100,1,'23.732614, 90.384543'),(2,'Abrar','Dhanmondi, Dhaka','123456789','402','Abrar Electronics','UCBL','98765432',240400,2,'23.738853824452487, 90.38558968705205'),(3,'Shibly','Jigatola, Dhaka','2345678','202','Shibly Computers','NRBC Bank','123456789',0,2,''),(4,'Shibly','Jigatola, Dhaka','123456789','','Shibly Computers','','',0,2,''),(6,'Shuvo','Lalbagh, Dhaka','6137813691123','203','Spark Gear','NRBC Bank','54923186153',5880,2,'23.72008094330496, 90.38939237594604'),(7,'Tushar','Lalmatia, Dhaka','6137813691123','204','Bliss Electronics','UCBL','486321',0,2,'23.75675293038741, 90.37490844726564'),(8,'Sajon Islam','Lalmatia, Dhaka','123156321','110','Sajon Computers','UCBL','123456',0,2,'23.757381390787604, 90.37559509277345');
/*!40000 ALTER TABLE `global_controller_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_transaction`
--

DROP TABLE IF EXISTS `global_controller_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_transaction`
--

LOCK TABLES `global_controller_transaction` WRITE;
/*!40000 ALTER TABLE `global_controller_transaction` DISABLE KEYS */;
INSERT INTO `global_controller_transaction` VALUES (1,'buy',65300),(2,'buy',65300),(3,'buy',65300),(4,'buy',65300),(5,'buy',65300),(6,'buy',65300),(7,'buy',143900),(8,'buy',94200),(9,'buy',94200),(10,'buy',5200),(11,'buy',5200),(12,'buy',10400),(13,'buy',10400),(14,'buy',5200),(15,'buy',5200),(16,'buy',5200),(17,'buy',5200),(18,'buy',75400),(19,'buy',75400),(20,'buy',138700),(21,'buy',138700),(22,'buy',55000),(23,'buy',55000),(24,'buy',99500),(25,'buy',99500),(26,'buy',44500),(27,'buy',44500),(28,'buy',222500),(29,'buy',44500),(30,'buy',20800),(31,'buy',1650),(32,'buy',2200),(33,'buy',88450),(34,'buy',49700),(35,'buy',32700),(36,'buy',27500),(37,'buy',27500),(38,'buy',27500),(39,'buy',1100),(40,'buy',1100),(41,'buy',37700),(42,'buy',32700),(43,'buy',44500),(44,'buy',54900),(45,'buy',5200),(46,'buy',32700),(47,'buy',500),(48,'buy',32002),(49,'buy',32002),(50,'buy',32002),(51,'buy',32002),(52,'buy',32002),(53,'buy',32002),(54,'buy',32002),(55,'buy',32002),(56,'buy',32002),(57,'buy',32002),(58,'buy',32002),(59,'buy',32002),(60,'buy',32002),(61,'buy',32002),(62,'buy',45002),(63,'buy',50001),(64,'buy',49700),(65,'RECHARGE',120),(66,'buy',550),(67,'RECHARGE',5000),(68,'RECHARGE',20),(69,'RECHARGE',20),(70,'RECHARGE',20);
/*!40000 ALTER TABLE `global_controller_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_user`
--

DROP TABLE IF EXISTS `global_controller_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `user_type_id` bigint NOT NULL,
  PRIMARY KEY (`username`),
  KEY `global_controller_us_user_type_id_88b0762c_fk_global_co` (`user_type_id`),
  CONSTRAINT `global_controller_us_user_type_id_88b0762c_fk_global_co` FOREIGN KEY (`user_type_id`) REFERENCES `global_controller_usertype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_user`
--

LOCK TABLES `global_controller_user` WRITE;
/*!40000 ALTER TABLE `global_controller_user` DISABLE KEYS */;
INSERT INTO `global_controller_user` VALUES ('','',4),('101','irshad',1),('102','abrar',1),('103','nafiz',1),('201','nasif',4),('202','shibly',4),('203','shuvo',4),('204','tushar',4),('210','tushar',4),('301','nazmul',2),('302','ghatak',2),('401','kamal',3),('402','dhrubo',3),('403','mofiz',3),('404','zahin',3),('irshad','irshad',1);
/*!40000 ALTER TABLE `global_controller_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_usertype`
--

DROP TABLE IF EXISTS `global_controller_usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_usertype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_usertype`
--

LOCK TABLES `global_controller_usertype` WRITE;
/*!40000 ALTER TABLE `global_controller_usertype` DISABLE KEYS */;
INSERT INTO `global_controller_usertype` VALUES (1,'customer'),(2,'employee'),(3,'deliveryman'),(4,'seller');
/*!40000 ALTER TABLE `global_controller_usertype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-29  1:48:03
