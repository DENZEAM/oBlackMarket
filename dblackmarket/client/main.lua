ESX = nil
local perquised = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
        Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    verif()
    Wait(7000)
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    Wait(2000)
end)

local bmmenu = RageUI.CreateMenu("", "Marché de Clyde",0, 0, 'root_cause', 'shopui_title_disruptionlogistics')
local bmoney = 0
local psped = ""

bmmenu.Closed = function()
	open = false
end
RegisterNetEvent("moneyv")
AddEventHandler("moneyv", function(blackmoney)
   bmoney = blackmoney
end)

RegisterNetEvent("perquise")
AddEventHandler("perquise", function(boolean)
   perquised = boolean

end)
RegisterNetEvent("dvped")
AddEventHandler("dvped", function()
   print(psped)
   DeletePed(psped)
end)

function dmenu()
   
    TriggerServerEvent("Getmoney")
    verif()
    local firstcoords = GetEntityCoords(PlayerPedId())
	if open then
		open = false
		RageUI.Visible(bmmenu,false)
		return
	else
		open = true
		RageUI.Visible(bmmenu,true)
		CreateThread(function()
			while open do 
                local actualypos = GetEntityCoords(PlayerPedId())
                local dif = #(firstcoords - actualypos)
                if dif > 6 then 
                    RageUI.CloseAll()
                end
                --for k,v in pairs(ConfigBM.Itemsell) do
                    --for k,v in pairs(prixx) do
                        
                        RageUI.IsVisible(bmmenu,function()
                            if ConfigBM.WLJOB[ESX.PlayerData.job and ESX.PlayerData.job.name] then
                                if ConfigBM.Perquisition == true then
                                    RageUI.Button("Perquisition", "Voulez vous perquisitionner Clyde ?", {RightBadge = RageUI.BadgeStyle.Alert, Color = {BackgroundColor = RageUI.ItemsColour.Red}}, true, {
                                        onSelected = function()
                                            TriggerServerEvent("dmremovebm")
                                            RageUI.CloseAll()
                                        end
                                    })
                                else
                                    RageUI.Separator("")
                                    RageUI.Separator("~c~ Tu veux quoi mec ? il a rien a voir ici")
                                    RageUI.Separator("")
                                end
                            else
                                RageUI.Separator("↓ ~b~Objet en vente ~s~↓ ")
                                for k,v in pairs (ConfigBM.Itemsell) do
                                    RageUI.Button(v.label, v.desc, {RightLabel = "~r~"..v.price.. "$"} , true, {
                                        onSelected = function()
                                            if ConfigBM.ESXCALIF == true then
                                                --print(ConfigBM.ESXCALIF)
                                                if ConfigBM.Blackmoneypay == true and ConfigBM.Money == true then
                                                    TriggerServerEvent("dmbuycalif", v.name,v.price,"all",v.label)
                                                elseif ConfigBM.Blackmoneypay == true and ConfigBM.Money == false then
                                                    TriggerServerEvent("dmbuycalif", v.name,v.price,"blackmoneypay",v.label)
                                                elseif  ConfigBM.Blackmoneypay == false and ConfigBM.Money == true then
                                                    TriggerServerEvent("dmbuycalif", v.name,v.price,"money",v.label)
                                                end
                                            else
                                                --print(ConfigBM.ESXCALIF)
                                                if ConfigBM.Blackmoneypay == true and ConfigBM.Money == true then
                                                    TriggerServerEvent("dmbuy", v.name,v.price,"all",v.label)
                                                elseif ConfigBM.Blackmoneypay == true and ConfigBM.Money == false then
                                                    TriggerServerEvent("dmbuy", v.name,v.price,"blackmoneypay",v.label)
                                                elseif  ConfigBM.Blackmoneypay == false and ConfigBM.Money == true then
                                                    TriggerServerEvent("dmbuy", v.name,v.price,"money",v.label)
                                                end
                                            end
                                        end
                                    })
                                end
                                if ConfigBM.BlanchimentArgent == true then
                                    RageUI.Separator(" ↓ Conversion ~r~Argent sale ~s~-> ~g~Argent propre~s~ ↓")
                                    RageUI.Button("Blanchiment", "~r~[Frais de conversion]~s~ ~b~"..ConfigBM.Tauxdeconversion.."% ~s~vous avez ~r~"..bmoney.." $~s~ vous recevrez ~g~"..bmoney - bmoney*ConfigBM.Tauxdeconversion/100 .."$" ,{RightBadge = RageUI.BadgeStyle.Tick}, true, {
                                        onSelected = function()
                                            TriggerServerEvent("dconvertmoney", bmoney)
                                            RageUI.CloseAll()
                                        end
                                    })
                                end
                            end
                        end)
                    --end
               -- end
				Citizen.Wait(1)
			end
		end)
	end
end


function verif()
    ESX.TriggerServerCallback("perquiseoupas",function(cb)
        perquised = cb
    end)
end
function rhash(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end

Citizen.CreateThread(function()
    Wait(750)

    if perquised == false then
        for k,v in pairs(ConfigBM.Marker) do
            local pp = v.ped
            local pc = v.pcoord
            local pedHash = GetHashKey(pp)
            local head = v.pheading
            rhash(pedHash)
            local pped = CreatePed(2, pedHash, pc.x , pc.y , pc.z , head, true, false)
            psped = pped
            FreezeEntityPosition(pped, true)
            SetEntityInvincible(pped, true)
            SetPedCanRagdoll(pped, true)
            SetPedCanArmIk(pped, true )
            SetPedCanBeTargetted(pped, true)
            SetBlockingOfNonTemporaryEvents(pped, true)
            

        end
    elseif perquised == true then 
        
    end
end)



Citizen.CreateThread(function() 
    for k,v in pairs (ConfigBM.Marker) do
        local interval = 750
        while true do
            if perquised == false then
                local taype = v.type
                local mc = v.coords
                local pPed = PlayerPedId()
                local pc = GetEntityCoords(pPed)
                local dif = GetDistanceBetweenCoords(mc, pc, true)
                if dif > 20 then
                    interval = 750
                else
                    interval = 1
                    DrawMarker(taype,mc,0.0,0.0,0.0,0.0,0.0,0.0,0.5,0.5,0.5,v.markercolor[1],v.markercolor[2],v.markercolor[3],255,false,false,0,false,nil,nil,false)
                   -- DrawMarker(taype, mc, 0.0, 0.0, 0.0, 90.0, 180.0, 360.0, 1.0, 1.0, 1.0,v.markercolor[1],v.markercolor[2],v.markercolor[3], 155)
                    if dif <= 5 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au marche de ~b~Clyde~w~.")
                        if IsControlJustPressed(0, 51) then 
                            dmenu() 
                        end
                    end
                end
            else
                break
            end
            Citizen.Wait(interval)
        end
    end
end)



