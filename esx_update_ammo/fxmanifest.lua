fx_version 'adamant'

game 'gta5'

author 'Rodrigo de Bona Sartor - https://github.com/goblinbr'
description 'Update player ammo on server even if it was gotten from NPCs'
lua54 'yes'
version '0.0.1'

shared_script '@es_extended/imports.lua'

server_scripts {
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    '@es_extended/config.weapons.lua',
    'client/main.lua'
}

dependencies {
    'es_extended'
}
