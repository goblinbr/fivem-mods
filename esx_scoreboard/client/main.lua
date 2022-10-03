local menuIsShowed = false

local openScoreboard = function()
    local playerStatus = {}
    TriggerEvent('esx_status:getStatus', 'kills', function(status) table.insert(playerStatus, status) end)
    TriggerEvent('esx_status:getStatus', 'deaths', function(status) table.insert(playerStatus, status) end)
    TriggerEvent('esx_status:getStatus', 'level', function(status) table.insert(playerStatus, status) end)

    ESX.TriggerServerCallback('esx_scoreboard:getPlayersStatus', function(players)
        SendNUIMessage({
            showMenu = true,
            players = players
        })
        menuIsShowed = true
        SetNuiFocus(true,true)
    end, playerStatus)
end

local closeScoreboard = function()
    SendNUIMessage({
        showMenu = false
    })
    menuIsShowed = false
    SetNuiFocus(false,false)
end

RegisterNUICallback('close', function()
    closeScoreboard()
end)

ESX.RegisterInput("esx_scoreboard:toggleScoreboard", "Toggle Scoreboard", "keyboard", "F6", function()
    if menuIsShowed then
        closeScoreboard()
    else
        openScoreboard()
    end
end)