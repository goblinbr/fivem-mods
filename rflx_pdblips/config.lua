Config = {}

Config.selfBlip = true -- use classic arrow or job specified blip?
Config.useRflxMulti = false -- server specific init
Config.useBaseEvents = false -- F for optimisation
Config.prints = false -- server side prints (on/off duty)

-- looks
Config.font = {
    useCustom = false, -- use custom font? Has to be specified below, also can be buggy with player tags
    name = 'Russo One', -- > this being inserted into <font face='nameComesHere'> eg. (<font face='Russo One'>) --> Your font has to be streamed and initialized on ur server
}
Config.notifications = {
    enable = false,
    useMythic = true,
    onDutyText = 'Přišel/a jste do služby', -- pretty straight foward
    offDutyText = 'Odešel/a jste ze služby', -- pretty straight foward
}
Config.blipGroup = {
    renameGroup = true,
    groupName = '~b~Players'
}

-- blips
Config.bigmapTags = false -- Playername tags when bigmap enabled?
Config.blipCone = false -- use that wierd FOV indicators thing?

Config.useCharacterName = true -- use IC name or OOC name, chose your warrior
Config.usePrefix = false
Config.namePrefix = { -- global name prefixes by grade_name 
    recruit = 'CAD.',
    officer = 'P/O-1.',
    officer2 = 'P/O-2.',
    officer3 = 'P/O-3.',
    sergeant = 'SGT-1.',
    sergeant2 = 'SGT-2.',
    lieutenant = 'LTN.',
    captain = 'CAPT.',
    commander = 'COM.',
    deputy = 'DPT.',
    aschief = 'AS-CHF.',
    boss = 'CHF.',

    deputy1 = 'DPT-1.',
    deputy2 = 'DPT-2.',
    assheriff = 'AS-SHRF.',
    undersheriff = 'UNSHRF.',
    boss_shrf = 'SHRF-COP.',
}

Config.emergencyJobs = {
    ['unemployed'] = {
        ignoreDuty = true,
        blip = {
            sprite = 480,
            color = 46,
        },
        vehBlip = {
            ['default'] = {
                sprite = 56,
                color = 46,
            }
        },
        canSee = {
            ['unemployed'] = true,
        }
    }
}