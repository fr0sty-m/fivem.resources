local locked = false

-- L key control
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)

    if IsControlJustReleased(1, 182) then
      local playerPed = PlayerPedId()
      local vehicle = GetVehiclePedIsIn(playerPed, false)

      if vehicle ~= 0 then
        locked = not locked
        SetVehicleDoorsLocked(vehicle, locked and 2 or 1)
        TriggerEvent('chat:addMessage', {
          color = {255, 0, 0},
          multiline = true,
          args = {"System", locked and "Araba kilitlendi." or "Araba kilitleri acildi."}
        })
      else 
        vehicle = GetClosestVehicle(GetEntityCoords(playerPed), 10.0, 0, 70)

        if DoesEntityExist(vehicle) then
          locked = not locked
          SetVehicleDoorsLocked(vehicle, locked and 2 or 1)
          TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", locked and "Araba kilitlendi." or "Araba kilitleri acildi."}
          })
        else
          TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "Yakinda araba yok."}
          })
        end
      end
    end
  end
end)

