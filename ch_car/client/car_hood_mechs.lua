Citizen.CreateThread(function()
  while true do
    Wait(0)

    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId, false)

    if playerVehicle > 0 and GetPedInVehicleSeat(playerVehicle, -1) == playerId then
      if IsControlJustReleased(0, 208) then
        if GetVehicleDoorAngleRatio(playerVehicle, 4) > 0.1 then
          SetVehicleDoorShut(playerVehicle, 4, false)
          TriggerEvent("chat:addMessage", {
            args = {"Hood open"}
          })
        else
          SetVehicleDoorOpen(playerVehicle, 4, false, false)
          TriggerEvent("chat:addMessage", {
              args = {"Kaporta Acik"}
          })
        end
    end

      if IsControlJustReleased(0, 207) then
        print("Trunk")
      end
  end
end)
