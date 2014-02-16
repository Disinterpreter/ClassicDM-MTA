--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

SkinShop = {
    button = {},
    window = {},
    gridlist = {}
}

--
--Some important vars:
--SkinShop.gridlist[1] - gridlist
--SkinShop.button[1] - Buy
--SkinShop.button[2] - cancel
--

SkinShop.window[1] = guiCreateWindow(932, 279, 300, 416, "Skin shop", false)
guiWindowSetSizable(SkinShop.window[1], false)
SkinShop.gridlist[1] = guiCreateGridList(12, 30, 278, 313, false, SkinShop.window[1])
skinName = guiGridListAddColumn(SkinShop.gridlist[1], "Name", 0.4) -- Coloumn name
skinPrice = guiGridListAddColumn(SkinShop.gridlist[1], "Price", 0.4) -- Coloumn price
SkinShop.button[1] = guiCreateButton(16, 370, 96, 36, "Buy", false, SkinShop.window[1])
guiSetProperty(SkinShop.button[1], "NormalTextColour", "FFAAAAAA")
SkinShop.button[2] = guiCreateButton(184, 370, 96, 36, "Cancel", false, SkinShop.window[1])
guiSetProperty(SkinShop.button[2], "NormalTextColour", "FFAAAAAA")

guiSetVisible (SkinShop.window[1], false)

-- Gridlist
for k,v in pairs ( g_Skins ) do
    local skinRow = guiGridListAddRow ( SkinShop.gridlist[1] )
    guiGridListSetItemText ( SkinShop.gridlist[1], skinRow, skinName, getSkinNameFromId (k), false, false )
    guiGridListSetItemText ( SkinShop.gridlist[1], skinRow, skinPrice, tonumber (v), false, false )
end
-- Gridlist click
addEventHandler( "onClientGUIClick", SkinShop.gridlist[1],
    function (  )
    	local clickedSkin = guiGridListGetItemText ( SkinShop.gridlist[1], guiGridListGetSelectedItem ( SkinShop.gridlist[1] ), 1 )
    	local playerSkin = getSkinIdFromName (clickedSkin)
    	if playerSkin then setElementModel (localPlayer, tonumber (playerSkin)) end
    end, false
)

-- Button Buy
addEventHandler("onClientGUIClick", SkinShop.button[1],
    function (  )
    	if playerSkin then triggerServerEvent ( "onPlayerBuySkin", localPlayer, playerSkin ) end
        toggleAllControls ( true )
        guiSetVisible ( SkinShop.window[1], false )
        showCursor ( false )
        setElementAlpha ( eventMarker, 255 )
    end, false
)
-- Button cancel
addEventHandler("onClientGUIClick", SkinShop.button[2],
    function (  )
        toggleAllControls ( true )
        guiSetVisible ( SkinShop.window[1], false )
        showCursor ( false )
        setElementModel ( localPlayer, oldSkin )
        setElementAlpha ( eventMarker, 255 )
    end, false
)
-- Event Marker
function showSkinShop( hitPlayer )
    if hitPlayer == localPlayer then
        if not isPedInVehicle ( hitPlayer ) then
        	eventMarker = source
        	setElementAlpha ( eventMarker, 0 )
        	oldSkin = getElementModel ( localPlayer )
            toggleAllControls ( false )
            guiSetVisible (SkinShop.window[1], true)
            showCursor (true)
        end
    end
end

--Сycle
for k,v in pairs ( g_SkinShopMarker ) do
    skinshop = createMarker( g_SkinShopMarker[k][1], g_SkinShopMarker[k][2], g_SkinShopMarker[k][3] - 1, "cylinder", 2, 255, 0, 255 )
    addEventHandler ( "onClientMarkerHit", skinshop, showSkinShop )
end