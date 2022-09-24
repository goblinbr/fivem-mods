AddEventHandler('gameEventTriggered',function(name,args)
    if name == 'CEventNetworkEntityDamage' then
        local victimId = args[1]
        local attackerId = args[2]
        local isFatalDamage = args[4]

        if isFatalDamage == 1 then
            local pedId = PlayerPedId()
            local pedVehicleId = GetVehiclePedIsIn(pedId)
            if attackerId == pedId or attackerId == pedVehicleId then
                local npcKilledData = {
                    victimId = victimId,
                    victimPedType = GetPedType(victimId),
                    attackerId = attackerId,
                    pedId = pedId,
                    pedVehicleId = pedVehicleId
                }
                TriggerServerEvent("esx_kill_npc:npcKilled", npcKilledData)
            end
        end
    else
        print('CLIENT game event ' .. name .. ' (' .. json.encode(args) .. ')')
    end
end)

-- [182] - CEventNetworkEntityDamage
-- IDX  Type	Returned Value
-- 1    integer	Victim (Entity ID)
-- 2    integer	Attacker (Entity ID)
-- 3    integer	1101169152
-- 4    boolean	Damage fatal
-- 5    hash	WeaponInfoHash, for example; 133987706 is joaat("WEAPON_RAMMED_BY_CAR")) - ref: common.rpf/data/ai/weapons.meta->Item type="CWeaponInfo"
-- 6    integer	1086820063
-- 7    integer	1086820063
-- 8    unknown	0
-- 9    unknown	0
-- 10   boolean	Is Melee damage
-- 11   integer	Unknown, but 0 for peds, 116 for the body of a vehicle, 93 for a tire, 120 for a side window, 121 for a rear window, 122 for a windscreen, etc