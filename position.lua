function savePos( pPlayer )
	local x,y,z = getElementPosition (pPlayer)
	outputChatBox ( x.. ",".. y .. ",".. z, pPlayer )
end
addCommandHandler ("savePos", savePos)