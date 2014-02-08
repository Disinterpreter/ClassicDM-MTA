--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--


RegisterInfo = {
    button = {},
    window = {},
    label = {}
}
GUIEditor = {
    button = {},
    window = {},
    label = {},
    edit = {}
}

--
--Some important vars:
--GUIEditor.edit[1]  - editor nickname
--GUIEditor.edit[2] - editor password
--GUIEditor.button[1] - button Login
--RegisterInfo.button[1] - cancel Register
--RegisterInfo.button[2] - button Register
--

----------Register and login GUI------
GUIEditor.window[1] = guiCreateWindow(446, 365, 317, 264, "", false)
guiWindowSetSizable(GUIEditor.window[1], false)

GUIEditor.edit[1] = guiCreateEdit(139, 93, 121, 26, getPlayerName (localPlayer), false, GUIEditor.window[1])
GUIEditor.edit[2] = guiCreateEdit(139, 129, 121, 26, "", false, GUIEditor.window[1])
GUIEditor.button[1] = guiCreateButton(226, 206, 81, 34, "OK!", false, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
GUIEditor.button[2] = guiCreateButton(9, 204, 79, 36, "Guest", false, GUIEditor.window[1])
guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
GUIEditor.label[1] = guiCreateLabel(96, 98, 33, 16, "Login:", false, GUIEditor.window[1])
GUIEditor.label[2] = guiCreateLabel(72, 129, 57, 16, "Password:", false, GUIEditor.window[1])
guiEditSetMasked ( GUIEditor.edit[2], true )

RegisterInfo.window[1] = guiCreateWindow(376, 390, 470, 174, "Account not registered", false)
guiWindowSetSizable(RegisterInfo.window[1], false)

RegisterInfo.label[1] = guiCreateLabel(33, 46, 383, 36, "Account not found, you want register it?", false, RegisterInfo.window[1])
RegisterInfo.button[2] = guiCreateButton(316, 119, 100, 34, "Yes", false, RegisterInfo.window[1])
guiSetProperty(RegisterInfo.button[2], "NormalTextColour", "FFAAAAAA")
RegisterInfo.button[1] = guiCreateButton(23, 119, 100, 34, "No", false, RegisterInfo.window[1])
guiSetProperty(RegisterInfo.button[1], "NormalTextColour", "FFAAAAAA")
--------------------------------------

showCursor (true)
guiSetVisible (RegisterInfo.window[1], false)

-- Login callback
addEventHandler("onClientGUIClick", GUIEditor.button[1],
    function ()
        sLogin = guiGetText (GUIEditor.edit[1])
        sPassword = guiGetText (GUIEditor.edit[2])
        if string.len (sPassword) >= 3 then
            setElementData (localPlayer, "ClassicDM.AccName", sLogin)
            triggerServerEvent ( "onGuiLogin", localPlayer, sLogin, sPassword )
        else
            outputChatBox ( "short password" )
        end
    end, false
)

-- Register callback
addEventHandler("onClientGUIClick", RegisterInfo.button[2],
    function ()
        triggerServerEvent ( "onGuiRegistration", localPlayer, sLogin, sPassword )
        triggerServerEvent ( "onGuiLogin", localPlayer, sLogin, sPassword )
        guiSetVisible (RegisterInfo.window[1], false)
        --showCursor (false)
    end, false
)

-- Cancel callback
addEventHandler("onClientGUIClick", RegisterInfo.button[1],
    function ()
        guiSetVisible (RegisterInfo.window[1], false)
    end, false
)

--Check register/login/incorrect data
addEvent( "onPlayerRegister", true )
addEventHandler( "onPlayerRegister", getRootElement(), 
function( player )
    if getElementData ( localPlayer, "ClassicDM.Check" ) == true then
        guiSetVisible (GUIEditor.window[1], false)
    elseif getElementData ( localPlayer, "ClassicDM.Check" ) == false then
        --outputChatBox ("Incorrect Passwrod")
    elseif getElementData ( localPlayer, "ClassicDM.Check" ) == "notRegister" then
        guiSetVisible (RegisterInfo.window[1], true)
        guiMoveToBack( GUIEditor.window[1] )
        --triggerServerEvent ( "onGuiRegistration", localPlayer, sLogin, sPassword )
    end 
end )