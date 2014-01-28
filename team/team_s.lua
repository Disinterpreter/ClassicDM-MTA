--
--The MIT License (MIT)
--Copyright (c) 2014 CoolDark
--
--See LICENSE file
--

function createBand ( pPlayer )
	triggerClientEvent ( "onBandShow", pPlayer )
end
--addCommandHandler ( "band", createBand )

function BandCreator ( teamName )
	local acc = getAccount (getElementData (client, "ClassicDM.AccName"))
	setAccountData ( acc, "ClassicDM.MyTeam", teamName )
    setElementData ( client, "ClassicDM.teamName", createTeam ( teamName ) )
    setPlayerTeam ( client, getElementData ( client, "ClassicDM.teamName" ) )
end
addEvent( "onBandCreate", true )
addEventHandler( "onBandCreate", root, BandCreator )