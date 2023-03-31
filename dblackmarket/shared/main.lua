ConfigBM = {}
ConfigBM.Perquisition = true --- mettre true si vous voulez activer la possibilité de perquisitionner de clyde sinon mettre false

ConfigBM.ESXCALIF = false --- Mettre true si vous êtes sur une version CALIF de ESX , sinon mettre false

ConfigBM.Blackmoneypay = true --- mettre true si vous voulez que les joueurs puissent paye avec de l'argent sale

ConfigBM.Money = false --- mettre true si vous voulez que les joueurs puissent paye avec de l'argent propre

ConfigBM.MoneyName = "money" --- Utiliser cash pour les bases calif, utiliser money pour les bases sous ESX normal,

ConfigBM.Blackmoneyname = "black_money" --- Utiliser dirtycash pour les bases calif, utiliser black money pour les bases sous ESX normal,

ConfigBM.BlanchimentArgent = true --- mettre true si vous voulez activer le blanchiment , mettre false pour désactiver le Blanchiment Argent

ConfigBM.Tauxdeconversion = 30 --- le taux de conversion en pourcentage du blanchiment

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

ConfigBM.WLJOB = { -- les jobs qui auront pas acces au BlackMarket et qui pouront le perquisitionner (si l'option est activer)
    ["police"] = true,
    ["bsco"] = true,
    ["fib"] = true,
    ["lssd"] = true,
}


ConfigBM.Itemsell = {
    {name = "armor", label = "Gilet par balle", desc = "un gilet par balle lourd avec une protection avance au niveau du bas du corps", price = 5670} ,
    {name = "secure_card", label = "Secure ID Card", desc = "une carte de sécurité gruppe 6 qui permet d'accede au banque Fleeca", price = 2370} 
}

-- Name = nom de l'item ( le nom que vous utliser pour le give)
-- label = le nom qui sera afficher sur le menu 
-- desc = la description qui sera afficher sur le menu
-- minimalprice = le prix minimal que l'item peux atteindre
-- maximalprice = le prix maxmimal que l'item peux atteindre
