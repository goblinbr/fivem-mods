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
ESX.RegisterServerCallback('esx_advancedweaponshop:buyWeapon', function(source, cb, weaponCat, weaponName, zone, quantity, ammo, hash, componentName)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = getPrice(weaponCat, componentName or weaponName, zone)

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

        if ammo then
            local bought = false
            for k, weaponConfig in ipairs(Config.Weapons) do
                if weaponConfig.ammo and weaponConfig.ammo.hash == hash and xPlayer.hasWeapon(weaponConfig.name) then
                    if not bought then
                        xPlayer.removeMoney(price)
                        bought = true
                    end
                    xPlayer.addWeaponAmmo(weaponConfig.name, quantity or 1)
                end
            end
            if bought then
                cb(true, true)
            else
                xPlayer.showNotification(_U('no_weapon_for_ammo'))
                cb(false)
            end
        elseif componentName then
            xPlayer.removeMoney(price)
            xPlayer.addWeaponComponent(weaponName, componentName)
            cb(true, false)
        elseif weaponName == 'BODY_ARMOR' then
            xPlayer.removeMoney(price)
            SetPedArmour(GetPlayerPed(source), GetPlayerMaxArmour(source))

            cb(true, false)
        elseif xPlayer.hasWeapon(weaponName) then
            if weaponCat == 'Throw' then
                xPlayer.removeMoney(price)
                xPlayer.addWeaponAmmo(weaponName, quantity or 1)

                cb(true, false)
            else
                xPlayer.showNotification(_U('already_owned'))
                cb(false)
            end
        else
            if zone == 'LegalShop' then
                xPlayer.removeMoney(price)
                xPlayer.addWeapon(weaponName, quantity or 50)

                cb(true, false)
            else
                xPlayer.removeAccountMoney('black_money', price)
                xPlayer.addWeapon(weaponName, quantity or 50)

                cb(true, false)
            end
        end
    end
end)
