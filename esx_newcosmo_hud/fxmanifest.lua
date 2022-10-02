fx_version 'cerulean'
description 'cosmo_hud for fivem, uses library from loading.io'
ui_page 'html/ui.html'
author 'CosmoKramer'
game 'gta5'

files {
    'html/ui.html',
    'html/script.js',
    'html/style.css',
    'html/loading-bar.js',
}

client_scripts {
    '@esx_npc_kill/public/main.lua',
    'config.lua',
    'client.lua'
}
