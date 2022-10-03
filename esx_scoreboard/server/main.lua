ESX.RegisterServerCallback('esx_scoreboard:getPlayersStatus', function(source, cb, playerStatus)
    print('esx_scoreboard:getPlayersStatus')
    local players = {}

    local sourceIdentifier = ''
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        sourceIdentifier = xPlayer.getIdentifier()
    end

    local result = MySQL.query.await('SELECT identifier, firstname, lastname, status FROM users')
    for _, v in ipairs(result) do
        local online = not not ESX.GetPlayerFromIdentifier(v.identifier)
        local kills, deaths, level = 0, 0, 1
        local isLocalPlayer = false
        local status = json.decode(v.status)
        if v.identifier == sourceIdentifier then
            status = playerStatus
            isLocalPlayer = true
        end
        for i = 1, #status do
            if status[i].name == 'kills' then
                kills = status[i].val
            elseif status[i].name == 'deaths' then
                deaths = status[i].val
            elseif status[i].name == 'level' then
                level = status[i].val
            end
        end

        local player = {
            name = v.firstname .. ' ' .. v.lastname,
            level = level,
            kills = kills,
            deaths = deaths,
            online = online,
            isLocalPlayer = isLocalPlayer
        }
        table.insert(players, player)
    end

	cb(players)
end)