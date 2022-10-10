local function getPrice(weaponCat, weaponName, zone)
    local zone = Config.Zones[zone]
    if not zone then
        print('zone not found for', zone)
    end
    local weapons = zone[weaponCat]
    if not weapons then
        print('weapons not found for', zone, weaponCat)
    end
    local weapon = nil
    for _,v in pairs(weapons) do
        if v.name == weaponName then
            weapon = v
            break
        end
    end
    if weapon then
        return weapon.price
    else
        return 0
    end
end

ESX.RegisterServerCallback('esx_advancedweaponshop:getAvailableAmmo', function(source, cb, ammoArray)
    local xPlayer = ESX.GetPlayerFromId(source)
    local availableAmmoArray = {}
    for _, ammo in ipairs(ammoArray) do
        local playerHasWeaponWithSameAmmoType = false
        for _, weaponConfig in ipairs(Config.Weapons) do
            if xPlayer.hasWeapon(weaponConfig.name) and weaponConfig.ammo and weaponConfig.ammo.hash == ammo.item.hash then
                playerHasWeaponWithSameAmmoType = true
                break
            end
        end
        if playerHasWeaponWithSameAmmoType then
            table.insert(availableAmmoArray, ammo)
        end
    end
    cb(availableAmmoArray)
end)

ESX.RegisterServerCallback('esx_advancedweaponshop:getAvailableWeaponsUpgrades', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local weaponsUpgrades = {}
    local upgradesConfig = Config.Zones.LegalShop.Upgrade
    for _, weaponConfig in ipairs(Config.Weapons) do
        if weaponConfig.components and #weaponConfig.components > 0 and xPlayer.hasWeapon(weaponConfig.name) then
            local weapon = { name = weaponConfig.name, label = weaponConfig.label, availableComponents = {} }
            for _, component in ipairs(weaponConfig.components) do
                local upgradeConfig
                for _, upgrade in ipairs(upgradesConfig) do
                    if upgrade.name == component.name then
                        upgradeConfig = upgrade
                        break
                    end
                end

                if upgradeConfig then
                    local hasComp = xPlayer.hasWeaponComponent(weaponConfig.name, component.name)
                    if not hasComp then
                        local comp = {}
                        for k, v in pairs(component) do
                            comp[k] = v
                        end
                        for k, v in pairs(upgradeConfig) do
                            comp[k] = v
                        end
                        table.insert(weapon.availableComponents, comp)
                    end
                end
            end
            if #weapon.availableComponents > 0 then
                table.insert(weaponsUpgrades, weapon)
            end
        end
    end

    cb(weaponsUpgrades)
end)

-- Buy Weapon
ESX.RegisterServerCallback('esx_advancedweaponshop:buyWeapon', function(source, cb, zone, current)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 0
    if current.ammo and current.refill then
        price = current.price
    else
        price = getPrice(current.weaponCat, current.componentName or current.weaponName, zone)
    end

    if price == 0 then
        print(('esx_advancedweaponshop: %s Attempted to buy a UNKNOWN Weapon!'):format(xPlayer.identifier))
        cb(false)
    else
        if zone == 'LegalShop' then
            if xPlayer.getMoney() < price then
                xPlayer.showNotification(_U('not_enough'))
                cb(false)
                return
            end
        else
            if xPlayer.getAccount('black_money').money < price then
                xPlayer.showNotification(_U('not_enough_black'))
                cb(false)
                return
            end
        end

        if current.ammo then
            local bought = false
            if current.refill then
                for _, ammoRefill in ipairs(current.refill) do
                    for _, weaponConfig in ipairs(Config.Weapons) do
                        if weaponConfig.ammo and weaponConfig.ammo.hash == ammoRefill.item.hash and xPlayer.hasWeapon(weaponConfig.name) then
                            if not bought then
                                xPlayer.removeMoney(price)
                                bought = true
                            end
                            xPlayer.addWeaponAmmo(weaponConfig.name, ammoRefill.ammoToComplete)
                        end
                    end
                end
            else
                for k, weaponConfig in ipairs(Config.Weapons) do
                    if weaponConfig.ammo and weaponConfig.ammo.hash == current.hash and xPlayer.hasWeapon(weaponConfig.name) then
                        if not bought then
                            xPlayer.removeMoney(price)
                            bought = true
                        end
                        xPlayer.addWeaponAmmo(weaponConfig.name, current.quantity or 1)
                    end
                end
            end


            if bought then
                cb(true, true)
            else
                xPlayer.showNotification(_U('no_weapon_for_ammo'))
                cb(false)
            end
        elseif current.componentName then
            xPlayer.removeMoney(price)
            xPlayer.addWeaponComponent(current.weaponName, current.componentName)
            cb(true, false)
        elseif current.weaponName == 'BODY_ARMOR' then
            xPlayer.removeMoney(price)
            SetPedArmour(GetPlayerPed(source), GetPlayerMaxArmour(source))

            cb(true, false)
        elseif xPlayer.hasWeapon(current.weaponName) then
            if current.weaponCat == 'Throw' then
                xPlayer.removeMoney(price)
                xPlayer.addWeaponAmmo(current.weaponName, current.quantity or 1)

                cb(true, false)
            else
                xPlayer.showNotification(_U('already_owned'))
                cb(false)
            end
        else
            if zone == 'LegalShop' then
                xPlayer.removeMoney(price)
                xPlayer.addWeapon(current.weaponName, current.quantity or 50)

                cb(true, false)
            else
                xPlayer.removeAccountMoney('black_money', price)
                xPlayer.addWeapon(current.weaponName, current.quantity or 50)

                cb(true, false)
            end
        end
    end
end)
