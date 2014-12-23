class character
{
	public:

		method character(strInfoName)
		{
			this->infoName = strInfoName
			this->statHPC = 0
			this->statHPM = 0
			this->rankLVL = 0
			this->rankEXP = 0
			this->rankREQ = 0
		}

		method equipWeapon(intWeaponRef)
		{
			// NOTE: Consider what to do if the character already has a weapon equipped
			this->itemWeapon = intWeaponRef

			// NOTE: Consider how to mark the weapon as being equipped to this character
			// weapon set equipped this->

			kill(intWeaponRef)
		}

		method getInfoName()
		{
			return this->infoName
		}

		method getRankLVL()
		{
			return this->rankLVL
		}

		method getStatHPC()
		{
			return this->statHPC
		}

		method getStatHPM()
		{
			return this->statHPC
		}

		method setRankLVL(intAmount)
		{
			this->rankLVL = intAmount
			kill(intAmount)
		}

		method setStatHPC(intAmount)
		{
			this->statHPC = intAmount
			kill(intAmount)
		}

		method setStatHPM(intAmount)
		{
			this->statHPC = intAmount
			kill(intAmount)
		}
		
	private:
		
		var infoName
		var itemAccess[]
		var itemWeapon
		var rankEXP
		var rankLVL
		var rankREQ
		var statHPC
		var statHPM
}
