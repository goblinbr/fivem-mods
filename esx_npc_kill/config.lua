Config = {}

Config.Locale = "en"

Config.moneyOnKill = 10
Config.moneyOnKillVehicle = 100
Config.xpOnKill = 10
Config.xpOnKillVehicle = 100
Config.showNotificationOnKill = true
Config.staminaRegenByLevel = 0.0052
Config.healthBylevel = 5
Config.xpLostOnDeathBylevel = 150
Config.radiusPlayerToDivideEarnings = 20.0

Config.configByPedType = {}

Config.configByPedType[PED_TYPES.MEDIC] = {
    moneyOnKill = 25,
    xpOnKill = 10,
    showNotificationOnKill = true
}

Config.configByPedType[PED_TYPES.FIREMAN] = {
    moneyOnKill = 35,
    xpOnKill = 10,
    showNotificationOnKill = true
}

Config.configByPedType[PED_TYPES.PROSTITUTE] = {
    moneyOnKill = 50,
    xpOnKill = 10,
    showNotificationOnKill = true
}

Config.configByPedType[PED_TYPES.COP] = {
    moneyOnKill = 100,
    xpOnKill = 100,
    showNotificationOnKill = true
}

Config.configByPedType[PED_TYPES.SWAT] = {
    moneyOnKill = 200,
    xpOnKill = 200,
    showNotificationOnKill = true
}

Config.configByPedType[PED_TYPES.ARMY] = {
    moneyOnKill = 1000,
    xpOnKill = 1000,
    showNotificationOnKill = true
}

Config.configByPedType[PED_TYPES.ANIMAL] = {
    moneyOnKill = -500,
    xpOnKill = 0,
    showNotificationOnKill = true
}


Config.configByVehicleModel = {}

local policeVehicleConfig = {
    moneyOnKill = 1000,
    xpOnKill = 1000,
    showNotificationOnKill = true
}
Config.configByVehicleModel[VEHICLE_MODELS.POLICE] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.POLICE2] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.POLICE3] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.POLICE4] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.POLICE_OLD1] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.POLICE_OLD2] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.POLICE_VAN] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.POLICE_BIKE] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.PARK_RANGER] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.SHERIFF] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.SHERIFF2] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.FBI] = policeVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.FBI2] = policeVehicleConfig

local policeHelicopterConfig = {
    moneyOnKill = 2500,
    xpOnKill = 2500,
    showNotificationOnKill = true
}
Config.configByVehicleModel[VEHICLE_MODELS.POLICE_HELICOPTER] = policeHelicopterConfig

local militaryVehicleConfig = {
    moneyOnKill = 5000,
    xpOnKill = 5000,
    showNotificationOnKill = true
}
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_APC] = militaryVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_BARRACKS] = militaryVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_BARRACKS2] = militaryVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_BARRACKS3] = militaryVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_CRUSADER] = militaryVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_HALFTRACK] = militaryVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_RHINO] = militaryVehicleConfig
Config.configByVehicleModel[VEHICLE_MODELS.MILITARY_TRAILERSMALL2] = militaryVehicleConfig
