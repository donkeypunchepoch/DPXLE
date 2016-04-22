ALTER TABLE `player_history`
	ADD COLUMN `killer` VARCHAR(64) NOT NULL;
	ALTER TABLE `player_history`
	ADD COLUMN `kUID` VARCHAR(32) NOT NULL;
	ALTER TABLE `player_history`
	ADD COLUMN `distance` INT(11) NOT NULL;
	
CREATE TABLE `vehicle_history` (
 `id` varchar(32) NOT NULL,
 `owner` varchar(64) NOT NULL,
 `class` varchar(64) NOT NULL,
 `position_x` double NOT NULL DEFAULT '0',
   `position_y` double NOT NULL DEFAULT '0',
   `position_z` double NOT NULL DEFAULT '0',
   `killer` varchar(64) NOT NULL,
   `kUID` varchar(32) NOT NULL,
   `destroyed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `container_history` (
	`id` varchar(32) NOT NULL,
	`owner` varchar(64) NOT NULL,
	`class` varchar(64) NOT NULL,
	`position_x` double NOT NULL DEFAULT '0',
  	`position_y` double NOT NULL DEFAULT '0',
  	`position_z` double NOT NULL DEFAULT '0',
  	`killer` varchar(64) NOT NULL,
  	`kUID` varchar(32) NOT NULL,
  	`destroyed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lock_history` (
	`player` varchar(64) NOT NULL,
	`UID` varchar(64) NOT NULL,
	`enteredPIN` varchar(32) NOT NULL,
	`position_x` double NOT NULL DEFAULT '0',
  	`position_y` double NOT NULL DEFAULT '0',
  	`position_z` double NOT NULL DEFAULT '0',
	`class` varchar(64) NOT NULL,
  	`realPIN` varchar(32) NOT NULL,
	`objID` varchar(32) NOT NULL,
  	`access` varchar(32) NOT NULL,
  	`logged_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `item_sell_history` (
	`pUID` varchar(32) NOT NULL,
	`player` varchar(64) NOT NULL,
	`price` varchar(64) NOT NULL,
	`respect` varchar(64) NOT NULL,
	`item` varchar(64) NOT NULL,
	`ppos` varchar(64) NOT NULL,
	`quantity` varchar(64) NOT NULL,
	`player_money` varchar(64) NOT NULL,
	`player_respect` varchar(64) NOT NULL,
	`date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `waste_history` (
	`pUID` varchar(32) NOT NULL,
	`player` varchar(64) NOT NULL,
	`price` varchar(64) NOT NULL,
	`respect` varchar(64) NOT NULL,
	`item` varchar(64) NOT NULL,
	`cargo` text NOT NULL,
	`ppos` varchar(64) NOT NULL,
	`player_money` varchar(64) NOT NULL,
	`player_respect` varchar(64) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `veh_buy_history` (
  `pUID` varchar(32) NOT NULL,
  `player` varchar(64) NOT NULL,
  `price` varchar(64) NOT NULL,
  `item` varchar(64) NOT NULL,
  `ppos` varchar(64) NOT NULL,
  `player_money` varchar(64) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `veh_paint_history` (
  `pUID` varchar(32) NOT NULL,
  `player` varchar(64) NOT NULL,
  `price` varchar(64) NOT NULL,
  `item` varchar(64) NOT NULL,
  `ppos` varchar(64) NOT NULL,
  `player_money` varchar(64) NOT NULL,
  `skin` varchar(64) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `item_buy_history` (
  `pUID` varchar(32) NOT NULL,
  `player` varchar(64) NOT NULL,
  `price` varchar(64) NOT NULL,
  `item` varchar(64) NOT NULL,
  `ppos` varchar(64) NOT NULL,
  `quantity` varchar(64) NOT NULL,
  `player_money` varchar(64) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `construction_history` (
 `id` varchar(32) NOT NULL,
 `owner` varchar(64) NOT NULL,
 `class` varchar(64) NOT NULL,
 `position_x` double NOT NULL DEFAULT '0',
   `position_y` double NOT NULL DEFAULT '0',
   `position_z` double NOT NULL DEFAULT '0',
   `locked` varchar(64) NOT NULL,
   `pincode` varchar(32) NOT NULL,
   `spawned` varchar(32) NOT NULL,
   `destroyed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `poptab_send_history` (
 `sUID` varchar(32) NOT NULL,
 `sender` varchar(64) NOT NULL,
 `amount` varchar(64) NOT NULL,
 `rUID` varchar(32) NOT NULL,
 `receiver` varchar(64) NOT NULL,
   `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;