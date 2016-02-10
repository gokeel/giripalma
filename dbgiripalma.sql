-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.8 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for giripalma
DROP DATABASE IF EXISTS `giripalma`;
CREATE DATABASE IF NOT EXISTS `giripalma` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `giripalma`;


-- Dumping structure for table giripalma.ospos_app_config
CREATE TABLE IF NOT EXISTS `ospos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_app_config: ~44 rows (approximately)
/*!40000 ALTER TABLE `ospos_app_config` DISABLE KEYS */;
INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
	('address', '123 Nowhere street'),
	('barcode_content', 'id'),
	('barcode_first_row', 'category'),
	('barcode_font', 'Arial'),
	('barcode_font_size', '10'),
	('barcode_generate_if_empty', '0'),
	('barcode_height', '50'),
	('barcode_num_in_row', '2'),
	('barcode_page_cellspacing', '20'),
	('barcode_page_width', '100'),
	('barcode_quality', '100'),
	('barcode_second_row', 'item_code'),
	('barcode_third_row', 'unit_price'),
	('barcode_type', 'Code39'),
	('barcode_width', '250'),
	('company', 'Open Source Point of Sale'),
	('company_logo', ''),
	('currency_symbol', '$'),
	('dateformat', 'm/d/Y'),
	('default_sales_discount', '0'),
	('default_tax_rate', '8'),
	('email', 'admin@pappastech.com'),
	('fax', ''),
	('invoice_default_comments', 'This is a default comment'),
	('invoice_email_message', 'Dear $CU, In attachment the receipt for sale $INV'),
	('lines_per_page', '25'),
	('phone', '555-555-5555'),
	('print_bottom_margin', '0'),
	('print_footer', '0'),
	('print_header', '0'),
	('print_left_margin', '0'),
	('print_right_margin', '0'),
	('print_silently', '1'),
	('print_top_margin', '0'),
	('receipt_show_taxes', '0'),
	('recv_invoice_format', '$CO'),
	('return_policy', 'Test'),
	('sales_invoice_format', '$CO'),
	('show_total_discount', '1'),
	('tax_included', '0'),
	('timeformat', 'H:i:s'),
	('timezone', 'America/New_York'),
	('use_invoice_template', '1'),
	('website', '');
/*!40000 ALTER TABLE `ospos_app_config` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_customers
CREATE TABLE IF NOT EXISTS `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_customers: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_customers` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_employees
CREATE TABLE IF NOT EXISTS `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_employees: ~1 rows (approximately)
/*!40000 ALTER TABLE `ospos_employees` DISABLE KEYS */;
INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
	('admin', '439a6de57d475c1a0ba9bcb1c39f0af6', 1, 0);
/*!40000 ALTER TABLE `ospos_employees` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_giftcards
CREATE TABLE IF NOT EXISTS `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` int(10) NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_giftcards: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_giftcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_giftcards` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_grants
CREATE TABLE IF NOT EXISTS `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_grants: ~51 rows (approximately)
/*!40000 ALTER TABLE `ospos_grants` DISABLE KEYS */;
INSERT INTO `ospos_grants` (`permission_id`, `person_id`) VALUES
	('config', 1),
	('customers', 1),
	('employees', 1),
	('giftcards', 1),
	('items', 1),
	('items_BATOS - Lippo Plaza Batu', 1),
	('items_GP1 - Pusat', 1),
	('items_GP2 - Toko Utama', 1),
	('items_GP3 - Gudang Panel', 1),
	('items_GP4 - Gudang Produksi Sofa', 1),
	('items_GP5 - Gudang Produksi HPL', 1),
	('items_MOG2 - Stand Depan Giant', 1),
	('items_MOG3 - Stand Depan Foodcourt', 1),
	('items_MOGATR - Atrium MOG', 1),
	('items_stock', 1),
	('item_kits', 1),
	('receivings', 1),
	('receivings_BATOS - Lippo Plaza Batu', 1),
	('receivings_GP1 - Pusat', 1),
	('receivings_GP2 - Toko Utama', 1),
	('receivings_GP3 - Gudang Panel', 1),
	('receivings_GP4 - Gudang Produksi Sofa', 1),
	('receivings_GP5 - Gudang Produksi HPL', 1),
	('receivings_MOG2 - Stand Depan Giant', 1),
	('receivings_MOG3 - Stand Depan Foodcourt', 1),
	('receivings_MOGATR - Atrium MOG', 1),
	('receivings_stock', 1),
	('reports', 1),
	('reports_categories', 1),
	('reports_customers', 1),
	('reports_discounts', 1),
	('reports_employees', 1),
	('reports_inventory', 1),
	('reports_items', 1),
	('reports_payments', 1),
	('reports_receivings', 1),
	('reports_sales', 1),
	('reports_suppliers', 1),
	('reports_taxes', 1),
	('sales', 1),
	('sales_BATOS - Lippo Plaza Batu', 1),
	('sales_GP1 - Pusat', 1),
	('sales_GP2 - Toko Utama', 1),
	('sales_GP3 - Gudang Panel', 1),
	('sales_GP4 - Gudang Produksi Sofa', 1),
	('sales_GP5 - Gudang Produksi HPL', 1),
	('sales_MOG2 - Stand Depan Giant', 1),
	('sales_MOG3 - Stand Depan Foodcourt', 1),
	('sales_MOGATR - Atrium MOG', 1),
	('sales_stock', 1),
	('suppliers', 1);
/*!40000 ALTER TABLE `ospos_grants` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_inventory
CREATE TABLE IF NOT EXISTS `ospos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`),
  CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_inventory: ~37 rows (approximately)
/*!40000 ALTER TABLE `ospos_inventory` DISABLE KEYS */;
INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
	(1, 1, 1, '2016-01-25 23:01:23', 'Manual Edit of Quantity', 1, 10),
	(2, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 9, 10),
	(3, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 2, 5),
	(4, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 3, 0),
	(5, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 4, 0),
	(6, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 5, 0),
	(7, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 6, 0),
	(8, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 7, 0),
	(9, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 8, 0),
	(10, 2, 1, '2016-01-27 02:07:46', 'Perubahan jumlah Stok secara manual', 10, 0),
	(11, 2, 1, '2016-01-27 02:07:47', 'Perubahan jumlah Stok secara manual', 1, 20),
	(12, 2, 1, '2016-01-27 02:09:38', 'Perubahan jumlah Stok secara manual', 4, 2),
	(13, 2, 1, '2016-01-27 02:12:19', 'POS 1', 2, -1),
	(14, 2, 1, '2016-01-27 22:32:53', 'POS 2', 9, -1),
	(15, 2, 1, '2016-01-28 02:40:39', 'POS 3', 9, -1),
	(16, 3, 1, '2016-01-28 23:21:28', 'Perubahan jumlah Stok secara manual', 9, 2),
	(17, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 2, 2),
	(18, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 3, 2),
	(19, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 4, 2),
	(20, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 5, 2),
	(21, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 6, 2),
	(22, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 7, 2),
	(23, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 8, 2),
	(24, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 10, 0),
	(25, 3, 1, '2016-01-28 23:21:29', 'Perubahan jumlah Stok secara manual', 1, 14),
	(26, 3, 1, '2016-02-01 01:01:04', 'POS 4', 9, -1),
	(27, 4, 1, '2016-02-01 04:17:29', 'Perubahan jumlah Stok secara manual', 9, 10),
	(28, 4, 1, '2016-02-01 04:17:29', 'Perubahan jumlah Stok secara manual', 2, 1),
	(29, 4, 1, '2016-02-01 04:17:29', 'Perubahan jumlah Stok secara manual', 3, 1),
	(30, 4, 1, '2016-02-01 04:17:29', 'Perubahan jumlah Stok secara manual', 4, 1),
	(31, 4, 1, '2016-02-01 04:17:30', 'Perubahan jumlah Stok secara manual', 5, 1),
	(32, 4, 1, '2016-02-01 04:17:30', 'Perubahan jumlah Stok secara manual', 6, 1),
	(33, 4, 1, '2016-02-01 04:17:30', 'Perubahan jumlah Stok secara manual', 7, 1),
	(34, 4, 1, '2016-02-01 04:17:30', 'Perubahan jumlah Stok secara manual', 8, 1),
	(35, 4, 1, '2016-02-01 04:17:30', 'Perubahan jumlah Stok secara manual', 10, 1),
	(36, 4, 1, '2016-02-01 04:17:30', 'Perubahan jumlah Stok secara manual', 1, 18),
	(37, 4, 1, '2016-02-01 22:04:55', 'POS 5', 9, -1);
/*!40000 ALTER TABLE `ospos_inventory` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_items
CREATE TABLE IF NOT EXISTS `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `dimension` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,2) NOT NULL DEFAULT '0.00',
  `receiving_quantity` int(11) NOT NULL DEFAULT '1',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `pic_id` int(10) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(25) NOT NULL,
  `custom2` varchar(25) NOT NULL,
  `custom3` varchar(25) NOT NULL,
  `custom4` varchar(25) NOT NULL,
  `custom5` varchar(25) NOT NULL,
  `custom6` varchar(25) NOT NULL,
  `custom7` varchar(25) NOT NULL,
  `custom8` varchar(25) NOT NULL,
  `custom9` varchar(25) NOT NULL,
  `custom10` varchar(25) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_items: ~4 rows (approximately)
/*!40000 ALTER TABLE `ospos_items` DISABLE KEYS */;
INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `color`, `dimension`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_id`, `allow_alt_description`, `is_serialized`, `deleted`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
	('meja', 'kredit', NULL, NULL, '', '', '', 40000.00, 50000.00, 5.00, 0, 1, NULL, 0, 0, 1, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Meja', 'Cash', NULL, 'M001', '', '', '', 20000.00, 30000.00, 1.00, 0, 2, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Kursi', 'kursi', NULL, 'K001', '', '', '', 30000.00, 50000.00, 2.00, 0, 3, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
	('Kursi Syahrini', 'new', NULL, 'K002', '', 'merah', '20x25', 100000.00, 300000.00, 1.00, 0, 4, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
/*!40000 ALTER TABLE `ospos_items` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_items_taxes
CREATE TABLE IF NOT EXISTS `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`),
  CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_items_taxes: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_items_taxes` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_item_kits
CREATE TABLE IF NOT EXISTS `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_item_kits: ~1 rows (approximately)
/*!40000 ALTER TABLE `ospos_item_kits` DISABLE KEYS */;
INSERT INTO `ospos_item_kits` (`item_kit_id`, `name`, `description`) VALUES
	(1, 'paket 1', '');
/*!40000 ALTER TABLE `ospos_item_kits` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_item_kit_items
CREATE TABLE IF NOT EXISTS `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`),
  CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_item_kit_items: ~2 rows (approximately)
/*!40000 ALTER TABLE `ospos_item_kit_items` DISABLE KEYS */;
INSERT INTO `ospos_item_kit_items` (`item_kit_id`, `item_id`, `quantity`) VALUES
	(1, 2, 1.00),
	(1, 3, 1.00);
/*!40000 ALTER TABLE `ospos_item_kit_items` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_item_quantities
CREATE TABLE IF NOT EXISTS `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_item_quantities: ~40 rows (approximately)
/*!40000 ALTER TABLE `ospos_item_quantities` DISABLE KEYS */;
INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
	(1, 1, 10),
	(1, 2, 0),
	(1, 3, 0),
	(1, 4, 0),
	(1, 5, 0),
	(1, 6, 0),
	(1, 7, 0),
	(1, 8, 0),
	(1, 9, 0),
	(1, 10, 0),
	(2, 1, 20),
	(2, 2, 4),
	(2, 3, 0),
	(2, 4, 2),
	(2, 5, 0),
	(2, 6, 0),
	(2, 7, 0),
	(2, 8, 0),
	(2, 9, 8),
	(2, 10, 0),
	(3, 1, 14),
	(3, 2, 2),
	(3, 3, 2),
	(3, 4, 2),
	(3, 5, 2),
	(3, 6, 2),
	(3, 7, 2),
	(3, 8, 2),
	(3, 9, 1),
	(3, 10, 0),
	(4, 1, 18),
	(4, 2, 1),
	(4, 3, 1),
	(4, 4, 1),
	(4, 5, 1),
	(4, 6, 1),
	(4, 7, 1),
	(4, 8, 1),
	(4, 9, 9),
	(4, 10, 1);
/*!40000 ALTER TABLE `ospos_item_quantities` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_modules
CREATE TABLE IF NOT EXISTS `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_modules: ~10 rows (approximately)
/*!40000 ALTER TABLE `ospos_modules` DISABLE KEYS */;
INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
	('module_config', 'module_config_desc', 100, 'config'),
	('module_customers', 'module_customers_desc', 10, 'customers'),
	('module_employees', 'module_employees_desc', 80, 'employees'),
	('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
	('module_items', 'module_items_desc', 20, 'items'),
	('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
	('module_receivings', 'module_receivings_desc', 60, 'receivings'),
	('module_reports', 'module_reports_desc', 50, 'reports'),
	('module_sales', 'module_sales_desc', 70, 'sales'),
	('module_suppliers', 'module_suppliers_desc', 40, 'suppliers');
/*!40000 ALTER TABLE `ospos_modules` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_people
CREATE TABLE IF NOT EXISTS `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_people: ~1 rows (approximately)
/*!40000 ALTER TABLE `ospos_people` DISABLE KEYS */;
INSERT INTO `ospos_people` (`first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
	('John', 'Doe', NULL, '555-555-5555', 'admin@pappastech.com', 'Address 1', '', '', '', '', '', '', 1);
/*!40000 ALTER TABLE `ospos_people` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_permissions
CREATE TABLE IF NOT EXISTS `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_permissions: ~51 rows (approximately)
/*!40000 ALTER TABLE `ospos_permissions` DISABLE KEYS */;
INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
	('config', 'config', NULL),
	('customers', 'customers', NULL),
	('employees', 'employees', NULL),
	('giftcards', 'giftcards', NULL),
	('items', 'items', NULL),
	('items_BATOS - Lippo Plaza Batu', 'items', 9),
	('items_GP1 - Pusat', 'items', 2),
	('items_GP2 - Toko Utama', 'items', 3),
	('items_GP3 - Gudang Panel', 'items', 4),
	('items_GP4 - Gudang Produksi Sofa', 'items', 5),
	('items_GP5 - Gudang Produksi HPL', 'items', 6),
	('items_MOG2 - Stand Depan Giant', 'items', 7),
	('items_MOG3 - Stand Depan Foodcourt', 'items', 8),
	('items_MOGATR - Atrium MOG', 'items', 10),
	('items_stock', 'items', 1),
	('item_kits', 'item_kits', NULL),
	('receivings', 'receivings', NULL),
	('receivings_BATOS - Lippo Plaza Batu', 'receivings', 9),
	('receivings_GP1 - Pusat', 'receivings', 2),
	('receivings_GP2 - Toko Utama', 'receivings', 3),
	('receivings_GP3 - Gudang Panel', 'receivings', 4),
	('receivings_GP4 - Gudang Produksi Sofa', 'receivings', 5),
	('receivings_GP5 - Gudang Produksi HPL', 'receivings', 6),
	('receivings_MOG2 - Stand Depan Giant', 'receivings', 7),
	('receivings_MOG3 - Stand Depan Foodcourt', 'receivings', 8),
	('receivings_MOGATR - Atrium MOG', 'receivings', 10),
	('receivings_stock', 'receivings', 1),
	('reports', 'reports', NULL),
	('reports_categories', 'reports', NULL),
	('reports_customers', 'reports', NULL),
	('reports_discounts', 'reports', NULL),
	('reports_employees', 'reports', NULL),
	('reports_inventory', 'reports', NULL),
	('reports_items', 'reports', NULL),
	('reports_payments', 'reports', NULL),
	('reports_receivings', 'reports', NULL),
	('reports_sales', 'reports', NULL),
	('reports_suppliers', 'reports', NULL),
	('reports_taxes', 'reports', NULL),
	('sales', 'sales', NULL),
	('sales_BATOS - Lippo Plaza Batu', 'sales', 9),
	('sales_GP1 - Pusat', 'sales', 2),
	('sales_GP2 - Toko Utama', 'sales', 3),
	('sales_GP3 - Gudang Panel', 'sales', 4),
	('sales_GP4 - Gudang Produksi Sofa', 'sales', 5),
	('sales_GP5 - Gudang Produksi HPL', 'sales', 6),
	('sales_MOG2 - Stand Depan Giant', 'sales', 7),
	('sales_MOG3 - Stand Depan Foodcourt', 'sales', 8),
	('sales_MOGATR - Atrium MOG', 'sales', 10),
	('sales_stock', 'sales', 1),
	('suppliers', 'suppliers', NULL);
/*!40000 ALTER TABLE `ospos_permissions` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_receivings
CREATE TABLE IF NOT EXISTS `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_receivings: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_receivings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_receivings` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_receivings_items
CREATE TABLE IF NOT EXISTS `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_receivings_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_receivings_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_receivings_items` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales
CREATE TABLE IF NOT EXISTS `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sale_time` (`sale_time`),
  CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales: ~5 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales` DISABLE KEYS */;
INSERT INTO `ospos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `invoice_number`, `sale_id`) VALUES
	('2016-01-27 02:12:18', NULL, 1, '', NULL, 1),
	('2016-01-27 22:32:53', NULL, 1, '', NULL, 2),
	('2016-01-28 02:40:39', NULL, 1, '', NULL, 3),
	('2016-02-01 01:01:04', NULL, 1, '', '0', 4),
	('2016-02-01 22:04:55', NULL, 1, '', '1', 5);
/*!40000 ALTER TABLE `ospos_sales` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales_items
CREATE TABLE IF NOT EXISTS `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`),
  CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales_items: ~5 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales_items` DISABLE KEYS */;
INSERT INTO `ospos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `item_location`) VALUES
	(1, 2, '', '', 1, 1.00, 20000.00, 30000.00, 0.00, 2),
	(2, 2, '', '', 1, 1.00, 20000.00, 30000.00, 0.00, 9),
	(3, 2, '', '', 1, 1.00, 20000.00, 30000.00, 0.00, 9),
	(4, 3, '', '', 1, 1.00, 30000.00, 50000.00, 0.00, 9),
	(5, 4, '', '', 1, 1.00, 100000.00, 300000.00, 0.00, 9);
/*!40000 ALTER TABLE `ospos_sales_items` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales_items_taxes
CREATE TABLE IF NOT EXISTS `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales_items_taxes: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales_payments
CREATE TABLE IF NOT EXISTS `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales_payments: ~6 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales_payments` DISABLE KEYS */;
INSERT INTO `ospos_sales_payments` (`sale_id`, `payment_type`, `payment_amount`) VALUES
	(1, 'Tunai', 30000.00),
	(2, 'Tunai', 30000.00),
	(3, 'kredit rekanan', 30000.00),
	(4, 'cash', 20000.00),
	(4, 'kredit in house', 30000.00),
	(5, 'cash', 300000.00);
/*!40000 ALTER TABLE `ospos_sales_payments` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales_suspended
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `ospos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales_suspended: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales_suspended` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales_suspended_items
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `ospos_sales_suspended_items_ibfk_3` (`item_location`),
  CONSTRAINT `ospos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`),
  CONSTRAINT `ospos_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales_suspended_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales_suspended_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended_items` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales_suspended_items_taxes
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended_items` (`sale_id`),
  CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales_suspended_items_taxes: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales_suspended_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended_items_taxes` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sales_suspended_payments
CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  CONSTRAINT `ospos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sales_suspended_payments: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_sales_suspended_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_suspended_payments` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_sessions
CREATE TABLE IF NOT EXISTS `ospos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_sessions: ~3 rows (approximately)
/*!40000 ALTER TABLE `ospos_sessions` DISABLE KEYS */;
INSERT INTO `ospos_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
	('43d558b908656d17f7b9620ddf2827b9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', 1453801341, 'a:9:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:13:"sale_location";s:1:"1";s:13:"item_location";s:1:"1";s:4:"cart";a:1:{i:1;a:16:{s:7:"item_id";s:1:"1";s:13:"item_location";s:1:"1";s:10:"stock_name";s:5:"stock";s:4:"line";i:1;s:4:"name";s:8:"bWVqYQ==";s:11:"item_number";N;s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:1:"2";s:8:"discount";s:1:"0";s:8:"in_stock";s:2:"10";s:5:"price";s:8:"50000.00";s:5:"total";s:9:"100000.00";s:16:"discounted_total";s:12:"100000.00000";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:2:{s:4:"Cash";a:2:{s:12:"payment_type";s:4:"Cash";s:14:"payment_amount";s:8:"50000.00";}s:5:"Tunai";a:2:{s:12:"payment_type";s:5:"Tunai";s:14:"payment_amount";s:12:"150000.00000";}}s:20:"sales_invoice_number";s:1:"0";}'),
	('9711dda4c869e57a303f97c1d37042cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1454385518, 'a:11:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:13:"sale_location";s:1:"6";s:13:"item_location";s:1:"1";s:22:"sales_print_after_sale";s:4:"true";s:28:"sales_invoice_number_enabled";s:4:"true";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:20:"sales_invoice_number";s:1:"2";}'),
	('a7a2bedb993ad0e6fdb5fd7a432a18b1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1453950418, '');
/*!40000 ALTER TABLE `ospos_sessions` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_stock_locations
CREATE TABLE IF NOT EXISTS `ospos_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_stock_locations: ~10 rows (approximately)
/*!40000 ALTER TABLE `ospos_stock_locations` DISABLE KEYS */;
INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
	(1, 'stock', 0),
	(2, 'GP1 - Pusat', 0),
	(3, 'GP2 - Toko Utama', 0),
	(4, 'GP3 - Gudang Panel', 0),
	(5, 'GP4 - Gudang Produksi Sofa', 0),
	(6, 'GP5 - Gudang Produksi HPL', 0),
	(7, 'MOG2 - Stand Depan Giant', 0),
	(8, 'MOG3 - Stand Depan Foodcourt', 0),
	(9, 'BATOS - Lippo Plaza Batu', 0),
	(10, 'MOGATR - Atrium MOG', 0);
/*!40000 ALTER TABLE `ospos_stock_locations` ENABLE KEYS */;


-- Dumping structure for table giripalma.ospos_suppliers
CREATE TABLE IF NOT EXISTS `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table giripalma.ospos_suppliers: ~0 rows (approximately)
/*!40000 ALTER TABLE `ospos_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_suppliers` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
