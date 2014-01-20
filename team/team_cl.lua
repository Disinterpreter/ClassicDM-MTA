--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--


GUIBand = {
    edit = {},
    button = {},
    window = {},
    label = {},
    gridlist = {}
}

GUIBand.window[1] = guiCreateWindow(365, 300, 485, 392, "", false)
guiWindowSetSizable(GUIBand.window[1], false)

GUIBand.edit[1] = guiCreateEdit(89, 60, 123, 24, "", false, GUIBand.window[1])
GUIBand.button[1] = guiCreateButton(132, 94, 80, 33, "Create band", false, GUIBand.window[1])
guiSetProperty(GUIBand.button[1], "NormalTextColour", "FFAAAAAA")
GUIBand.gridlist[1] = guiCreateGridList(29, 138, 183, 231, false, GUIBand.window[1])
guiGridListAddColumn(GUIBand.gridlist[1], "Players", 0.9)
GUIBand.button[2] = guiCreateButton(367, 329, 103, 40, "Leave band", false, GUIBand.window[1])
guiSetProperty(GUIBand.button[2], "NormalTextColour", "FFAAAAAA")
GUIBand.label[1] = guiCreateLabel(42, 61, 37, 19, "Name:", false, GUIBand.window[1])
GUIBand.button[3] = guiCreateButton(32, 94, 80, 33, "Invite", false, GUIBand.window[1])
guiSetProperty(GUIBand.button[3], "NormalTextColour", "FFAAAAAA")
GUIBand.button[4] = guiCreateButton(222, 60, 80, 33, "Invite band", false, GUIBand.window[1])
guiSetProperty(GUIBand.button[4], "NormalTextColour", "FFAAAAAA")
GUIBand.button[5] = guiCreateButton(402, 30, 73, 34, "Exit", false, GUIBand.window[1])
guiSetProperty(GUIBand.button[5], "NormalTextColour", "FFAAAAAA")
guiSetVisible ( GUIBand.window[1], false )

addEventHandler("onClientGUIClick", GUIBand.button[1],
    function ()
    sName = guiGetText ( GUIBand.edit[1] )
    triggerServerEvent ( "onBandCreate", localPlayer, sName )
    end, false
)

addEventHandler("onClientGUIClick", GUIBand.button[5],
    function ()
    guiSetVisible ( GUIBand.window[1], false )
    showCursor ( false )
    end, false
)

function bandShow (  )
    guiSetVisible ( GUIBand.window[1], true )
    showCursor ( true )
end
addEvent( "onBandShow", true )
addEventHandler( "onBandShow", root, bandShow )