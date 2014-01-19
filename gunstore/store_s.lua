function playerBuyWapon ( gunID )
	if getPlayerMoney ( client ) >= tonumber (g_Weapon[gunID]) then
    	takePlayerMoney ( client, g_Weapon[gunID] )
    	giveWeapon ( client, gunID )
	else
		outputChatBox ( "You don't have enough money", client )
	end
end
addEvent( "onPlayerBuyWeapon", true )
addEventHandler( "onPlayerBuyWeapon", root, playerBuyWapon )
