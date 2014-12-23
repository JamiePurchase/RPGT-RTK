autoLocal(true)
include("backpackService.prg")
include("characterService.prg")
include("partyService.prg")
include("weaponService.prg")

:New
if(testMode==1){branch(:NewData)}

:NewIntro
colorRGB(0,0,0)
fillRect(0,0,800,600)
setImage("Artwork/background2.png",0,0,800,600)
delay(1)
setImageTransparent("Artwork/parchment1.png",0,0,800,600,0,255,0)
colorRGB(0,0,0)
font("Segoe Script")
fontSize(32)
italics("on")
delay(0.5)
pixelText(230,200,"The pale sky is on the wane")
delay(1)
pixelText(235,250,"Next, a yellow one shall reign;")
delay(1)
pixelText(240,300,"The calendar's rotation")
delay(1)
pixelText(245,350,"Spells fortune for the nation.")
italics("off")
delay(5)
fade(2)

:NewPrologue
colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(255,255,255)
font("Segoe Script")
fontSize(64)
bold("on")
pixelText(50,420,"Prologue")
bold("off")
fontSize(46)
pixelText(50,485,"Rebellion of the Yellow Turbans")
delay(3)
fade(2)

:NewData
// Backpack
backpackInit()
backpackAddWealth(100)

// Weapons
objWeapon = weaponCreate("IronSword01")
backpackAddWeapon(objWeapon)

// Party
partyInit()
objHero = characterCreate("LiuBei")
partyAddCharacter(objHero)

// Stage00 (Prologue)
stageFound[0] = 1
stagePoint[0][1] = 1

// Troops
troopFound[0]

// Menu
menuPauseOptionDisabled[3] = 1
menuPauseOptionDisabled[4] = 1
menuPauseOptionDisabled[5] = 1

