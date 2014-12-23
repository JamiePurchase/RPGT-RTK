include("backpackService.prg")
include("characterService.prg")
include("partyService.prg")
include("weaponService.prg")

// Create Backpack
backpackInit()
backpackAddWealth(100)
objWeapon = weaponCreate("IronSword01")
intWeaponPos = backpackAddWeapon(objWeapon)

// Create Party
partyInit()
objHero = characterCreate("LiuBei")
objHero->equipWeapon(intWeaponPos)
partyAddCharacter(objHero)

// Execute Pause Menu
run("gamePause.prg")
