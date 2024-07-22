local seatbeltOn = false

-- Seatbelt System
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local inVehicle = GetVehiclePedIsIn(playerPed, false)
        if inVehicle and GetPedInVehicleSeat(inVehicle, -1) == playerPed then
            if IsControlJustPressed(0, 29) then -- 'B' key
                seatbeltOn = not seatbeltOn
                if seatbeltOn then
                    TriggerEvent('chat:addMessage', {
                        args = {"Emniyet kemeri baglandi"}
                    })
                else
                    TriggerEvent('chat:addMessage', {
                        args = {"Emniyet kemeri cikarildi"}
                    })
                end
            end
        else
            seatbeltOn = false
        end

        -- Prevent exiting the vehicle while seatbelt is on
        if inVehicle and seatbeltOn then
            DisableControlAction(0, 75, true) -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle for some versions
        end
    end
end)

