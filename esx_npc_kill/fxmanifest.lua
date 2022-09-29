fx_version 'adamant'

game 'gta5'

author 'Rodrigo de Bona Sartor - https://github.com/goblinbr'
description 'Give money on NPC kill'
lua54 'yes'
version '0.0.1'

shared_script '@es_extended/imports.lua'

server_scripts {
    '@es_extended/locale.lua',
    'ped_types.lua',
    'locales/*.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'ped_types.lua',
    'locales/*.lua',
    'config.lua',
    'client/main.lua'
}

dependencies {
    'es_extended',
    'esx_addonaccount'
}
