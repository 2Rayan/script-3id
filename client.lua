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

Citizen.CreateThread(function()
    model = GetHashKey(Config.Ped)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    ped = CreatePed(0, model ,Config.Location, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, Config.BotHeading )
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
end)

exports[Config.target]:AddBoxZone("3edehnpc", Config.targetloc, 1, 1, {
	name = "3edehnpc",
    heading=340,
	debugPoly = false,
    minZ=29.1,
    maxZ=31.1
}, {
	options = {
        {
            type="server",
            event = "get3edeh",
            icon = Config.icon,
            label = Config.label
        },
	},
	distance = Config.distance
})
