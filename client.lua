RegisterNetEvent("free:toggleFreeMenu")
AddEventHandler("free:toggleFreeMenu", function(state)
	SetNuiFocus(state, state)
	SendNUIMessage({type = "toggleshow", enable = state})
end)

RegisterNetEvent("free:setTimeout")
AddEventHandler("free:setTimeout", function(t)
	SendNUIMessage({type = "settimeout", timeout = tonumber(t * 1000)})
end)

RegisterNetEvent("free:giveWpn")
AddEventHandler("free:giveWpn", function(wpn,ammo)
	local ped = GetPlayerPed(-1)
	wpn = GetHashKey(wpn)
	if HasPedGotWeapon(ped, wpn, false) then AddAmmoToPed(ped, wpn, ammo) else GiveWeaponToPed(ped, wpn, ammo, false, false) end
end)

RegisterNUICallback("hidemenu", function(data, cb)
	TriggerEvent("free:toggleFreeMenu", false)
end)

RegisterNUICallback("collect", function(data, cb)
	TriggerServerEvent("free:collect", data.t)
end)

Citizen.CreateThread(function()
	TriggerServerEvent("free:updateTimeout")
	while true do
		Citizen.Wait(600000)
		TriggerServerEvent("free:updateTimeout") -- update timeout every 10 minutes because why not
	end
end)

TriggerEvent('chat:addSuggestion', '/daily', 'Open daily rewards menu',{})