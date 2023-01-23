local ESX = exports["es_extended"]:getSharedObject()
local conf = Config.Discord;

CreateThread(function()
    while true do
        SetDiscordAppId(conf.ApplicationId)
        SetDiscordRichPresenceAsset(conf.IconLarge)
        SetDiscordRichPresenceAssetText(conf.IconLargeHoverText)
        SetDiscordRichPresenceAssetSmall(conf.IconSmall)
        SetDiscordRichPresenceAssetSmallText(conf.IconSmallHoverText)
        local playerPed = PlayerPedId()
		    local coords = GetEntityCoords(playerPed, true)
        local streetnamehash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local location = GetStreetNameFromHashKey(streetnamehash)
        if conf.ShowPlayerCount then
            ESX.TriggerServerCallback('Fivem_RPC:server:GetcurrentPlayers', function(result)
                SetRichPresence('Wlaking on the '..location..'\nPlayers: ' .. result .. '/' .. conf.MaxPlayers)
            end)
        end

        if conf.Buttons and type(conf.Buttons) == "table" then
            for i,v in pairs(conf.Buttons) do
                SetDiscordRichPresenceAction(i - 1,
                    v.text,
                    v.url
                )       
            end
        end

        Wait(6000)
    end
end)
