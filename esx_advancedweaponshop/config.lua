Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.DrawDistance = 10 -- Marker Draw Distance.
Config.MarkerInfo = {Type = 1, r = 0, g = 128, b = 255, x = 1.5, y = 1.5, z = 0.5} -- Marker Settings.

Config.UseBlips = true -- true = Use Weapon Shop Blips.

-- Require Licenses | Use only if you are using esx_license
Config.License = {
	Master = true, -- Master Toggle | Set to true if using esx_license.
	Melee = true, -- true = Will Require Players to have a Melee License to Purchase Melee Weapons.
	Handgun = true, -- true = Will Require Players to have a Handgun License to Purchase Handguns.
	SMG = true, -- true = Will Require Players to have a SMG License to Purchase SMGs.
	Shotgun = true, -- true = Will Require Players to have a Shotgun License to Purchase Shotguns.
	Assault = true, -- true = Will Require Players to have a Assault License to Purchase Assault Rifles.
	LMG = true, -- true = Will Require Players to have a LMG License to Purchase LMGs.
	Sniper = true, -- true = Will Require Players to have a Sniper License to Purchase Sniper Rifles.
	Heavy = true -- true = Will Require Players to have a Heavy License to Purchase Heavy Weapons.
}

-- true = This shop has Weapons
Config.HasWeapons = {
	LegalShop = {
		Misc = true,
		Throw = true,
		Melee = true,
		Handgun = true,
		SMG = true,
		Shotgun = true,
		Assault = true,
		LMG = true,
		Sniper = true,
		Heavy = true
	},

	IllegalShop = {
		Misc = false,
		Throw = true,
		Melee = true,
		Handgun = true,
		SMG = true,
		Shotgun = true,
		Assault = true,
		LMG = false,
		Sniper = false,
		Heavy = false
	}
}

Config.Zones = {
	LegalShop = {
		Legal = true, -- DO NOT CHANGE
		Misc = {
			{cat = 'Misc', name = 'GADGET_PARACHUTE', price = 800},
			{cat = 'Misc', name = 'WEAPON_FIREEXTINGUISHER', price = 100}
		},
		Throw = {
			{cat = 'Throw', name = 'WEAPON_BALL', price = 25},
			{cat = 'Throw', name = 'WEAPON_BZGAS', price = 250},
			{cat = 'Throw', name = 'WEAPON_FLARE', price = 100},
			{cat = 'Throw', name = 'WEAPON_SNOWBALL', price = 25},
			{cat = 'Throw', name = 'WEAPON_SMOKEGRENADE', price = 250},
			{cat = 'Throw', name = 'WEAPON_MOLOTOV', price = 300},
			{cat = 'Throw', name = 'WEAPON_GRENADE', price = 1000},
			{cat = 'Throw', name = 'WEAPON_PETROLCAN', price = 200},
			{cat = 'Throw', name = 'WEAPON_PIPEBOMB', price = 2000}
		},
		Melee = {
			{cat = 'Melee', name = 'WEAPON_DAGGER', price = 15},
			{cat = 'Melee', name = 'WEAPON_BAT', price = 20},
			{cat = 'Melee', name = 'WEAPON_BATTLEAXE', price = 125},
			{cat = 'Melee', name = 'WEAPON_BOTTLE', price = 10},
			{cat = 'Melee', name = 'WEAPON_CROWBAR', price = 15},
			{cat = 'Melee', name = 'WEAPON_FLASHLIGHT', price = 25},
			{cat = 'Melee', name = 'WEAPON_GOLFCLUB', price = 40},
			{cat = 'Melee', name = 'WEAPON_HAMMER', price = 5},
			{cat = 'Melee', name = 'WEAPON_HATCHET', price = 20},
			{cat = 'Melee', name = 'WEAPON_KNIFE', price = 30},
			{cat = 'Melee', name = 'WEAPON_KNUCKLE', price = 25},
			{cat = 'Melee', name = 'WEAPON_MACHETE', price = 20},
			{cat = 'Melee', name = 'WEAPON_NIGHTSTICK', price = 15},
			{cat = 'Melee', name = 'WEAPON_WRENCH', price = 40},
			{cat = 'Melee', name = 'WEAPON_POOLCUE', price = 10},
			{cat = 'Melee', name = 'WEAPON_STONE_HATCHET', price = 15},
			{cat = 'Melee', name = 'WEAPON_SWITCHBLADE', price = 25}
		},
		Handgun = {
			{cat = 'Handgun', name = 'WEAPON_APPISTOL', price = 3700},
			{cat = 'Handgun', name = 'WEAPON_CERAMICPISTOL', price = 1400},
			{cat = 'Handgun', name = 'WEAPON_COMBATPISTOL', price = 1400},
			{cat = 'Handgun', name = 'WEAPON_DOUBLEACTION', price = 1650},
			{cat = 'Handgun', name = 'WEAPON_FLAREGUN', price = 1500},
			--{cat = 'Handgun', name = 'WEAPON_GADGETPISTOL', price = 500},
			{cat = 'Handgun', name = 'WEAPON_HEAVYPISTOL', price = 1550},
			{cat = 'Handgun', name = 'WEAPON_REVOLVER', price = 2300},
			{cat = 'Handgun', name = 'WEAPON_NAVYREVOLVER', price = 1650},
			{cat = 'Handgun', name = 'WEAPON_PISTOL', price = 1350},
			{cat = 'Handgun', name = 'WEAPON_PISTOL50', price = 2500},
			{cat = 'Handgun', name = 'WEAPON_SNSPISTOL', price = 1150},
			{cat = 'Handgun', name = 'WEAPON_STUNGUN', price = 1500},
			{cat = 'Handgun', name = 'WEAPON_VINTAGEPISTOL', price = 1300},
			{cat = 'Handgun', name = 'WEAPON_MARKSMANPISTOL', price = 1225}
		},
		SMG = {
			{cat = 'SMG', name = 'WEAPON_ASSAULTSMG', price = 3400},
			{cat = 'SMG', name = 'WEAPON_COMBATPDW', price = 3500},
			{cat = 'SMG', name = 'WEAPON_MACHINEPISTOL', price = 3300},
			{cat = 'SMG', name = 'WEAPON_MICROSMG', price = 3900},
			{cat = 'SMG', name = 'WEAPON_MINISMG', price = 3800},
			{cat = 'SMG', name = 'WEAPON_SMG', price = 1600}
		},
		Shotgun = {
			{cat = 'Shotgun', name = 'WEAPON_ASSAULTSHOTGUN', price = 5100},
			{cat = 'Shotgun', name = 'WEAPON_AUTOSHOTGUN', price = 5100},
			{cat = 'Shotgun', name = 'WEAPON_BULLPUPSHOTGUN', price = 4400},
			--{cat = 'Shotgun', name = 'WEAPON_COMBATSHOTGUN', price = 550},
			{cat = 'Shotgun', name = 'WEAPON_DBSHOTGUN', price = 4450},
			{cat = 'Shotgun', name = 'WEAPON_HEAVYSHOTGUN', price = 5000},
			{cat = 'Shotgun', name = 'WEAPON_MUSKET', price = 4225},
			{cat = 'Shotgun', name = 'WEAPON_PUMPSHOTGUN', price = 5000},
			{cat = 'Shotgun', name = 'WEAPON_SAWNOFFSHOTGUN', price = 4500}
		},
		Assault = {
			{cat = 'Assault', name = 'WEAPON_ADVANCEDRIFLE', price = 12000},
			{cat = 'Assault', name = 'WEAPON_ASSAULTRIFLE', price = 11200},
			{cat = 'Assault', name = 'WEAPON_BULLPUPRIFLE', price = 11200},
			{cat = 'Assault', name = 'WEAPON_CARBINERIFLE', price = 12400},
			{cat = 'Assault', name = 'WEAPON_COMPACTRIFLE', price = 10750},
			--{cat = 'Assault', name = 'WEAPON_MILITARYRIFLE', price = 2050},
			{cat = 'Assault', name = 'WEAPON_SPECIALCARBINE', price = 15200}
		},
		LMG = {
			{cat = 'LMG', name = 'WEAPON_COMBATMG', price = 33950},
			{cat = 'LMG', name = 'WEAPON_GUSENBERG', price = 24280},
			{cat = 'LMG', name = 'WEAPON_MG', price = 28250}
		},
		Sniper = {
			{cat = 'Sniper', name = 'WEAPON_HEAVYSNIPER', price = 59900},
			{cat = 'Sniper', name = 'WEAPON_MARKSMANRIFLE', price = 53800},
			{cat = 'Sniper', name = 'WEAPON_SNIPERRIFLE', price = 52000}
		},
		Heavy = {
			{cat = 'Heavy', name = 'WEAPON_GRENADELAUNCHER', price = 100000},
			{cat = 'Heavy', name = 'WEAPON_HOMINGLAUNCHER', price = 100000},
			{cat = 'Heavy', name = 'WEAPON_MINIGUN', price = 100000},
			{cat = 'Heavy', name = 'WEAPON_RPG', price = 100000}
		},
		Locations = {
			vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1),
			vector3(-1306.2, -394.0, 35.6),
			vector3(-3171.97, 1087.4, 19.84),
			vector3(119.47, -1977.88, 19.93)
		}
	},

	IllegalShop = {
		Legal = false, -- DO NOT CHANGE
		Misc = {
			--{cat = 'Misc', name = 'NAME_HERE', price = 1}
		},
		Throw = {
			{cat = 'Throw', name = 'WEAPON_BZGAS', price = 500},
			{cat = 'Throw', name = 'WEAPON_MOLOTOV', price = 150},
			{cat = 'Throw', name = 'WEAPON_SMOKEGRENADE', price = 500}
		},
		Melee = {
			{cat = 'Melee', name = 'WEAPON_BAT', price = 25},
			{cat = 'Melee', name = 'WEAPON_BOTTLE', price = 15},
			{cat = 'Melee', name = 'WEAPON_CROWBAR', price = 20},
			{cat = 'Melee', name = 'WEAPON_KNIFE', price = 35},
			{cat = 'Melee', name = 'WEAPON_KNUCKLE', price = 30},
			{cat = 'Melee', name = 'WEAPON_MACHETE', price = 25},
			{cat = 'Melee', name = 'WEAPON_SWITCHBLADE', price = 30}
		},
		Handgun = {
			{cat = 'Handgun', name = 'WEAPON_PISTOL', price = 700},
			{cat = 'Handgun', name = 'WEAPON_SNSPISTOL', price = 300},
			{cat = 'Handgun', name = 'WEAPON_VINTAGEPISTOL', price = 600}
		},
		SMG = {
			{cat = 'SMG', name = 'WEAPON_MICROSMG', price = 1800},
			{cat = 'SMG', name = 'WEAPON_MINISMG', price = 1600},
			{cat = 'SMG', name = 'WEAPON_SMG', price = 3200}
		},
		Shotgun = {
			{cat = 'Shotgun', name = 'WEAPON_DBSHOTGUN', price = 900},
			{cat = 'Shotgun', name = 'WEAPON_PUMPSHOTGUN', price = 700},
			{cat = 'Shotgun', name = 'WEAPON_SAWNOFFSHOTGUN', price = 1000}
		},
		Assault = {
			{cat = 'Assault', name = 'WEAPON_ASSAULTRIFLE', price = 2400},
			{cat = 'Assault', name = 'WEAPON_CARBINERIFLE', price = 4800}
		},
		LMG = {
			--{cat = 'LMG', name = 'NAME_HERE', price = 1}
		},
		Sniper = {
			--{cat = 'Sniper', name = 'NAME_HERE', price = 1}
		},
		Heavy = {
		},
		Locations = {
		}
	}
}
