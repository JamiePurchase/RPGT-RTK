class battle
{
	public:
		
		method battle(strType,strArea)
		{
			this->infoType = strType
			this->infoArea = strArea
			this->armyCount[1] = 0
			this->armyCount[2] = 0
			this->timeTurns = 0
		}

	method addArmy(intForce,objArmy)
	{
		intArmy = this->armyCount[intForce] + 1
		this->armyArray[intForce][intArmy] = objArmy
		this->armyCount[intForce] = intArmy
		kill(intForce)
	}

	method getArmy(intForce,intArmy)
	{
		return this->armyArray[intForce][intArmy]
	}

	method getArmyCount(intForce)
	{
		return this->armyCount[intForce]
	}

	method getInfoArea()
	{
		return this->infoArea
	}

	method getInfoType()
	{
		return this->infoType
	}
	
	private:

		var armyArray[]
		var armyCount[]
		var infoArea
		var infoType
		var timeTurns
		
}
