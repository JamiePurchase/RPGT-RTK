class backpack
{
	
	public:
		
		method backpack()
		{
			this->wealthCount = 0
			this->potionCount = 0
			this->weaponCount = 0
			this->accessCount = 0
			this->uniqueCount = 0
		}

		method addWealth(intAmount)
		{
			this->wealthCount = this->wealthCount + intAmount
			kill(intAmount)
		}
		
		method addWeapon(objWeapon)
		{
			pos = this->getWeaponCount() + 1
			this->weaponArray[pos] = objWeapon
			this->weaponCount = this->weaponCount + 1
		}

	method getAccessCount()
	{
		return this->accessCount
	}
	
	method getPotionCount()
	{
		return this->potionCount
	}

	method getUniqueCount()
	{
		return this->uniqueCount
	}

	method getWealthCount()
	{
		return this->wealthCount
	}

	method getWeaponCount()
	{
		return this->weaponCount
	}
	
	private:
		
		var accessArray[]
		var accessCount
		var potionArray[]
		var potionCount
		var uniqueArray[]
		var uniqueCount
		var wealthCount
		var weaponArray[]
		var weaponCount
		
	}


