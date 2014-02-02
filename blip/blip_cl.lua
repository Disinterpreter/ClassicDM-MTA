addEventHandler("onClientResourceStart", getRootElement(), 
	function ()
		for k,v in ipairs (getElementsByType ("vehicle")) do
			createBlipAttachedTo ( v, 0, 2, 255, 255, 255, 40, 0, 200.0, getRootElement() )
		end
	end
)