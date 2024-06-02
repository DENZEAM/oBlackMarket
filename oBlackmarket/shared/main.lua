ConfigBM = {}
ConfigBM.PoliceRaid = true --- Set to true if you want to enable the ability to raid, otherwise set to false

ConfigBM.ESXCALIF = false --- Set to true if you are on a CALIF version of ESX, otherwise set to false

ConfigBM.DirtyMoneyPay = true --- Set to true if you want players to be able to pay with dirty money

ConfigBM.CleanMoneyPay = false --- Set to true if you want players to be able to pay with clean money

ConfigBM.CleanMoneyName = "money" --- Use 'cash' for CALIF bases, use 'money' for normal ESX bases

ConfigBM.DirtyMoneyName = "black_money" --- Use 'dirtycash' for CALIF bases, use 'black money' for normal ESX bases

ConfigBM.CleanMoneyPayLaundering = true --- Set to true if you want to enable money laundering, set to false to disable money laundering

ConfigBM.ConversionRate = 30 --- The conversion rate percentage for money laundering

ConfigBM.Locale = 'en' --- Set the language to 'en' for English. Other available languages are: 'fr', 'es', 'pt', 'ru', 'it'

ConfigBM.Marker = {
    {
        type = 25,
        coords = vector3(-1462.7236328125,-392.43215942383,37.23),
        markercolor = {0,0,0},
        ped = "s_m_y_dealer_01",
        pcoord = vector3(-1461.4345703125,-394.44873046875,37.334400177002),
        pheading = 30.02 
    }
}

ConfigBM.RestrictedJobs = { -- jobs that will not have access to the Black Market and can raid it (if the option is enabled)
    ["police"] = true,
    ["bsco"] = true,
    ["fib"] = true,
    ["lssd"] = true,
}

ConfigBM.ItemSell = {
    {name = "cannabis", label = "Cannabis", desc = "A plant known for its psychoactive properties", price = 30} ,
    {name = "bandage", label = "Bandage", desc = "A medical item used for treating wounds", price = 12} 
}

-- Name = item name (the name you use for the give command)
-- label = the name that will be displayed on the menu
-- desc = the description that will be displayed on the menu
-- minimalprice = the minimum price the item can reach
-- maximalprice = the maximum price the item can reach
