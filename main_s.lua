g_Players = NULL;
 
function OnResourceStart()
    g_Players = {};
   
    for x, pPlayer in ipairs( getElementsByType( "player" ) ) do
        g_Players[ x ] = pPlayer;
       
        setElementData( pPlayer, "ID", x );
    end
end
addEventHandler ( "onResourceStart", getRootElement(), OnResourceStart )
function OnPlayerQuit()
    g_Players[ getElementData( source, "ID" ) or 0 ] = NULL;
end

addEventHandler ( "onPlayerQuit", getRootElement(), OnPlayerQuit )

function OnPlayerJoin()
    exports.scoreboard:scoreboardAddColumn( "ID" )

	local iID = 0;
    for x in ipairs( g_Players ) do
        iID = x;
    end
    iID = iID + 1;
    g_Players[ iID ] = source;
    setElementData( source, "ID", iID );
    --outputChatBox (getElementData(source, "ID"))
end
addEventHandler("onPlayerJoin", getRootElement(), OnPlayerJoin)

addEventHandler ( "onPlayerWasted", root,
	function ( ammo, killer, killerWeap )
		if killer and getElementType(killer) == "player" and getElementType(source) == "player" then
			takePlayerMoney ( source, 50 )
			givePlayerMoney ( killer, 50 )
			setTimer( spawnPlayer, 2000, 1, source, positions[iRandom][1], positions[iRandom][2], positions[iRandom][3] )
		end
		setTimer( spawnPlayer, 2000, 1, source, positions[iRandom][1], positions[iRandom][2], positions[iRandom][3] )
	end
)

addEventHandler ( "onPlayerSpawn", root,
	function ()
		setElementModel ( source, getAccountData (getPlayerAccount (source), "ClassicDM.PlayerSkin") )
	end
)