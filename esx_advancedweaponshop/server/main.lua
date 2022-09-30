
-- Buy Weapon
ESX.RegisterServerCallback('esx_advancedweaponshop:buyWeapon', function(source, cb, weaponCat, weaponName, zone, quantity, ammo, hash)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPrice(weaponCat, weaponName, zone)

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

function getPrice(weaponCat, weaponName, zone)
	if weaponCat == 'Misc' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Misc) do
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
	elseif weaponCat == 'Throw' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Throw) do
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
	elseif weaponCat == 'Melee' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Melee) do
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
	elseif weaponCat == 'Handgun' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Handgun) do
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
	elseif weaponCat == 'SMG' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].SMG) do
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
	elseif weaponCat == 'Shotgun' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Shotgun) do
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
	elseif weaponCat == 'Assault' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Assault) do
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
	elseif weaponCat == 'LMG' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].LMG) do
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
	elseif weaponCat == 'Sniper' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Sniper) do
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
	elseif weaponCat == 'Heavy' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Heavy) do
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
	elseif weaponCat == 'Ammo' then
		local weapon = nil

		for k,v in pairs(Config.Zones[zone].Ammo) do
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
end
