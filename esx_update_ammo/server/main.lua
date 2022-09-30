RegisterNetEvent('esx_update_ammo:updateWeaponAmmo')
AddEventHandler('esx_update_ammo:updateWeaponAmmo', function(weaponName, currentAmmo)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local numWeapon, weapon = xPlayer.getWeapon(weaponName)
		if weapon then
            if weapon.ammo < currentAmmo then
                local ammoToAdd = currentAmmo - weapon.ammo
                xPlayer.addWeaponAmmo(weaponName, ammoToAdd)
            elseif weapon.ammo > currentAmmo then
                xPlayer.updateWeaponAmmo(weaponName, currentAmmo)
            end
        end
    end
end)


RegisterNetEvent('esx_update_ammo:removeWeapon')
AddEventHandler('esx_update_ammo:removeWeapon', function(weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.removeWeapon(weaponName)
    end
end)
