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
        local showNotification = Config.showNotificationOnKill
        local configPedType = Config.configByPedType[npcKilledData.victimPedType]
        if configPedType then
            money = configPedType.moneyOnKill
            showNotification = configPedType.showNotificationOnKill
        end
        if money ~= 0 then
            xPlayer.addMoney(money, 'NPC KILL')

            if showNotification then
                local msgKey = 'notification_after_kill_' .. npcKilledData.victimPedType
                if Locales[Config.Locale][msgKey] == nil then
                    msgKey = 'notification_after_kill'
                end
                xPlayer.showNotification(_U(msgKey, ESX.Math.GroupDigits(money)))
            end
        end
    end
end)