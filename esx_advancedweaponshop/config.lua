Config = {}
Config.Locale = "en" -- Set Locale file to use.

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
        Heavy = true,
        Ammo = true,
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
        Heavy = false,
        Ammo = false
    }
}

Config.Zones = {
    LegalShop = {
        Legal = true, -- DO NOT CHANGE
        Misc = {
            {cat = 'Misc', name = 'BODY_ARMOR', price = 100, label = 'Body armor'},
            {cat = 'Misc', name = 'GADGET_PARACHUTE', price = 800}
        },
        Throw = {
            {cat = 'Throw', name = 'WEAPON_FLARE', price = 100, quantity = 1, hash = `AMMO_FLARE`},
            {cat = 'Throw', name = 'WEAPON_PETROLCAN', price = 200, quantity = 4500, hash = `AMMO_PETROLCAN`},
            {cat = 'Throw', name = 'WEAPON_BZGAS', price = 250, quantity = 1, hash = `AMMO_BZGAS`},
            {cat = 'Throw', name = 'WEAPON_SMOKEGRENADE', price = 250, quantity = 1, hash = `AMMO_SMOKEGRENADE`},
            {cat = 'Throw', name = 'WEAPON_MOLOTOV', price = 300, quantity = 1, hash = `AMMO_MOLOTOV`},
            {cat = 'Throw', name = 'WEAPON_PROXMINE', price = 500, quantity = 1, hash = `AMMO_PROXMINE`},
            {cat = 'Throw', name = 'WEAPON_GRENADE', price = 800, quantity = 1, hash = `AMMO_GRENADE`},
            {cat = 'Throw', name = 'WEAPON_PIPEBOMB', price = 800, quantity = 1, hash = `AMMO_PIPEBOMB`},
            {cat = 'Throw', name = 'WEAPON_STICKYBOMB', price = 1000, quantity = 1, hash = `AMMO_STICKYBOMB`},
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
        Ammo = {
            {cat = 'Ammo', name = 'AMMO_PISTOL', price = 10, ammo = true, quantity = 20, hash = `AMMO_PISTOL`, label = _U('ammo_pistol')},
            {cat = 'Ammo', name = 'AMMO_SHOTGUN', price = 20, ammo = true, quantity = 16, hash = `AMMO_SHOTGUN`, label = _U('ammo_shotgun')},
            {cat = 'Ammo', name = 'AMMO_SMG', price = 50, ammo = true, quantity = 50, hash = `AMMO_SMG`, label = _U('ammo_smg')},
            {cat = 'Ammo', name = 'AMMO_RIFLE', price = 100, ammo = true, quantity = 60, hash = `AMMO_RIFLE`, label = _U('ammo_rifle')},
            {cat = 'Ammo', name = 'AMMO_MG', price = 250, ammo = true, quantity = 50, hash = `AMMO_MG`, label = _U('ammo_mg')},
            {cat = 'Ammo', name = 'AMMO_SNIPER', price = 300, ammo = true, quantity = 10, hash = `AMMO_SNIPER`, label = _U('ammo_sniper')},
            {cat = 'Ammo', name = 'AMMO_GRENADELAUNCHER', price = 250, ammo = true, quantity = 1, hash = `AMMO_GRENADELAUNCHER`, label = _U('ammo_grenadelauncher')},
            {cat = 'Ammo', name = 'AMMO_HOMINGLAUNCHER', price = 350, ammo = true, quantity = 1, hash = `AMMO_HOMINGLAUNCHER`, label = _U('ammo_hominglauncher')},
            {cat = 'Ammo', name = 'AMMO_MINIGUN', price = 500, ammo = true, quantity = 100, hash = `AMMO_MINIGUN`, label = _U('ammo_minigun')},
            {cat = 'Ammo', name = 'AMMO_RPG', price = 300, ammo = true, quantity = 1, hash = `AMMO_RPG`, label = _U('ammo_rpg')},
        },
        Upgrade = {
            {cat = 'Upgrade', name = 'ammo_armor', price = 2000},
            {cat = 'Upgrade', name = 'ammo_explosive', price = 2000},
            {cat = 'Upgrade', name = 'ammo_fmj', price = 2000},
            {cat = 'Upgrade', name = 'ammo_hollowpoint', price = 2000},
            {cat = 'Upgrade', name = 'ammo_incendiary', price = 2000},
            {cat = 'Upgrade', name = 'ammo_tracer', price = 2000},
            {cat = 'Upgrade', name = 'barrel_default', price = 2000},
            {cat = 'Upgrade', name = 'barrel_heavy', price = 2000},
            {cat = 'Upgrade', name = 'clip_box', price = 2000},
            {cat = 'Upgrade', name = 'clip_drum', price = 2000},
            {cat = 'Upgrade', name = 'clip_extended', price = 5000},
            {cat = 'Upgrade', name = 'compensator', price = 2000},
            {cat = 'Upgrade', name = 'flashlight', price = 100},
            {cat = 'Upgrade', name = 'grip', price = 2000},
            {cat = 'Upgrade', name = 'ironsights', price = 1000},
            {cat = 'Upgrade', name = 'luxary_finish', price = 10000},
            {cat = 'Upgrade', name = 'muzzle_bell', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_fat', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_flat', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_heavy', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_precision', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_slanted', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_split', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_squared', price = 2000},
            {cat = 'Upgrade', name = 'muzzle_tactical', price = 2000},
            {cat = 'Upgrade', name = 'scope', price = 2000},
            {cat = 'Upgrade', name = 'scope_advanced', price = 2000},
            {cat = 'Upgrade', name = 'scope_holo', price = 2000},
            {cat = 'Upgrade', name = 'scope_large', price = 2000},
            {cat = 'Upgrade', name = 'scope_medium', price = 2000},
            {cat = 'Upgrade', name = 'scope_nightvision', price = 2000},
            {cat = 'Upgrade', name = 'scope_small', price = 2000},
            {cat = 'Upgrade', name = 'scope_thermal', price = 2000},
            {cat = 'Upgrade', name = 'scope_zoom', price = 2000},
            {cat = 'Upgrade', name = 'shells_armor', price = 2000},
            {cat = 'Upgrade', name = 'shells_default', price = 2000},
            {cat = 'Upgrade', name = 'shells_explosive', price = 2000},
            {cat = 'Upgrade', name = 'shells_hollowpoint', price = 2000},
            {cat = 'Upgrade', name = 'shells_incendiary', price = 2000},
            {cat = 'Upgrade', name = 'suppressor', price = 2000}
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
        Legal = false,
        Locations = {
        }
    }
}
