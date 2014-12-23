include("backpackService.prg")

// Create Backpack
backpackInit()

// Add Wealth
backpackAddWealth(100)

// Save Backpack
backpackSave()

// Load Backpack
backpackLoad()
intWealthCount = backpackGetWealthCount()
intPotionCount = backpackGetPotionCount()
intWeaponCount = backpackGetWeaponCount()
intAccessCount = backpackGetAccessCount()
intUniqueCount = backpackGetUniqueCount()

// Draw Backpack
colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(0,100,0)
font("Times New Roman")
fontSize(32)
bold("on")
pixelText(50,25,"Backpack Data")
bold("off")
pixelText(50,80,"Wealth")
pixelText(125,80,intWealthCount)
pixelText(50,115,"Potions")
pixelText(125,115,intPotionCount)
pixelText(50,150,"Weapons")
pixelText(125,150,intWeaponCount)
pixelText(50,185,"Accessories")
pixelText(125,185,intAccessCount)
pixelText(50,230,"Key Items")
pixelText(125,230,intUniqueCount)

wait()
windows()
