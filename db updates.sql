USE giripalma;

ALTER TABLE `ospos_modules`
	ADD COLUMN `href` TEXT NOT NULL AFTER `sort_number`;

update ospos_modules
set href = module_id;

UPDATE `giripalma`.`ospos_modules` SET `href`='#' WHERE  `module_id`='sales';

INSERT INTO `giripalma`.`ospos_module_menu` (`name`, `module`, `href`, `sort_number`, `menu_identifier`) VALUES ('Surat Pesanan', 'sales', 'sales', 1, 'sales_order');
INSERT INTO `giripalma`.`ospos_module_menu` (`name`, `module`, `href`, `sort_number`, `menu_identifier`) VALUES ('Surat Jalan', 'sales', 'shipments', 2, 'shipment');

