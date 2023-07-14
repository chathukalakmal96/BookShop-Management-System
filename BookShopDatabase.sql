-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.52-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bookshop
CREATE DATABASE IF NOT EXISTS `bookshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookshop`;

-- Dumping structure for table bookshop.company
CREATE TABLE IF NOT EXISTS `company` (
  `cid` varchar(50) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.company: ~3 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`cid`, `company_name`, `rowstate`) VALUES
	('C1907081', 'Atlas', 1),
	('C1907082', 'NSP', 1),
	('C1907083', 'Nalaka', 1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;

-- Dumping structure for table bookshop.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `nic` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dob` date NOT NULL,
  `no` varchar(45) NOT NULL,
  `Street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `question` varchar(150) NOT NULL,
  `answer` varchar(150) NOT NULL,
  `rowstate` int(11) NOT NULL,
  PRIMARY KEY (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.employee: ~2 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`nic`, `fname`, `lname`, `position`, `gender`, `mobile`, `email`, `dob`, `no`, `Street`, `city`, `password`, `question`, `answer`, `rowstate`) VALUES
	('961912954v', 'Chathuka', 'Lakmal', 'Manager', 'female', '0754519827', 'lchathuka@gmail.com', '1996-07-09', '82/4', 'Ranasinghe Mw', 'Meeghawatta', '123', 'What is your nickname?', 'dax', 1),
	('992356983v', 'Chamith', 'Harinda', 'Cashier', 'female', '0715623898', 'chamith99@gmail.com', '1992-04-01', '235', 'Mathara', 'Kaburupitiya', '456', '', '', 1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table bookshop.grn
CREATE TABLE IF NOT EXISTS `grn` (
  `idgrn` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` varchar(50) DEFAULT NULL,
  `id_employee` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`idgrn`),
  KEY `FK_grn_supplier` (`id_supplier`),
  KEY `FK_grn_employee` (`id_employee`),
  CONSTRAINT `FK_grn_employee` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`nic`),
  CONSTRAINT `FK_grn_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.grn: ~7 rows (approximately)
/*!40000 ALTER TABLE `grn` DISABLE KEYS */;
INSERT INTO `grn` (`idgrn`, `id_supplier`, `id_employee`, `date`, `total_price`) VALUES
	(1, 'S1907071', '961912954v', '2019-07-11', 9000),
	(2, 'S1907071', '961912954v', '2019-07-11', 8000),
	(3, 'S1907071', '961912954v', '2019-07-11', 9500),
	(4, 'S1907071', '961912954v', '2019-07-11', 9000),
	(5, 'S1907071', '961912954v', '2019-07-11', 18300),
	(6, 'S1907071', '961912954v', '2019-07-11', 3300),
	(7, 'S1907071', '961912954v', '2019-07-12', 900);
/*!40000 ALTER TABLE `grn` ENABLE KEYS */;

-- Dumping structure for table bookshop.grn_product
CREATE TABLE IF NOT EXISTS `grn_product` (
  `id_grn_product` int(11) NOT NULL AUTO_INCREMENT,
  `id_grn` int(11) DEFAULT NULL,
  `id_company` varchar(50) DEFAULT NULL,
  `id_item_type` varchar(50) DEFAULT NULL,
  `id_item_id` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `buy_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `total_buy_price` double DEFAULT NULL,
  PRIMARY KEY (`id_grn_product`),
  KEY `FK_grn_product_grn` (`id_grn`),
  KEY `FK_grn_product_company` (`id_company`),
  KEY `FK_grn_product_itemtype` (`id_item_type`),
  KEY `FK_grn_product_item_name` (`id_item_id`),
  CONSTRAINT `FK_grn_product_company` FOREIGN KEY (`id_company`) REFERENCES `company` (`cid`),
  CONSTRAINT `FK_grn_product_grn` FOREIGN KEY (`id_grn`) REFERENCES `grn` (`idgrn`),
  CONSTRAINT `FK_grn_product_itemtype` FOREIGN KEY (`id_item_type`) REFERENCES `itemtype` (`itid`),
  CONSTRAINT `FK_grn_product_item_name` FOREIGN KEY (`id_item_id`) REFERENCES `item_name` (`inid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.grn_product: ~11 rows (approximately)
/*!40000 ALTER TABLE `grn_product` DISABLE KEYS */;
INSERT INTO `grn_product` (`id_grn_product`, `id_grn`, `id_company`, `id_item_type`, `id_item_id`, `qty`, `buy_price`, `sell_price`, `total_buy_price`) VALUES
	(1, 1, 'C1907081', 'IT1907081', 'P1907081', 100, 90, 110, 9000),
	(2, 2, 'C1907083', 'IT1907081', 'P1907081', 100, 80, 100, 8000),
	(3, 3, 'C1907081', 'IT1907081', 'P1907081', 100, 95, 110, 9500),
	(4, 4, 'C1907081', 'IT1907081', 'P1907081', 100, 90, 115, 9000),
	(5, 5, 'C1907082', 'IT1907081', 'P1907089', 100, 65, 80, 6500),
	(6, 5, 'C1907082', 'IT1907081', 'P1907088', 100, 60, 72, 6000),
	(7, 5, 'C1907082', 'IT1907081', 'P1907087', 100, 58, 65, 5800),
	(8, 6, 'C1907081', 'IT1907082', 'P19071116', 100, 10, 12, 1000),
	(9, 6, 'C1907081', 'IT1907082', 'P19071117', 100, 8, 10, 800),
	(10, 6, 'C1907081', 'IT1907082', 'P19071118', 50, 12, 15, 600),
	(12, 7, 'C1907081', 'IT1907081', 'P1907081', 100, 9, 12, 900);
/*!40000 ALTER TABLE `grn_product` ENABLE KEYS */;

-- Dumping structure for table bookshop.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `inid` varchar(50) NOT NULL,
  `employee_nic` varchar(45) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `subtotal` double NOT NULL,
  `disscount` varchar(50) NOT NULL DEFAULT '',
  `nettotal` double NOT NULL,
  `paynent` double NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`inid`),
  KEY `fk_invoice_employee1_idx` (`employee_nic`),
  CONSTRAINT `fk_invoice_employee1` FOREIGN KEY (`employee_nic`) REFERENCES `employee` (`nic`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.invoice: ~15 rows (approximately)
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`inid`, `employee_nic`, `date`, `subtotal`, `disscount`, `nettotal`, `paynent`, `balance`) VALUES
	('INV001', '961912954v', '2019-07-11', 1100, '10', 990, 1000, 10),
	('INV002', '961912954v', '2019-07-11', 1150, '10', 1035, 1500, 465),
	('INV010', '961912954v', '2019-07-12', 120, '0', 120, 150, 30),
	('INV011', '961912954v', '2019-07-12', 276, '0', 276, 300, 24),
	('INV012', '961912954v', '2019-07-12', 170, '0', 170, 200, 30),
	('INV013', '961912954v', '2019-07-12', 269, '0', 269, 300, 31),
	('INV014', '961912954v', '2019-07-12', 390, '0', 390, 400, 10),
	('INV015', '961912954v', '2019-07-12', 192, '0', 192, 200, 8),
	('INV03', '961912954v', '2019-07-11', 1150, '10', 1035, 1200, 165),
	('INV04', '961912954v', '2019-07-11', 1150, '10', 1035, 1500, 465),
	('INV05', '961912954v', '2019-07-11', 195, '0', 195, 200, 5),
	('INV06', '961912954v', '2019-07-11', 195, '0', 195, 200, 5),
	('INV07', '961912954v', '2019-07-11', 195, '2', 191.1, 200, 8.90000000000001),
	('INV08', '961912954v', '2019-07-12', 120, '10', 108, 110, 2),
	('INV09', '961912954v', '2019-07-12', 120, '0', 120, 150, 30);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;

-- Dumping structure for table bookshop.invoiceitem
CREATE TABLE IF NOT EXISTS `invoiceitem` (
  `ii_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_inid` varchar(50) NOT NULL DEFAULT '',
  `stock_sid` int(11) NOT NULL,
  `qty` double NOT NULL,
  `linetot` double DEFAULT NULL,
  PRIMARY KEY (`ii_id`),
  KEY `fk_invoiceitem_invoice1_idx` (`invoice_inid`),
  KEY `fk_invoiceitem_stock1_idx` (`stock_sid`),
  CONSTRAINT `FK_invoiceitem_invoice` FOREIGN KEY (`invoice_inid`) REFERENCES `invoice` (`inid`),
  CONSTRAINT `fk_invoiceitem_stock1` FOREIGN KEY (`stock_sid`) REFERENCES `stock` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.invoiceitem: ~28 rows (approximately)
/*!40000 ALTER TABLE `invoiceitem` DISABLE KEYS */;
INSERT INTO `invoiceitem` (`ii_id`, `invoice_inid`, `stock_sid`, `qty`, `linetot`) VALUES
	(1, 'INV001', 1, 10, 200),
	(2, 'INV002', 3, 10, 200),
	(3, 'INV03', 3, 10, 200),
	(4, 'INV04', 3, 10, 200),
	(5, 'INV05', 7, 10, 200),
	(6, 'INV05', 9, 5, 200),
	(7, 'INV06', 9, 5, 200),
	(8, 'INV06', 10, 10, 200),
	(9, 'INV07', 9, 5, 200),
	(10, 'INV07', 10, 10, 200),
	(11, 'INV08', 10, 10, 200),
	(12, 'INV09', 7, 10, 200),
	(13, 'INV010', 10, 10, 200),
	(14, 'INV011', 7, 5, 200),
	(15, 'INV011', 8, 12, 200),
	(16, 'INV011', 10, 3, 200),
	(17, 'INV011', 9, 4, 200),
	(18, 'INV012', 10, 10, 120),
	(19, 'INV012', 8, 5, 50),
	(20, 'INV013', 10, 12, 144),
	(21, 'INV013', 9, 5, 75),
	(22, 'INV013', 8, 5, 50),
	(23, 'INV014', 10, 10, 120),
	(24, 'INV014', 7, 10, 120),
	(25, 'INV014', 9, 10, 150),
	(26, 'INV015', 7, 5, 60),
	(27, 'INV015', 10, 6, 72),
	(28, 'INV015', 8, 6, 60);
/*!40000 ALTER TABLE `invoiceitem` ENABLE KEYS */;

-- Dumping structure for table bookshop.itemtype
CREATE TABLE IF NOT EXISTS `itemtype` (
  `itid` varchar(50) NOT NULL,
  `typename` varchar(45) DEFAULT NULL,
  `rowstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`itid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.itemtype: ~2 rows (approximately)
/*!40000 ALTER TABLE `itemtype` DISABLE KEYS */;
INSERT INTO `itemtype` (`itid`, `typename`, `rowstate`) VALUES
	('IT1907081', 'BooK', 1),
	('IT1907082', 'Pens', 1);
/*!40000 ALTER TABLE `itemtype` ENABLE KEYS */;

-- Dumping structure for table bookshop.item_name
CREATE TABLE IF NOT EXISTS `item_name` (
  `inid` varchar(50) NOT NULL,
  `name` varchar(45) NOT NULL,
  `rowstate` int(11) NOT NULL,
  PRIMARY KEY (`inid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.item_name: ~19 rows (approximately)
/*!40000 ALTER TABLE `item_name` DISABLE KEYS */;
INSERT INTO `item_name` (`inid`, `name`, `rowstate`) VALUES
	('P1907081', 'CR Book Page 80 (Single Ruled)', 1),
	('P19070810', 'CR Book Page 40 (Square Ruled)', 1),
	('P19070811', 'CR Book Page 80 (Square Ruled)', 1),
	('P19070812', 'CR Book Page 120 (Square Ruled)', 1),
	('P19070813', 'CR Book Page 160 (Square Ruled)', 1),
	('P19070814', 'CR Book Page 200 (Square Ruled)', 1),
	('P19070815', 'CR Book Page 40 (Single Ruled)', 1),
	('P1907082', 'CR Book 120 (Single Ruled)', 1),
	('P1907083', 'CR Book Page 160 (Single Ruled)', 1),
	('P1907084', 'CR Book Page 200 (Single Ruled)', 1),
	('P1907085', 'Ex Book Page 40', 1),
	('P1907086', 'Ex Book Page 80', 1),
	('P1907087', 'Ex Book Page 120', 1),
	('P1907088', 'Ex Book Page 160', 1),
	('P1907089', 'Ex Book Page 200', 1),
	('P19071116', 'Atlas Chooty Gel', 1),
	('P19071117', 'Atlas Chooty T', 1),
	('P19071118', 'Atlas Stylus', 1),
	('P19071119', 'Atlas Butter Gel', 1);
/*!40000 ALTER TABLE `item_name` ENABLE KEYS */;

-- Dumping structure for table bookshop.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `selling_price` varchar(45) NOT NULL,
  `item_id` varchar(50) NOT NULL,
  `company_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `Index 2` (`item_id`),
  KEY `Index 3` (`company_id`),
  CONSTRAINT `FK_stock_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`cid`),
  CONSTRAINT `FK_stock_item_name` FOREIGN KEY (`item_id`) REFERENCES `item_name` (`inid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.stock: ~10 rows (approximately)
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`sid`, `qty`, `selling_price`, `item_id`, `company_id`) VALUES
	(1, 0, '110', 'P1907081', 'C1907081'),
	(3, 70, '115', 'P1907081', 'C1907081'),
	(4, 100, '80', 'P1907089', 'C1907082'),
	(5, 100, '72', 'P1907088', 'C1907082'),
	(6, 100, '65', 'P1907087', 'C1907082'),
	(7, 60, '12', 'P19071116', 'C1907081'),
	(8, 72, '10', 'P19071117', 'C1907081'),
	(9, 16, '15', 'P19071118', 'C1907081'),
	(10, 19, '12', 'P19071119', 'C1907081'),
	(11, 100, '12', 'P1907081', 'C1907081');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

-- Dumping structure for table bookshop.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `sid` varchar(50) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `rowstate` int(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.supplier: ~7 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`sid`, `name`, `mobile`, `email`, `no`, `street`, `city`, `rowstate`) VALUES
	('S1907071', 'Thilan Ravindu', 715568979, 'thilan96@gmail.com', '65', 'Hanwella Rd', 'Awissawella', 1),
	('S1907072', 'chathuka lakmal', 705670499, 'lchathuka@gmail.com', '82/4', 'Ranasinghe Mw', 'Siyambalape', 1),
	('S1907093', 'Veranga Dias', 775566288, 'verangawick93@gmail.com', '85/A', 'Galle Rd', 'Thumpane', 1),
	('S1907094', 'Nilupul Nethmina', 766799933, 'nilupul96@mail.com', '769/1', 'Benwala Langa', 'Batapola', 1),
	('S1907095', 'Nadun Madushan', 718367066, 'nadun@gmail.com', '69/7B', 'Narammala', 'Kurunegala', 1),
	('S1907096', 'Sameera Wije', 717693328, 'sameerawije@gmail.com', '923/D', 'Narammala Rd', 'dambadeniya', 1),
	('S1907127', 'Anuj Kalhara', 715566899, 'anujkalhara99@gmail.com', '85/7', 'Kiribathgoda', 'Kadawatha', 1);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
