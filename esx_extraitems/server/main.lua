-- Clean Kit
ESX.RegisterUsableItem('cleankit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:cleankit', source)
end)

RegisterNetEvent('esx_extraitems:removecleankit')
AddEventHandler('esx_extraitems:removecleankit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.CleanKit then
		xPlayer.removeInventoryItem('cleankit', 1)
		xPlayer.showNotification(_U('used_cleankit'))
	end
end)

-- Defib
ESX.RegisterUsableItem('defib', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:defib', source)
end)

RegisterNetEvent('esx_extraitems:removedefib')
AddEventHandler('esx_extraitems:removedefib', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.Defib then
		xPlayer.removeInventoryItem('defib', 1)
		xPlayer.showNotification(_U('used_defib'))
	end
end)

-- First Aid Kit
ESX.RegisterUsableItem('firstaidkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:firstaidkit', source)
end)

RegisterNetEvent('esx_extraitems:removefirstaidkit')
AddEventHandler('esx_extraitems:removefirstaidkit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.FirstAidKit then
		xPlayer.removeInventoryItem('firstaidkit', 1)
		xPlayer.showNotification(_U('used_firstaidkit'))
	end
end)

-- Repair Kit
ESX.RegisterUsableItem('repairkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:repairkit', source)
end)

RegisterNetEvent('esx_extraitems:removerepairkit')
AddEventHandler('esx_extraitems:removerepairkit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.RepairKit then
		xPlayer.removeInventoryItem('repairkit', 1)
		xPlayer.showNotification(_U('used_repairkit'))
	end
end)

-- Tire Kit
ESX.RegisterUsableItem('tirekit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:tirekit', source)
end)

RegisterNetEvent('esx_extraitems:removetirekit')
AddEventHandler('esx_extraitems:removetirekit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.Removeables.TireKit then
		xPlayer.removeInventoryItem('tirekit', 1)
		xPlayer.showNotification(_U('used_tirekit'))
	end
end)

-- Start of Ammo Boxes
ESX.RegisterUsableItem('boxpistol', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxpistol')
end)

ESX.RegisterUsableItem('boxsmg', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxsmg')
end)

ESX.RegisterUsableItem('boxshot', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxshot')
end)

ESX.RegisterUsableItem('boxrifle', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxrifle')
end)

ESX.RegisterUsableItem('boxmg', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxmg')
end)

ESX.RegisterUsableItem('boxsniper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxsniper')
end)

ESX.RegisterUsableItem('boxbig', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxbig')
end)

ESX.RegisterUsableItem('boxsmall', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_extraitems:checkammo', source, 'boxsmall')
end)

RegisterNetEvent('esx_extraitems:removebox')
AddEventHandler('esx_extraitems:removebox', function(hash, ammo, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local weaponName = ESX.GetWeaponFromHash(hash)

	if type == 'boxpistol' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxpistol', 1)
			xPlayer.showNotification(_U('used_boxpistol'))
		end
	elseif type == 'boxsmg' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxsmg', 1)
			xPlayer.showNotification(_U('used_boxsmg'))
		end
	elseif type == 'boxshot' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxshot', 1)
			xPlayer.showNotification(_U('used_boxshot'))
		end
	elseif type == 'boxrifle' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxrifle', 1)
			xPlayer.showNotification(_U('used_boxrifle'))
		end
	elseif type == 'boxmg' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxmg', 1)
			xPlayer.showNotification(_U('used_boxmg'))
		end
	elseif type == 'boxsniper' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxsniper', 1)
			xPlayer.showNotification(_U('used_boxsniper'))
		end
	elseif type == 'boxbig' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxbig', 1)
			xPlayer.showNotification(_U('used_boxbig'))
		end
	elseif type == 'boxsmall' then
		xPlayer.addWeaponAmmo(weaponName.name, ammo)

		if Config.Removeables.AmmoBoxes then
			xPlayer.removeInventoryItem('boxsmall', 1)
			xPlayer.showNotification(_U('used_boxsmall'))
		end
	end
end)
-- End of Ammo Boxes

-- Check if Player has Item
ESX.RegisterServerCallback('esx_extraitems:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	cb(qtty)
end)

function getItemAmount(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	return qtty
end
