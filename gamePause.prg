include("backpackService.prg")
include("extendDraw.prg")

// Test
include("extendDebug.prg")

:Pause
pauseInit()
branch(:PauseBuild)

:PauseBuild
pauseBuild()
branch(:PauseDraw)

:PauseDraw
pauseDraw()
branch(:PauseWait)

:PauseWait
intResult = pauseWait()
// Note: Move this?
if(intResult==1){branch(:PauseDraw)}
if(intResult==2){branch(:PauseSelect)}
if(intResult==3)
{
	if(pauseMenuSub==0)
	{
		branch(:PauseDone)
	}
	else
	{
		// NOTE: This will need to be changed when multiple layers are developed (ie: main -> item -> weapon -> options)
		pauseMenuSub = 0
		branch(:PauseDraw)
	}
}
if(intResult==4){branch(:PauseDraw)}
branch(:PauseWait)

:PauseSelect
if(pauseMenuSub==0){branch(:PauseSelectMain)}
if(pauseMenuSub==1){branch(:PauseSelectInventory)}
if(pauseMenuSub==2){branch(:PauseSelectEquipment)}

:PauseSelectMain
if(pauseMenuRowPos[0]<8)
{
	pauseMenuSub = pauseMenuRowPos[0]
	branch(:PauseBuild)
}
if(pauseMenuRowPos[0]==8){branch(:PauseDone)}

:PauseSelectInventory
// TBD

:PauseSelectEquipment
// TBD

:PauseSelectAbilities
// TBD

:PauseSelectTroops
// TBD

:PauseSelectMission
// TBD

:PauseSelectJournal
// TBD

:PauseSelectOptions
// TBD

:PauseDone
pauseKill()

function pauseBuild()
{
	// Debug
	strDebug = "pauseBuild executed when pauseMenuSub = " + pauseMenuSub
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	if(pauseMenuSub==0){pauseBuildMain()}
	if(pauseMenuSub==1){pauseBuildInventory()}
	if(pauseMenuSub==2){pauseBuildEquipment()}
	if(pauseMenuSub==3){pauseBuildAbilities()}
	if(pauseMenuSub==4){pauseBuildTroops()}
	if(pauseMenuSub==5){pauseBuildMissions()}
	if(pauseMenuSub==6){pauseBuildJournal()}
	if(pauseMenuSub==7){pauseBuildOptions()}
}

function pauseBuildAbilities()
{
	// TBD
}

function pauseBuildEquipment()
{
	// Debug
	strDebug = "pauseBuildEquipment executed"
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	// Build Frame
	createCanvas(800,600,pauseCanvasEquipment)
	drawCanvas(pauseCanvasBkg,0,0,800,600,pauseCanvasEquipment)
	drawFrame(25,50,775,450,pauseCanvasEquipment)

	// NOTE: Expand this to handle multiple characters

	// Load Details
	strWeapon = "Iron Sword"
	strAccess[1] = "None"
	strAccess[2] = "None"

	// Build Details
	colorRGB(0,0,0)
	font("Segoe Script")
	fontSize(32)
	pixelText(200,100,"Weapon",pauseCanvasEquipment)
	pixelText(350,100,strWeapon,pauseCanvasEquipment)
	pixelText(200,150,"Accessories",pauseCanvasEquipment)
	pixelText(350,150,strAccess[1],pauseCanvasEquipment)
	pixelText(350,185,strAccess[2],pauseCanvasEquipment)

	// Define Cursor
	pauseMenuRowPos[2] = 1
	pauseMenuRowMax[2] = 3
	pauseMenuMoveLR[2] = 0
	// NOTE: Might want to do this ONLY when the value isn't already something other than 0 (to preserve previous selection)
}

function pauseBuildInventory()
{
	// Debug
	strDebug = "pauseBuildInventory executed"
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	// Build Frame
	createCanvas(800,600,pauseCanvasInventory)
	drawCanvas(pauseCanvasBkg,0,0,800,600,pauseCanvasInventory)
	drawFrame(25,50,775,450,pauseCanvasInventory)

	// Build Categories
	//

	// Build Item List
	intRowMax = pauseBuildInventoryItems()

	// Define Cursor
	pauseMenuRowPos[1] = 1
	pauseMenuRowMax[1] = intRowMax
	pauseMenuColPos[1] = 2
	pauseMenuColMax[1] = 4
	pauseMenuMoveLR[1] = 1
	// NOTE: Might want to do this ONLY when the value isn't already something other than 0 (to preserve previous selection)
}

function pauseBuildInventoryItems()
{
	// Get Data
	if(pauseMenuColPos[1]==1)
	{
		arrItemArray = backpackGetPotionArray()
		intItemCount = backpackGetPotionCount()
	}
	if(pauseMenuColPos[1]==2)
	{
		arrItemArray = backpackGetWeaponArray()
		intItemCount = backpackGetWeaponCount()
	}
	if(pauseMenuColPos[1]==3)
	{
		arrItemArray = backpackGetAccessArray()
		intItemCount = backpackGetAccessCount()
	}
	if(pauseMenuColPos[1]==4)
	{
		arrItemArray = backpackGetUniqueArray()
		intItemCount = backpackGetUniqueCount()
	}

	// Draw List
	colorRGB(0,0,0)
	font("Segoe Script")
	fontSize(32)
	for(intItem=1;intItem<=intItemCount;intItem=intItem+1)
	{
		intPosY = 35 * intItem + 100
		strItemName = arrItemArray[intItem]->getDetailName()
		pixelText(100,intPosY,strItemName,pauseMenuCanvasInventory)
	}

	// Return Item Count for Row Max
	return(intItemCount)
}

function pauseBuildJournal()
{
	// TBD
}

function pauseBuildMain()
{
	// Debug
	strDebug = "pauseBuildMain executed"
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	pauseBuildMainOptions()
	pauseBuildMainInfo()
}

function pauseBuildMainOptions()
{
	pauseMenuOption[1] = "INVENTORY"
	pauseMenuOption[2] = "EQUIPMENT"
	pauseMenuOption[3] = "ABILITIES"
	pauseMenuOption[4] = "TROOPS"
	pauseMenuOption[5] = "MISSIONS"
	pauseMenuOption[6] = "JOURNAL"
	pauseMenuOption[7] = "OPTIONS"
	pauseMenuOption[8] = "CLOSE"
	createCanvas(800,600,pauseCanvasMain)
	drawCanvas(pauseCanvasBkg,0,0,800,600,pauseCanvasMain)
	drawFrame(25,50,300,450,pauseCanvasMain)
	colorRGB(0,0,0)
	font("Segoe Script")
	fontSize(32)
	pixelText(65,60,pauseMenuOption[1],pauseCanvasMain)
	pixelText(65,110,pauseMenuOption[2],pauseCanvasMain)
	pixelText(65,160,pauseMenuOption[3],pauseCanvasMain)
	pixelText(65,210,pauseMenuOption[4],pauseCanvasMain)
	pixelText(65,260,pauseMenuOption[5],pauseCanvasMain)
	pixelText(65,310,pauseMenuOption[6],pauseCanvasMain)
	pixelText(65,360,pauseMenuOption[7],pauseCanvasMain)
	pixelText(65,410,pauseMenuOption[8],pauseCanvasMain)
	pauseMenuRowPos[0] = 1
	pauseMenuRowMax[0] = 8
	pauseMenuMoveLR[0] = 0
}

function pauseBuildMainInfo()
{
	createCanvas(800,600,pauseCanvasInfo)
	colorRGB(0,255,0)
	fillRect(0,0,800,600,pauseCanvasInfo)
	colorRGB(15,50,15)
	drawRect(26,476,776,576,pauseCanvasInfo)
	drawRect(27,477,777,577,pauseCanvasInfo)
	colorRGB(57,150,44)
	fillRect(25,474,775,575,pauseCanvasInfo)
	colorRGB(0,0,0)
	drawRect(25,474,775,575,pauseCanvasInfo)
	colorRGB(0,0,0)
	font("Segoe Script")
	fontSize(32)
	pixelText(50,485,"Some more text can go in this new frame.",pauseCanvasInfo)
}

function pauseBuildMissions()
{
	// TBD
}

function pauseBuildOptions()
{
	// TBD
}

function pauseBuildTroops()
{
	// TBD
}

function pauseDraw()
{
	// Debug
	strDebug = "pauseDraw executed when pauseMenuSub = " + pauseMenuSub
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	if(pauseMenuSub==0){pauseDrawMain()}
	if(pauseMenuSub==1){pauseDrawInventory()}
	if(pauseMenuSub==2){pauseDrawEquipment()}
	if(pauseMenuSub==3){pauseDrawAbilities()}
	if(pauseMenuSub==4){pauseDrawTroops()}
	if(pauseMenuSub==5){pauseDrawMissions()}
	if(pauseMenuSub==6){pauseDrawJournal()}
	if(pauseMenuSub==7){pauseDrawOptions()}
}

function pauseDrawAbilities()
{
	// TBD
}

function pauseDrawEquipment()
{
	// Debug
	strDebug = "pauseDrawEquipment executed"
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	drawCanvas(pauseCanvasEquipment,0,0)
	// TBD: Cursor
}

function pauseDrawInventory()
{
	// Debug
	strDebug = "pauseDrawInventory executed"
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	drawCanvas(pauseCanvasInventory,0,0)
	// TBD: Cursor
}

function pauseDrawJournal()
{
	// TBD
}

function pauseDrawMain()
{
	// Debug
	strDebug = "pauseDrawMain executed"
	debugLogAdd(strDebug)
	kill(strDebug)
	// Debug End

	drawCanvas(pauseCanvasMain,0,0,800,600)
	drawCanvasTransparent(pauseCanvasInfo,0,0,0,255,0,800,600)
	intRow = pauseMenuRowPos[0]
	intPosY = 50 * intRow + 1
	colorRGB(46,191,38)
	if(menuPauseOptionDisabled[intRow]==1){colorRGB(119,154,107)}
	fillRect(26,intPosY,299,intPosY+48)
	colorRGB(0,0,0)
	font("Segoe Script")
	fontSize(32)
	bold("on")
	pixelText(65,intPosY+9,pauseMenuOption[intRow])
	bold("off")
	kill(intRow)
	kill(intPosY)
}

function pauseDrawMissions()
{
	// TBD
}

function pauseDrawOptions()
{
	// TBD
}

function pauseDrawTroops()
{
	// TBD
}

function pauseInit()
{
	// Save Screen
	createCanvas(800,600,pauseCanvasBkg)
	canvasGetScreen(pauseCanvasBkg)

	// Initial Menu
	pauseMenuSub = 0
}

function pauseKill()
{
	// Kill
}

function pauseWait()
{
	intResult = 0
	strKey = wait()

	// Debug
	if(strKey=="d"){debugLogDraw()}
	// Debug End

	if(strKey=="ENTER" || strKey==" "){intResult = 2}
	if(strKey=="ESC"){intResult = 3}
	if(strKey=="UP" && pauseMenuRowPos[pauseMenuSub]>1)
	{
		pauseMenuRowPos[pauseMenuSub] = pauseMenuRowPos[pauseMenuSub] - 1
		intResult = 1
	}
	if(strKey=="DOWN" && pauseMenuRowPos[pauseMenuSub]<pauseMenuRowMax[pauseMenuSub])
	{
		pauseMenuRowPos[pauseMenuSub] = pauseMenuRowPos[pauseMenuSub] + 1
		intResult = 1
	}
	if(strKey=="LEFT" && pauseMenuMoveLR[pauseMenuSub]==1)
	{
		if(pauseMenuColPos[pauseMenuSub]>1)
		{
			pauseMenuColPos[pauseMenuSub] = pauseMenuColPos[pauseMenuSub] - 1
			intResult = 4
		}
	}
	if(strKey=="RIGHT" && pauseMenuMoveLR[pauseMenuSub]==1)
	{
		if(pauseMenuColPos[pauseMenuSub]<pauseMenuColMax[pauseMenuSub])
		{
			pauseMenuColPos[pauseMenuSub] = pauseMenuColPos[pauseMenuSub] + 1
			intResult = 4
		}
	}
	return(intResult)
}

