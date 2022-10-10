fx_version 'adamant'

game 'gta5'

author 'Rodrigo de Bona Sartor - https://github.com/goblinbr'
description 'Spawn random trains'
lua54 'yes'
version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
    'config.lua',
    'client/main.lua'
}
