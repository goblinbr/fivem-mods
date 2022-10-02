Config = {}

Config.Locale = 'en'

Config.moneyOnKill = 10
Config.xpOnKill = 10
Config.showNotificationOnKill = true
Config.staminaRegenByLevel = 0.0052
Config.healthBylevel = 5
Config.xpLostOnDeathBylevel = 500

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
