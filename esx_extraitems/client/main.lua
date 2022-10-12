RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- Start of Clean Kit
local usingCleanKit = false

RegisterNetEvent('esx_extraitems:cleankit')
AddEventHandler('esx_extraitems:cleankit', function()
	local playerPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(playerPed)
	local vehicle = ESX.Game.GetVehicleInDirection()

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification(_U('error_veh'))
	else
		if DoesEntityExist(vehicle) and IsPedOnFoot(playerPed) and not usingCleanKit then
			usingCleanKit = true
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
			CreateThread(function()
				Wait(Config.Wait.CleanKit)
				WashDecalsFromVehicle(vehicle, playerPed, 1.0)
				SetVehicleDirtLevel(vehicle, 0.1)
				ClearPedTasksImmediately(playerPed)
				TriggerServerEvent('esx_extraitems:removecleankit')
				ESX.ShowNotification(_U('clean_done'))
				usingCleanKit = false
			end)
		else
			ESX.ShowNotification(_U('error_no_veh'))
		end
	end
end)
-- End of Clean Kit

-- Start of Defib
local usingDefib = false

RegisterNetEvent('esx_extraitems:defib')
AddEventHandler('esx_extraitems:defib', function(source)
	local playerPed = GetPlayerPed(-1)

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification(_U('error_veh'))
	else
		if IsPedOnFoot(playerPed) and not usingDefib then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer == -1 or closestDistance > 3.0 then
				ESX.ShowNotification(_U('error_no_ped'))
			else
				local closestPlayerPed = GetPlayerPed(closestPlayer)
				local chance = math.random(100)

				if IsPedDeadOrDying(closestPlayerPed, 1) then
					usingDefib = true
					local playerPed = PlayerPedId()
					local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
					ESX.ShowNotification(_U('revive_inprogress'))

					for i=1, 15 do
						Wait(900)

						ESX.Streaming.RequestAnimDict(lib, function()
							TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
						end)
					end

					if chance <= 50 then
						TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
						ESX.ShowNotification(_U('defib_worked'))
						usingDefib = false
					else
						ESX.ShowNotification(_U('defib_failed'))
						usingDefib = false
					end
				else
					ESX.ShowNotification(_U('player_not_unconscious'))
				end
			end
		else
			ESX.ShowNotification(_U('error_no_foot'))
		end
	end
end)
-- End of Defib

-- Start of First Aid Kit
local usingFirstAidKit = false

RegisterNetEvent('esx_extraitems:firstaidkit')
AddEventHandler('esx_extraitems:firstaidkit', function()
	local playerPed = GetPlayerPed(-1)
	local health = GetEntityHealth(playerPed)
	local maxHealth = GetEntityMaxHealth(playerPed)

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification(_U('error_veh'))
	else
		if IsPedOnFoot(playerPed) and not usingFirstAidKit then
			if health > 0 and health < maxHealth then
				usingFirstAidKit = true
				local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01'
				ESX.Streaming.RequestAnimDict(lib, function()
					TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

					Wait(500)
					while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
						Wait(0)
						DisableAllControlActions(0)
					end

					TriggerServerEvent('esx_extraitems:removefirstaidkit')
					SetEntityHealth(playerPed, maxHealth)
					usingFirstAidKit = false
				end)
			end
		else
			ESX.ShowNotification(_U('error_no_foot'))
		end
	end
end)
-- End of First Aid Kit


-- Start of Repair Kit
local usingRepairKit = false

RegisterNetEvent('esx_extraitems:repairkit')
AddEventHandler('esx_extraitems:repairkit', function()
	local playerPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(playerPed)
	local vehicle = ESX.Game.GetVehicleInDirection()

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification(_U('error_veh'))
	else
		if DoesEntityExist(vehicle) and IsPedOnFoot(playerPed) and not usingRepairKit then
			usingRepairKit = true
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
			CreateThread(function()
				Wait(Config.Wait.RepairKit)

				SetVehicleUndriveable(vehicle, false)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)

				ClearPedTasksImmediately(playerPed)
				TriggerServerEvent('esx_extraitems:removerepairkit')
				ESX.ShowNotification(_U('repair_done'))
				usingRepairKit = false
			end)
		else
			ESX.ShowNotification(_U('error_no_veh'))
		end
	end
end)
-- End of Repair Kit

-- Start of Tire Kit
local usingTireKit = false

RegisterNetEvent('esx_extraitems:tirekit')
AddEventHandler('esx_extraitems:tirekit', function()
	local playerPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(playerPed)
	local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	local closestTire = GetClosestVehicleTire(vehicle)

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification(_U('error_veh'))
	else
		if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) and not usingTireKit then
			if DoesEntityExist(vehicle) and IsPedOnFoot(playerPed) and closestTire ~= nil then
				usingTireKit = true
				TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_KNEEL', 0, true)
				CreateThread(function()
					Wait(Config.Wait.TireKit)
					SetVehicleTyreFixed(vehicle, closestTire.tireIndex)
					SetVehicleWheelHealth(vehicle, closestTire.tireIndex, 100)
					ClearPedTasksImmediately(playerPed)
					TriggerServerEvent('esx_extraitems:removetirekit')
					ESX.ShowNotification(_U('tire_done'))
					usingTireKit = false
				end)
			else
				ESX.ShowNotification(_U('error_no_tire'))
			end
		else
			ESX.ShowNotification(_U('error_no_veh'))
		end
	end
end)

function GetClosestVehicleTire(vehicle)
	local tireBones = {'wheel_lf', 'wheel_rf', 'wheel_lm1', 'wheel_rm1', 'wheel_lm2', 'wheel_rm2', 'wheel_lm3', 'wheel_rm3', 'wheel_lr', 'wheel_rr'}
	local tireIndex = {['wheel_lf'] = 0, ['wheel_rf'] = 1, ['wheel_lm1'] = 2, ['wheel_rm1'] = 3, ['wheel_lm2'] = 45,['wheel_rm2'] = 47, ['wheel_lm3'] = 46, ['wheel_rm3'] = 48, ['wheel_lr'] = 4, ['wheel_rr'] = 5}
	local playerPed = GetPlayerPed(-1)
	local playerPos = GetEntityCoords(playerPed, false)
	local minDistance = 1.0
	local closestTire = nil

	for a=1, #tireBones do
		local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tireBones[a]))
		local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, bonePos.x, bonePos.y, bonePos.z)

		if closestTire == nil then
			if distance <= minDistance then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		else
			if distance < closestTire.boneDist then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		end
	end

	return closestTire
end
-- End of Tire Kit


-- Start of Ammo Boxes
RegisterNetEvent('esx_extraitems:checkammo')
AddEventHandler('esx_extraitems:checkammo', function(type)
	local playerPed = GetPlayerPed(-1)

	if IsPedArmed(playerPed, 4) then
		if type == 'boxpistol' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.Pistol
			if isWeaponPistol(hash) then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxpistol')
			else
				ESX.ShowNotification(_U('not_suitable'))
			end
		elseif type == 'boxsmg' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.SMG
			if isWeaponSMG(hash) then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxsmg')
			else
				ESX.ShowNotification(_U('not_suitable'))
			end
		elseif type == 'boxshot' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.Shotgun
			if isWeaponShotgun(hash) then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxshot')
			else
				ESX.ShowNotification(_U('not_suitable'))
			end
		elseif type == 'boxrifle' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.Rifle
			if isWeaponRifle(hash) then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxrifle')
			else
				ESX.ShowNotification(_U('not_suitable'))
			end
		elseif type == 'boxmg' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.MG
			if isWeaponMG(hash) then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxmg')
			else
				ESX.ShowNotification(_U('not_suitable'))
			end
		elseif type == 'boxsniper' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.Sniper
			if isWeaponSniper(hash) then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxsniper')
			else
				ESX.ShowNotification(_U('not_suitable'))
			end
		elseif type == 'boxbig' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.BoxBig
			if hash ~= nil then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxbig')
			end
		elseif type == 'boxsmall' then
			hash = GetSelectedPedWeapon(playerPed)
			ammo = Config.AmmoBoxes.BoxSmall
			if hash ~= nil then
				TriggerServerEvent('esx_extraitems:removebox', hash, ammo, 'boxsmall')
			end
		end
	else
		ESX.ShowNotification(_U('no_weapon'))
	end
end)

function isWeaponPistol(model)
	for _, weaponPistol in pairs(Config.WeaponList.Pistols) do
		if model == GetHashKey(weaponPistol) then
			return true
		end
	end
	return false
end

function isWeaponSMG(model)
	for _, weaponSMG in pairs(Config.WeaponList.SMGs) do
		if model == GetHashKey(weaponSMG) then
			return true
		end
	end
	return false
end

function isWeaponShotgun(model)
	for _, weaponShotgun in pairs(Config.WeaponList.Shotguns) do
		if model == GetHashKey(weaponShotgun) then
			return true
		end
	end
	return false
end

function isWeaponRifle(model)
	for _, weaponRifle in pairs(Config.WeaponList.Rifles) do
		if model == GetHashKey(weaponRifle) then
			return true
		end
	end
	return false
end

function isWeaponMG(model)
	for _, weaponMG in pairs(Config.WeaponList.MGs) do
		if model == GetHashKey(weaponMG) then
			return true
		end
	end
	return false
end

function isWeaponSniper(model)
	for _, weaponSniper in pairs(Config.WeaponList.Snipers) do
		if model == GetHashKey(weaponSniper) then
			return true
		end
	end
	return false
end

function isWeaponFlare(model)
	for _, weaponFlare in pairs(Config.WeaponList.Flares) do
		if model == GetHashKey(weaponFlare) then
			return true
		end
	end
	return false
end
-- End of Ammo Boxes
