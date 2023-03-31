fx_version 'cerulean'
game 'gta5'

name "dblackmarket"
description "blackmarket fivem script by DEN"
author "DEN"
version "1"

shared_scripts {
	'shared/main.lua'
}

client_scripts {
	--- RageUI
	'RageUI/RMenu.lua',
    'RageUI/menu/RageUI.lua',
    'RageUI/menu/Menu.lua',
    'RageUI/menu/MenuController.lua',
    'RageUI/components/*.lua',
    'RageUI/menu/elements/*.lua',
    'RageUI/menu/items/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/windows/*.lua',
	'client/*.lua'
}

server_scripts {
	'server/*.lua',
    "Configweebhook.lua"
}
