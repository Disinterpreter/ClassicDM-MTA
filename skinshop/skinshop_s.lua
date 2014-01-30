--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

function playerBuySkin ( skinID )	
	if getPlayerMoney (client) >= tonumber (g_Skins[skinID]) then
    	takePlayerMoney (client, g_Skins[skinID])
    	setElementModel (client, tonumber (skinID))
    	--setAccountData ( getAccount ( client ), "ClassicDM.PlayerSkin", tonumber (skinID) )
	else
		outputChatBox ( "You don't have enough money", client )
	end
end
addEvent( "onPlayerBuySkin", true )
addEventHandler( "onPlayerBuySkin", root, playerBuySkin )
