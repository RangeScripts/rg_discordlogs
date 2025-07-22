
local _name = load("return '\\114\\103\\95\\100\\105\\115\\99\\111\\114\\100\\108\\111\\103\\115'")()

if GetCurrentResourceName() ~= _name then return end

local function sendToDiscord(title, message, color)
    if type(message) == 'table' then
        message = table.concat(message, '\n')
    end

    
    if not Discord.webhook or Discord.webhook == '' then return end

  
    local colorValue = color
    if type(color) == 'string' then
        colorValue = Colors[color] or Colors['White']
    end

    local embed = {
        {
            ["title"] = title,
            ["description"] = message,
            ["color"] = colorValue or Colors['White'],
            ["footer"] = {
                ["text"] = Discord.footer,
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(Discord.webhook, function() end, 'POST', json.encode({
        username = Discord.name,
        avatar_url = Discord.avatar,
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end


exports('createLogs', function(title, message, color)
    sendToDiscord(title, message, color)
end)


-- exports.rg_discordlogs:createLogs('Připojení', 'Hráč se připojil na server', 'Green')
-- exports.rg_discordlogs:createLogs('Odpojení', 'Hráč se odpojil ze serveru', 'Red')
-- exports.rg_discordlogs:createLogs('Varování', 'Detekován pokus o cheat!', 'Yellow')
