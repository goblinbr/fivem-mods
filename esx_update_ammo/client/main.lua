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
                        ammo = currentAmmo
                    }
                else
                    weapons[weaponConfig.name] = {
                        ammo = 0
                    }
                end
            end
        end

        while ESX.PlayerLoaded do
            playerPed = ESX.PlayerData.ped
            for k, weaponConfig in ipairs(Config.Weapons) do
                if weaponConfig.ammo then
                    local weapon = weapons[weaponConfig.name]
                    local weaponHash = joaat(weaponConfig.name)
                    if HasPedGotWeapon(playerPed, weaponHash, false) then
                        local currentAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
                        if weapon.ammo ~= currentAmmo then
                            weapon.ammo = currentAmmo
                            TriggerServerEvent('esx_update_ammo:updateWeaponAmmo', weaponConfig.name, currentAmmo)
                        end
                    else
                        weapon.ammo = 0
                    end
                end
            end
            Wait(1000)
        end
    end)
end

StartServerAmmoSyncLoops()