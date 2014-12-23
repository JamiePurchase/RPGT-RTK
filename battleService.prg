autoLocal(true)
include("battleClass.prg")
include("partyService.prg")

function battleInit(strType,strLocation)
{
	// NOTE: Consider using pre-defined data for battles stored in text files?
	global(battleObject) = battle(strType,strLocation)
}

function battleAddParty()
{
	intArmyMax = partyGetCharacterCount()
	for(intArmyPos=1;intArmyPos<=intArmyMax;intArmyPos=intArmyPos+1)
	{
		objArmy = partyGetArmy(intArmyPos)
		global(battleObject)->addArmy(1,objArmy)
	}
	kill(intArmyMax)
	kill(intArmyPos)
}

function battleGetArmy(intForce,intArmy)
{
	return global(battleObject)->getArmy(intForce,intArmy)
}

function battleGetArmyCount(intForce)
{
	return global(battleObject)->getArmyCount(intForce)
}

function battleGetInfoArea()
{
	return global(battleObject)->getInfoArea()
}

function battleGetInfoType()
{
	return global(battleObject)->getInfoType()
}

function battleKill()
{
	global(battleObject)->release()
}

