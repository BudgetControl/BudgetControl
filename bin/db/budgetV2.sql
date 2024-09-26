-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: dt56qwjeg7
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(10,2) DEFAULT NULL,
  `configuration` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `notification` tinyint(1) DEFAULT '0',
  `workspace_id` int(11) unsigned NOT NULL,
  `emails` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`uuid`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
INSERT INTO `budgets` VALUES ('a22270e2-bbf1-4ad5-963a-63d4ceff8d53','Budget 1','Budget 1 description',1000.00,'{\"tags\": [], \"types\": [\"incoming\", \"expenses\", \"debit\"], \"period\": \"recursively\", \"accounts\": [196], \"end_date\": \"3333-11-19T02:08:00.000000Z\", \"categories\": [], \"period_end\": \"2024-08-19T00:00:00.000000Z\", \"start_date\": \"2024-06-08T00:00:00.000000Z\", \"period_start\": \"2024-07-17T00:00:00.000000Z\"}','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,0,1,NULL);
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd33fab82e','food-&-drinks','fas fa-hamburger',NULL,'expenses','food_drinks'),(2,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34082904','shopping','fas fa-shopping-cart',NULL,'expenses','shopping'),(3,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3424b7b8','home','fas fa-home',NULL,'expenses','home'),(4,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3436347d','transport','fas fa-subway',NULL,'expenses','transport'),(5,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd343d8220','vehicles','fas fa-car-alt',NULL,'expenses','vehicles'),(6,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3458b904','entertainment','fas fa-cloud-sun',NULL,'expenses','entertainment'),(7,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd348b183f','communication & pc','fas fa-laptop',NULL,'expenses','communication_pc'),(8,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3492e995','financial expenses','fas fa-hand-holding-usd',NULL,'expenses','financial_expenses'),(9,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd349e3b38','investments','fas fa-file-invoice-dollar',NULL,'investments','investments'),(10,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34a79940','income','fas fa-euro-sign',NULL,'incoming','income'),(11,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34d0dfc4','other','fas fa-question',NULL,'expenses','other');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(10,2) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'United States Dollar',NULL,'USD','$',NULL,'united_states_dollar'),(2,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Euro',NULL,'EUR','€',NULL,'euro'),(3,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'British Pound',NULL,'GBP','£',NULL,'british_pound'),(4,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Japanese Yen',NULL,'JPY','¥',NULL,'japanese_yen'),(5,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Swiss Franc',NULL,'CHF','CHF',NULL,'swiss_franc'),(6,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Canadian Dollar',NULL,'CAD','CA$',NULL,'canadian_dollar'),(7,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Australian Dollar',NULL,'AUD','A$',NULL,'australian_dollar'),(8,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'New Zealand Dollar',NULL,'NZD','NZ$',NULL,'new_zealand_dollar'),(9,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Swedish Krona',NULL,'SEK','SEK',NULL,'swedish_krona'),(10,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Norwegian Krone',NULL,'NOK','NOK',NULL,'norwegian_krone'),(11,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Danish Krone',NULL,'DKK','DKK',NULL,'danish_krone'),(12,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Singapore Dollar',NULL,'SGD','SGD',NULL,'singapore_dollar'),(13,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Hong Kong Dollar',NULL,'HKD','HKD',NULL,'hong_kong_dollar'),(14,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Chinese Yuan',NULL,'CNY','¥',NULL,'chinese_yuan'),(15,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Russian Ruble',NULL,'RUB','₽',NULL,'russian_ruble'),(16,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Indian Rupee',NULL,'INR','₹',NULL,'indian_rupee'),(17,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Indonesian Rupiah',NULL,'IDR','Rp',NULL,'indonesian_rupiah'),(18,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Brazilian Real',NULL,'BRL','R$',NULL,'brazilian_real'),(19,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Mexican Peso',NULL,'MXN','MXN',NULL,'mexican_peso'),(20,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Argentine Peso',NULL,'ARS','$',NULL,'argentine_peso');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty` tinyint(1) DEFAULT '0',
  `transfer` tinyint(1) DEFAULT '0',
  `confirmed` tinyint(1) DEFAULT '0',
  `planned` tinyint(1) DEFAULT '0',
  `installment` tinyint(1) DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL,
  `account_id` int(11) unsigned NOT NULL,
  `transfer_id` int(11) unsigned DEFAULT NULL,
  `transfer_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(11) unsigned NOT NULL,
  `payment_type_id` int(11) unsigned NOT NULL DEFAULT '1',
  `payee_id` int(11) unsigned DEFAULT NULL,
  `waranty` tinyint(1) DEFAULT '0',
  `geolocation` point DEFAULT NULL,
  `workspace_id` int(11) unsigned NOT NULL,
  `exclude_from_stats` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  KEY `account_id` (`account_id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `currency_id` (`currency_id`),
  KEY `payment_type_id` (`payment_type_id`),
  KEY `payee_id` (`payee_id`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `entries_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `wallets` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_ibfk_3` FOREIGN KEY (`payee_id`) REFERENCES `payees` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `sub_categories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_ibfk_5` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `entries_ibfk_6` FOREIGN KEY (`payment_type_id`) REFERENCES `payments_types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,'2024-09-26 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'de4c3643-1b24-4170-9216-8ba6d3d03a37',778.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(2,'2024-10-16 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'030e9825-a98b-42e4-821f-c30cccf2b785',216.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(3,'2024-10-16 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'2a00e25e-2a9b-49da-bd86-616c0ac58962',813.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(4,'2024-10-16 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'ab2e7704-ee7d-41a6-87c8-30fdebbe769b',788.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(5,'2024-10-16 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'d373d245-512d-4bff-b414-9d59781be3ee',894.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(6,'2024-09-26 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'1bf8436a-a47e-46cb-bfa4-183dee46e61d',-294.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(7,'2024-10-16 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'1103a152-c305-483f-9ba6-7a10b7936277',-303.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(8,'2024-10-16 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f953c18d-2dd1-4093-bd0d-ac6de7313285',-946.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(9,'2024-10-16 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'9f3e1e16-9427-4e83-bdc5-848f0906214a',-599.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(10,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'14059d58-411f-4117-825b-524eaac823cb',300.00,'test','transfer',0,1,1,0,0,75,1,1,'f7b3b3b0-0b7b-11ec-82a8-0242ac130004',1,1,NULL,1,NULL,1,0),(11,'2024-12-15 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'360248d7-1aad-462a-8315-9932d8581187',-300.00,'test','transfer',0,1,1,0,0,75,1,4,'f7b3b3b0-0b7b-11ec-82a8-0242ac139903',1,1,NULL,1,NULL,1,0),(12,'2025-01-24 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'cc9ad768-f10a-4c10-951b-6f6c7f58d7f0',300.00,'test','transfer',0,1,1,0,0,75,1,1,'f7b3b3b0-0b7b-11ec-82a8-0242ac130012',1,1,NULL,1,NULL,1,0),(13,'2025-03-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'6728f56c-e97a-4a17-9866-17cc3d518dc1',-300.00,'test','transfer',0,1,1,0,0,75,1,4,'f7b3b3b0-0b7b-11ec-82a8-0242ac130443',1,1,NULL,1,NULL,1,0),(14,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'266a10fa-cd59-4182-a069-29036ab0cf60',-500.00,'test','debit',0,0,1,0,0,55,1,NULL,NULL,1,1,1,1,NULL,1,0),(15,'2024-11-25 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'7bc2b32a-61d4-4c08-b111-ceda019e6a3b',-912.00,'test','debit',0,0,1,0,0,55,1,NULL,NULL,1,1,1,1,NULL,1,0),(16,'2024-12-15 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'a42c4d21-9d44-498b-a9ca-e42b32e78cbe',-447.00,'test','debit',0,0,1,0,0,55,1,NULL,NULL,1,1,1,1,NULL,1,0),(17,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'2b598724-4766-4bec-9529-da3196533d22',550.00,'test','debit',0,0,1,0,0,55,1,NULL,NULL,1,1,1,1,NULL,1,0),(18,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'2b598724-4766-4bec-9529-da3196533d11',-500.00,'test','expenses',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(19,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-0242ac130003',500.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(20,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-delete',525.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(21,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-0242ac130005',200.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(22,'2024-11-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-0242ac130006',400.00,'test','incoming',0,0,1,0,0,12,1,NULL,NULL,1,1,NULL,1,NULL,1,0),(23,'2024-12-15 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-0242ac139903',-300.00,'test','transfer',0,1,1,0,0,75,1,2,'f7b3b3b0-0b7b-11ec-82a8-0242ac130004',1,1,NULL,1,NULL,1,0),(24,'2025-01-24 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-0242ac130004',300.00,'test','transfer',0,1,1,0,0,75,2,1,'f7b3b3b0-0b7b-11ec-82a8-0242ac139903',1,1,NULL,1,NULL,1,0),(25,'2025-03-05 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-0242ac139902',-300.00,'test','transfer',0,1,1,0,0,75,1,2,'f7b3b3b0-0b7b-11ec-82a8-0242ac130001',1,1,NULL,1,NULL,1,0),(26,'2025-04-14 17:05:07','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'f7b3b3b0-0b7b-11ec-82a8-0242ac130001',300.00,'test','transfer',0,1,1,0,0,75,2,1,'f7b3b3b0-0b7b-11ec-82a8-0242ac139902',1,1,NULL,1,NULL,1,0);
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry_labels`
--

DROP TABLE IF EXISTS `entry_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entry_labels` (
  `entry_id` int(11) NOT NULL,
  `labels_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_labels`
--

LOCK TABLES `entry_labels` WRITE;
/*!40000 ALTER TABLE `entry_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `entry_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `command` text COLLATE utf8mb4_unicode_ci,
  `exception` text COLLATE utf8mb4_unicode_ci,
  `failed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `workspace_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `labels_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES (1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'719ffd31-cad7-4ce3-9ff5-bd222a94f226','lorem','#c0c7c7',NULL,0,1),(2,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'38f43916-c3e3-4bcc-a41a-e9d5a5a4bd9b','ipsum','#ad13a2',NULL,0,1),(3,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'82f19ede-032d-49da-892f-592b160e5103','dolor','#ffd52f',NULL,0,1),(4,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'66310d0b-f780-4f4f-900b-1bda117f2d8c','sit','#a1d33d',NULL,0,1),(5,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'3d042296-a101-4dee-96aa-fe59f3b176e1','amet','#cb70ab',NULL,0,1),(6,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'fbca33ab-9652-4ce1-b8d8-ed5c1c77946f','consectetur','#9b698e',NULL,0,1),(7,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'21376478-9dee-4522-abf3-f877d865c17a','adipiscing','#6512bd',NULL,0,1),(8,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'e0e616b0-8d8a-48b7-9b3f-40767edb2dfd','elit','#fc490c',NULL,0,1),(9,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'cfee6ca9-8485-4588-b763-8c9be870aef5','sed','#67c6a1',NULL,0,1),(10,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'707d6751-d863-4a8b-b5b4-a7cecaf82f32','do','#2421fc',NULL,0,1),(11,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'0a7b4c40-f609-4bf3-929e-434867b76ef2','eiusmod','#0f9661',NULL,0,1),(12,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'93b472a3-4fa0-486d-befd-9789ea984a89','tempor','#eda80a',NULL,0,1),(13,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'be2c71b1-afab-427f-be0c-292e40d92806','incididunt','#093f65',NULL,0,1);
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_labels`
--

DROP TABLE IF EXISTS `model_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_labels` (
  `models_id` int(11) NOT NULL,
  `labels_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`models_id`,`labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_labels`
--

LOCK TABLES `model_labels` WRITE;
/*!40000 ALTER TABLE `model_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `workspace_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'2024-09-26 17:05:07','2024-09-26 17:05:07','eebadd83-1b7b-4347-ac1e-a6dae1e51b00',NULL,253.00,'test','incoming',12,1,1,NULL,NULL,1),(2,'2024-09-26 17:05:07','2024-09-26 17:05:07','ed222da0-509a-47ca-b86b-87652fa79ef0',NULL,312.00,'test','incoming',12,1,1,NULL,NULL,1),(3,'2024-09-26 17:05:07','2024-09-26 17:05:07','3800117d-a354-42b3-9690-147ba81129c1',NULL,-344.00,'test','expenses',12,1,1,NULL,NULL,1),(4,'2024-09-26 17:05:07','2024-09-26 17:05:07','31cd9cb4-ba33-44d8-9be0-73efbc72d055',NULL,-559.00,'test','expenses',12,1,1,NULL,NULL,1),(5,'2024-09-26 17:05:07','2024-09-26 17:05:07','f7b3b3b0-0b7b-11ec-82a8-0242ac130002','test',NULL,'test','incoming',12,1,1,NULL,NULL,1);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_migrations`
--

DROP TABLE IF EXISTS `ms_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_migrations`
--

LOCK TABLES `ms_migrations` WRITE;
/*!40000 ALTER TABLE `ms_migrations` DISABLE KEYS */;
INSERT INTO `ms_migrations` VALUES (20240520130509,'WalletTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801070537,'BudgetTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801070700,'CategoriesTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801070731,'CurrenciesTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801070808,'EntriesTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801070848,'EntryLabelsTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801070926,'FailedJobsTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801070958,'LabelsTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071028,'ModelLabelsTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071052,'ModelsTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071125,'PayeesTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071207,'PaymentsTypeTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071242,'PlannedEntriesTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071311,'PlannedEntryLabelsTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071344,'SubCategoriesTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071413,'UsersTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071513,'WorkspacesTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071540,'WorkspaceSettingsTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071612,'WorkspacesUsersMMTable','2024-09-26 17:05:00','2024-09-26 17:05:00',0),(20240801071955,'ForeignKeys','2024-09-26 17:05:00','2024-09-26 17:05:01',0);
/*!40000 ALTER TABLE `ms_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payees`
--

DROP TABLE IF EXISTS `payees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `payees_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payees`
--

LOCK TABLES `payees` WRITE;
/*!40000 ALTER TABLE `payees` DISABLE KEYS */;
INSERT INTO `payees` VALUES (1,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,NULL,'59c171da-b1fa-4cb3-81fb-3a850e58575e','Payee 1');
/*!40000 ALTER TABLE `payees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_types`
--

DROP TABLE IF EXISTS `payments_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_types`
--

LOCK TABLES `payments_types` WRITE;
/*!40000 ALTER TABLE `payments_types` DISABLE KEYS */;
INSERT INTO `payments_types` VALUES (1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'e72bf621-913b-49ba-936c-2b32983b096f','Credit Card',NULL,'credit_card'),(2,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'06ec835b-5090-4610-b8b6-8cfe772bfc6e','Debit Card',NULL,'debit_card'),(3,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'18511a33-8a2c-419b-8cc6-600c293af748','Bank Transfer',NULL,'bank_transfer'),(4,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'75b8b53a-c55f-4392-8596-4b81224e4902','Cash',NULL,'cash'),(5,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'b6e86f85-0a75-412d-b392-b91ad5b9e646','Check',NULL,'check');
/*!40000 ALTER TABLE `payments_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planned_entries`
--

DROP TABLE IF EXISTS `planned_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planned_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `planning` enum('daily','weekly','monthly','yearly','once-shot','recursively') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty` tinyint(1) DEFAULT '0',
  `transfer` tinyint(1) DEFAULT '0',
  `confirmed` tinyint(1) DEFAULT '0',
  `planned` tinyint(1) DEFAULT '1',
  `category_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payee_id` int(11) DEFAULT NULL,
  `geolocation_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `workspace_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  KEY `account_id` (`account_id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `currency_id` (`currency_id`),
  KEY `payment_type` (`payment_type`),
  KEY `payee_id` (`payee_id`),
  KEY `workspace_id` (`workspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planned_entries`
--

LOCK TABLES `planned_entries` WRITE;
/*!40000 ALTER TABLE `planned_entries` DISABLE KEYS */;
INSERT INTO `planned_entries` VALUES (1,'2024-09-26 17:05:07',NULL,'2024-09-26 17:05:07','2024-09-26 17:05:07','37a86187-ddfd-4ffe-9b50-de5fef4f3e3e',517.00,'test',NULL,'incoming',0,0,0,1,12,1,NULL,1,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `planned_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planned_entry_labels`
--

DROP TABLE IF EXISTS `planned_entry_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planned_entry_labels` (
  `planned_entry_id` int(11) NOT NULL,
  `labels_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`planned_entry_id`,`labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planned_entry_labels`
--

LOCK TABLES `planned_entry_labels` WRITE;
/*!40000 ALTER TABLE `planned_entry_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `planned_entry_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_time` datetime DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `exclude_from_stats` tinyint(1) DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `sub_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd33fc645d','bars-&-clubs',1,NULL,0,'bars_clubs'),(2,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd33fe2db1','restaurants & fast-food',1,NULL,0,'restaurants_fast_food'),(3,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34005b12','groceries',1,NULL,0,'groceries'),(4,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3409933b','clothing & shoes',2,NULL,0,'clothing_shoes'),(5,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd340b1bd5','pets',2,NULL,0,'pets'),(6,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34156a8a','beauty & wellness',2,NULL,0,'beauty_wellness'),(7,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3417082b','stationery & tools',2,NULL,0,'stationery_tools'),(8,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34187428','home & garden',2,NULL,0,'home_garden'),(9,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3419e3bc','electronics, accessories',2,NULL,0,'electronics_accessories'),(10,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd341b4fd1','pharmacy',2,NULL,0,'pharmacy'),(11,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd341cc935','children',2,NULL,0,'children'),(12,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd341e3f4d','jewelry & accessories',2,NULL,0,'jewelry_accessories'),(13,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd342061d0','gifts',2,NULL,0,'gifts'),(14,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3421c9df','family assistance',2,NULL,0,'family_assistance'),(15,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34234923','leisure',2,NULL,0,'leisure'),(16,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34262b0a','rent',3,NULL,0,'rent'),(17,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34279fdd','property insurance',3,NULL,0,'property_insurance'),(18,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3429166f','condominium',3,NULL,0,'condominium'),(19,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd342a923b','energy & utilities',3,NULL,0,'energy_utilities'),(20,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd342c0b1e','maintenance',3,NULL,0,'maintenance'),(21,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd342d7fed','mortgage',3,NULL,0,'mortgage'),(22,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3437b202','taxi',4,NULL,0,'taxi'),(23,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34391f8a','public transport',4,NULL,0,'public_transport'),(24,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd343a9a52','trips',4,NULL,0,'trips'),(25,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd343c1e24','business trips',4,NULL,0,'business_trips'),(26,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd343ee87a','vehicle insurance',5,NULL,0,'vehicle_insurance'),(27,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34410996','fuel',5,NULL,0,'fuel'),(28,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34427667','vehicle maintenance',5,NULL,0,'vehicle_maintenance'),(29,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3443e70c','rentals',5,NULL,0,'rentals'),(30,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34455430','parking',5,NULL,0,'parking'),(31,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3456ea7b','tolls',5,NULL,0,'tolls'),(32,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34673e16','alcohol',6,NULL,0,'alcohol'),(33,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3468a7df','tobacco',6,NULL,0,'tobacco'),(34,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd346a22da','culture, sports events',6,NULL,0,'culture_sports_events'),(35,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd346b8ce8','donations, charity',6,NULL,0,'donations_charity'),(36,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd346cf022','events',6,NULL,0,'events'),(37,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd346e4ea6','wedding',6,NULL,0,'wedding'),(38,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd347080fa','training, development',6,NULL,0,'training_development'),(39,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3471e92f','hobbies',6,NULL,0,'hobbies'),(40,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34735340','books, audio, subscriptions',6,NULL,0,'books_audio_subscriptions'),(41,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3475c224','lotteries & gambling',6,NULL,0,'lotteries_gambling'),(42,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd347738ec','health',6,NULL,0,'health'),(43,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34789d6c','sports, fitness',6,NULL,0,'sports_fitness'),(44,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd347a4aa1','tv & streaming',6,NULL,0,'tv_streaming'),(45,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34818d9b','holidays',6,NULL,0,'holidays'),(46,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3489a8e7','hotels',6,NULL,0,'hotels'),(47,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd348c7799','internet',7,NULL,0,'internet'),(48,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd348de1cb','postal services',7,NULL,0,'postal_services'),(49,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34901262','software, apps & games',7,NULL,0,'software_apps_games'),(50,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34917feb','telephone',7,NULL,0,'telephone'),(51,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34945b39','family allowance',8,NULL,0,'family_allowance'),(52,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3495c208','insurance',8,NULL,0,'insurance'),(53,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34972877','consultancy',8,NULL,0,'consultancy'),(54,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34988c32','fines',8,NULL,0,'fines'),(55,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd3499f86c','loans & interests',8,NULL,0,'loans_interests'),(56,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd349b66a4','taxes',8,NULL,0,'taxes'),(57,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd349cce90','taxes, commissions',8,NULL,0,'taxes_commissions'),(58,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34a05b27','real estate',9,NULL,0,'real_estate'),(59,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34a1cb95','movable property',9,NULL,0,'movable_property'),(60,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34a33e4b','financial investments',9,NULL,0,'financial_investments'),(61,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34a4a6eb','collections',9,NULL,0,'collections'),(62,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34a6103c','savings',9,NULL,0,'savings'),(63,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34a92396','checks',10,NULL,0,'checks'),(64,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34aac024','coupons',10,NULL,0,'coupons'),(65,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34ac3e9b','family allowance',10,NULL,0,'family_allowance'),(66,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34ada18a','rental income',10,NULL,0,'rental_income'),(67,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34af17aa','interest, dividends',10,NULL,0,'interest_dividends'),(68,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34b14b4a','lotteries & gambling',10,NULL,0,'lotteries_gambling'),(69,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34b2bcd4','loans, rentals',10,NULL,0,'loans_rentals'),(70,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34bdce92','quotas & grants',10,NULL,0,'quotas_grants'),(71,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34c00eec','gifts',10,NULL,0,'gifts'),(72,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34ca2820','refunds (taxes, purchases)',10,NULL,0,'refunds_taxes_purchases'),(73,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'6357ff2aaf8eb','salary',10,NULL,0,'salary'),(74,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'6357ff2ab1a47','sales',10,NULL,0,'sales'),(75,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'635bd34d25f01','other',11,NULL,0,'other'),(76,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'6560a071d8822','transfer',11,NULL,1,'transfer');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `sub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'8936394c-3735-4053-992b-ba9b4e70e300','YWAlYxYF6/vEI4mmmau1Qw==','QAgWVlAsznLANmKVzbyCJEoaSGqWSFfSqDfdjGiO43o=',NULL,'I2sOiQ0v7xXHnhriW5oRbg==',NULL,'2024-09-26 17:05:07','2024-09-26 17:10:52',NULL,'93HDZawHjmPBd3adSuqacJd0nXC3iS/4Wjq3WNGRfc/k0IcpborM8c/9LmYDsnWb'),(2,'2f6cd46c-fbef-4d12-be20-61304463fdd8','0kKAcYZUe84AGlEy81d3dg==','aLBgaOXxLZJUkmrTkeON6g==','2024-09-26 17:05:07','9ZS3tYAl/rG+qpEAtI7O6g==',NULL,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,'Zlu2p8NUtmlX5dkGpflRTZw4N9VyHWGIb/hWw68XcgC5WDIF3TvICqtdFuuNZR7h');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(22) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('bank','cache','credit-card','investment','loan','other','prepaid-card','credit-card-revolving') COLLATE utf8mb4_unicode_ci NOT NULL,
  `installement` int(11) DEFAULT '0',
  `installement_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(10,2) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `exclude_from_stats` tinyint(1) DEFAULT '0',
  `invoice_date` date DEFAULT NULL,
  `payment_account` int(11) DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `workspace_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `id` (`id`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,'a48f54d7-6ce1-44ae-8fa2-3a68b95fdf07','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','credit-card-revolving',0,'400',NULL,'2',0.00,0,'2024-07-11',1,'2024-07-04',NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL),(2,'6e8c9f96-f8a2-4193-a8b6-fc56b5db5075','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','credit-card',0,NULL,NULL,'2',0.00,0,'2024-07-11',1,'2024-07-04',NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL),(3,'61f6ffd1-d1d0-4cd2-972c-59c2e9d66bcf','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','bank',0,NULL,NULL,'2',0.00,0,NULL,1,NULL,NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL),(4,'0a716cac-0a23-4fa3-a249-c322ff2013a1','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','cache',0,NULL,NULL,'2',0.00,0,NULL,1,NULL,NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL),(5,'05ab7e8c-81f8-46d7-925a-fbc321103f22','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','investment',0,NULL,NULL,'2',0.00,0,NULL,1,NULL,NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL),(6,'d8f243ac-524c-4a00-92d5-1e022ab51454','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','loan',0,NULL,NULL,'2',0.00,0,NULL,1,NULL,NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL),(7,'1e4ba726-5803-457a-bb8f-a858ad0b7ee1','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','other',0,NULL,NULL,'2',0.00,0,NULL,1,NULL,NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL),(8,'47441c65-bd1e-4d62-8f43-8b18da5ffaca','CgslzfSyQtuxgAh9wj+vvw==','#e6e632ff','prepaid-card',0,NULL,NULL,'2',0.00,0,NULL,1,NULL,NULL,1,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL);
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspace_settings`
--

DROP TABLE IF EXISTS `workspace_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspace_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` int(11) unsigned NOT NULL,
  `setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `workspace_id` (`workspace_id`),
  CONSTRAINT `workspace_settings_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspace_settings`
--

LOCK TABLES `workspace_settings` WRITE;
/*!40000 ALTER TABLE `workspace_settings` DISABLE KEYS */;
INSERT INTO `workspace_settings` VALUES (1,1,'app_configurations','{\"currency_id\": 1, \"payment_type_id\": 1}','2024-09-26 17:05:07','2024-09-26 17:05:07',NULL);
/*!40000 ALTER TABLE `workspace_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspaces` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `current` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `workspaces_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (1,'89ba510c-5bbf-4f80-902b-6c4c53fb6496','test','test',1,'2024-09-26 17:05:07','2024-09-26 17:11:36',NULL,1),(2,'4373a9a3-a482-4d5a-b8fe-c0572be7efe3','test','test',0,'2024-09-26 17:05:07','2024-09-26 17:05:07',NULL,2);
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces_users_mm`
--

DROP TABLE IF EXISTS `workspaces_users_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspaces_users_mm` (
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`workspace_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces_users_mm`
--

LOCK TABLES `workspaces_users_mm` WRITE;
/*!40000 ALTER TABLE `workspaces_users_mm` DISABLE KEYS */;
INSERT INTO `workspaces_users_mm` VALUES (1,1,'2024-09-26 17:05:07','2024-09-26 17:05:07');
/*!40000 ALTER TABLE `workspaces_users_mm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 19:12:49
