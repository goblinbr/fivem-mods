Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.

Config.MarkerInfo = {Type = 1, r = 102, g = 102, b = 204, x = 2.0, y = 2.0, z = 1.0} -- Marker Settings.
Config.Blip = {Sprite = 408, Color = 0, Display = 2, Scale = 1.0} -- Blip Settings.

Config.UseBlips = true -- true = Use License Shop Blips
Config.RequireDMV = false -- true = Will Require Players to have Drivers Permit to buy other Licenses.
Config.AdvancedVehicleShop = false -- true = Using esx_advancedvehicleshop
Config.AdvancedWeaponShop = true -- true = Using esx_advancedweaponshop
Config.DMVSchool = true -- true = Using esx_dmvschool
Config.SellDMV = false -- true = If 'Config.RequireDMV' = false & you want Players to be able to buy Drivers Permit.
Config.Drugs = false -- true = Using esx_drugs
Config.WeaponShop = false -- true = Using esx_weaponshop

-- Prices of Licenses
Config.Prices = {
	Aircraft = 10000,
	Boating = 50,
	Melee = 200,
	Handgun = 1000,
	SMG = 6000,
	Shotgun = 4000,
	Assault = 15000,
	LMG = 20000,
	Sniper = 30000,
	Heavy = 50000,
	Commercial = 300,
	Drivers = 5000,
	DriversP = 75,
	Motorcycle = 5000,
	Weed = 10000,
	Weapon = 1000
}

Config.Locs = {
	vector3(241.0, -1378.9, 32.7)
}
