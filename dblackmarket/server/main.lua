ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local sperquise = false

RegisterServerEvent("dmbuy")
AddEventHandler("dmbuy", function(item,price,typetransfere,label)
    
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = item
    local playermoney = xPlayer.getAccount(ConfigBM.MoneyName)
    local blackplayermoney = xPlayer.getAccount(ConfigBM.Blackmoneyname)
    if typetransfere == "money" then
          
        if playermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.MoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez de place sur vous~s~")
            end
        else
            xPlayer.showNotification("~r~Vous n'avez pas assez d'argent~s~")
        end
    elseif typetransfere == "blackmoneypay" then
        
        if blackplayermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.Blackmoneyname, price)
                xPlayer.addInventoryItem(item, 1)
                
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez de place sur vous~s~")
            end
        else
            xPlayer.showNotification("~r~Vous n'avez pas assez d'argent~s~")
        end
    else
        if blackplayermoney >= price then
            
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.Blackmoneyname, price)
                xPlayer.addInventoryItem(item, 1)
                
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez de place sur vous~s~")
            end
        elseif playermoney >= price then
            
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.MoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez d'argent~s~")
            end
        end
    end 
end)
RegisterServerEvent("dmbuycalif")
AddEventHandler("dmbuycalif", function(item,price,typetransfere,label)
    
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = item
    local playermoney = xPlayer.getAccount(ConfigBM.MoneyName).money
    local blackplayermoney = xPlayer.getAccount(ConfigBM.Blackmoneyname).money
    if typetransfere == "money" then
          
        if playermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.MoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification("Vous avez acheté un(e) ~b~" ..label)
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez de place sur vous~s~")
            end
        else
            xPlayer.showNotification("~r~Vous n'avez pas assez d'argent~s~")
        end
    elseif typetransfere == "blackmoneypay" then
        
        if blackplayermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.Blackmoneyname, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification("Vous avez acheté un(e) ~b~" ..label)
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez de place sur vous~s~")
            end
        else
            xPlayer.showNotification("~r~Vous n'avez pas assez d'argent~s~")
        end
    else
        if blackplayermoney >= price then
            
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.Blackmoneyname, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification("Vous avez acheté un(e) ~b~" ..label)
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez de place sur vous~s~")
            end
        elseif playermoney >= price then
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.MoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification("Vous avez acheté un(e) ~b~" ..label)
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification("~r~Vous n'avez pas assez de place sur vous~s~")
            end
        else
            xPlayer.showNotification("~r~Vous n'avez pas assez d'argent~s~")
        end
    end
end)


RegisterServerEvent("Getmoney")
AddEventHandler("Getmoney", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local bmoney = xPlayer.getAccount(ConfigBM.Blackmoneyname).money
    TriggerClientEvent("moneyv", src, bmoney)
end)
RegisterServerEvent("dconvertmoney")
AddEventHandler("dconvertmoney", function(blackmoney)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local difmoney = blackmoney - blackmoney*ConfigBM.Tauxdeconversion/100
    xPlayer.removeAccountMoney(ConfigBM.Blackmoneyname, blackmoney)
    xPlayer.addAccountMoney(ConfigBM.MoneyName, difmoney)
    xPlayer.showNotification("Vous venez de blanchir ~r~"..blackmoney.."$~s~ vous avez recu ~g~"..difmoney.."$")
    DbmWeebhook("BlackMarket - Blanchiment", "Joueur : **"..xPlayer.name.."**\nlicense : **"..xPlayer.identifier.."**\nArgent sale avant Blanchiment : **"..blackmoney.."$**\nArgent propre apres Blanchiment : **"..difmoney.."$**\nTaux de conversion : **"..ConfigBM.Tauxdeconversion.."%**",ConfigWEB.BlachimentWebhook,ConfigWEB.WeebhookColor)
end)

RegisterServerEvent("dmremovebm")
AddEventHandler("dmremovebm", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    sperquise = true
    TriggerClientEvent("perquise", -1, true)
    TriggerClientEvent("dvped", -1)
    xPlayer.showNotification("Vous avez ~r~perquisitionner~s~ ~b~Clyde")
    DbmWeebhook("BlackMarket - Perquisition","Le Joueur : **"..xPlayer.name.."** **("..xPlayer.identifier..")** vien de perquisitionner Clyde",ConfigWEB.Perquisition,ConfigWEB.WeebhookColor)
end)

DbmWeebhook = function(title, message, webhook, color)
	local content = {
        {
        	["color"] = color,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {["text"] = os.date("%Y/%m/%d %H:%M:%S")}, 
        }
    }

  	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end

ESX.RegisterServerCallback("perquiseoupas",function(source,cb)
    if sperquise == false then
        cb(false)
    else
        cb(true)
    end
end)