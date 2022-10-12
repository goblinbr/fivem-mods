Config = {}
Config.Locale = 'en' -- Set Locale file to use.

Config.Removeables = {
	-- true = Removes if/when used.
	Defib = false,
	FirstAidKit = true,
	CleanKit = true,
	RepairKit = true,
	TireKit = true,
	AmmoBoxes = true,
}

-- Item Scenario Wait Times in Miliseconds.
Config.Wait = {
	CleanKit = 10000,
	RepairKit = 10000,
	TireKit = 10000
}

-- Weapon Ammos
Config.AmmoBoxes = {
	-- Advanced
	Pistol = 100, -- Amount of Pistol Ammo to Give. | 9mm @ 0.28 per round | 50 x 1.05 = 14
	SMG = 100, -- Amount of SMG Ammo to Give. | 9mm @ 0.28 per round | 50 x 1.05 = 14
	Shotgun = 50, -- Amount of Shotgun Ammo to Give. | 12g @ 0.36 per round | 25 x 0.36 = 9
	Rifle = 50, -- Amount of Assault Rifle Ammo to Give. | 5.56 @ 0.47 per round | 25 x 0.47 = 11.75 (12)
	MG = 100, -- Amount of LMG Ammo to Give. | 5.56 @ 0.47 per round | 50 x 0.47 = 23.50 (24)
	Sniper = 40, -- Amount of Sniper Rifle Ammo to Give. | 7.62 @ 1.05 per round | 20 x 1.05 = 21
	Flare = 5, -- Amount of Flare Gun Ammo to Give.
	-- Basic
	BoxBig = 100, -- Amount of Box Big Ammo to Give.
	BoxSmall = 50 -- Amount of Box Small Ammo to Give.
}

Config.WeaponList = {
	Pistols = {
		'WEAPON_APPISTOL',
		'WEAPON_CERAMICPISTOL',
		'WEAPON_COMBATPISTOL',
		'WEAPON_DOUBLEACTION',
		'WEAPON_GADGETPISTOL',
		'WEAPON_HEAVYPISTOL',
		'WEAPON_REVOLVER',
		'WEAPON_REVOLVER_MK2',
		'WEAPON_MARKSMANPISTOL',
		'WEAPON_NAVYREVOLVER',
		'WEAPON_PISTOL',
		'WEAPON_PISTOL_MK2',
		'WEAPON_PISTOL50',
		'WEAPON_SNSPISTOL',
		'WEAPON_SNSPISTOL_MK2',
		'WEAPON_VINTAGEPISTOL',
		'WEAPON_MACHINEPISTOL',
	},
	SMGs = {
		'WEAPON_ASSAULTSMG',
		'WEAPON_COMBATPDW',
		'WEAPON_MICROSMG',
		'WEAPON_MINISMG',
		'WEAPON_SMG',
		'WEAPON_SMG_MK2',
	},
	Shotguns = {
		'WEAPON_ASSAULTSHOTGUN',
		'WEAPON_AUTOSHOTGUN',
		'WEAPON_BULLPUPSHOTGUN',
		'WEAPON_COMBATSHOTGUN',
		'WEAPON_DBSHOTGUN',
		'WEAPON_HEAVYSHOTGUN',
		'WEAPON_MUSKET',
		'WEAPON_PUMPSHOTGUN',
		'WEAPON_PUMPSHOTGUN_MK2',
		'WEAPON_SAWNOFFSHOTGUN',
	},
	Rifles = {
		'WEAPON_ADVANCEDRIFLE',
		'WEAPON_ASSAULTRIFLE',
		'WEAPON_ASSAULTRIFLE_MK2',
		'WEAPON_BULLPUPRIFLE',
		'WEAPON_BULLPUPRIFLE_MK2',
		'WEAPON_CARBINERIFLE',
		'WEAPON_CARBINERIFLE_MK2',
		'WEAPON_COMPACTRIFLE',
		'WEAPON_MILITARYRIFLE',
		'WEAPON_SPECIALCARBINE',
		'WEAPON_SPECIALCARBINE_MK2',
	},
	MGs = {
		'WEAPON_COMBATMG',
		'WEAPON_COMBATMG_MK2',
		'WEAPON_GUSENBERG',
		'WEAPON_MG',
	},
	Snipers = {
		'WEAPON_HEAVYSNIPER',
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE',
		'WEAPON_MARKSMANRIFLE_MK2',
		'WEAPON_SNIPERRIFLE',
	},
	Flares = {
		'WEAPON_FLAREGUN'
	}
}
