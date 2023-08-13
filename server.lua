--[[


██████╗ ██████╗  █████╗ ██╗   ██╗ █████╗ ███╗   ██╗
╚════██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗████╗  ██║
 █████╔╝██████╔╝███████║ ╚████╔╝ ███████║██╔██╗ ██║
██╔═══╝ ██╔══██╗██╔══██║  ╚██╔╝  ██╔══██║██║╚██╗██║
███████╗██║  ██║██║  ██║   ██║   ██║  ██║██║ ╚████║
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝
                                                
------------- Dont Sale This Script -------------
----------------- Made By 2Rayan --------------
-- https://discord.gg/bTpHJ58MrP
-- الله لا يوفقك اذا راح تبيعه
]]--


local QBCore = exports[Config.Core]:GetCoreObject()


function SavePlayer(src)
    local config = LoadResourceFile(GetCurrentResourceName(), "player.json")
    local cfg = json.decode(config)
    if type(cfg) == "table" then
        local Player = QBCore.Functions.GetPlayer(src);
        local citizenidu = Player.PlayerData.citizenid;
        local PlayerData = {};
        if citizenidu ~= nil and citizenidu ~= "nil" and citizenidu ~= "" then
            PlayerData['citizenid'] = tostring(citizenidu);
        end
        cfg[tostring(GetPlayerName(src))] = PlayerData;
        SaveResourceFile(GetCurrentResourceName(), "player.json", json.encode(cfg, { indent = true }), -1)
    end
end

function isInData(src)
    local config = LoadResourceFile(GetCurrentResourceName(), "player.json")
    local cfg = json.decode(config)
    if type(cfg) == "table" then
        local Player = QBCore.Functions.GetPlayer(src);
        local citizenidu = Player.PlayerData.citizenid;
        for k, v in pairs(cfg) do
            local reason = v['reason']
            local citizenid = v['citizenid'];
            if tostring(citizenid) == tostring(citizenidu) then return { ['reason'] = reason } end
        end
        return false;
    end
end


RegisterNetEvent('get3edeh', function()
    local src = source
    if not isInData(src) then
        local Player = QBCore.Functions.GetPlayer(src);
    
        Player.Functions.AddMoney(Config.moneytype, Config.Money, "عيدية")
    
        SavePlayer(src)    
        TriggerClientEvent('QBCore:Notify', source, Config.M1, 'info')
    else
        TriggerClientEvent('QBCore:Notify', source, Config.M2, 'error')
    end
end)

print('script by 2rayan -_-')