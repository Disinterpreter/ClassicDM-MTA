--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

local guns = { }
addEventHandler ( "onPlayerQuit", root, 
	function ()
		local guns = { }
		local ammo = { }
		for slot = 0, 12 do
			table.insert (guns, getPedWeapon ( source, slot ))
			table.insert (ammo, getPedTotalAmmo ( source, slot ))
		end
		jsonguns = toJSON(guns)
		jsonammo = toJSON(ammo)
		local acc = getPlayerAccount( source )
		setAccountData ( acc, "ClassicDM.Weapons", jsonguns )
		setAccountData ( acc, "ClassicDM.Ammo", jsonammo )
		--setAccountData ( acc, "ClassicDM.PlayerSkin", getElementModel ( source ) )
		setAccountData ( acc, "ClassicDM.playerHealth", getElementHealth ( source ) )
		setAccountData ( acc, "ClassicDM.Money", getPlayerMoney ( source ) )
		--for i = 0,12 do
		--	setAccountData ( acc, "ClassicDM.playerweapon"..i, getPedWeapon (source, i) )
		--	setAccountData ( acc, "ClassicDM.playerweaponAmmo"..i, getPedTotalAmmo (source, i) )
		--end
	end 
)

addEventHandler ( "onPlayerLogin", root, 
	function ()
		local acc = getPlayerAccount( source )
		if getElementData ( source, "ClassicDM.RegisterInfo" ) == 1 then
			setElementModel (source, getAccountData (acc, "ClassicDM.PlayerSkin") )
		else
			setElementModel ( source, getAccountData (acc, "ClassicDM.PlayerSkin") )
			givePlayerMoney ( source, getAccountData ( acc, "ClassicDM.Money" ) )
			setElementHealth ( source, getAccountData ( acc, "ClassicDM.playerHealth" ) )
			weapons = getAccountData ( acc, "ClassicDM.Weapons" )
			ammo = getAccountData ( acc, "ClassicDM.Ammo" )
			outputChatBox ( tostring (ammo) )
			for k,v in pairs ( fromJSON (weapons) ) do
				giveWeapon ( source, tonumber ( v ) ) 
			end	
			for k,v in pairs ( fromJSON (ammo) ) do
				setWeaponAmmo(source,fromJSON (weapons)[k],v)
			end
			--for i = 0,12 do
			--	giveWeapon ( source, getAccountData ( acc, "ClassicDM.playerweapon"..i), getAccountData ( acc, "ClassicDM.playerweaponAmmo"..i) ) 
			--end
			--if not getTeamFromName (  getAccountData ( acc, "ClassicDM.MyTeam" ) ) then
			--	setPlayerTeam ( source, getTeamFromName (  getAccountData ( acc, "ClassicDM.MyTeam" ) ) )
			--end
		end
	end 
)

function userWeap( pPlayer )
	outputChatBox ( myjsno )
	for k,v in pairs ( fromJSON (myjsno) ) do
		outputChatBox ( v.ammo )
	end
end
addCommandHandler ("guns", userWeap)