local waitingLoadoutAdd = false
AddEventHandler('esx:onPlayerSpawn', function(spawn)
	waitingLoadoutAdd = true
    Wait(3000)
	waitingLoadoutAdd = false
end)

function StartServerAmmoSyncLoops()
    CreateThread(function()
        while not ESX.PlayerLoaded or not ESX.PlayerData.ped do
            Wait(500)
        end

        local weapons = {}

        local playerPed = ESX.PlayerData.ped
        for k, weaponConfig in ipairs(Config.Weapons) do
            if weaponConfig.ammo then
                local weaponHash = joaat(weaponConfig.name)
                if HasPedGotWeapon(playerPed, weaponHash, false) then
                    local currentAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
                    weapons[weaponConfig.name] = {
                        ammo = currentAmmo,
                        removed = false
                    }
                else
                    weapons[weaponConfig.name] = {
                        ammo = 0,
                        removed = true
                    }
                end
            end
        end

        while ESX.PlayerLoaded do
            playerPed = ESX.PlayerData.ped
            if playerPed then
                for k, weaponConfig in ipairs(Config.Weapons) do
                    if weaponConfig.ammo and not waitingLoadoutAdd then
                        local weapon = weapons[weaponConfig.name]
                        local weaponHash = joaat(weaponConfig.name)
                        if HasPedGotWeapon(playerPed, weaponHash, false) then
                            local currentAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
                            if weapon.ammo ~= currentAmmo then
                                weapon.ammo = currentAmmo
                                weapon.removed = false
                                TriggerServerEvent('esx_update_ammo:updateWeaponAmmo', weaponConfig.name, currentAmmo)
                            end
                        elseif not weapon.removed then
                            weapon.ammo = 0
                            weapon.removed = true
                            TriggerServerEvent('esx_update_ammo:removeWeapon', weaponConfig.name)
                        end
                    end
                end
            end
            Wait(1000)
        end
    end)
end

StartServerAmmoSyncLoops()