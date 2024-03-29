-- MySQL dump 
-- Host: flip1.engr.oregonstate.edu    Database: CS340
-- ------------------------------------------------------

--
-- Table structure for table `customers`
--

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--Creating table for customers

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Jace','Parks','parkjace@oregonstate.edu',5037506380),(2,'Zach','Baker','bakerzac@oregonstate.edu',9712410768),(3,'Howard','Knutz','HK@oregonstate.edu',8083141592);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--Creating table for items

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` float(5,2) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

-- loading data for `items`
LOCK TABLES `items` WRITE;
INSERT INTO `items` VALUES (1,'milk',2.69),(2,'chedder_cheese',6.75),(3,'wagu_beef',90.11);
UNLOCK TABLES;

--Creating table for stores

DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` int(5) NOT NULL,
  `street` varchar(255) NOT NULL,
  `address_number` int(5) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- loading data for `stores`
LOCK TABLES `stores` WRITE;
INSERT INTO `stores` VALUES (1,'Oregon','Corvallis',97330,'Wallup_Street',1238),(2,'Oregon','Sherwood',97140,'Brownsauce_lane',666),(3,'California','Hanford',93230,'Aspin_street',1238);
UNLOCK TABLES;

--Creating table for payments

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) NOT NULL,
  `customer_id` int(11),
  `company` varchar(255) NOT NULL,
  PRIMARY KEY (`payment_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- loading data for `items`
LOCK TABLES `payments` WRITE;
INSERT INTO `payments` VALUES (1,'creditcard',1,'VISA'),(2,'debtcard',2,'Master_Card'),(3,'cash',3,'U.S.A');
UNLOCK TABLES;

--Creating table for orders_details
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `item_id` int(11),
  `store_id` int(11),
  `order_id` int(11),
  PRIMARY KEY (`order_details_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- loading data for `order_details`
LOCK TABLES `order_details` WRITE;
INSERT INTO `order_details` VALUES (1,12,400.05,1,1,1),(2,25,222.22,2,2,2),(3,66,1174.40,3,3,3);
UNLOCK TABLES;

--Creating table for orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` float(10,2) NOT NULL,
  `payment_id` int(11),
  `customer_id` int(11),
  `store_id` int(11),
  PRIMARY KEY (`order_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- loading data for `items`
LOCK TABLES `orders` WRITE;
INSERT INTO `orders` VALUES (1,300.42,1,1,1),(2,25.00,2,2,2),(3,60.00,3,3,3);
UNLOCK TABLES;

