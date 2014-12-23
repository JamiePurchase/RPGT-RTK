class itemWeapon
{
	public:

		method itemWeapon(strName)
		{
			this->detailName = strName
		}

		method getDetailName()
		{
			return this->detailName
		}

		method getDetailInfo()
		{
			return this->detailInfo
		}

		method getDamageBase()
		{
			return this->damageBase
		}

		method getDamageType()
		{
			return this->damageType
		}

		method getRepairMax()
		{
			return this->repairMax
		}

		method getRepairNow()
		{
			return this->repairNow
		}
		
		method setDetailInfo(strInfo)
		{
			this->detailInfo = strInfo
		}

		method setDamageBase(intDamage)
		{
			this->damageBase = intDamage
		}

		method setDamageType(strType)
		{
			this->damageType = strType
		}

		method setRepairNow(intValue)
		{
			this->repairNow = intValue
		}

		method setRepairMax(intValue)
		{
			this->repairMax = intValue
		}
		
	private:
		
		var detailName
		var detailInfo
		var damageBase
		var damageType
		var repairNow
		var repairMax
		
}

