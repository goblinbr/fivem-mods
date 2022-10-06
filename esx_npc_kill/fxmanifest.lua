fx_version 'adamant'

game 'gta5'

author 'Rodrigo de Bona Sartor - https://github.com/goblinbr'
description 'Give money on NPC kill'
lua54 'yes'
version '1.0.0'

shared_script '@es_extended/imports.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'public/ped_types.lua',
    'public/vehicle_models.lua',
    'locales/*.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'public/ped_types.lua',
    'public/vehicle_models.lua',
    'locales/*.lua',
    'config.lua',
    'public/main.lua',
    'client/main.lua'
}

dependencies {
    'es_extended',
    'esx_addonaccount'
}
