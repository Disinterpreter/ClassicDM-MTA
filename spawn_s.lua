addEventHandler ("onPlayerLogin", root, 
	function ()
		fadeCamera(source, true)
		setCameraTarget(source, source)
		spawnPlayer (source, 0,0,25)
	end 
)