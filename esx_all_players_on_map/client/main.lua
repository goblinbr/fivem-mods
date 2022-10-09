local activeBlips = {}

local function setupBlip(blip, playerName, isInVehicle)
    local config = Config.pedBlip
    if isInVehicle then
        config = Config.vehBlip
    end

    SetBlipSprite(blip, config.sprite)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, config.scale or 1.0)
    SetBlipColour(blip, config.color)
    SetBlipFlashes(blip, false)
    SetBlipShowCone(blip, Config.blipCone)
    SetBlipCategory(blip, 7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(playerName)
    EndTextCommandSetBlipName(blip)
end

AddEventHandler('esx:onPlayerDeath', function()
    for playerId, activeBlip in pairs(activeBlips) do
        if activeBlip then
            RemoveBlip(activeBlip.blip)
            activeBlips[playerId] = nil
        end
    end
end)

CreateThread(function()
    DisplayPlayerNameTagsOnBlips(true)

    if Config.blipGroup.renameGroup then
        AddTextEntryByHash(`BLIP_OTHPLYR`, Config.blipGroup.groupName..'~w~')
    end

    while true do
        local thisPlayerId = PlayerId()
        local players = {}
        local activePlayers = {}
        local cliPlayerIdByServerId = {}
        for _, playerId in ipairs(GetActivePlayers()) do
            if playerId ~= thisPlayerId then
                local playerServerId = tostring(GetPlayerServerId(playerId))
                players[playerServerId] = true
                cliPlayerIdByServerId[playerServerId] = playerId
            end
        end

        ESX.TriggerServerCallback('esx:getPlayerNames', function(returnedPlayers)
            for serverPlayerId, playerName in pairs(returnedPlayers) do
                local clientPlayerId = cliPlayerIdByServerId[serverPlayerId]

                local pedId = GetPlayerPed(clientPlayerId)
                if pedId then
                    activePlayers[serverPlayerId] = true

                    local activeBlip = activeBlips[serverPlayerId]
                    if not activeBlip then
                        activeBlip = {}
                        activeBlips[serverPlayerId] = activeBlip
                    end

                    local blip = activeBlip.blip
                    if not blip or activeBlip.pedId ~= pedId then
                        if blip then
                            RemoveBlip(activeBlip.blip)
                        end

                        blip = AddBlipForEntity(pedId)
                        activeBlip.blip = blip
                        activeBlip.playerName = playerName
                        activeBlip.isInVehicle = false
                        activeBlip.pedId = pedId
                        setupBlip(blip, playerName, false)
                    end

                    local pedVehicleId = GetVehiclePedIsIn(pedId)
                    if pedVehicleId == 0 then
                        if activeBlip.isInVehicle then
                            activeBlip.isInVehicle = false
                            setupBlip(blip, playerName, false)
                        end
                    else
                        if not activeBlip.isInVehicle then
                            activeBlip.isInVehicle = true
                            setupBlip(blip, playerName, true)
                        end
                    end
                end
            end

            for playerId, activeBlip in pairs(activeBlips) do
                if activeBlip and not activePlayers[playerId] then
                    RemoveBlip(activeBlip.blip)
                    activeBlips[playerId] = nil
                end
            end
        end, players)

        Wait(1000)
    end
end)
