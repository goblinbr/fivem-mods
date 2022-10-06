local MAX_VICTIM_IDS = 100
local victimIdsKilled = {}
for i=1, MAX_VICTIM_IDS do
    victimIdsKilled[i] = 0
end
local victimIdIndex = 0

RegisterServerEvent('esx_kill_npc:npcKilled')
AddEventHandler('esx_kill_npc:npcKilled', function(npcKilledData)
    if source == nil then
        return
    end
    if npcKilledData == nil then
        return
    end

    for k,vid in pairs(victimIdsKilled) do 
        if vid == npcKilledData.victimId then
            print('ignoring repeated victim id',vid)
            return
        end
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        victimIdIndex = victimIdIndex + 1
        if victimIdIndex > MAX_VICTIM_IDS then
            victimIdIndex = 1
        end
        victimIdsKilled[victimIdIndex] = npcKilledData.victimId

        local money = Config.moneyOnKill
        local xpOnKill = Config.xpOnKill
        local showNotification = Config.showNotificationOnKill
        if npcKilledData.victimVehicleModel then
            money = Config.moneyOnKillVehicle
            xpOnKill = Config.xpOnKillVehicle

            local configVehicleModel = Config.configByVehicleModel[npcKilledData.victimVehicleModel]
            if configVehicleModel then
                money = configVehicleModel.moneyOnKill
                showNotification = configVehicleModel.showNotificationOnKill
                xpOnKill = configVehicleModel.xpOnKill
            end
        else
            local configPedType = Config.configByPedType[npcKilledData.victimPedType]
            if configPedType then
                money = configPedType.moneyOnKill
                showNotification = configPedType.showNotificationOnKill
                xpOnKill = configPedType.xpOnKill
            end
        end
        if money ~= 0 then
            if money > 0 then
                xPlayer.addMoney(money, 'NPC KILL')
            else
                xPlayer.removeMoney(money * -1, 'NPC KILL')
            end

            if showNotification then
                local msgKey = 'notification_after_kill_' .. npcKilledData.victimPedType
                if npcKilledData.victimVehicleModel then
                    msgKey = 'notification_after_kill_vehicle_' .. npcKilledData.victimVehicleModel
                    if Locales[Config.Locale][msgKey] == nil then
                        msgKey = 'notification_after_kill_vehicle'
                    end
                end
                if Locales[Config.Locale][msgKey] == nil then
                    msgKey = 'notification_after_kill'
                end
                xPlayer.showNotification(_U(msgKey, ESX.Math.GroupDigits(money)))
            end
        end
        if xpOnKill > 0 then
            TriggerClientEvent('esx_status:add', source, 'xp', xpOnKill)
        end
        TriggerClientEvent('esx_status:add', source, 'kills', 1)
    end
end)

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    xPlayer.setMoney(0)
end)

RegisterServerEvent('esx_kill_npc:saveStatus')
AddEventHandler('esx_kill_npc:saveStatus', function()
    if source == nil then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local status = ESX.Players[xPlayer.source]

    MySQL.update('UPDATE users SET status = ? WHERE identifier = ?', { json.encode(status), xPlayer.identifier })
    ESX.Players[xPlayer.source] = nil
end)