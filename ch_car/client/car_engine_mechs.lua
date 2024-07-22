-- Engine Start System
local engineOn = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = GetPlayerPed(-1)
        local inVehicle = GetVehiclePedIsIn(playerPed, false)

        if inVehicle and GetPedInVehicleSeat(inVehicle, -1) == playerPed then
            if not engineOn then
                SetVehicleEngineOn(inVehicle, false, true, true)

                if IsControlJustReleased(0, 38) then -- 'E' key
                    SetVehicleEngineOn(inVehicle, true, true, false)
                    engineOn = true
                    TriggerEvent('chat:addMessage', {
                        color = {255, 0, 0},
                        multiline = true,
                        args = {"System", "Motor calistirildi"}
                    })
                end
            end
        else
            engineOn = false
        end
    end
end)

