--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

g_Store = {
    gridlist = {},
    window = {},
    button = {}
}

g_Store.window[1] = guiCreateWindow(475, 300, 402, 383, "", false)
guiWindowSetSizable(g_Store.window[1], false)

g_Store.gridlist[1] = guiCreateGridList(12, 27, 268, 279, false, g_Store.window[1])
NameColoumn = guiGridListAddColumn(g_Store.gridlist[1], "Name", 0.5)
PriceColoumn = guiGridListAddColumn(g_Store.gridlist[1], "Price", 0.5)
g_Store.button[1] = guiCreateButton(296, 335, 96, 38, "Exit", false, g_Store.window[1])
guiSetProperty(g_Store.button[1], "NormalTextColour", "FFAAAAAA")
g_Store.button[2] = guiCreateButton(296, 287, 96, 38, "Buy", false, g_Store.window[1])
guiSetProperty(g_Store.button[2], "NormalTextColour", "FFAAAAAA")
guiSetVisible (g_Store.window[1], false)

for k,v in pairs ( g_Weapon ) do
	local row = guiGridListAddRow (g_Store.gridlist[1])
	guiGridListSetItemText ( g_Store.gridlist[1], row, NameColoumn, getWeaponNameFromID (k), false, false )
	guiGridListSetItemText ( g_Store.gridlist[1], row, PriceColoumn, tonumber (v), false, false )
end

addEventHandler("onClientGUIClick", g_Store.gridlist[1],
    function ()
    	local ClickedWeaponName = guiGridListGetItemText ( g_Store.gridlist[1], guiGridListGetSelectedItem ( g_Store.gridlist[1] ), 1 )
		ClickGunId = getWeaponIDFromName ( ClickedWeaponName )
    end, false
)

addEventHandler("onClientGUIClick", g_Store.button[1],
    function ()
        toggleAllControls ( true )
    	guiSetVisible (g_Store.window[1], false)
    	showCursor (false)
    end, false
)

addEventHandler("onClientGUIClick", g_Store.button[2],
    function ()
        triggerServerEvent ( "onPlayerBuyWeapon", localPlayer, ClickGunId )
        setPedWeaponSlot ( localPlayer, getSlotFromWeapon ( ClickGunId ) )
        --toggleAllControls ( true )
        --guiSetVisible (g_Store.window[1], false)
        --showCursor (false)
    end, false
)

function showMarkers( hitPlayer )
    if hitPlayer == localPlayer then
        toggleAllControls ( false )
        guiSetVisible (g_Store.window[1], true)
        showCursor (true)
    end
end
for k,v in pairs ( g_WeaponMarker ) do
	markers = createMarker(g_WeaponMarker[k][1], g_WeaponMarker[k][2], g_WeaponMarker[k][3] - 1, "cylinder", 2, 255, 0, 0)
	addEventHandler ( "onClientMarkerHit", markers, showMarkers )
end


