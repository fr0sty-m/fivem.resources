
-- Realistic Driving Mechanics
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local inVehicle = GetVehiclePedIsIn(playerPed, false)
        local onBike = IsPedOnAnyBike(playerPed)

        if inVehicle then
            -- Reduce turning abilities for more realistic handling
            SetVehicleHandlingFloat(inVehicle, 'CHandlingData', 'fSteeringLock', 25.0) -- Default is around 33.0
            SetVehicleHandlingFloat(inVehicle, 'CHandlingData', 'fTractionCurveMax', 1.5) -- Default is around 2.5
            SetVehicleHandlingFloat(inVehicle, 'CHandlingData', 'fTractionCurveMin', 1.2) -- Default is around 2.0
            SetVehicleHandlingFloat(inVehicle, 'CHandlingData', 'fTractionCurveLateral', 22.5) -- Default is around 25.0
            SetVehicleHandlingFloat(inVehicle, 'CHandlingData', 'fLowSpeedTractionLossMult', 1.0) -- Default is around 0.9
            SetVehicleHandlingFloat(inVehicle, 'CHandlingData', 'fTractionLossMult', 1.0) -- Default is around 1.0
        end

        if onBike then
            local helmetType = GetPedHelmetType(playerPed)

            if helmetType == 0 then
                GivePedHelmet(playerPed, true, 1, 0)
            end
        else
            RemovePedHelmet(playerPed, true)
        end
    end
end)

