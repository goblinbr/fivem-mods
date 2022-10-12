USE `es_extended`;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('boxpistol', 'Ammo Box Pistol', 1, 0, 1),
	('boxsmg', 'Ammo Box SMG', 1, 0, 1),
	('boxshot', 'Ammo Box Shotgun', 1, 0, 1),
	('boxrifle', 'Ammo Box Rifle', 1, 0, 1),
	('boxmg', 'Ammo Box MG', 1, 0, 1),
	('boxsniper', 'Ammo Box Sniper', 1, 0, 1),
	('cleankit', 'Cleaning Kit', 1, 0, 1),
	('defib', 'Defib', 1, 0, 1),
	('firstaidkit', 'First Aid Kit', 1, 0, 1),
	('repairkit', 'Repair Kit', 1, 0, 1),
	('tirekit', 'Tire Kit', 1, 0, 1)
;

INSERT INTO `shops` (store, item, price) VALUES
	('ExtraItemsShop', 'boxpistol', 14),
	('ExtraItemsShop', 'boxsmg', 14),
	('ExtraItemsShop', 'boxshot', 9),
	('ExtraItemsShop', 'boxrifle', 12),
	('ExtraItemsShop', 'boxmg', 24),
	('ExtraItemsShop', 'boxsniper', 21),
	('ExtraItemsShop', 'cleankit', 5),
	('ExtraItemsShop', 'defib', 1200),
	('ExtraItemsShop', 'firstaidkit', 80),
	('ExtraItemsShop', 'repairkit', 150),
	('ExtraItemsShop', 'tirekit', 25)
;
