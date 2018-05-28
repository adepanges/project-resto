/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.21-0ubuntu0.16.04.1 : Database - project_resto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `orders` */

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  `pay` decimal(15,2) DEFAULT NULL,
  `refund` decimal(15,2) DEFAULT NULL,
  `pay_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `table_id` (`table_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `table` (`table_id`) ON UPDATE NO ACTION,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sso_user` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`table_id`,`user_id`,`customer_name`,`total_price`,`pay`,`refund`,`pay_at`,`created_at`,`is_deleted`,`is_active`) values (360,2,NULL,'Indri',33000.00,NULL,NULL,NULL,'2018-05-05 03:34:09',0,0),(361,3,NULL,'Ayu',4500.00,NULL,NULL,NULL,'2018-05-05 21:02:14',0,0),(362,4,NULL,'gina',33000.00,35000.00,2000.00,NULL,'2018-05-05 21:04:23',0,0),(363,5,NULL,'abdul',74500.00,100000.00,25500.00,NULL,'2018-05-05 21:04:34',0,0),(364,6,NULL,'dobleh',43000.00,50000.00,7000.00,NULL,'2018-05-06 03:34:15',0,0),(365,2,NULL,'Indri',60000.00,60000.00,0.00,NULL,'2018-05-15 23:06:45',0,0),(366,2,NULL,'Indri',37500.00,40000.00,2500.00,NULL,'2018-05-15 23:45:48',0,0),(367,2,NULL,'Inu',58000.00,70000.00,12000.00,NULL,'2018-05-16 13:44:26',0,0),(368,2,NULL,'Eko',1090000.00,1100000.00,10000.00,NULL,'2018-05-18 08:13:32',0,0),(369,2,NULL,'Eko',2180000.00,2200000.00,20000.00,NULL,'2018-05-18 08:13:33',0,0),(370,2,NULL,'Indri',1000000.00,1000000.00,0.00,NULL,'2018-05-18 09:48:11',0,0),(371,2,NULL,'Indri',250000.00,300000.00,50000.00,NULL,'2018-05-18 09:51:14',0,0),(372,2,NULL,'Seno',3005000.00,3050000.00,45000.00,NULL,'2018-05-18 09:53:30',0,0),(373,2,NULL,'Indri',2000000.00,2000000.00,0.00,NULL,'2018-05-18 09:58:51',0,0),(374,2,NULL,'Dona',2730000.00,2730000.00,0.00,NULL,'2018-05-21 07:23:42',0,0),(375,3,NULL,'Muhib',2000000.00,2300000.00,300000.00,NULL,'2018-05-21 19:46:02',0,0),(376,3,NULL,'Indri',1600000.00,1600000.00,0.00,NULL,'2018-05-21 19:52:04',0,0),(377,4,NULL,'',55000.00,NULL,NULL,NULL,'2018-05-21 22:18:51',0,1),(378,5,NULL,'Indri',2120000.00,2200000.00,80000.00,NULL,'2018-05-21 22:49:23',0,0),(379,2,NULL,'Indri',3000000.00,3000000.00,0.00,'2018-05-28 09:12:29','2018-05-24 22:10:02',0,0);

/*Table structure for table `orders_cart` */

CREATE TABLE `orders_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `qty` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_reference_30` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `FK_reference_30` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL,
  CONSTRAINT `orders_cart_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1324 DEFAULT CHARSET=latin1;

/*Data for the table `orders_cart` */

insert  into `orders_cart`(`cart_id`,`order_id`,`product_id`,`product_name`,`unit_price`,`price`,`qty`) values (1271,360,6,'Teh Tawar',1000.00,1000.00,1),(1274,360,NULL,'Ayam Gepuk Paha',16000.00,32000.00,2),(1275,363,6,'Teh Tawar',1000.00,1000.00,1),(1276,363,11,'Nasi Uduk',6000.00,12000.00,2),(1277,363,NULL,'Teh Manis',4500.00,13500.00,3),(1278,363,NULL,'Ayam Gepuk Dada',16000.00,48000.00,3),(1279,361,NULL,'Teh Manis',4500.00,4500.00,1),(1280,362,6,'Teh Tawar',1000.00,1000.00,1),(1281,362,8,'Nasi Goreng Spesial',15000.00,15000.00,1),(1282,362,9,'Nasi Goreng Gila',17000.00,17000.00,1),(1283,364,7,'Nasi Goreng',12000.00,12000.00,1),(1284,364,8,'Nasi Goreng Spesial',15000.00,15000.00,1),(1285,364,NULL,'Ayam Gepuk Dada',16000.00,16000.00,1),(1286,365,11,'Nasi Uduk',6000.00,12000.00,2),(1287,365,NULL,'Ayam Gepuk Dada',16000.00,48000.00,3),(1288,366,6,'Teh Tawar',1000.00,1000.00,1),(1289,366,8,'Nasi Goreng Spesial',15000.00,15000.00,1),(1290,366,9,'Nasi Goreng Gila',17000.00,17000.00,1),(1291,366,NULL,'Teh Manis',4500.00,4500.00,1),(1292,367,NULL,'Teh Manis',4500.00,9000.00,2),(1293,367,6,'Teh Tawar',1000.00,4000.00,4),(1294,367,8,'Nasi Goreng Spesial',15000.00,45000.00,3),(1295,368,NULL,'Black Label',1000000.00,1000000.00,1),(1296,368,17,'Coca-cola',30000.00,30000.00,1),(1297,368,17,'Coca-cola',30000.00,60000.00,2),(1298,369,NULL,'Black Label',1000000.00,2000000.00,2),(1299,369,17,'Coca-cola',30000.00,180000.00,6),(1300,370,NULL,'Black Label',1000000.00,1000000.00,1),(1301,371,NULL,'Mansion K',250000.00,250000.00,1),(1302,372,NULL,'Black Label',1000000.00,2000000.00,2),(1303,372,15,'Bir Bintang Putih',55000.00,550000.00,10),(1304,372,17,'Coca-cola',30000.00,180000.00,6),(1305,372,16,'Quiness',55000.00,275000.00,5),(1306,373,NULL,'Black Label',1000000.00,1000000.00,1),(1307,373,6,'Chivas Regael',1000000.00,1000000.00,1),(1308,374,NULL,'Black Label',1000000.00,2000000.00,2),(1309,374,8,'Long Island',160000.00,480000.00,3),(1310,374,NULL,'Mansion K',250000.00,250000.00,1),(1311,375,NULL,'Vodka B',500000.00,1500000.00,3),(1312,375,NULL,'Mansion K',250000.00,500000.00,2),(1313,376,9,'Margaret',150000.00,150000.00,1),(1314,376,10,'Strong Long Island',200000.00,200000.00,1),(1315,376,NULL,'Mansion K',250000.00,250000.00,1),(1316,376,6,'Chivas Regael',1000000.00,1000000.00,1),(1317,378,6,'Chivas Regael',1000000.00,2000000.00,2),(1318,378,17,'Coca-cola',30000.00,120000.00,4),(1319,377,15,'Bir Bintang Putih',55000.00,55000.00,1),(1320,379,6,'Chivas Regael',1000000.00,1000000.00,1),(1321,379,14,'Vodka ',500000.00,500000.00,1),(1322,379,7,'Red Label',750000.00,750000.00,1),(1323,379,7,'Red Label',750000.00,750000.00,1);

/*Table structure for table `orders_invoices` */

CREATE TABLE `orders_invoices` (
  `order_invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `franchise_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_address_id` int(11) DEFAULT NULL,
  `logistic_id` int(11) DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `order_code` varchar(20) DEFAULT NULL,
  `customer` text,
  `customer_address` text,
  `order_cart` text,
  `total_price` decimal(15,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `billed_date` datetime DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `printed` smallint(6) DEFAULT '0',
  `logistic_name` varchar(255) DEFAULT NULL,
  `version` smallint(6) DEFAULT '1',
  PRIMARY KEY (`order_invoice_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `FK_reference_39` (`customer_id`),
  KEY `FK_reference_40` (`customer_address_id`),
  KEY `FK_reference_38` (`order_id`),
  KEY `orders_invoices_ibfk_1` (`franchise_id`),
  KEY `logistic_id` (`logistic_id`),
  CONSTRAINT `FK_reference_38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_reference_39` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_reference_40` FOREIGN KEY (`customer_address_id`) REFERENCES `customer_address` (`customer_address_id`),
  CONSTRAINT `orders_invoices_ibfk_1` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE SET NULL,
  CONSTRAINT `orders_invoices_ibfk_2` FOREIGN KEY (`logistic_id`) REFERENCES `master_logistics` (`logistic_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orders_invoices` */

/*Table structure for table `product` */

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('FOOD','DRINK') DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `status` smallint(6) DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`product_id`,`name`,`type`,`unit_price`,`status`) values (6,'Chivas Regael','DRINK',1000000.00,1),(7,'Red Label','DRINK',750000.00,1),(8,'Long Island','DRINK',160000.00,1),(9,'Margaret','DRINK',150000.00,1),(10,'Strong Long Island','DRINK',200000.00,1),(11,'Mansion ','DRINK',500000.00,1),(14,'Vodka ','DRINK',500000.00,1),(15,'Bir Bintang Putih','DRINK',55000.00,1),(16,'Quiness','DRINK',55000.00,1),(17,'Coca-cola','DRINK',30000.00,1),(18,'Sprite','DRINK',30000.00,1),(19,'Black Label','DRINK',1500000.00,1);

/*Table structure for table `sso_role` */

CREATE TABLE `sso_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `sso_role` */

insert  into `sso_role`(`role_id`,`name`,`label`,`status`) values (1,'ADMINISTRATOR','Administrator',1),(2,'PIMPINAN','Pimpinan',1),(3,'CASHIER','Cashier',1),(4,'Waiters','Waiters',1);

/*Table structure for table `sso_session_web` */

CREATE TABLE `sso_session_web` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sso_session_web` */

/*Table structure for table `sso_user` */

CREATE TABLE `sso_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Data for the table `sso_user` */

insert  into `sso_user`(`user_id`,`username`,`password`,`email`,`first_name`,`last_name`,`created_at`,`updated_at`,`status`) values (1,'NO_USER',NULL,NULL,NULL,NULL,NULL,NULL,0),(31,'Admin','0cc175b9c0f1b6a831c399e269772661','admin@mutiara.com','Admin','Mini','2018-02-15 17:15:43','2018-05-20 17:06:13',1),(34,'Ayu','0cc175b9c0f1b6a831c399e269772661','ayu@mutiara.com','Ayu','Sukandar','2018-02-22 17:11:54','2018-05-28 09:33:37',1),(38,'Dhini','0cc175b9c0f1b6a831c399e269772661','dhimas@mutiara.com','Dhini','','2018-02-22 17:13:38','2018-05-20 17:06:52',1),(43,'Hitania','0cc175b9c0f1b6a831c399e269772661','hitania@mutiara.com','Hitania','Patma','2018-02-22 17:15:30','2018-05-24 13:55:01',1),(46,'Shanty','0cc175b9c0f1b6a831c399e269772661','sai@mutiara.com','Shanty','','2018-02-22 17:17:01','2018-05-20 17:07:08',1),(47,'Dede','0cc175b9c0f1b6a831c399e269772661','nurrudin@mutiara.com','Dede','Shihab','2018-02-22 17:17:27','2018-05-20 17:07:14',1),(48,'Tania','0cc175b9c0f1b6a831c399e269772661','ugan@mutiara.com','Tania','Amelia','2018-02-22 17:17:49','2018-05-20 17:07:21',1),(49,'Windy','0cc175b9c0f1b6a831c399e269772661','amir@mutiara.com','Windy','','2018-02-22 17:18:02','2018-05-20 17:07:27',1),(51,'Yunita','0cc175b9c0f1b6a831c399e269772661','yunus@mutiara.com','Yunita','','2018-02-22 17:18:45','2018-05-20 17:07:46',1),(52,'Pimpinan','0cc175b9c0f1b6a831c399e269772661','a@mutiara.com','Big','Boss','2018-05-20 17:05:38','2018-05-24 13:55:27',1),(53,'ani','a6c45362cf65dee14014c5396509ba22','ani123@gmail.com','ani','ani','2018-05-24 22:08:58','2018-05-24 22:08:58',1);

/*Table structure for table `sso_user_role` */

CREATE TABLE `sso_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`user_role_id`),
  KEY `FK_reference_2` (`role_id`),
  KEY `FK_reference_1` (`user_id`),
  CONSTRAINT `FK_reference_1` FOREIGN KEY (`user_id`) REFERENCES `sso_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_reference_2` FOREIGN KEY (`role_id`) REFERENCES `sso_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

/*Data for the table `sso_user_role` */

insert  into `sso_user_role`(`user_role_id`,`user_id`,`role_id`,`created_at`,`status`) values (1,31,1,'2018-02-20 16:45:59',1),(27,31,2,'2018-04-26 22:14:45',1),(28,48,4,'2018-05-03 22:31:47',1),(29,43,3,'2018-05-06 03:42:41',1),(30,52,2,'2018-05-20 17:08:22',1),(31,34,3,'2018-05-21 07:23:04',1),(33,34,4,'2018-05-24 13:36:04',1),(35,38,4,'2018-05-24 13:36:57',1),(36,46,4,'2018-05-24 13:37:23',1),(37,47,4,'2018-05-24 13:37:46',1),(38,49,4,'2018-05-24 13:38:31',1),(40,51,4,'2018-05-24 13:39:26',1),(41,53,4,'2018-05-24 22:09:21',1);

/*Table structure for table `table` */

CREATE TABLE `table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `table` */

insert  into `table`(`table_id`,`code`,`name`,`status`) values (2,'A1','1',1),(3,'A2','2',1),(4,'A3','3',1),(5,'A4','4',1),(6,'A5','5',1);

/*Table structure for table `time_dimension` */

CREATE TABLE `time_dimension` (
  `id` int(11) NOT NULL,
  `db_date` date NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `day_name` varchar(9) NOT NULL,
  `month_name` varchar(9) NOT NULL,
  `holiday_flag` tinyint(1) DEFAULT '0',
  `weekend_flag` tinyint(1) DEFAULT '0',
  `event` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `td_ymd_idx` (`year`,`month`,`day`),
  UNIQUE KEY `td_dbdate_idx` (`db_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `time_dimension` */

insert  into `time_dimension`(`id`,`db_date`,`year`,`month`,`day`,`quarter`,`week`,`day_name`,`month_name`,`holiday_flag`,`weekend_flag`,`event`) values (20180101,'2018-01-01',2018,1,1,1,1,'Senin','Januari',0,0,NULL),(20180102,'2018-01-02',2018,1,2,1,1,'Selasa','Januari',0,0,NULL),(20180103,'2018-01-03',2018,1,3,1,1,'Rabu','Januari',0,0,NULL),(20180104,'2018-01-04',2018,1,4,1,1,'Kamis','Januari',0,0,NULL),(20180105,'2018-01-05',2018,1,5,1,1,'Jumat','Januari',0,0,NULL),(20180106,'2018-01-06',2018,1,6,1,1,'Sabtu','Januari',0,1,NULL),(20180107,'2018-01-07',2018,1,7,1,1,'Minggu','Januari',0,1,NULL),(20180108,'2018-01-08',2018,1,8,1,2,'Senin','Januari',0,0,NULL),(20180109,'2018-01-09',2018,1,9,1,2,'Selasa','Januari',0,0,NULL),(20180110,'2018-01-10',2018,1,10,1,2,'Rabu','Januari',0,0,NULL),(20180111,'2018-01-11',2018,1,11,1,2,'Kamis','Januari',0,0,NULL),(20180112,'2018-01-12',2018,1,12,1,2,'Jumat','Januari',0,0,NULL),(20180113,'2018-01-13',2018,1,13,1,2,'Sabtu','Januari',0,1,NULL),(20180114,'2018-01-14',2018,1,14,1,2,'Minggu','Januari',0,1,NULL),(20180115,'2018-01-15',2018,1,15,1,3,'Senin','Januari',0,0,NULL),(20180116,'2018-01-16',2018,1,16,1,3,'Selasa','Januari',0,0,NULL),(20180117,'2018-01-17',2018,1,17,1,3,'Rabu','Januari',0,0,NULL),(20180118,'2018-01-18',2018,1,18,1,3,'Kamis','Januari',0,0,NULL),(20180119,'2018-01-19',2018,1,19,1,3,'Jumat','Januari',0,0,NULL),(20180120,'2018-01-20',2018,1,20,1,3,'Sabtu','Januari',0,1,NULL),(20180121,'2018-01-21',2018,1,21,1,3,'Minggu','Januari',0,1,NULL),(20180122,'2018-01-22',2018,1,22,1,4,'Senin','Januari',0,0,NULL),(20180123,'2018-01-23',2018,1,23,1,4,'Selasa','Januari',0,0,NULL),(20180124,'2018-01-24',2018,1,24,1,4,'Rabu','Januari',0,0,NULL),(20180125,'2018-01-25',2018,1,25,1,4,'Kamis','Januari',0,0,NULL),(20180126,'2018-01-26',2018,1,26,1,4,'Jumat','Januari',0,0,NULL),(20180127,'2018-01-27',2018,1,27,1,4,'Sabtu','Januari',0,1,NULL),(20180128,'2018-01-28',2018,1,28,1,4,'Minggu','Januari',0,1,NULL),(20180129,'2018-01-29',2018,1,29,1,5,'Senin','Januari',0,0,NULL),(20180130,'2018-01-30',2018,1,30,1,5,'Selasa','Januari',0,0,NULL),(20180131,'2018-01-31',2018,1,31,1,5,'Rabu','Januari',0,0,NULL),(20180201,'2018-02-01',2018,2,1,1,5,'Kamis','Februari',0,0,NULL),(20180202,'2018-02-02',2018,2,2,1,5,'Jumat','Februari',0,0,NULL),(20180203,'2018-02-03',2018,2,3,1,5,'Sabtu','Februari',0,1,NULL),(20180204,'2018-02-04',2018,2,4,1,5,'Minggu','Februari',0,1,NULL),(20180205,'2018-02-05',2018,2,5,1,6,'Senin','Februari',0,0,NULL),(20180206,'2018-02-06',2018,2,6,1,6,'Selasa','Februari',0,0,NULL),(20180207,'2018-02-07',2018,2,7,1,6,'Rabu','Februari',0,0,NULL),(20180208,'2018-02-08',2018,2,8,1,6,'Kamis','Februari',0,0,NULL),(20180209,'2018-02-09',2018,2,9,1,6,'Jumat','Februari',0,0,NULL),(20180210,'2018-02-10',2018,2,10,1,6,'Sabtu','Februari',0,1,NULL),(20180211,'2018-02-11',2018,2,11,1,6,'Minggu','Februari',0,1,NULL),(20180212,'2018-02-12',2018,2,12,1,7,'Senin','Februari',0,0,NULL),(20180213,'2018-02-13',2018,2,13,1,7,'Selasa','Februari',0,0,NULL),(20180214,'2018-02-14',2018,2,14,1,7,'Rabu','Februari',0,0,NULL),(20180215,'2018-02-15',2018,2,15,1,7,'Kamis','Februari',0,0,NULL),(20180216,'2018-02-16',2018,2,16,1,7,'Jumat','Februari',0,0,NULL),(20180217,'2018-02-17',2018,2,17,1,7,'Sabtu','Februari',0,1,NULL),(20180218,'2018-02-18',2018,2,18,1,7,'Minggu','Februari',0,1,NULL),(20180219,'2018-02-19',2018,2,19,1,8,'Senin','Februari',0,0,NULL),(20180220,'2018-02-20',2018,2,20,1,8,'Selasa','Februari',0,0,NULL),(20180221,'2018-02-21',2018,2,21,1,8,'Rabu','Februari',0,0,NULL),(20180222,'2018-02-22',2018,2,22,1,8,'Kamis','Februari',0,0,NULL),(20180223,'2018-02-23',2018,2,23,1,8,'Jumat','Februari',0,0,NULL),(20180224,'2018-02-24',2018,2,24,1,8,'Sabtu','Februari',0,1,NULL),(20180225,'2018-02-25',2018,2,25,1,8,'Minggu','Februari',0,1,NULL),(20180226,'2018-02-26',2018,2,26,1,9,'Senin','Februari',0,0,NULL),(20180227,'2018-02-27',2018,2,27,1,9,'Selasa','Februari',0,0,NULL),(20180228,'2018-02-28',2018,2,28,1,9,'Rabu','Februari',0,0,NULL),(20180301,'2018-03-01',2018,3,1,1,9,'Kamis','Maret',0,0,NULL),(20180302,'2018-03-02',2018,3,2,1,9,'Jumat','Maret',0,0,NULL),(20180303,'2018-03-03',2018,3,3,1,9,'Sabtu','Maret',0,1,NULL),(20180304,'2018-03-04',2018,3,4,1,9,'Minggu','Maret',0,1,NULL),(20180305,'2018-03-05',2018,3,5,1,10,'Senin','Maret',0,0,NULL),(20180306,'2018-03-06',2018,3,6,1,10,'Selasa','Maret',0,0,NULL),(20180307,'2018-03-07',2018,3,7,1,10,'Rabu','Maret',0,0,NULL),(20180308,'2018-03-08',2018,3,8,1,10,'Kamis','Maret',0,0,NULL),(20180309,'2018-03-09',2018,3,9,1,10,'Jumat','Maret',0,0,NULL),(20180310,'2018-03-10',2018,3,10,1,10,'Sabtu','Maret',0,1,NULL),(20180311,'2018-03-11',2018,3,11,1,10,'Minggu','Maret',0,1,NULL),(20180312,'2018-03-12',2018,3,12,1,11,'Senin','Maret',0,0,NULL),(20180313,'2018-03-13',2018,3,13,1,11,'Selasa','Maret',0,0,NULL),(20180314,'2018-03-14',2018,3,14,1,11,'Rabu','Maret',0,0,NULL),(20180315,'2018-03-15',2018,3,15,1,11,'Kamis','Maret',0,0,NULL),(20180316,'2018-03-16',2018,3,16,1,11,'Jumat','Maret',0,0,NULL),(20180317,'2018-03-17',2018,3,17,1,11,'Sabtu','Maret',0,1,NULL),(20180318,'2018-03-18',2018,3,18,1,11,'Minggu','Maret',0,1,NULL),(20180319,'2018-03-19',2018,3,19,1,12,'Senin','Maret',0,0,NULL),(20180320,'2018-03-20',2018,3,20,1,12,'Selasa','Maret',0,0,NULL),(20180321,'2018-03-21',2018,3,21,1,12,'Rabu','Maret',0,0,NULL),(20180322,'2018-03-22',2018,3,22,1,12,'Kamis','Maret',0,0,NULL),(20180323,'2018-03-23',2018,3,23,1,12,'Jumat','Maret',0,0,NULL),(20180324,'2018-03-24',2018,3,24,1,12,'Sabtu','Maret',0,1,NULL),(20180325,'2018-03-25',2018,3,25,1,12,'Minggu','Maret',0,1,NULL),(20180326,'2018-03-26',2018,3,26,1,13,'Senin','Maret',0,0,NULL),(20180327,'2018-03-27',2018,3,27,1,13,'Selasa','Maret',0,0,NULL),(20180328,'2018-03-28',2018,3,28,1,13,'Rabu','Maret',0,0,NULL),(20180329,'2018-03-29',2018,3,29,1,13,'Kamis','Maret',0,0,NULL),(20180330,'2018-03-30',2018,3,30,1,13,'Jumat','Maret',0,0,NULL),(20180331,'2018-03-31',2018,3,31,1,13,'Sabtu','Maret',0,1,NULL),(20180401,'2018-04-01',2018,4,1,2,13,'Minggu','April',0,1,NULL),(20180402,'2018-04-02',2018,4,2,2,14,'Senin','April',0,0,NULL),(20180403,'2018-04-03',2018,4,3,2,14,'Selasa','April',0,0,NULL),(20180404,'2018-04-04',2018,4,4,2,14,'Rabu','April',0,0,NULL),(20180405,'2018-04-05',2018,4,5,2,14,'Kamis','April',0,0,NULL),(20180406,'2018-04-06',2018,4,6,2,14,'Jumat','April',0,0,NULL),(20180407,'2018-04-07',2018,4,7,2,14,'Sabtu','April',0,1,NULL),(20180408,'2018-04-08',2018,4,8,2,14,'Minggu','April',0,1,NULL),(20180409,'2018-04-09',2018,4,9,2,15,'Senin','April',0,0,NULL),(20180410,'2018-04-10',2018,4,10,2,15,'Selasa','April',0,0,NULL),(20180411,'2018-04-11',2018,4,11,2,15,'Rabu','April',0,0,NULL),(20180412,'2018-04-12',2018,4,12,2,15,'Kamis','April',0,0,NULL),(20180413,'2018-04-13',2018,4,13,2,15,'Jumat','April',0,0,NULL),(20180414,'2018-04-14',2018,4,14,2,15,'Sabtu','April',0,1,NULL),(20180415,'2018-04-15',2018,4,15,2,15,'Minggu','April',0,1,NULL),(20180416,'2018-04-16',2018,4,16,2,16,'Senin','April',0,0,NULL),(20180417,'2018-04-17',2018,4,17,2,16,'Selasa','April',0,0,NULL),(20180418,'2018-04-18',2018,4,18,2,16,'Rabu','April',0,0,NULL),(20180419,'2018-04-19',2018,4,19,2,16,'Kamis','April',0,0,NULL),(20180420,'2018-04-20',2018,4,20,2,16,'Jumat','April',0,0,NULL),(20180421,'2018-04-21',2018,4,21,2,16,'Sabtu','April',0,1,NULL),(20180422,'2018-04-22',2018,4,22,2,16,'Minggu','April',0,1,NULL),(20180423,'2018-04-23',2018,4,23,2,17,'Senin','April',0,0,NULL),(20180424,'2018-04-24',2018,4,24,2,17,'Selasa','April',0,0,NULL),(20180425,'2018-04-25',2018,4,25,2,17,'Rabu','April',0,0,NULL),(20180426,'2018-04-26',2018,4,26,2,17,'Kamis','April',0,0,NULL),(20180427,'2018-04-27',2018,4,27,2,17,'Jumat','April',0,0,NULL),(20180428,'2018-04-28',2018,4,28,2,17,'Sabtu','April',0,1,NULL),(20180429,'2018-04-29',2018,4,29,2,17,'Minggu','April',0,1,NULL),(20180430,'2018-04-30',2018,4,30,2,18,'Senin','April',0,0,NULL),(20180501,'2018-05-01',2018,5,1,2,18,'Selasa','Mei',0,0,NULL),(20180502,'2018-05-02',2018,5,2,2,18,'Rabu','Mei',0,0,NULL),(20180503,'2018-05-03',2018,5,3,2,18,'Kamis','Mei',0,0,NULL),(20180504,'2018-05-04',2018,5,4,2,18,'Jumat','Mei',0,0,NULL),(20180505,'2018-05-05',2018,5,5,2,18,'Sabtu','Mei',0,1,NULL),(20180506,'2018-05-06',2018,5,6,2,18,'Minggu','Mei',0,1,NULL),(20180507,'2018-05-07',2018,5,7,2,19,'Senin','Mei',0,0,NULL),(20180508,'2018-05-08',2018,5,8,2,19,'Selasa','Mei',0,0,NULL),(20180509,'2018-05-09',2018,5,9,2,19,'Rabu','Mei',0,0,NULL),(20180510,'2018-05-10',2018,5,10,2,19,'Kamis','Mei',0,0,NULL),(20180511,'2018-05-11',2018,5,11,2,19,'Jumat','Mei',0,0,NULL),(20180512,'2018-05-12',2018,5,12,2,19,'Sabtu','Mei',0,1,NULL),(20180513,'2018-05-13',2018,5,13,2,19,'Minggu','Mei',0,1,NULL),(20180514,'2018-05-14',2018,5,14,2,20,'Senin','Mei',0,0,NULL),(20180515,'2018-05-15',2018,5,15,2,20,'Selasa','Mei',0,0,NULL),(20180516,'2018-05-16',2018,5,16,2,20,'Rabu','Mei',0,0,NULL),(20180517,'2018-05-17',2018,5,17,2,20,'Kamis','Mei',0,0,NULL),(20180518,'2018-05-18',2018,5,18,2,20,'Jumat','Mei',0,0,NULL),(20180519,'2018-05-19',2018,5,19,2,20,'Sabtu','Mei',0,1,NULL),(20180520,'2018-05-20',2018,5,20,2,20,'Minggu','Mei',0,1,NULL),(20180521,'2018-05-21',2018,5,21,2,21,'Senin','Mei',0,0,NULL),(20180522,'2018-05-22',2018,5,22,2,21,'Selasa','Mei',0,0,NULL),(20180523,'2018-05-23',2018,5,23,2,21,'Rabu','Mei',0,0,NULL),(20180524,'2018-05-24',2018,5,24,2,21,'Kamis','Mei',0,0,NULL),(20180525,'2018-05-25',2018,5,25,2,21,'Jumat','Mei',0,0,NULL),(20180526,'2018-05-26',2018,5,26,2,21,'Sabtu','Mei',0,1,NULL),(20180527,'2018-05-27',2018,5,27,2,21,'Minggu','Mei',0,1,NULL),(20180528,'2018-05-28',2018,5,28,2,22,'Senin','Mei',0,0,NULL),(20180529,'2018-05-29',2018,5,29,2,22,'Selasa','Mei',0,0,NULL),(20180530,'2018-05-30',2018,5,30,2,22,'Rabu','Mei',0,0,NULL),(20180531,'2018-05-31',2018,5,31,2,22,'Kamis','Mei',0,0,NULL),(20180601,'2018-06-01',2018,6,1,2,22,'Jumat','Juni',0,0,NULL),(20180602,'2018-06-02',2018,6,2,2,22,'Sabtu','Juni',0,1,NULL),(20180603,'2018-06-03',2018,6,3,2,22,'Minggu','Juni',0,1,NULL),(20180604,'2018-06-04',2018,6,4,2,23,'Senin','Juni',0,0,NULL),(20180605,'2018-06-05',2018,6,5,2,23,'Selasa','Juni',0,0,NULL),(20180606,'2018-06-06',2018,6,6,2,23,'Rabu','Juni',0,0,NULL),(20180607,'2018-06-07',2018,6,7,2,23,'Kamis','Juni',0,0,NULL),(20180608,'2018-06-08',2018,6,8,2,23,'Jumat','Juni',0,0,NULL),(20180609,'2018-06-09',2018,6,9,2,23,'Sabtu','Juni',0,1,NULL),(20180610,'2018-06-10',2018,6,10,2,23,'Minggu','Juni',0,1,NULL),(20180611,'2018-06-11',2018,6,11,2,24,'Senin','Juni',0,0,NULL),(20180612,'2018-06-12',2018,6,12,2,24,'Selasa','Juni',0,0,NULL),(20180613,'2018-06-13',2018,6,13,2,24,'Rabu','Juni',0,0,NULL),(20180614,'2018-06-14',2018,6,14,2,24,'Kamis','Juni',0,0,NULL),(20180615,'2018-06-15',2018,6,15,2,24,'Jumat','Juni',0,0,NULL),(20180616,'2018-06-16',2018,6,16,2,24,'Sabtu','Juni',0,1,NULL),(20180617,'2018-06-17',2018,6,17,2,24,'Minggu','Juni',0,1,NULL),(20180618,'2018-06-18',2018,6,18,2,25,'Senin','Juni',0,0,NULL),(20180619,'2018-06-19',2018,6,19,2,25,'Selasa','Juni',0,0,NULL),(20180620,'2018-06-20',2018,6,20,2,25,'Rabu','Juni',0,0,NULL),(20180621,'2018-06-21',2018,6,21,2,25,'Kamis','Juni',0,0,NULL),(20180622,'2018-06-22',2018,6,22,2,25,'Jumat','Juni',0,0,NULL),(20180623,'2018-06-23',2018,6,23,2,25,'Sabtu','Juni',0,1,NULL),(20180624,'2018-06-24',2018,6,24,2,25,'Minggu','Juni',0,1,NULL),(20180625,'2018-06-25',2018,6,25,2,26,'Senin','Juni',0,0,NULL),(20180626,'2018-06-26',2018,6,26,2,26,'Selasa','Juni',0,0,NULL),(20180627,'2018-06-27',2018,6,27,2,26,'Rabu','Juni',0,0,NULL),(20180628,'2018-06-28',2018,6,28,2,26,'Kamis','Juni',0,0,NULL),(20180629,'2018-06-29',2018,6,29,2,26,'Jumat','Juni',0,0,NULL),(20180630,'2018-06-30',2018,6,30,2,26,'Sabtu','Juni',0,1,NULL),(20180701,'2018-07-01',2018,7,1,3,26,'Minggu','Juli',0,1,NULL),(20180702,'2018-07-02',2018,7,2,3,27,'Senin','Juli',0,0,NULL),(20180703,'2018-07-03',2018,7,3,3,27,'Selasa','Juli',0,0,NULL),(20180704,'2018-07-04',2018,7,4,3,27,'Rabu','Juli',0,0,NULL),(20180705,'2018-07-05',2018,7,5,3,27,'Kamis','Juli',0,0,NULL),(20180706,'2018-07-06',2018,7,6,3,27,'Jumat','Juli',0,0,NULL),(20180707,'2018-07-07',2018,7,7,3,27,'Sabtu','Juli',0,1,NULL),(20180708,'2018-07-08',2018,7,8,3,27,'Minggu','Juli',0,1,NULL),(20180709,'2018-07-09',2018,7,9,3,28,'Senin','Juli',0,0,NULL),(20180710,'2018-07-10',2018,7,10,3,28,'Selasa','Juli',0,0,NULL),(20180711,'2018-07-11',2018,7,11,3,28,'Rabu','Juli',0,0,NULL),(20180712,'2018-07-12',2018,7,12,3,28,'Kamis','Juli',0,0,NULL),(20180713,'2018-07-13',2018,7,13,3,28,'Jumat','Juli',0,0,NULL),(20180714,'2018-07-14',2018,7,14,3,28,'Sabtu','Juli',0,1,NULL),(20180715,'2018-07-15',2018,7,15,3,28,'Minggu','Juli',0,1,NULL),(20180716,'2018-07-16',2018,7,16,3,29,'Senin','Juli',0,0,NULL),(20180717,'2018-07-17',2018,7,17,3,29,'Selasa','Juli',0,0,NULL),(20180718,'2018-07-18',2018,7,18,3,29,'Rabu','Juli',0,0,NULL),(20180719,'2018-07-19',2018,7,19,3,29,'Kamis','Juli',0,0,NULL),(20180720,'2018-07-20',2018,7,20,3,29,'Jumat','Juli',0,0,NULL),(20180721,'2018-07-21',2018,7,21,3,29,'Sabtu','Juli',0,1,NULL),(20180722,'2018-07-22',2018,7,22,3,29,'Minggu','Juli',0,1,NULL),(20180723,'2018-07-23',2018,7,23,3,30,'Senin','Juli',0,0,NULL),(20180724,'2018-07-24',2018,7,24,3,30,'Selasa','Juli',0,0,NULL),(20180725,'2018-07-25',2018,7,25,3,30,'Rabu','Juli',0,0,NULL),(20180726,'2018-07-26',2018,7,26,3,30,'Kamis','Juli',0,0,NULL),(20180727,'2018-07-27',2018,7,27,3,30,'Jumat','Juli',0,0,NULL),(20180728,'2018-07-28',2018,7,28,3,30,'Sabtu','Juli',0,1,NULL),(20180729,'2018-07-29',2018,7,29,3,30,'Minggu','Juli',0,1,NULL),(20180730,'2018-07-30',2018,7,30,3,31,'Senin','Juli',0,0,NULL),(20180731,'2018-07-31',2018,7,31,3,31,'Selasa','Juli',0,0,NULL),(20180801,'2018-08-01',2018,8,1,3,31,'Rabu','Agustus',0,0,NULL),(20180802,'2018-08-02',2018,8,2,3,31,'Kamis','Agustus',0,0,NULL),(20180803,'2018-08-03',2018,8,3,3,31,'Jumat','Agustus',0,0,NULL),(20180804,'2018-08-04',2018,8,4,3,31,'Sabtu','Agustus',0,1,NULL),(20180805,'2018-08-05',2018,8,5,3,31,'Minggu','Agustus',0,1,NULL),(20180806,'2018-08-06',2018,8,6,3,32,'Senin','Agustus',0,0,NULL),(20180807,'2018-08-07',2018,8,7,3,32,'Selasa','Agustus',0,0,NULL),(20180808,'2018-08-08',2018,8,8,3,32,'Rabu','Agustus',0,0,NULL),(20180809,'2018-08-09',2018,8,9,3,32,'Kamis','Agustus',0,0,NULL),(20180810,'2018-08-10',2018,8,10,3,32,'Jumat','Agustus',0,0,NULL),(20180811,'2018-08-11',2018,8,11,3,32,'Sabtu','Agustus',0,1,NULL),(20180812,'2018-08-12',2018,8,12,3,32,'Minggu','Agustus',0,1,NULL),(20180813,'2018-08-13',2018,8,13,3,33,'Senin','Agustus',0,0,NULL),(20180814,'2018-08-14',2018,8,14,3,33,'Selasa','Agustus',0,0,NULL),(20180815,'2018-08-15',2018,8,15,3,33,'Rabu','Agustus',0,0,NULL),(20180816,'2018-08-16',2018,8,16,3,33,'Kamis','Agustus',0,0,NULL),(20180817,'2018-08-17',2018,8,17,3,33,'Jumat','Agustus',0,0,NULL),(20180818,'2018-08-18',2018,8,18,3,33,'Sabtu','Agustus',0,1,NULL),(20180819,'2018-08-19',2018,8,19,3,33,'Minggu','Agustus',0,1,NULL),(20180820,'2018-08-20',2018,8,20,3,34,'Senin','Agustus',0,0,NULL),(20180821,'2018-08-21',2018,8,21,3,34,'Selasa','Agustus',0,0,NULL),(20180822,'2018-08-22',2018,8,22,3,34,'Rabu','Agustus',0,0,NULL),(20180823,'2018-08-23',2018,8,23,3,34,'Kamis','Agustus',0,0,NULL),(20180824,'2018-08-24',2018,8,24,3,34,'Jumat','Agustus',0,0,NULL),(20180825,'2018-08-25',2018,8,25,3,34,'Sabtu','Agustus',0,1,NULL),(20180826,'2018-08-26',2018,8,26,3,34,'Minggu','Agustus',0,1,NULL),(20180827,'2018-08-27',2018,8,27,3,35,'Senin','Agustus',0,0,NULL),(20180828,'2018-08-28',2018,8,28,3,35,'Selasa','Agustus',0,0,NULL),(20180829,'2018-08-29',2018,8,29,3,35,'Rabu','Agustus',0,0,NULL),(20180830,'2018-08-30',2018,8,30,3,35,'Kamis','Agustus',0,0,NULL),(20180831,'2018-08-31',2018,8,31,3,35,'Jumat','Agustus',0,0,NULL),(20180901,'2018-09-01',2018,9,1,3,35,'Sabtu','September',0,1,NULL),(20180902,'2018-09-02',2018,9,2,3,35,'Minggu','September',0,1,NULL),(20180903,'2018-09-03',2018,9,3,3,36,'Senin','September',0,0,NULL),(20180904,'2018-09-04',2018,9,4,3,36,'Selasa','September',0,0,NULL),(20180905,'2018-09-05',2018,9,5,3,36,'Rabu','September',0,0,NULL),(20180906,'2018-09-06',2018,9,6,3,36,'Kamis','September',0,0,NULL),(20180907,'2018-09-07',2018,9,7,3,36,'Jumat','September',0,0,NULL),(20180908,'2018-09-08',2018,9,8,3,36,'Sabtu','September',0,1,NULL),(20180909,'2018-09-09',2018,9,9,3,36,'Minggu','September',0,1,NULL),(20180910,'2018-09-10',2018,9,10,3,37,'Senin','September',0,0,NULL),(20180911,'2018-09-11',2018,9,11,3,37,'Selasa','September',0,0,NULL),(20180912,'2018-09-12',2018,9,12,3,37,'Rabu','September',0,0,NULL),(20180913,'2018-09-13',2018,9,13,3,37,'Kamis','September',0,0,NULL),(20180914,'2018-09-14',2018,9,14,3,37,'Jumat','September',0,0,NULL),(20180915,'2018-09-15',2018,9,15,3,37,'Sabtu','September',0,1,NULL),(20180916,'2018-09-16',2018,9,16,3,37,'Minggu','September',0,1,NULL),(20180917,'2018-09-17',2018,9,17,3,38,'Senin','September',0,0,NULL),(20180918,'2018-09-18',2018,9,18,3,38,'Selasa','September',0,0,NULL),(20180919,'2018-09-19',2018,9,19,3,38,'Rabu','September',0,0,NULL),(20180920,'2018-09-20',2018,9,20,3,38,'Kamis','September',0,0,NULL),(20180921,'2018-09-21',2018,9,21,3,38,'Jumat','September',0,0,NULL),(20180922,'2018-09-22',2018,9,22,3,38,'Sabtu','September',0,1,NULL),(20180923,'2018-09-23',2018,9,23,3,38,'Minggu','September',0,1,NULL),(20180924,'2018-09-24',2018,9,24,3,39,'Senin','September',0,0,NULL),(20180925,'2018-09-25',2018,9,25,3,39,'Selasa','September',0,0,NULL),(20180926,'2018-09-26',2018,9,26,3,39,'Rabu','September',0,0,NULL),(20180927,'2018-09-27',2018,9,27,3,39,'Kamis','September',0,0,NULL),(20180928,'2018-09-28',2018,9,28,3,39,'Jumat','September',0,0,NULL),(20180929,'2018-09-29',2018,9,29,3,39,'Sabtu','September',0,1,NULL),(20180930,'2018-09-30',2018,9,30,3,39,'Minggu','September',0,1,NULL),(20181001,'2018-10-01',2018,10,1,4,40,'Senin','Oktober',0,0,NULL),(20181002,'2018-10-02',2018,10,2,4,40,'Selasa','Oktober',0,0,NULL),(20181003,'2018-10-03',2018,10,3,4,40,'Rabu','Oktober',0,0,NULL),(20181004,'2018-10-04',2018,10,4,4,40,'Kamis','Oktober',0,0,NULL),(20181005,'2018-10-05',2018,10,5,4,40,'Jumat','Oktober',0,0,NULL),(20181006,'2018-10-06',2018,10,6,4,40,'Sabtu','Oktober',0,1,NULL),(20181007,'2018-10-07',2018,10,7,4,40,'Minggu','Oktober',0,1,NULL),(20181008,'2018-10-08',2018,10,8,4,41,'Senin','Oktober',0,0,NULL),(20181009,'2018-10-09',2018,10,9,4,41,'Selasa','Oktober',0,0,NULL),(20181010,'2018-10-10',2018,10,10,4,41,'Rabu','Oktober',0,0,NULL),(20181011,'2018-10-11',2018,10,11,4,41,'Kamis','Oktober',0,0,NULL),(20181012,'2018-10-12',2018,10,12,4,41,'Jumat','Oktober',0,0,NULL),(20181013,'2018-10-13',2018,10,13,4,41,'Sabtu','Oktober',0,1,NULL),(20181014,'2018-10-14',2018,10,14,4,41,'Minggu','Oktober',0,1,NULL),(20181015,'2018-10-15',2018,10,15,4,42,'Senin','Oktober',0,0,NULL),(20181016,'2018-10-16',2018,10,16,4,42,'Selasa','Oktober',0,0,NULL),(20181017,'2018-10-17',2018,10,17,4,42,'Rabu','Oktober',0,0,NULL),(20181018,'2018-10-18',2018,10,18,4,42,'Kamis','Oktober',0,0,NULL),(20181019,'2018-10-19',2018,10,19,4,42,'Jumat','Oktober',0,0,NULL),(20181020,'2018-10-20',2018,10,20,4,42,'Sabtu','Oktober',0,1,NULL),(20181021,'2018-10-21',2018,10,21,4,42,'Minggu','Oktober',0,1,NULL),(20181022,'2018-10-22',2018,10,22,4,43,'Senin','Oktober',0,0,NULL),(20181023,'2018-10-23',2018,10,23,4,43,'Selasa','Oktober',0,0,NULL),(20181024,'2018-10-24',2018,10,24,4,43,'Rabu','Oktober',0,0,NULL),(20181025,'2018-10-25',2018,10,25,4,43,'Kamis','Oktober',0,0,NULL),(20181026,'2018-10-26',2018,10,26,4,43,'Jumat','Oktober',0,0,NULL),(20181027,'2018-10-27',2018,10,27,4,43,'Sabtu','Oktober',0,1,NULL),(20181028,'2018-10-28',2018,10,28,4,43,'Minggu','Oktober',0,1,NULL),(20181029,'2018-10-29',2018,10,29,4,44,'Senin','Oktober',0,0,NULL),(20181030,'2018-10-30',2018,10,30,4,44,'Selasa','Oktober',0,0,NULL),(20181031,'2018-10-31',2018,10,31,4,44,'Rabu','Oktober',0,0,NULL),(20181101,'2018-11-01',2018,11,1,4,44,'Kamis','November',0,0,NULL),(20181102,'2018-11-02',2018,11,2,4,44,'Jumat','November',0,0,NULL),(20181103,'2018-11-03',2018,11,3,4,44,'Sabtu','November',0,1,NULL),(20181104,'2018-11-04',2018,11,4,4,44,'Minggu','November',0,1,NULL),(20181105,'2018-11-05',2018,11,5,4,45,'Senin','November',0,0,NULL),(20181106,'2018-11-06',2018,11,6,4,45,'Selasa','November',0,0,NULL),(20181107,'2018-11-07',2018,11,7,4,45,'Rabu','November',0,0,NULL),(20181108,'2018-11-08',2018,11,8,4,45,'Kamis','November',0,0,NULL),(20181109,'2018-11-09',2018,11,9,4,45,'Jumat','November',0,0,NULL),(20181110,'2018-11-10',2018,11,10,4,45,'Sabtu','November',0,1,NULL),(20181111,'2018-11-11',2018,11,11,4,45,'Minggu','November',0,1,NULL),(20181112,'2018-11-12',2018,11,12,4,46,'Senin','November',0,0,NULL),(20181113,'2018-11-13',2018,11,13,4,46,'Selasa','November',0,0,NULL),(20181114,'2018-11-14',2018,11,14,4,46,'Rabu','November',0,0,NULL),(20181115,'2018-11-15',2018,11,15,4,46,'Kamis','November',0,0,NULL),(20181116,'2018-11-16',2018,11,16,4,46,'Jumat','November',0,0,NULL),(20181117,'2018-11-17',2018,11,17,4,46,'Sabtu','November',0,1,NULL),(20181118,'2018-11-18',2018,11,18,4,46,'Minggu','November',0,1,NULL),(20181119,'2018-11-19',2018,11,19,4,47,'Senin','November',0,0,NULL),(20181120,'2018-11-20',2018,11,20,4,47,'Selasa','November',0,0,NULL),(20181121,'2018-11-21',2018,11,21,4,47,'Rabu','November',0,0,NULL),(20181122,'2018-11-22',2018,11,22,4,47,'Kamis','November',0,0,NULL),(20181123,'2018-11-23',2018,11,23,4,47,'Jumat','November',0,0,NULL),(20181124,'2018-11-24',2018,11,24,4,47,'Sabtu','November',0,1,NULL),(20181125,'2018-11-25',2018,11,25,4,47,'Minggu','November',0,1,NULL),(20181126,'2018-11-26',2018,11,26,4,48,'Senin','November',0,0,NULL),(20181127,'2018-11-27',2018,11,27,4,48,'Selasa','November',0,0,NULL),(20181128,'2018-11-28',2018,11,28,4,48,'Rabu','November',0,0,NULL),(20181129,'2018-11-29',2018,11,29,4,48,'Kamis','November',0,0,NULL),(20181130,'2018-11-30',2018,11,30,4,48,'Jumat','November',0,0,NULL),(20181201,'2018-12-01',2018,12,1,4,48,'Sabtu','Desember',0,1,NULL),(20181202,'2018-12-02',2018,12,2,4,48,'Minggu','Desember',0,1,NULL),(20181203,'2018-12-03',2018,12,3,4,49,'Senin','Desember',0,0,NULL),(20181204,'2018-12-04',2018,12,4,4,49,'Selasa','Desember',0,0,NULL),(20181205,'2018-12-05',2018,12,5,4,49,'Rabu','Desember',0,0,NULL),(20181206,'2018-12-06',2018,12,6,4,49,'Kamis','Desember',0,0,NULL),(20181207,'2018-12-07',2018,12,7,4,49,'Jumat','Desember',0,0,NULL),(20181208,'2018-12-08',2018,12,8,4,49,'Sabtu','Desember',0,1,NULL),(20181209,'2018-12-09',2018,12,9,4,49,'Minggu','Desember',0,1,NULL),(20181210,'2018-12-10',2018,12,10,4,50,'Senin','Desember',0,0,NULL),(20181211,'2018-12-11',2018,12,11,4,50,'Selasa','Desember',0,0,NULL),(20181212,'2018-12-12',2018,12,12,4,50,'Rabu','Desember',0,0,NULL),(20181213,'2018-12-13',2018,12,13,4,50,'Kamis','Desember',0,0,NULL),(20181214,'2018-12-14',2018,12,14,4,50,'Jumat','Desember',0,0,NULL),(20181215,'2018-12-15',2018,12,15,4,50,'Sabtu','Desember',0,1,NULL),(20181216,'2018-12-16',2018,12,16,4,50,'Minggu','Desember',0,1,NULL),(20181217,'2018-12-17',2018,12,17,4,51,'Senin','Desember',0,0,NULL),(20181218,'2018-12-18',2018,12,18,4,51,'Selasa','Desember',0,0,NULL),(20181219,'2018-12-19',2018,12,19,4,51,'Rabu','Desember',0,0,NULL),(20181220,'2018-12-20',2018,12,20,4,51,'Kamis','Desember',0,0,NULL),(20181221,'2018-12-21',2018,12,21,4,51,'Jumat','Desember',0,0,NULL),(20181222,'2018-12-22',2018,12,22,4,51,'Sabtu','Desember',0,1,NULL),(20181223,'2018-12-23',2018,12,23,4,51,'Minggu','Desember',0,1,NULL),(20181224,'2018-12-24',2018,12,24,4,52,'Senin','Desember',0,0,NULL),(20181225,'2018-12-25',2018,12,25,4,52,'Selasa','Desember',0,0,NULL),(20181226,'2018-12-26',2018,12,26,4,52,'Rabu','Desember',0,0,NULL),(20181227,'2018-12-27',2018,12,27,4,52,'Kamis','Desember',0,0,NULL),(20181228,'2018-12-28',2018,12,28,4,52,'Jumat','Desember',0,0,NULL),(20181229,'2018-12-29',2018,12,29,4,52,'Sabtu','Desember',0,1,NULL),(20181230,'2018-12-30',2018,12,30,4,52,'Minggu','Desember',0,1,NULL),(20181231,'2018-12-31',2018,12,31,4,1,'Senin','Desember',0,0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
