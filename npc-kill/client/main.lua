local BUILD = GetGameBuildNumber()

AddEventHandler('gameEventTriggered',function(name,args)
    if name == 'CEventNetworkEntityDamage' then
        local victimId = args[1]
        local attackerId = args[2]
        local isFatalDamage = args[4]

        if BUILD >= 2189 then
            isFatalDamage = args[6]
        else
            if BUILD >= 2060 then
                isFatalDamage = args[5]
            end
        end

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
    else
        print('CLIENT game event ' .. name .. ' (' .. json.encode(args) .. ')')
    end
end)
