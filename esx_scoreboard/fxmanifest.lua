fx_version 'cerulean'
description 'scoreboard mod to show players kills/deaths'
ui_page 'html/ui.html'
author 'Rodrigo de Bona Sartor - https://github.com/goblinbr'
game 'gta5'

shared_script '@es_extended/imports.lua'

files {
    'html/ui.html',
    'html/script.js',
    'html/style.css'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/main.lua'
}