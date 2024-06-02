
local sperquise = false

function _U(entry, ...)
    local locale = ConfigBM.Locale
    local args = {...}
    if Locales[locale] and Locales[locale][entry] then
        return string.format(Locales[locale][entry], table.unpack(args))
    else
        return 'Translation [' .. locale .. '][' .. entry .. '] does not exist'
    end
end

RegisterServerEvent("dmbuy")
AddEventHandler("dmbuy", function(item, price, typetransfere, label)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playermoney = xPlayer.getAccount(ConfigBM.CleanMoneyName).money
    local blackplayermoney = xPlayer.getAccount(ConfigBM.DirtyMoneyName).money

    if typetransfere == "money" then
        if playermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.CleanMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        else
            xPlayer.showNotification(_U('not_enough_money'))
        end
    elseif typetransfere == "blackmoneypay" then
        if blackplayermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.DirtyMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        else
            xPlayer.showNotification(_U('not_enough_money'))
        end
    else
        if blackplayermoney >= price then
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.DirtyMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        elseif playermoney >= price then
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.CleanMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        else
            xPlayer.showNotification(_U('not_enough_money'))
        end
    end
end)

RegisterServerEvent("dmbuycalif")
AddEventHandler("dmbuycalif", function(item, price, typetransfere, label)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playermoney = xPlayer.getAccount(ConfigBM.CleanMoneyName).money
    local blackplayermoney = xPlayer.getAccount(ConfigBM.DirtyMoneyName).money

    if typetransfere == "money" then
        if playermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.CleanMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        else
            xPlayer.showNotification(_U('not_enough_money'))
        end
    elseif typetransfere == "blackmoneypay" then
        if blackplayermoney >= price then 
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.DirtyMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        else
            xPlayer.showNotification(_U('not_enough_money'))
        end
    else
        if blackplayermoney >= price then
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.DirtyMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        elseif playermoney >= price then
            if xPlayer.canCarryItem(item, 1) then
                xPlayer.removeAccountMoney(ConfigBM.CleanMoneyName, price)
                xPlayer.addInventoryItem(item, 1)
                xPlayer.showNotification(_U('bought_item', label))
                DbmWeebhook("BlackMarket - Buy", "Le joueur : "..xPlayer.name.." **("..xPlayer.identifier.."**) vien d'acheter un(e) "..label.." ("..item..") pour le prix de : **"..price.."$**", ConfigWEB.BuyWebhook,ConfigWEB.WeebhookColor)
            else
                xPlayer.showNotification(_U('not_enough_space'))
            end
        else
            xPlayer.showNotification(_U('not_enough_money'))
        end
    end
end)

RegisterServerEvent("Getmoney")
AddEventHandler("Getmoney", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local bmoney = xPlayer.getAccount(ConfigBM.DirtyMoneyName).money
    TriggerClientEvent("moneyv", src, bmoney)
end)

RegisterServerEvent("dconvertmoney")
AddEventHandler("dconvertmoney", function(blackmoney)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local difmoney = blackmoney - blackmoney * ConfigBM.ConversionRate / 100
    xPlayer.removeAccountMoney(ConfigBM.DirtyMoneyName, blackmoney)
    xPlayer.addAccountMoney(ConfigBM.CleanMoneyName, difmoney)
    xPlayer.showNotification(_U('money_laundering', blackmoney, difmoney))
    DbmWeebhook("BlackMarket - Blanchiment", "Joueur : **"..xPlayer.name.."**\nlicense : **"..xPlayer.identifier.."**\nArgent sale avant Blanchiment : **"..blackmoney.."$**\nArgent propre apres Blanchiment : **"..difmoney.."$**\nTaux de conversion : **"..ConfigBM.ConversionRate.."%**", ConfigWEB.BlachimentWebhook, ConfigWEB.WeebhookColor)
end)

RegisterServerEvent("dmremovebm")
AddEventHandler("dmremovebm", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    sperquise = true
    TriggerClientEvent("perquise", -1, true)
    TriggerClientEvent("dvped", -1)
    xPlayer.showNotification(_U('perquisition'))
    DbmWeebhook("BlackMarket - Perquisition", "Le Joueur : **"..xPlayer.name.."** **("..xPlayer.identifier..")** vien de perquisitionner Clyde", ConfigWEB.Perquisition, ConfigWEB.WeebhookColor)
end)

DbmWeebhook = function(title, message, webhook, color)
    local content = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = { ["text"] = os.date("%Y/%m/%d %H:%M:%S") },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = content }), { ['Content-Type'] = 'application/json' })
end

ESX.RegisterServerCallback("perquiseoupas", function(source, cb)
    if sperquise == false then
        cb(false)
    else
        cb(true)
    end
end)
