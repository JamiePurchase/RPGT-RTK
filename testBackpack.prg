include("backpackClass.prg")
include("weaponClass.prg")

colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(255,255,255)
font("Times New Roman")
fontSize(14)

// Create a backpack object
myBackpack = backpackInit()
pixelText(10,10,"myBackpack is our backpack object")
writePosY = 10
wait()

// Call a method of the backpack object
strLine = "myBackpack contains " + myBackpack->getWeaponCount() + " weapons"
writeNext(strLine)

// Call another method
strLine = "myBackpack contains " + myBackpack->getPotionCount() + " potions"
writeNext(strLine)

// Create an Iron Sword weapon object
myWeapon = itemWeapon("Iron Sword")
writeNext("We created a new weapon object")

// Call a method on the weapon
strLine = "The weapon object is a " + myWeapon->getDetailName()
writeNext(strLine)

// Add the weapon to the backpack
myBackpack->addWeapon(myWeapon)
writeNext("We added an Iron Sword to the backpack")

// Check the number of weapons in the backpack
strLine = "Now there is " + myBackpack->getWeaponCount() + " weapon in the backpack"
writeNext(strLine)

windows()

function writeNext(strText)
{
	writePosY = writePosY + 16
	pixelText(10,writePosY,strText)
	wait()
	kill(strText)
}

