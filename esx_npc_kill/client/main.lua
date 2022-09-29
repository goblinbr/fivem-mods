local BUILD = GetGameBuildNumber()
local idxFatalDamage = 4
if BUILD >= 2189 then
    idxFatalDamage = 6
else
    if BUILD >= 2060 then
        idxFatalDamage = 5
    end
end

AddEventHandler('gameEventTriggered',function(name,args)
    if name == 'CEventNetworkEntityDamage' then
        local victimId = args[1]
        local attackerId = args[2]
        local isFatalDamage = args[idxFatalDamage]

        if isFatalDamage == 1 then
            local pedId = PlayerPedId()
            local pedVehicleId = GetVehiclePedIsIn(pedId)
            if attackerId == pedId or attackerId == pedVehicleId then
                local npcKilledData = {
                    victimId = victimId,
                    victimPedType = GetPedType(victimId),
                    attackerId = attackerId,
                    pedId = pedId,
                    pedVehicleId = pedVehicleId
                }
                TriggerServerEvent("esx_kill_npc:npcKilled", npcKilledData)
            end
        end
    end
end)
