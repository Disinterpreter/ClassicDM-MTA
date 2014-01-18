function getAccountAlive( sName, sPassword )
	if type ( getAccount ( sName ) ) == "userdata" then
		local logInAcc = logIn ( client, getAccount ( sName ), sPassword )
		setElementData (client, "ClassicDM.Check", logInAcc)
	else
		setElementData (client, "ClassicDM.Check", "notRegister")
	end
	triggerClientEvent ( "onPlayerRegister", client, client )
end
addEvent( "onGuiLogin", true )
addEventHandler( "onGuiLogin", root, getAccountAlive )

function addAccoutnToGui ( sLogin, sPassword )
	addAccount ( sLogin, sPassword )
end
addEvent( "onGuiRegistration", true )
addEventHandler( "onGuiRegistration", root, addAccoutnToGui )