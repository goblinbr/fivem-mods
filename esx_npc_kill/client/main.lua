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

local level = 1
local xp = 0

AddEventHandler('esx:onPlayerDeath', function()
    local xpLost = Config.xpLostOnDeathBylevel * level
    if xpLost > xp then
        xpLost = xp
    end
    if xpLost > 0 then
        TriggerEvent('esx_status:remove', 'xp', xpLost)
        ESX.ShowNotification(_U('xp_lost_on_death', xpLost))
    end
    TriggerEvent('esx_status:add', 'deaths', 1)
end)

AddEventHandler('esx_status:loaded', function(status)
    TriggerEvent('esx_status:registerStatus', 'level', 1, '#000', function(status)
		return true
	end, function(status)
        if status.val > level then
            level = status.val

            local playerPedId = PlayerPedId()
            local maxHealth = 200 + Config.healthBylevel * (level - 1)
            SetPedMaxHealth(playerPedId, maxHealth)
            SetEntityHealth(playerPedId, maxHealth)
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

CreateThread(function()
    while true do
        Wait(50)

        local playerId = PlayerId()
        if playerId then
            local stamina = GetPlayerStamina(playerId)
            if stamina < 100.0 then
                stamina = stamina + Config.staminaRegenByLevel * (level - 1)
                if stamina > 100.0  then
                    stamina = 100.0
                end
                SetPlayerStamina(playerId, stamina)
            end
        end
    end
end)
