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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auction',7,'add_auction'),(26,'Can change auction',7,'change_auction'),(27,'Can delete auction',7,'delete_auction'),(28,'Can view auction',7,'view_auction'),(29,'Can add brand',8,'add_brand'),(30,'Can change brand',8,'change_brand'),(31,'Can delete brand',8,'delete_brand'),(32,'Can view brand',8,'view_brand'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add customer',10,'add_customer'),(38,'Can change customer',10,'change_customer'),(39,'Can delete customer',10,'delete_customer'),(40,'Can view customer',10,'view_customer'),(41,'Can add deliveryman',11,'add_deliveryman'),(42,'Can change deliveryman',11,'change_deliveryman'),(43,'Can delete deliveryman',11,'delete_deliveryman'),(44,'Can view deliveryman',11,'view_deliveryman'),(45,'Can add hub',12,'add_hub'),(46,'Can change hub',12,'change_hub'),(47,'Can delete hub',12,'delete_hub'),(48,'Can view hub',12,'view_hub'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add order_ status',14,'add_order_status'),(54,'Can change order_ status',14,'change_order_status'),(55,'Can delete order_ status',14,'delete_order_status'),(56,'Can view order_ status',14,'view_order_status'),(57,'Can add transaction',15,'add_transaction'),(58,'Can change transaction',15,'change_transaction'),(59,'Can delete transaction',15,'delete_transaction'),(60,'Can view transaction',15,'view_transaction'),(61,'Can add user type',16,'add_usertype'),(62,'Can change user type',16,'change_usertype'),(63,'Can delete user type',16,'delete_usertype'),(64,'Can view user type',16,'view_usertype'),(65,'Can add user',17,'add_user'),(66,'Can change user',17,'change_user'),(67,'Can delete user',17,'delete_user'),(68,'Can view user',17,'view_user'),(69,'Can add seller',18,'add_seller'),(70,'Can change seller',18,'change_seller'),(71,'Can delete seller',18,'delete_seller'),(72,'Can view seller',18,'view_seller'),(73,'Can add return',19,'add_return'),(74,'Can change return',19,'change_return'),(75,'Can delete return',19,'delete_return'),(76,'Can view return',19,'view_return'),(77,'Can add product',20,'add_product'),(78,'Can change product',20,'change_product'),(79,'Can delete product',20,'delete_product'),(80,'Can view product',20,'view_product'),(81,'Can add order_ set',21,'add_order_set'),(82,'Can change order_ set',21,'change_order_set'),(83,'Can delete order_ set',21,'delete_order_set'),(84,'Can view order_ set',21,'view_order_set'),(85,'Can add inventory',22,'add_inventory'),(86,'Can change inventory',22,'change_inventory'),(87,'Can delete inventory',22,'delete_inventory'),(88,'Can view inventory',22,'view_inventory'),(89,'Can add hubman',23,'add_hubman'),(90,'Can change hubman',23,'change_hubman'),(91,'Can delete hubman',23,'delete_hubman'),(92,'Can view hubman',23,'view_hubman'),(93,'Can add bid',24,'add_bid'),(94,'Can change bid',24,'change_bid'),(95,'Can delete bid',24,'delete_bid'),(96,'Can view bid',24,'view_bid'),(97,'Can add auction_ order',25,'add_auction_order'),(98,'Can change auction_ order',25,'change_auction_order'),(99,'Can delete auction_ order',25,'delete_auction_order'),(100,'Can view auction_ order',25,'view_auction_order');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$iXUdD5BfihRlUilcjKM06D$/GUO+8KVfNAYrYs8Q7THkBzsL6YyhsmlPgpy71Qh6yI=','2022-08-13 13:57:01.907925',1,'user','','','',1,1,'2022-07-18 08:27:21.778415');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-07-18 08:27:48.336896','1','Hub object (1)',1,'[{\"added\": {}}]',12,1),(2,'2022-07-26 14:02:45.658684','1','customer',1,'[{\"added\": {}}]',16,1),(3,'2022-07-26 14:02:49.620736','2','employee',1,'[{\"added\": {}}]',16,1),(4,'2022-07-26 14:02:55.458475','3','deliveryman',1,'[{\"added\": {}}]',16,1),(5,'2022-07-26 14:03:15.399160','alice','customer | alice',1,'[{\"added\": {}}]',17,1),(6,'2022-07-27 08:35:42.911321','4','seller',1,'[{\"added\": {}}]',16,1),(7,'2022-07-27 08:53:06.602666','2','Hub object (2)',1,'[{\"added\": {}}]',12,1),(8,'2022-07-27 09:04:41.538034','1','ASUS',1,'[{\"added\": {}}]',8,1),(9,'2022-07-27 09:04:44.548151','2','HP',1,'[{\"added\": {}}]',8,1),(10,'2022-07-27 09:05:06.021425','1','Monitor',1,'[{\"added\": {}}]',9,1),(11,'2022-07-27 09:05:10.160514','2','Mouse',1,'[{\"added\": {}}]',9,1),(12,'2022-07-27 09:05:14.872682','3','Keyboard',1,'[{\"added\": {}}]',9,1),(13,'2022-07-27 09:06:12.711840','1','Asus VQ27W1B',1,'[{\"added\": {}}]',20,1),(14,'2022-07-27 09:06:42.062519','2','HP Hero',1,'[{\"added\": {}}]',20,1),(15,'2022-07-27 09:38:51.130319','1','Hub object (1)',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',12,1),(16,'2022-07-27 09:38:54.887490','2','Hub object (2)',2,'[{\"changed\": {\"fields\": [\"Address\"]}}]',12,1),(17,'2022-07-27 09:38:57.707836','1','Hub object (1)',2,'[]',12,1),(18,'2022-07-27 09:43:23.366893','Zahin Islam','seller | Zahin Islam',3,'',17,1),(19,'2022-07-27 09:43:52.282320','1','Nasif | abc | 20',1,'[{\"added\": {}}]',22,1),(20,'2022-07-27 09:44:02.407712','2','Nasif | abc | 33',1,'[{\"added\": {}}]',22,1),(21,'2022-07-27 09:44:11.077794','2','Nasif | abc | 33',2,'[]',22,1),(22,'2022-07-27 11:49:47.387474','alice','customer | alice',3,'',17,1),(23,'2022-07-27 11:49:52.903223','irshad','customer | irshad',2,'[]',17,1),(24,'2022-07-27 11:49:58.174452','1','irshad | 123',2,'[]',10,1),(25,'2022-07-27 13:59:01.151795','1','irshad | 123',2,'[{\"changed\": {\"fields\": [\"Wallet\"]}}]',10,1),(26,'2022-07-27 14:08:23.449222','1','In shop',1,'[{\"added\": {}}]',14,1),(27,'2022-07-27 14:10:22.794551','1','Kamal | DK 22001',1,'[{\"added\": {}}]',11,1),(28,'2022-07-27 14:35:08.340294','2','Delivered',1,'[{\"added\": {}}]',14,1),(29,'2022-08-07 15:26:34.380227','kamal','deliveryman | kamal',1,'[{\"added\": {}}]',17,1),(30,'2022-08-07 15:27:00.482915','Kamal','deliveryman | Kamal',2,'[{\"changed\": {\"fields\": [\"Username\", \"Password\"]}}]',17,1),(31,'2022-08-07 15:30:13.804572','Kamal','deliveryman | Kamal',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(32,'2022-08-07 15:30:24.030425','Kamal','deliveryman | Kamal',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(33,'2022-08-07 15:30:32.849501','kamal','deliveryman | kamal',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',17,1),(34,'2022-08-07 15:30:43.828856','1','kamal | DK 22001',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(35,'2022-08-13 13:58:31.586371','1','kamal | DK 22001',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',11,1),(36,'2022-08-13 13:58:45.250608','401','deliveryman | 401',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(37,'2022-08-13 13:59:08.536970','1','irshad | 101',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',10,1),(38,'2022-08-13 13:59:32.557750','1','Nasif | abc',2,'[{\"changed\": {\"fields\": [\"Phone\"]}}]',18,1),(39,'2022-08-13 13:59:54.800427','101','customer | 101',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1),(40,'2022-08-13 14:01:43.777327','201','seller | 201',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',17,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'global_controller','auction'),(25,'global_controller','auction_order'),(24,'global_controller','bid'),(8,'global_controller','brand'),(9,'global_controller','category'),(10,'global_controller','customer'),(11,'global_controller','deliveryman'),(12,'global_controller','hub'),(23,'global_controller','hubman'),(22,'global_controller','inventory'),(13,'global_controller','order'),(21,'global_controller','order_set'),(14,'global_controller','order_status'),(20,'global_controller','product'),(19,'global_controller','return'),(18,'global_controller','seller'),(15,'global_controller','transaction'),(17,'global_controller','user'),(16,'global_controller','usertype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-07-17 14:52:24.148804'),(2,'auth','0001_initial','2022-07-17 14:52:26.280829'),(3,'admin','0001_initial','2022-07-17 14:52:26.729785'),(4,'admin','0002_logentry_remove_auto_add','2022-07-17 14:52:26.759588'),(5,'admin','0003_logentry_add_action_flag_choices','2022-07-17 14:52:26.780079'),(6,'contenttypes','0002_remove_content_type_name','2022-07-17 14:52:26.990303'),(7,'auth','0002_alter_permission_name_max_length','2022-07-17 14:52:27.203076'),(8,'auth','0003_alter_user_email_max_length','2022-07-17 14:52:27.270767'),(9,'auth','0004_alter_user_username_opts','2022-07-17 14:52:27.288713'),(10,'auth','0005_alter_user_last_login_null','2022-07-17 14:52:27.462472'),(11,'auth','0006_require_contenttypes_0002','2022-07-17 14:52:27.489983'),(12,'auth','0007_alter_validators_add_error_messages','2022-07-17 14:52:27.508770'),(13,'auth','0008_alter_user_username_max_length','2022-07-17 14:52:27.734111'),(14,'auth','0009_alter_user_last_name_max_length','2022-07-17 14:52:27.945190'),(15,'auth','0010_alter_group_name_max_length','2022-07-17 14:52:28.008291'),(16,'auth','0011_update_proxy_permissions','2022-07-17 14:52:28.027077'),(17,'auth','0012_alter_user_first_name_max_length','2022-07-17 14:52:28.215883'),(18,'global_controller','0001_initial','2022-07-17 14:52:34.808249'),(19,'sessions','0001_initial','2022-07-17 14:52:34.961684'),(20,'global_controller','0002_alter_order_deliveryman','2022-07-27 14:30:06.734747'),(21,'global_controller','0003_alter_order_product','2022-07-27 14:32:06.128401'),(22,'global_controller','0004_alter_customer_name','2022-08-01 10:27:01.040971'),(23,'global_controller','0005_alter_user_username','2022-08-01 10:28:09.775201');
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
  `quantity` int NOT NULL,
  `base_price` int NOT NULL,
  `product_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `global_controller_au_seller_id_7f2d9cf9_fk_global_co` (`seller_id`),
  CONSTRAINT `global_controller_au_product_id_454df5b9_fk_global_co` FOREIGN KEY (`product_id`) REFERENCES `global_controller_product` (`id`),
  CONSTRAINT `global_controller_au_seller_id_7f2d9cf9_fk_global_co` FOREIGN KEY (`seller_id`) REFERENCES `global_controller_seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_auction`
--

LOCK TABLES `global_controller_auction` WRITE;
/*!40000 ALTER TABLE `global_controller_auction` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_controller_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_auction_order`
--

DROP TABLE IF EXISTS `global_controller_auction_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_auction_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auction_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auction_id` (`auction_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `global_controller_au_auction_id_2c1aff85_fk_global_co` FOREIGN KEY (`auction_id`) REFERENCES `global_controller_auction` (`id`),
  CONSTRAINT `global_controller_au_order_id_eeb64597_fk_global_co` FOREIGN KEY (`order_id`) REFERENCES `global_controller_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_auction_order`
--

LOCK TABLES `global_controller_auction_order` WRITE;
/*!40000 ALTER TABLE `global_controller_auction_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_controller_auction_order` ENABLE KEYS */;
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
  `auction_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auction_id` (`auction_id`),
  KEY `global_controller_bi_customer_id_8fb64d04_fk_global_co` (`customer_id`),
  CONSTRAINT `global_controller_bi_auction_id_4021918d_fk_global_co` FOREIGN KEY (`auction_id`) REFERENCES `global_controller_auction` (`id`),
  CONSTRAINT `global_controller_bi_customer_id_8fb64d04_fk_global_co` FOREIGN KEY (`customer_id`) REFERENCES `global_controller_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_bid`
--

LOCK TABLES `global_controller_bid` WRITE;
/*!40000 ALTER TABLE `global_controller_bid` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_brand`
--

LOCK TABLES `global_controller_brand` WRITE;
/*!40000 ALTER TABLE `global_controller_brand` DISABLE KEYS */;
INSERT INTO `global_controller_brand` VALUES (1,'ASUS'),(2,'HP');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_category`
--

LOCK TABLES `global_controller_category` WRITE;
/*!40000 ALTER TABLE `global_controller_category` DISABLE KEYS */;
INSERT INTO `global_controller_category` VALUES (1,'Monitor'),(2,'Mouse'),(3,'Keyboard');
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
  PRIMARY KEY (`id`),
  KEY `global_controller_cu_delivery_address_hub_c4e7ade3_fk_global_co` (`delivery_address_hub_id`),
  CONSTRAINT `global_controller_cu_delivery_address_hub_c4e7ade3_fk_global_co` FOREIGN KEY (`delivery_address_hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_customer`
--

LOCK TABLES `global_controller_customer` WRITE;
/*!40000 ALTER TABLE `global_controller_customer` DISABLE KEYS */;
INSERT INTO `global_controller_customer` VALUES (1,'irshad','dhaka','123','101',30000,2),(2,'<script>alert(\"h\")</script>','Uttara, Dhaka','6137813691123','21379183789',0,2),(3,'<script>alert(\"h\")</script>','Uttara, Dhaka','6137813691123','21379183789',0,2),(4,'<script>alert(\"hello\")</script>','Uttara, Dhaka','6137813691123','01706363005',0,2);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_deliveryman`
--

LOCK TABLES `global_controller_deliveryman` WRITE;
/*!40000 ALTER TABLE `global_controller_deliveryman` DISABLE KEYS */;
INSERT INTO `global_controller_deliveryman` VALUES (1,'kamal','Dhaka','Pickup Man','126386172368','401','DK 22001');
/*!40000 ALTER TABLE `global_controller_deliveryman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_controller_deliveryman_current_hub`
--

DROP TABLE IF EXISTS `global_controller_deliveryman_current_hub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_controller_deliveryman_current_hub` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deliveryman_id` bigint NOT NULL,
  `hub_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `global_controller_delive_deliveryman_id_hub_id_bb0290d5_uniq` (`deliveryman_id`,`hub_id`),
  KEY `global_controller_de_hub_id_dfc5165e_fk_global_co` (`hub_id`),
  CONSTRAINT `global_controller_de_deliveryman_id_31c8479b_fk_global_co` FOREIGN KEY (`deliveryman_id`) REFERENCES `global_controller_deliveryman` (`id`),
  CONSTRAINT `global_controller_de_hub_id_dfc5165e_fk_global_co` FOREIGN KEY (`hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_deliveryman_current_hub`
--

LOCK TABLES `global_controller_deliveryman_current_hub` WRITE;
/*!40000 ALTER TABLE `global_controller_deliveryman_current_hub` DISABLE KEYS */;
INSERT INTO `global_controller_deliveryman_current_hub` VALUES (1,1,1);
/*!40000 ALTER TABLE `global_controller_deliveryman_current_hub` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `designation` varchar(100) NOT NULL,
  `NID` varchar(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `hub_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `global_controller_hu_hub_id_f1bf938e_fk_global_co` (`hub_id`),
  CONSTRAINT `global_controller_hu_hub_id_f1bf938e_fk_global_co` FOREIGN KEY (`hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_hubman`
--

LOCK TABLES `global_controller_hubman` WRITE;
/*!40000 ALTER TABLE `global_controller_hubman` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `global_controller_in_product_id_97aa3032_fk_global_co` (`product_id`),
  KEY `global_controller_in_seller_id_3f88a5c9_fk_global_co` (`seller_id`),
  CONSTRAINT `global_controller_in_product_id_97aa3032_fk_global_co` FOREIGN KEY (`product_id`) REFERENCES `global_controller_product` (`id`),
  CONSTRAINT `global_controller_in_seller_id_3f88a5c9_fk_global_co` FOREIGN KEY (`seller_id`) REFERENCES `global_controller_seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_inventory`
--

LOCK TABLES `global_controller_inventory` WRITE;
/*!40000 ALTER TABLE `global_controller_inventory` DISABLE KEYS */;
INSERT INTO `global_controller_inventory` VALUES (1,7,1,1),(2,3,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_order`
--

LOCK TABLES `global_controller_order` WRITE;
/*!40000 ALTER TABLE `global_controller_order` DISABLE KEYS */;
INSERT INTO `global_controller_order` VALUES (1,'qqwwee',1,1,2,1,1,1),(4,'qqwwee',1,1,4,1,1,1),(5,'qqwwee',4,1,4,2,1,1),(6,'qqwwee',3,1,5,1,1,1),(7,'qqwwee',2,1,5,2,1,1),(8,'qqwwee',1,1,6,1,1,1),(9,'qqwwee',1,1,6,1,1,1),(10,'qqwwee',1,1,6,2,1,1),(11,'qqwwee',1,1,7,1,1,1),(12,'qqwwee',1,1,7,1,1,1),(13,'qqwwee',1,1,7,2,1,1),(14,'qqwwee',1,1,8,2,1,1),(15,'qqwwee',1,1,9,2,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_order_set`
--

LOCK TABLES `global_controller_order_set` WRITE;
/*!40000 ALTER TABLE `global_controller_order_set` DISABLE KEYS */;
INSERT INTO `global_controller_order_set` VALUES (1,'2022-07-27',1,3),(2,'2022-07-27',1,4),(3,'2022-07-27',1,5),(4,'2022-07-27',1,6),(5,'2022-07-28',1,7),(6,'2022-08-13',1,8),(7,'2022-08-13',1,9),(8,'2022-08-13',1,10),(9,'2022-08-13',1,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_order_status`
--

LOCK TABLES `global_controller_order_status` WRITE;
/*!40000 ALTER TABLE `global_controller_order_status` DISABLE KEYS */;
INSERT INTO `global_controller_order_status` VALUES (1,'In shop'),(2,'Delivered');
/*!40000 ALTER TABLE `global_controller_order_status` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_product`
--

LOCK TABLES `global_controller_product` WRITE;
/*!40000 ALTER TABLE `global_controller_product` DISABLE KEYS */;
INSERT INTO `global_controller_product` VALUES (1,'Asus VQ27W1B',3,'27 inch gaming monitor',44500,1,1),(2,'HP Hero',2,'Gaming Mouse',5200,2,2);
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
  PRIMARY KEY (`id`),
  KEY `global_controller_se_hub_id_5b0ed730_fk_global_co` (`hub_id`),
  CONSTRAINT `global_controller_se_hub_id_5b0ed730_fk_global_co` FOREIGN KEY (`hub_id`) REFERENCES `global_controller_hub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_seller`
--

LOCK TABLES `global_controller_seller` WRITE;
/*!40000 ALTER TABLE `global_controller_seller` DISABLE KEYS */;
INSERT INTO `global_controller_seller` VALUES (1,'Nasif','New Market, Rajshahi','123123','201','abc','ABC Bank','91239108209',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_controller_transaction`
--

LOCK TABLES `global_controller_transaction` WRITE;
/*!40000 ALTER TABLE `global_controller_transaction` DISABLE KEYS */;
INSERT INTO `global_controller_transaction` VALUES (1,'buy',65300),(2,'buy',65300),(3,'buy',65300),(4,'buy',65300),(5,'buy',65300),(6,'buy',65300),(7,'buy',143900),(8,'buy',94200),(9,'buy',94200),(10,'buy',5200),(11,'buy',5200);
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
INSERT INTO `global_controller_user` VALUES ('<script>alert(\"hello\")</script>','irshad',1),('101','irshad',1),('201','nasif',4),('401','kamal',3),('irshad','irshad',1),('kamal','kamal',3),('Nasif','nasif',4);
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

-- Dump completed on 2022-08-13 20:18:01
