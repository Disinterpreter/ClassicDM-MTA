--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

function getSkinNameFromId( id )
	if tonumber ( id ) then
		if skins[tonumber (id)] then
			return skins[tonumber (id)];
		else
			return false;
		end
	end
end

function getSkinIdFromName( name )
	if tostring ( name ) then
		for k,v in pairs(skins) do
			if(v == name) then return k end
		end
	end
end