AddEventHandler('esx:onPlayerSpawn', function(spawn, a, b, c, d, e)
    local vehicleModel = Config.vehicleModel;

    if not IsModelInCdimage(vehicleModel) or not IsModelAVehicle(vehicleModel) then
        print('[^1ERROR^7] model not found ' .. vehicleModel)
        return
    end

    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do
        Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local vehicle = CreateVehicle(vehicleModel, pos.x + 1, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleModel)

end)
