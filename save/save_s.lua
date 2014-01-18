addEventHandler ( "onPlayerQuit", root, 
	function ()
		local acc = getAccount (getElementData (source, "ClassicDM.AccName"))
		setAccountData ( acc, "ClassicDM.playerHealth", getElementHealth ( source ) )
		for i = 0,12 do
			setAccountData ( acc, "ClassicDM.playerweapon"..i, getPedWeapon (source, i) )
			setAccountData ( acc, "ClassicDM.playerweaponAmmo"..i, getPedTotalAmmo (source, i) )
		end
	end 
)

addEventHandler ( "onPlayerLogin", root, 
	function ()
		local acc = getAccount (getElementData (source, "ClassicDM.AccName"))
		if getAccountData (acc, "ClassicDM.playerweapon1") then
			setElementHealth ( source, getAccountData ( acc, "ClassicDM.playerHealth" ) )
			for i = 0,12 do
				giveWeapon ( source, getAccountData ( acc, "ClassicDM.playerweapon"..i), getAccountData ( acc, "ClassicDM.playerweaponAmmo"..i) ) 
			end
		end
	end 
)