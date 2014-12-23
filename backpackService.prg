autoLocal(true)
include("backpackClass.prg")

function backpackInit()
{
	global(partyBackpack) = backpack()
}

function backpackAddWealth(intAmount)
{
	global(partyBackpack)->addWealth(intAmount)
}

function backpackAddWeapon(objWeapon)
{
	global(partyBackpack)->addWeapon(objWeapon)
	return global(partyBackpack)->getWeaponCount()
}

function backpackGetAccessArray()
{
	return global(partyBackpack)->getAccessArray()
}

function backpackGetAccessCount()
{
	return global(partyBackpack)->getAccessCount()
}

function backpackGetPotionArray()
{
	return global(partyBackpack)->getPotionArray()
}

function backpackGetPotionCount()
{
	return global(partyBackpack)->getPotionCount()
}

function backpackGetUniqueArray()
{
	return global(partyBackpack)->getUniqueArray()
}

function backpackGetUniqueCount()
{
	return global(partyBackpack)->getUniqueCount()
}

function backpackGetWealthCount()
{
	return global(partyBackpack)->getWealthCount()
}

function backpackGetWeaponArray()
{
	return global(partyBackpack)->getWeaponArray()
}

function backpackGetWeaponCount()
{
	return global(partyBackpack)->getWeaponCount()
}

function backpackLoad()
{
	global(partyBackpack) = backpack()
	global(partyBackpack)->addWealth(intWealthCount)
	// note: count will be done automatically as items are added during the individual load
}

function backpackSave()
{
	// Open File
	txtFile = ioOpen("Save/RTK-Backpack.txt","w")

	// Get Data
	intWealthCount = global(partyBackpack)->getWealthCount()
	intPotionCount = global(partyBackpack)->getPotionCount()
	intWeaponCount = global(partyBackpack)->getWeaponCount()
	intAccessCount = global(partyBackpack)->getAccessCount()
	intUniqueCount = global(partyBackpack)->getUniqueCount()

	// Write Data
	ioWrite(txtFile,"RTK Save Data")
	ioWrite(txtFile,intWealthCount)
	ioWrite(txtFile,intPotionCount)
	ioWrite(txtFile,intWeaponCount)
	ioWrite(txtFile,intAccessCount)
	ioWrite(txtFile,intUniqueCount)

	// Close File
	ioClose(txtFile)
	kill(txtFile)
}




