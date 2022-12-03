ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local spawn = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
    while not spawn do
        Wait(60000)
        if IsPlayerSwitchInProgress() then
            Wait(1000)
        end
        if not ESX.IsPlayerLoaded() then
            Wait(1000)
        end
        spawn = true
        print(spawn)
        Wait(10)
    end
end)

RegisterNetEvent("TropicShield:loadPlayers")
AddEventHandler("TropicShield:loadPlayers", function()
    if spawn then return print("Already loaded") end
    while not spawn do
        if ESX.IsPlayerLoaded() then
            spawn = true
            print(spawn)
            Wait(10)
        else
            Wait(1000)
        end
    end
end)

-- Anti Spectate
local antiSpectate = false
CreateThread(function()
    while TropicShield_CL.AntiSpectate do
        Wait(10)
        if not IsPlayerSwitchInProgress() and spawn then
            local ped = NetworkIsInSpectatorMode()
            if ped == 1 then
                antiSpectate = true
                TriggerServerEvent('aramsamsam:ban', source, 'Spectate detected')
                Wait(10000)
            end
            if not antiSpectate then
            Wait(3000)
            end
        end
    end
end)

-- KeyLog
local keylog = false
CreateThread(function()
    while TropicShield_CL.BlacklistedKey do
        Wait(10)
        if not IsPlayerSwitchInProgress() and spawn then
            for v, k in ipairs(TropicShield_CL.BlacklistedKeyList) do
                if IsControlJustReleased(0, k.value) then
                    keylog = true
                    exports["screenshot-basic"]:requestScreenshotUpload(TropicShield.ScreenshotWebhook, "files[]", function(a) end)
                    Wait(1000)
                    break
                end
            end
            if not keylog then
                Wait(1)
            end
        end
    end
end)

-- Anti NoClip
local antiNoclipTest = false
CreateThread(function()
    while TropicShield_CL.AntiNoClip do
        Wait(100)
        if spawn and not IsPlayerSwitchInProgress() then
            local _ped = GetPlayerPed(-1)
            local _heightaboveground = GetEntityHeightAboveGround(_ped)
            local _pstate = GetPedParachuteState(_ped)
            local _pid = PlayerPedId()
            local pCoords = GetEntityCoords(_ped)
            for k,v in pairs(TropicShield_CL.WhitelistedNoClipCoords) do
                if Vdist(pCoords, v.coords) < TropicShield_CL.WhitelistedNoClipCoordsDistance then
                else
                    if _heightaboveground > 10 and not IsPedInAnyVehicle(_ped, false) and not IsPedInParachuteFreeFall(_ped) and not IsEntityDead(PlayerPedId()) and not IsPedFalling(_ped) and not IsPedJumpingOutOfVehicle(_ped) and not IsPlayerDead(_pid) and not GetEntityHealth(PlayerPedId()) == 0 then
                        if _pstate == -1 then
                            antiNoclipTest = true
                            TriggerServerEvent('aramsamsam:ban', source, 'NoClip detected')
                            Wait(10000)
                        end
                    else
                        if TropicShield_CL.AntiFlyAroundInVehicle then
                            if _heightaboveground > 35 and IsPedInAnyVehicle(_ped, false) then
                                local vehicle = GetVehiclePedIsUsing(ped)
                                local isheli = GetVehicleClass(vehicle)
                                if isheli == 15 or isheli == 16 then
                                else
                                    TriggerServerEvent('aramsamsam:ban', source, "User seems to be flying around in a vehicle")
                                    Wait(10000)
                                end
                            end
                        end
                    end
                end
            end
            if not antiNoclipTest then
                Wait(3000)
            end
        end
    end
end)

--Anti AI
local antiAI = false
CreateThread(function()
    while TropicShield_CL.AntiDamageModifier do
		Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            local weaponHash = GetSelectedPedWeapon(GetPlayerPed(-1))
            if TropicShield_CL.AntiDamageChanger then
                local WeaponDamage = math.floor(GetWeaponDamage(weaponHash))
                if TropicShield_CL.WeaponDamages[weaponHash] and WeaponDamage > TropicShield_CL.WeaponDamages[weaponHash].damage then
                    local weapon = TropicShield_CL.WeaponDamages[weaponHash]
                    antiAI = true
                    TriggerServerEvent('aramsamsam:ban', source, "Tried to change his gun damage to :"..WeaponDamage)
                    Wait(10000)
                end	
            end
            if not antiAI then
                Wait(2000)
            end
        end
    end
end)


-- Anti Freecam
local antiFreeCam = false
CreateThread(function()
    while TropicShield_CL.AntiFreecam do
        Wait(10)
        if not IsPlayerSwitchInProgress() and spawn then
            local ped = GetPlayerPed(-1)
            local camcoords = (GetEntityCoords(ped) - GetFinalRenderedCamCoord())
            if (camcoords.x > 35) or (camcoords.y > 35) or (camcoords.z > 35) or (camcoords.x < -35) or (camcoords.y < -35) or (camcoords.z < -35) then
                antiFreeCam = true
                TriggerServerEvent('aramsamsam:ban', source, 'Freecam detected')
                Wait(10000)
            end
            if not antiFreeCam then
                Wait(2000)
            end
        end
    end
end)


-- Anti NUI Devtools
RegisterNUICallback(GetCurrentResourceName(), function()
    if TropicShield_CL.AntiNuiDevtools ~= true then return end
    TriggerServerEvent('aramsamsam:ban', source, 'NUI Devtools detected')
end)


-- Anti Weapon Pickup
CreateThread(function() 
    while TropicShield_CL.AntiWeaponPickup do
        Wait(10)
        if not IsPlayerSwitchInProgress() and spawn then
            Wait(990)
            RemoveAllPickupsOfType(GetHashKey("PICKUP_ARMOUR_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_ARMOUR_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_SNACK"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW"))
        end
    end
end)

-- Anti Invisible
local antiInvisible = false
CreateThread(function()
    while TropicShield_CL.AntiInvisible do
        Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            local ped = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(ped)
            local entityalpha = GetEntityAlpha(ped)
            for k,v in pairs(TropicShield_CL.WhitelistedInvisCoords) do
                if Vdist(pCoords, v.coords) < TropicShield_CL.WhitelistedInvisCoordsDistance then
                    
                else
                    if not IsEntityVisible(ped) or not IsEntityVisibleToScript(ped) or entityalpha <= 150 then
                        local antiInvisible = true
                        TriggerServerEvent('aramsamsam:ban', source, 'Invisibility detected')
                        Wait(10000)
                    end
                end
            end
            if not antiInvisible then
                Wait(2900)
            end
        end
    end
end)

-- Anti Explosionbullet
local antiExplosionBullet = false
CreateThread(function()
    while TropicShield_CL.AntiExplosionBullet do
        Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            local weapondamage = GetWeaponDamageType(GetSelectedPedWeapon(_ped))
            if weapondamage == 4 or weapondamage == 5 or weapondamage == 6 or weapondamage == 13 then
                antiExplosionBullet = true
                TriggerServerEvent('aramsamsam:ban', source, 'Explosion Bullet detected')
                Wait(10000)
            end
            if not antiExplosionBullet then
                Wait(2900)
            end
        end
    end
end)

-- Anti Vision
local antiVision = false
CreateThread(function()
    while TropicShield_CL.AntiVision do
        Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            if GetUsingnightvision(true) then
                if TropicShield_CL.AntiNightVision ~= true then return end
                antiVision = true
                TriggerServerEvent('aramsamsam:ban', source, 'Night Vision detected')
                Wait(10000)
            end
            if GetUsingseethrough(true) then
                if TropicShield_CL.AntiThermalVision ~= true then return end
                antiVision = true
                TriggerServerEvent('aramsamsam:ban', source, 'Thermal Vision detected')
                Wait(10000)
            end
            if not antiVision then
                Wait(2500)
            end
        end
    end
end)

-- Anti Teleport
CreateThread(function()
    while TropicShield_CL.AntiTeleport do
        Wait(10)
        if not IsPlayerSwitchInProgress() and spawn then
            local ped = GetPlayerPed(-1)
            local coordx1, coordy1, coordz1 = table.unpack(GetEntityCoords(ped, true))
            if coordx1 and coordy1 and coordz1 then
                Wait(10000)
                local coordx2, coordy2, coordz2 = table.unpack(GetEntityCoords(PlayerPedId(), true))
                if GetDistanceBetweenCoords(coordx1, coordy1, coordz1, coordx2, coordy2, coordz2) > 100 then
                    if IsPedFalling(ped) then return end
                    if IsPedInAnyVehicle(ped) then return end
                    if IsPedInParachuteFreeFall(ped) then return end
                    if IsPedRagdoll(ped) then return end
                    if IsPlayerSwitchInProgress() then return end
                    if IsPedJumpingOutOfVehicle(ped) then return end
                    if not IsEntityVisible(ped) then return end
                    if not IsEntityVisibleToScript(ped) then return end
                    TriggerServerEvent('aramsamsam:ban', source, 'Teleport detected')
                    Wait(10000)
                end
            end
            Wait(990)
        end
    end
end)

-- Anti Super Jump
local antiSuperJump = false
CreateThread(function()
	while TropicShield_CL.SuperJump do
		Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            if DoesEntityExist(PlayerPedId()) and not IsPlayerSwitchInProgress() then
                local jumping = IsPedJumping(PlayerPedId())
                if jumping then
                    antiSuperJump = true
                    TriggerServerEvent('TropicShield:CheckJumping')
                end
            end
            if not antiSuperJump then
                Wait(1700)
            end
        end
    end    
end)

RegisterNetEvent("TropicShield:superJump")
AddEventHandler("TropicShield:superJump", function()
    TriggerServerEvent('aramsamsam:ban', source, 'Superjump')
    Wait(10000)
end)


-- Blacklisted Weapons
local antiBlacklistedWeapons = false
CreateThread(function()
	while TropicShield_CL.BlacklistedWeapons do
		Wait(100)
        if not IsPlayerSwitchInProgress() and spawn and not exports["ws_ffa"]:isInZone() then
            for _,theWeapon in ipairs(TropicShield_CL.BlacklistedWeaponsList) do
                Wait(5)
                local ped = GetPlayerPed(-1)
                if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
                    print("Removed Weapons")
                    RemoveAllPedWeapons(ped)
                    Wait(10)
                    if TropicShield_CL.BlacklistedWeaponsBan then
                        antiBlacklistedWeapons = true
                        TriggerServerEvent('aramsamsam:ban', source, 'Blacklisted Weapon detected')
                        Wait(10000)
                    end
                end
            end
            if not antiBlacklistedWeapons then 
                Wait(2900)
            end
        end
	end
end)

-- Blacklisted Vehicles
local antiBlacklistedVehicles = false
CreateThread(function()
	while TropicShield_CL.BlacklistedVehicles do
		Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            playerPed = GetPlayerPed(-1)
            if playerPed then
                checkCar(GetVehiclePedIsIn(playerPed, false))

                x, y, z = table.unpack(GetEntityCoords(playerPed, true))
                for _, blacklistedCar in pairs(TropicShield_CL.BlacklistedVehiclesList) do
                    checkCar(GetClosestVehicle(x, y, z, 10.0, GetHashKey(blacklistedCar), 3))
                end
            end
            if not antiBlacklistedVehicles then
                Wait(9900)
            end
        end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
            TriggerServerEvent("aramsamsam:screenshot2")
			DeleteEntity(car)
            if TropicShield_CL.BlacklistedVehiclesBan then
			    TriggerServerEvent('aramsamsam:ban', source, 'Blacklisted Vehicle detected')
                Wait(10000)
            end
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(TropicShield_CL.BlacklistedVehiclesList) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end

-- Anti Vehicle Modifier
local antiVehicleModifier = false
CreateThread(function()
    while true do
        Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            local ped = PlayerPedId()
            local sleep = true
            if IsPedInAnyVehicle(ped, false) then
                sleep = false
                local vehiclein = GetVehiclePedIsIn(ped, 0)
                if IsVehicleDamaged(vehiclein) then
                    if GetEntityHealth(vehiclein) >= GetEntityMaxHealth(vehiclein) then
                        if TropicShield_CL.VehicleGodMode then
                            if GetVehiclePedIsIn(GetPlayerPed(-1)) then return end
                            antiVehicleModifier = true
                            TriggerServerEvent('aramsamsam:ban', vehiclein, 'Vehicle-Modifier detected. Type: 2')
                            DeleteEntity(vehiclein)
                            Wait(10000)
                        end
                    end
                end
                SetEntityInvincible(vehiclein, false)
                if GetVehicleCheatPowerIncrease(vehiclein) > 1.0 then
                    if TropicShield_CL.VehiclePowerIncrease then
                        if GetVehiclePedIsIn(GetPlayerPed(-1)) then return end
                        antiVehicleModifier = true
                        TriggerServerEvent('aramsamsam:ban', vehiclein, 'Vehicle-Modifier detected. Type: 3')
                        DeleteEntity(vehiclein)
                        Wait(10000)
                    end
                end
                if GetVehicleTopSpeedModifier(vehiclein) > -1.0 then
                    if TropicShield_CL.VehicleSpeedHack then
                        if GetVehiclePedIsIn(GetPlayerPed(-1)) then return end
                        antiVehicleModifier = true
                        TriggerServerEvent('aramsamsam:ban', vehiclein, 'Vehicle-Modifier detected. Type: 5')
                        DeleteEntity(vehiclein)
                        Wait(10000)
                    end
                end
                SetVehicleTyresCanBurst(vehiclein, true)
            end
            if not antiVehicleModifier then
                Wait(4900)
            end
        end
    end
end)

-- Anti Infinite Ammo
CreateThread(function()
    while TropicShield_CL.AntiInfiniteAmmo do
        Wait(10)
        if not IsPlayerSwitchInProgress() and spawn then
            Wait(5000)
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
        end
    end
end)

-- Anti Eulen Godmode
local antiEulenGodMode = false
CreateThread(function()
    while TropicShield_CL.AntiGodMode1 do
        Wait(5000)-- 100
        if not IsPlayerSwitchInProgress() and spawn and not IsPedDeadOrDying(PlayerPedId(), true) and GetEntityHealth(PlayerPedId()) ~= 0 then
            local ped = PlayerPedId()
            local health = GetEntityHealth(ped)
            Wait(1)
            SetEntityHealth(ped, health - 5)
            Wait(1)
            local health2 = GetEntityHealth(ped)
            if health2 > health - 5 or not GetEntityCanBeDamaged(ped) then
                SetEntityHealth(ped, health)
                antiEulenGodMode = true
                TriggerServerEvent('aramsamsam:ban', source, 'Godmode detected. Type: 1')
                Wait(10000)
            else
                SetEntityHealth(ped, health)
            end
            if not antiEulenGodMode then
                Wait(1)-- 4900
            end
        end
    end
end)

-- Anti GodMode2
local antiGodMode2 = false
CreateThread(function()
    while TropicShield_CL.AntiGodMode2 do
        Wait(100)
        if spawn and not IsPlayerSwitchInProgress() and not IsPlayerDead(PlayerPedId()) then
            local ped = GetPlayerPed(-1)
            if GetPlayerInvincible(ped) then
                antiGodMode2 = true
                TriggerServerEvent('aramsamsam:ban', ped, 'Godmode detected. Type: 2')
                SetPlayerInvincible(ped, false)
                Wait(10000)
            end
            if not antiGodMode2 then
                Wait(4900)
            end
        end
    end
end)

-- Anti GodMode3+4
local antiGodMode3 = false
CreateThread(function()
    while TropicShield_CL.AntiGodMode3 do
        Wait(100)
        if spawn and not IsPlayerSwitchInProgress() and not IsPlayerDead(PlayerPedId()) then
            if GetPlayerInvincible_2(PlayerId()) then
                antiGodMode3 = true
                TriggerServerEvent('aramsamsam:ban', source, 'Godmode detected. Type: 3')
                Wait(10000)
            end
            if not antiGodMode3 then
                Wait(4900)
            end
        end
    end
end)

-- Anti Stopper
AddEventHandler("onResourceStop", function(res)
    found = false
    if TropicShield_CL.AntiStarter ~= true then return end
    for k, v in pairs(TropicShield_CL.WhitelistedResources) do
        if res == v and not found then 
            print("Whitelisted Resource Stopped")
            found = true
            break
        end
    end
    if res == GetCurrentResourceName() and not found then
        TriggerServerEvent('aramsamsam:ban', source, 'Tried to stop Script: ' ..res)
        print('Tried to stopped Script: ' ..res)
        Wait(100)
        CancelEvent()
        return
    elseif not found then
        TriggerServerEvent('aramsamsam:ban', source, 'Tried to stop Script: Resourcename ' .. res)
        print('Tried to stopped Script: Resourcename ' .. res)
        Wait(100)
        CancelEvent()
        return
    end
end)

-- Anti Starter
AddEventHandler("onResourceStart", function(res)
    found = false
    if TropicShield_CL.AntiStarter ~= true then return end
    for k, v in pairs(TropicShield_CL.WhitelistedResources) do
        if res == v and not found then 
            print("Whitelisted Resource Started")
            found = true
            break
        end
    end
    if res == GetCurrentResourceName() then
        TriggerServerEvent('aramsamsam:ban', source, 'Tried to start Script: ' ..res)
        print('Tried to start Script: ' ..res)
        Wait(100)
        CancelEvent()
        return
    elseif not found then
        TriggerServerEvent('aramsamsam:ban', source, 'Tried to start Script: Resourcename ' .. res)
        print('Tried to start Script: Resourcename ' .. res)
        Wait(100)
        CancelEvent()
        return
    end
end)

-- Screenshot
RegisterNetEvent("aramsamsam:screenshot")
AddEventHandler("aramsamsam:screenshot", function(data)
    exports['screenshot-basic']:requestScreenshotUpload(TropicShield.BanWebhook, "files[]", function(data) end)
end)

RegisterNetEvent("aramsamsam:screenshot2")
AddEventHandler("aramsamsam:screenshot2", function(data)
  if data ~= nil then
  exports["screenshot-basic"]:requestScreenshotUpload(TropicShield.ScreenshotWebhook, "files[]", function(data) end)
  end
end) 

-- Anti Damage Modifier
local antiDamageModifier = false
CreateThread(function()
    while TropicShield_CL.AntiDamageModifier do
        Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            if GetPlayerWeaponDamageModifier(PlayerId()) > 1.0 then
                antiDamageModifier = true
                TriggerServerEvent('aramsamsam:ban', source, 'Tried to use Damage Modifier')
                Wait(10000)
            end
            if not antiDamageModifier then
                Wait(2400)
            end
        end
    end
end)

-- Anti Injection
local anitInjection = false
CreateThread(function()
	while true do
		Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            local DetectableTextures = {
                {txd = "HydroMenu", txt = "HydroMenuHeader", name = "HydroMenu"},
                {txd = "John", txt = "John2", name = "SugarMenu"},
                {txd = "darkside", txt = "logo", name = "Darkside"},
                {txd = "ISMMENU", txt = "ISMMENUHeader", name = "ISMMENU"},
                {txd = "dopatest", txt = "duiTex", name = "Copypaste Menu"},
                {txd = "fm", txt = "menu_bg", name = "Fallout Menu"},
                {txd = "wave", txt = "logo", name ="Wave"},
                {txd = "wave1", txt = "logo1", name = "Wave (alt.)"},
                {txd = "meow2", txt = "woof2", name ="Alokas66", x = 1000, y = 1000},
                {txd = "adb831a7fdd83d_Guest_d1e2a309ce7591dff86", txt = "adb831a7fdd83d_Guest_d1e2a309ce7591dff8Header6", name ="Guest Menu"},
                {txd = "hugev_gif_DSGUHSDGISDG", txt = "duiTex_DSIOGJSDG", name="HugeV Menu"},
                {txd = "MM", txt = "menu_bg", name="Metrix Mehtods"},
                {txd = "wm", txt = "wm2", name="WM Menu"},
                {txd = "fm", txt = "menu_bg", name = "Fallout"},
                {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
                {txd = "Blood-X", txt="Blood-X", name="Blood-X Menu"},
                {txd = "Dopamine", txt="Dopameme", name="Dopamine Menu"},
                {txd = "Fallout", txt="FalloutMenu", name="Fallout Menu"},
                {txd = "Luxmenu", txt="Lux meme", name="LuxMenu"},
                {txd = "Reaper", txt="reaper", name="Reaper Menu"},
                {txd = "absoluteeulen", txt="Absolut", name="Absolut Menu"},
                {txd = "KekHack", txt="kekhack", name="KekHack Menu"},
                {txd = "Maestro", txt="maestro", name="Maestro Menu"},
                {txd = "SkidMenu", txt="skidmenu", name="Skid Menu"},
                {txd = "Brutan", txt="brutan", name="Brutan Menu"},
                {txd = "FiveSense", txt="fivesense", name="Fivesense Menu"},
                {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
                {txd = "Auttaja", txt="auttaja", name="Auttaja Menu"},
                {txd = "BartowMenu", txt="bartowmenu", name="Bartow Menu"},
                {txd = "Hoax", txt="hoaxmenu", name="Hoax Menu"},
                {txd = "FendinX", txt="fendin", name="Fendinx Menu"},
                {txd = "Hammenu", txt="Ham", name="Ham Menu"},
                {txd = "Lynxmenu", txt="Lynx", name="Lynx Menu"},
                {txd = "Oblivious", txt="oblivious", name="Oblivious Menu"},
                {txd = "malossimenuv", txt="malossimenu", name="Malossi Menu"},
                {txd = "memeeee", txt="Memeeee", name="Memeeee Menu"},
                {txd = "tiago", txt="Tiago", name="Tiago Menu"},
                {txd = "Hydramenu", txt="hydramenu", name="Hydra Menu"}
                
            }
            
            for i, data in pairs(DetectableTextures) do
                if data.x and data.y then
                    if GetTextureResolution(data.txd, data.txt).x == data.x and GetTextureResolution(data.txd, data.txt).y == data.y then
                        if TropicShield_CL.AntiInjection then 
                        TriggerEvent("aramsamsam:screenshot", source)
                        Wait(500)
                        anitInjection = true
                        TriggerServerEvent('aramsamsam:ban', source, 'Injection detected: ' ..data.txt)
                        Wait(10000)
                    end
                end
                else 
                    if GetTextureResolution(data.txd, data.txt).x ~= 4.0 then
                        if TropicShield_CL.AntiInjection then
                        TriggerEvent("aramsamsam:screenshot", source)
                        Wait(500)
                        anitInjection = true
                        TriggerServerEvent('aramsamsam:ban', source, 'Injection detected: ' ..data.txt)
                        Wait(10000)
                    end
                end
                end
            end
            if not anitInjection then
                Wait(9900)
            end
        end
	end
end)

local ischecking = false
CreateThread(function()
    while TropicShield_CL.OnScreenMenuDetection do
    Wait(5000)
    if not IsPlayerSwitchInProgress() and spawn then
        if not ischecking then
            exports["screenshot-basic"]:requestScreenshot(function(data)
                Wait(1000)
                SendNUIMessage({
                    type = "screenshotcheck",
                    screenshoturl = data
                })
            end)
            ischecking = true
        end
        Wait(15000)
    end
  end
end)


RegisterNUICallback('check', function(data)
    if data.text ~= nil then     
        for _, word in pairs(TropicShield_CL.BlacklistedMenuWords) do
            if string.find(string.lower(data.text), string.lower(word)) then
                TriggerServerEvent("aramsamsam:ban", source, 'On Screen Word Found: ' ..word) -- BAN (ON SCREEN MENU DETECTION)
            end
        end
    end
    ischecking = false
end)

-- Anti Plate Changer
local antiPlateChanger = false
CreateThread(function()
    while TropicShield_CL.AntiVehicleplatechange do
        Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
            local firstplate = GetVehicleNumberPlateText(vehicle)
            Wait(100)
            local secondplate = GetVehicleNumberPlateText(vehicle)
            if firstplate ~= secondplate then
                if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    antiPlateChanger = true
                    TriggerServerEvent('aramsamsam:ban', source, 'Vehicle-Plate Change detected')
                    Wait(10000)
                end
            end
            if not antiPlateChanger then
                Wait(4900)
            end
        end
    end
end)


local antiDamageModifier2 = false
CreateThread(function()
	while TropicShield_CL.AntiDamageModifier do
        Wait(100)
        if not IsPlayerSwitchInProgress() and spawn then
            local defaultModifier = 1.0
            local weaponDamageModifier = GetPlayerWeaponDamageModifier(PlayerId())
            if weaponDamageModifier ~= defaultModifier and weaponDamageModifier ~= 0.0 and weaponDamageModifier > 1.0 then
                antiDamageModifier2 = true
                TriggerServerEvent('aramsamsam:ban', source, "Tried to change weapon damage modifier")
                Wait(10000)
            end

            local WeaponDefenceModifier = GetPlayerWeaponDefenseModifier(PlayerId())
            if WeaponDefenceModifier ~= defaultModifier and WeaponDefenceModifier ~= 0.0 and WeaponDefenceModifier > 1.0 then
                antiDamageModifier2 = true
                TriggerServerEvent('aramsamsam:ban', source, "Tried to change weapon defence modifier")
                Wait(10000)
            end


            local WeaponDefenceModifier2 = GetPlayerWeaponDefenseModifier_2(PlayerId())
            if WeaponDefenceModifier2 ~= defaultModifier and WeaponDefenceModifier2 ~= 0.0 and WeaponDefenceModifier2 > 1.0 then
                antiDamageModifier2 = true
                TriggerServerEvent('aramsamsam:ban', source, "Tried to change weapon defence modifier2")
                Wait(10000)
            end


            local VehicleDamageModifier = GetPlayerVehicleDamageModifier(PlayerId())
            if VehicleDamageModifier ~= defaultModifier and VehicleDamageModifier ~= 0.0 and VehicleDamageModifier > 1.0 then
                antiDamageModifier2 = true
                TriggerServerEvent('aramsamsam:ban', source, "Tried to change vehicle damage modifier")
                Wait(10000)
            end

            local VehicleDefenceModifier = GetPlayerVehicleDefenseModifier(PlayerId())
            if VehicleDefenceModifier ~= defaultModifier and VehicleDefenceModifier ~= 0.0 and VehicleDefenceModifier > 1.0 then
                antiDamageModifier2 = true
                TriggerServerEvent('aramsamsam:ban', source, "Tried to change vehicle defence modifier")
                Wait(10000)
            end

            local MeleeDefenceModifier = GetPlayerMeleeWeaponDefenseModifier(PlayerId())
            if MeleeDefenceModifier ~= defaultModifier and VehicleDefenceModifier ~= 0.0 and MeleeDefenceModifier > 1.0 then
                antiDamageModifier2 = true
                TriggerServerEvent('aramsamsam:ban', source, "Tried to change melee defence modifier")
                Wait(10000)
            end
            if not antiDamageModifier2 then 
                Wait(4900)
            end
        end
	end
end)


local weaponHashes = {"dagger", "bat", "bottle", "crowbar", "flashlight", "golfclub", "hammer", "hatchet", "knuckle",
"knife", "machete", "switchblade", "nightstick", "wrench", "battleaxe", "poolcue",
"stone_hatchet", "pistol", "pistol_mk2", "combatpistol", "appistol", "stungun", "pistol50",
"snspistol", "snspistol_mk2", "heavypistol", "vintagepistol", "flaregun", "marksmanpistol",
"revolver", "revolver_mk2", "doubleaction", "raypistol", "ceramicpistol", "navyrevolver",
"microsmg", "smg", "smg_mk2", "assaultsmg", "combatpdw", "machinepistol", "minismg", "raycarbine",
"pumpshotgun", "pumpshotgun_mk2", "sawnoffshotgun", "assaultshotgun", "bullpupshotgun", "musket",
"heavyshotgun", "dbshotgun", "autoshotgun", "assaultrifle", "assaultrifle_mk2", "carbinerifle",
"carbinerifle_mk2", "advancedrifle", "specialcarbine", "specialcarbine_mk2", "bullpuprifle",
"bullpuprifle_mk2", "compactrifle", "mg", "combatmg", "combatmg_mk2", "gusenberg", "sniperrifle",
"heavysniper", "heavysniper_mk2", "marksmanrifle", "marksmanrifle_mk2", "rpg", "grenadelauncher",
"grenadelauncher_smoke", "minigun", "firework", "railgun", "hominglauncher", "compactlauncher",
"rayminigun", "grenade", "bzgas", "smokegrenade", "flare", "molotov", "stickybomb", "proxmine",
"snowball", "pipebomb", "ball", "petrolcan", "fireextinguisher", "hazardcan"} -- Add more weapons here [https://wiki.fivem.net/wiki/Weapons]

local antiModder = false
CreateThread(function()
    local ReasonFORPLDeath, Moddername, deathcause, Weapon
    while true do
        Wait(10)
        if not IsPlayerSwitchInProgress() and spawn then
            if IsEntityDead(PlayerPedId()) then
                local ModderKL = GetPedSourceOfDeath(PlayerPedId())
                local moddername2 = GetPlayerName(ModderKL)
                local deathcause = GetPeddeathcause(PlayerPedId()) or nil
                local modderid = GetPlayerFromServerId(ModderKL)
                Weaponname = nil
                if IsEntityAPed(ModderKL) and IsPedAPlayer(ModderKL) then
                    Moddername = NetworkGetPlayerIndexFromPed(ModderKL)
                elseif IsEntityAVehicle(ModderKL) and IsEntityAPed(GetPedInVehicleSeat(ModderKL, -1)) and IsPedAPlayer(GetPedInVehicleSeat(ModderKL, -1)) then
                        Moddername = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(ModderKL, -1))
                end
            end
            Wait(250)

            if (Moddername == PlayerId()) then
                return
            elseif (Moddername == nil) then
                return 
            elseif (deathcause == nil) then
                return
            else
                for k, v in ipairs(weaponHashes) do -- [https://wiki.fivem.net/wiki/Weapons] Weapon hashes are defined above
                    if deathcause ==  GetHashKey("weapon_" .. v) then
                        Weaponname = 'weapon_' .. v
                    end
                end
            end
            Wait(250)
            if HasPedGotWeapon(ModderKL, GetHashKey(Weaponname)) then
                print("^4[TropicShield]^7 ^1Modder gefunden^7")
                antiModder = true 
                TriggerServerEvent("aramsamsam:ban", "Modding")
                return Wait(10000)
            end
            Wait(250)

            Moddername = nil
            ReasonFORPLDeath = nil
            deathcause = nil
            Weaponname = nil
            while IsEntityDead(PlayerPedId()) do
                Wait(1000)
            end
            if not antiModder then
                Wait(240)
            end
        end
    end
end)