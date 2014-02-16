--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

addEventHandler ("onPlayerLogin", root, 
	function (  )
		fadeCamera( source, true )
		setCameraTarget( source, source )
		iRandom = math.random ( #g_Positions )
		spawnPlayer ( source, g_Positions[iRandom][1],g_Positions[iRandom][2],g_Positions[iRandom][3] )
	end 
)

addEventHandler ( "onPlayerLogout", root, 
	function (  )
		fadeCamera( source, false )
	end
)

addEventHandler ( "onPlayerSpawn", root,
	function (  )
		setElementModel ( source, getAccountData (getPlayerAccount (source), "ClassicDM.PlayerSkin") )
		giveWeapon ( source, 22, 100 )
	end
)