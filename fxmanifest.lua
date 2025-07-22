fx_version 'cerulean'
game 'gta5'

author 'RG Scripts'
description 'Discord Logging System'
version '1.0.0'

shared_scripts {   
    "secure_config.lua", 

}

server_scripts {
    'server/settings.webhook.lua',
    'server/discord.lua',
} 

exports {
    'createLogs'
}