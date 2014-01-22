--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

addEventHandler ( "onPlayerQuit", root, 
	function ()
		local acc = getPlayerAccount( source )
		setAccountData ( acc, "ClassicDM.playerHealth", getElementHealth ( source ) )
		for i = 0,12 do
			setAccountData ( acc, "ClassicDM.playerweapon"..i, getPedWeapon (source, i) )
			setAccountData ( acc, "ClassicDM.playerweaponAmmo"..i, getPedTotalAmmo (source, i) )
		end
	end 
)

addEventHandler ( "onPlayerLogin", root, 
	function ()
		local acc = getPlayerAccount( source )
		if getAccountData (acc, "ClassicDM.playerweapon1") then
			for i = 0,12 do
				giveWeapon ( source, getAccountData ( acc, "ClassicDM.playerweapon"..i), getAccountData ( acc, "ClassicDM.playerweaponAmmo"..i) ) 
			end
		end
		if not getTeamFromName (  getAccountData ( acc, "ClassicDM.MyTeam" ) ) then
			setPlayerTeam ( source, getTeamFromName (  getAccountData ( acc, "ClassicDM.MyTeam" ) ) )
			setElementHealth ( source, getAccountData ( acc, "ClassicDM.playerHealth" ) )
		end
	end 
)