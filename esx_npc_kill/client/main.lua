local ENTITY_TYPE_PED = 1

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

        local victimEntityType = GetEntityType(victimId)
        local victimVehicleModel
        if victimEntityType ~= ENTITY_TYPE_PED then
            victimVehicleModel = GetEntityModel(victimId)
        end

        if isFatalDamage == 1 then
            local pedId = PlayerPedId()
            local pedVehicleId = GetVehiclePedIsIn(pedId)
            if attackerId == pedId or attackerId == pedVehicleId then
                local npcKilledData = {
                    victimId = victimId,
                    victimPedType = GetPedType(victimId),
                    victimEntityType = victimEntityType,
                    victimVehicleModel = victimVehicleModel,
                    attackerId = attackerId,
                    pedId = pedId,
                    pedVehicleId = pedVehicleId
                }
                TriggerServerEvent("esx_kill_npc:npcKilled", npcKilledData)
            end
        end
    end
end)

local level = 1
local xp = 0

AddEventHandler('esx:onPlayerDeath', function()
    local xpLost = Config.xpLostOnDeathBylevel * level
    if xpLost > xp then
        xpLost = xp
    end
    if xpLost > 0 then
        TriggerEvent('esx_status:remove', 'xp', xpLost)
        TriggerEvent('chatMessage', "", {255, 0, 0}, _U('xp_lost_on_death', xpLost))
    end
    TriggerEvent('esx_status:add', 'deaths', 1)
end)

AddEventHandler('esx_status:loaded', function(status)
    TriggerEvent('esx_status:registerStatus', 'level', 1, '#000', function(status)
        return true
    end, function(status)
        if status.val > level then
            level = status.val

            local playerId = PlayerId()
            local playerPedId = PlayerPedId()
            local maxHealth = 200 + Config.healthBylevel * (level - 1)
            local maxArmour = 100 + Config.armourBylevel * (level - 1)
            SetPedMaxHealth(playerPedId, maxHealth)
            SetEntityHealth(playerPedId, maxHealth)
            SetPlayerMaxArmour(playerId, maxArmour)

            local skillQty = level * Config.skillByLevel
            StatSetInt(`MP0_SHOOTING_ABILITY`, skillQty, true)
            StatSetInt(`MP0_STEALTH_ABILITY`, skillQty, true)
            StatSetInt(`MP0_FLYING_ABILITY`, skillQty, true)
            StatSetInt(`MP0_WHEELIE_ABILITY`, skillQty, true)
            StatSetInt(`MP0_LUNG_CAPACITY`, skillQty, true)
            StatSetInt(`MP0_STRENGTH`, skillQty, true)
            StatSetInt(`MP0_STAMINA`, skillQty, true)
        end
    end)

    TriggerEvent('esx_status:registerStatus', 'xp', 0, '#7F8EFF', function(status)
        return true
    end, function(status)
        xp = status.val

        local requiredXp = GetRequiredXpToLevelUp(level)
        if status.val >= GetRequiredXpToLevelUp(level) then
            TriggerEvent('esx_status:remove', 'xp', requiredXp)
            TriggerEvent('esx_status:add', 'level', 1)
            TriggerServerEvent("esx_kill_npc:saveStatus")

            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            ESX.ShowNotification(_U('level_up', level + 1))
        end
    end)

    TriggerEvent('esx_status:registerStatus', 'kills', 0, '#000', function(status)
        return true
    end, function(status)
    end)

    TriggerEvent('esx_status:registerStatus', 'deaths', 0, '#000', function(status)
        return true
    end, function(status)
    end)

end)
