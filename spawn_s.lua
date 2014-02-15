--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

addEventHandler ("onPlayerLogin", root, 
	function ()
		fadeCamera(source, true)
		setCameraTarget(source, source)
		iRandom = math.random (#positions)
		spawnPlayer (source, positions[iRandom][1],positions[iRandom][2],positions[iRandom][3])
	end 
)

addEventHandler ("onPlayerLogout", root, 
	function ()
		fadeCamera(source, false)
	end
)

addEventHandler ("onPlayerSpawn", root,
	function ()
		setElementModel (source, getAccountData (getPlayerAccount (source), "ClassicDM.PlayerSkin"))
		giveWeapon (source, 22, 100)
	end
)