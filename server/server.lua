local ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('SY_Rpc:server:GetcurrentPlayers', function(_,cb)
    local xPlayers = ESX.GetExtendedPlayers()
    cb(#xPlayers)
end)
