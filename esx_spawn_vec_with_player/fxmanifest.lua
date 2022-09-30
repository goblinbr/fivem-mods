fx_version 'adamant'

game 'gta5'

author 'Rodrigo de Bona Sartor - https://github.com/goblinbr'
description 'Spawn a vehicle with the player'
lua54 'yes'
version '0.0.1'

shared_script '@es_extended/imports.lua'

client_scripts {
    'config.lua',
    'client/main.lua'
}

dependencies {
    'es_extended'
}
