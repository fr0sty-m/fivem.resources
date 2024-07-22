RegisterCommand("vehicle", function(source, args)
	local vehicle_name = args[1] or "adder"

	if not IsModelInCdimage(vehicle_name) or not IsModelAVehicle(vehicle_name) then
		TriggerEvent("char:addMessage", {
			args = { "Uh oh, " .. vehicle_name .. " is not a vehicle." },
		})

		return
	end


	RequestModel(vehicle_name)

	while not HasModelLoaded(vehicle_name) do
		Wait(10)
	end

	local playerPed = PlayerPedId()
	local pos				= GetEntityCoords(playerPed)
	local heading		= GetEntityHeading(playerPed)

	local vehicle = CreateVehicle(
		vehicle_name,
		pos,
		heading,
		true
	)

	SetPedIntoVehicle(playerPed, vehicle, -1)

	SetModelAsNoLongerNeeded(vehicle_name)

end)
