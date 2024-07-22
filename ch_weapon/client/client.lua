RegisterCommand("weapon", function(source, args, rawCommand)
  local weapon_name = args[1]
  local weapon_ammo = args[2] or 150

  if not IsWeaponValid(weapon_name) then
    TriggerEvent('chat:addMessage', {
      args = {'Oh, ' .. weapon_name .. ' is not a weapon'}
    })

    return 
  end

  local playerPed = PlayerPedId()
  GiveWeaponToPed(playerPed, weapon_name, weapon_ammo, false, false)
end)
