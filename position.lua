function savePos( pPlayer )
	local x,y,z = getElementPosition (pPlayer)
	outputChatBox (x.. ",".. y .. ",".. z)
end
addCommandHandler ("savePos", savePos)