local ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('Fivem_RPC:server:GetcurrentPlayers', function(_,cb)
    local xPlayers = ESX.GetExtendedPlayers()
    cb(#xPlayers)
end)
