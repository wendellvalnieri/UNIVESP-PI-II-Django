-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: django2
-- ------------------------------------------------------
-- Server version	8.0.36

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add produto',7,'add_produto'),(26,'Can change produto',7,'change_produto'),(27,'Can delete produto',7,'delete_produto'),(28,'Can view produto',7,'view_produto');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$j7ADYCJNKcNn4IOOeDO6bF$4VLR5gmsh8DFMaA0wY8bumNw7Ghv8BbPfAcBKqOtZT4=',NULL,1,'cliente','','','priheuko@yahoo.com.br',1,1,'2024-05-01 19:13:31.828555'),(2,'pbkdf2_sha256$720000$hd6Qq0sS2FLSSUTHxw7kfB$woGl5Wc2StljrMAvU2jM5lPvnKt3zzpMQPK3mFRVBiE=','2024-05-14 18:57:57.727199',1,'priscila','','','priheuko@yahoo.com.br',1,1,'2024-05-02 23:29:30.875546');
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
-- Table structure for table `core_produto`
--

DROP TABLE IF EXISTS `core_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criado` date NOT NULL,
  `modificado` date NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preço` decimal(8,2) NOT NULL,
  `estoque` int NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_produto_slug_2b8518b5` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_produto`
--

LOCK TABLES `core_produto` WRITE;
/*!40000 ALTER TABLE `core_produto` DISABLE KEYS */;
INSERT INTO `core_produto` VALUES (3,'2024-05-03','2024-05-14',1,'KIT TESOURAS PROFISSIONAL',239.96,2,'produtos/kit_tesouras.JPG','kit-tesouras-profissional'),(4,'2024-05-03','2024-05-14',1,'KIT WELLA INVIGO',278.90,3,'produtos/KIT_INVIGO_COLOR_BRILLIANCE.JPG','kit-wella-invigo'),(5,'2024-05-03','2024-05-14',1,'L\'OREAL CURL EXPRESSION',115.90,2,'produtos/LOréal_Professionnel_Serie_Expert_Curl_Expression.JPG','loreal-curl-expression'),(6,'2024-05-03','2024-05-14',1,'CHAPINHA TAIFF',509.00,1,'produtos/TAIFF_-_CHAPINHA.JPG','chapinha-taiff'),(7,'2024-05-03','2024-05-14',1,'L\'ANZA VOLUMIZADOR',284.74,3,'produtos/VOLUMIZADOR.JPG','lanza-volumizador'),(8,'2024-05-03','2024-05-14',1,'SCHWARZKOPF CONDICIONADOR',412.80,2,'produtos/condicionador.JPG','schwarzkopf-condicionador'),(9,'2024-05-09','2024-05-14',1,'shampoo Kérastase',179.96,3,'produtos/kerastase_shampoo.JPG','shampoo-kerastase'),(11,'2024-05-16','2024-05-16',1,'Kit Wella Professionals Oil Reflections Duo Salão',339.00,2,'produtos/oil_reflections_WELLA.JPG','kit-wella-professionals-oil-reflections-duo-salao'),(12,'2024-05-22','2024-05-22',1,'shampoo',200.00,5,'produtos/LOREAL_ABSOLUT_REPAIR.JPG','shampoo');
/*!40000 ALTER TABLE `core_produto` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-05-03 16:59:58.024953','1','playstation 4',1,'[{\"added\": {}}]',7,2),(2,'2024-05-03 17:00:23.010379','2','atari',1,'[{\"added\": {}}]',7,2),(3,'2024-05-03 17:01:43.395679','3','nintendo switch',1,'[{\"added\": {}}]',7,2),(4,'2024-05-03 18:27:00.053097','5','XBOX SERIES X',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',7,2),(5,'2024-05-03 18:27:08.971674','4','MASTER SYSTEM',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',7,2),(6,'2024-05-03 18:27:16.475548','3','nintendo switch',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',7,2),(7,'2024-05-03 18:27:22.878587','2','atari',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',7,2),(8,'2024-05-03 18:27:35.472802','1','playstation 4',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',7,2),(9,'2024-05-03 19:57:42.852212','6','nintendo',2,'[{\"changed\": {\"fields\": [\"Estoque\"]}}]',7,2),(10,'2024-05-14 20:16:44.545246','10','x1',3,'',7,2),(11,'2024-05-14 20:16:52.682023','2','atari',3,'',7,2),(12,'2024-05-14 20:16:56.306123','1','playstation 4',3,'',7,2),(13,'2024-05-14 20:17:58.994723','9','shampoo Kérastase',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Pre\\u00e7o\", \"Estoque\", \"Imagem\"]}}]',7,2),(14,'2024-05-14 20:20:16.564280','8','SCHWARZKOPF CONDIOCIONADOR',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Pre\\u00e7o\", \"Estoque\", \"Imagem\"]}}]',7,2),(15,'2024-05-14 20:20:57.282460','7','L\'ANZA VOLUMIZADOR',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Pre\\u00e7o\", \"Estoque\", \"Imagem\"]}}]',7,2),(16,'2024-05-14 20:21:21.864850','6','CHAPINHA TAIFF',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Pre\\u00e7o\", \"Estoque\", \"Imagem\"]}}]',7,2),(17,'2024-05-14 20:22:11.884478','5','L\'OREAL CURL EXPRESSION',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Pre\\u00e7o\", \"Estoque\", \"Imagem\"]}}]',7,2),(18,'2024-05-14 20:22:42.986450','4','KIT WELLA INVIGO',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Pre\\u00e7o\", \"Estoque\", \"Imagem\"]}}]',7,2),(19,'2024-05-14 20:23:13.273119','3','KIT TESOURAS PROFISSIONAL',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Pre\\u00e7o\", \"Estoque\", \"Imagem\"]}}]',7,2),(20,'2024-05-14 20:30:08.653740','8','SCHWARZKOPF CONDICIONADOR',2,'[{\"changed\": {\"fields\": [\"Nome\"]}}]',7,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core','produto'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-01 19:06:46.008751'),(2,'auth','0001_initial','2024-05-01 19:06:46.752927'),(3,'admin','0001_initial','2024-05-01 19:06:46.923717'),(4,'admin','0002_logentry_remove_auto_add','2024-05-01 19:06:46.933710'),(5,'admin','0003_logentry_add_action_flag_choices','2024-05-01 19:06:46.942836'),(6,'contenttypes','0002_remove_content_type_name','2024-05-01 19:06:47.036080'),(7,'auth','0002_alter_permission_name_max_length','2024-05-01 19:06:47.108521'),(8,'auth','0003_alter_user_email_max_length','2024-05-01 19:06:47.137651'),(9,'auth','0004_alter_user_username_opts','2024-05-01 19:06:47.148777'),(10,'auth','0005_alter_user_last_login_null','2024-05-01 19:06:47.223364'),(11,'auth','0006_require_contenttypes_0002','2024-05-01 19:06:47.227467'),(12,'auth','0007_alter_validators_add_error_messages','2024-05-01 19:06:47.236542'),(13,'auth','0008_alter_user_username_max_length','2024-05-01 19:06:47.313893'),(14,'auth','0009_alter_user_last_name_max_length','2024-05-01 19:06:47.395439'),(15,'auth','0010_alter_group_name_max_length','2024-05-01 19:06:47.419500'),(16,'auth','0011_update_proxy_permissions','2024-05-01 19:06:47.428616'),(17,'auth','0012_alter_user_first_name_max_length','2024-05-01 19:06:47.505067'),(18,'sessions','0001_initial','2024-05-01 19:06:47.546284'),(19,'core','0001_initial','2024-05-02 23:17:16.406819'),(20,'core','0002_alter_produto_imagem','2024-05-02 23:57:33.388507');
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
INSERT INTO `django_session` VALUES ('besbzf14wdgt536sshbvrnmvowv4rc7v','.eJxVjDsOwyAQRO9CHSHW5mNSpvcZ0AJLcBKBZOwqyt2DJRdJN5p5b97M4b5ltzda3RLZlQ3s8tt5DE8qxxAfWO6Vh1q2dfH8QPi5Nj7XSK_byf4dZGy525Lk5BWCAJxAo6IAPiApbQzqBGYUcgARkgBlZSI99iikIKukjV1lny_YYjde:1s6xLZ:0AeTtWDxPI4CoRvYypM8myZiJ5b5B9sErSD7yQumUBE','2024-05-28 18:57:57.769781');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-31 22:59:12
