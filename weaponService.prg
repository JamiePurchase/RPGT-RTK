include("weaponClass.prg")

function weaponCreate(strTemplate)
{
	strFile = "Data/Weapons/" + strTemplate + ".txt"
	txtData = ioOpen(strFile,"r")

	// Read Data
	strDetailName = ioRead(txtData)
	strDetailInfo = ioRead(txtData)
	intDamageBase = ioRead(txtData)
	strDamageType = ioRead(txtData)
	intRepairNow = ioRead(txtData)
	ioClose(txtData)

	// Create Object
	objWeapon = itemWeapon(strDetailName)
	objWeapon->setDetailInfo(strDetailInfo)
	objWeapon->setDamageBase(intDamageBase)
	objWeapon->setDamageType(strDamageType)
	objWeapon->setRepairNow(intRepairNow)
	objWeapon->setRepairMax(intRepairNow)

	// Kill Variables
	kill(strTemplate)
	kill(strFile)
	kill(txtData)
	kill(strDetailName)
	kill(strDetailInfo)
	kill(intDamageBase)
	kill(strDamageType)
	kill(intRepairNow)

	// Return Object
	return objWeapon
}

