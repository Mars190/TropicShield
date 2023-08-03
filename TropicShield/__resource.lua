fx_version 'adamant'
games {'gta5'}

author 'TropicShield'
description 'Anticheat of TropicLife'
lua54 'yes'

shared_scripts {
    'config/*.lua'
}

client_script {
    "client/client.lua"
}

server_script {
    "server/server.lua"
}

ui_page 'index.html'

files {
    'index.html',
    'onworddetection.js'
}

escrow_ignore {
    'config/client_config.lua',
    'config/server_config.lua',
    'config/server_webhooks.lua'
}
