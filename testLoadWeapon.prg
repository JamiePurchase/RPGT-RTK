include("weaponService.prg")

:File
colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(0,100,0)
font("Times New Roman")
fontSize(32)
bold("on")
pixelText(50,25,"Weapon Data")
bold("off")

:FilePrompt
strPrompt = prompt("Please enter the item to load (eg: IronSword)")
strFile = "Data/Weapons/" + strPrompt + ".txt"
strTitle = "Weapon Data: " + strFile

:FileTitle
colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(0,100,0)
font("Times New Roman")
fontSize(32)
bold("on")
pixelText(50,25,strTitle)
bold("off")

// Open File
txtData = ioOpen(strFile,"r")
strDetailName = ioRead(txtData)

// Create Object
objWeapon = weaponCreate(strPrompt)
strDetailName = objWeapon->getDetailName()
strDetailInfo = objWeapon->getDetailInfo()
intDamageBase = objWeapon->getDamageBase()
strDamageType = objWeapon->getDamageType()
intRepairMax = objWeapon->getRepairMax()

// Draw Item
pixelText(50,80,"Item Name")
pixelText(250,80,strDetailName)
pixelText(50,115,"Information")
pixelText(250,115,strDetailInfo)
pixelText(50,150,"Damage (Base)")
pixelText(250,150,intDamageBase)
pixelText(50,185,"Damage Type")
pixelText(250,185,strDamageType)
pixelText(50,220,"Repair Max")
pixelText(250,220,intRepairMax)

wait()
windows()

