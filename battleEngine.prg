include("battleService.prg")

//---------------------------------------------------> Initial Setup

:BattleBuild
battleBuild()

//---------------------------------------------------> Strategy Phase (Player)

:BattleDraw
battleDraw()

:BattleWait
wait()

//---------------------------------------------------> Strategy Phase (AI)

//---------------------------------------------------> Combat Phase

//---------------------------------------------------> Victory

//---------------------------------------------------> Defeat

// TEMPORARY FUNCTIONS (move these)

function battleBuild()
{
	colorRGB(228,231,134)
	fillRect(0,0,800,600)
	strImage = "Battle/Background/" + battleGetLocation + ".png"
	setImage(strImage,0,0,800,600)
	kill(strImage)
}

function battleDraw()
{
	battleDrawUnits()
	battleDrawInfo(1)
	battleDrawInfo(2)
}

function battleDrawInfo(intForce)
{
	if(intForce==1)
	{
		colorRGB(57,150,44)
		fillRect(0,500,200,575)
		colorRGB(0,0,0)
		drawRect(-1,500,200,575)
		colorRGB(0,0,0)
		font("Segoe Script")
		fontSize(26)
		bold("on")
		pixelText(10,545,"Liu Bei's Forces")
		bold("off")
	}
	if(intForce==2)
	{
		colorRGB(169,39,24)
		fillRect(600,500,800,575)
		colorRGB(0,0,0)
		drawRect(600,500,800,575)
		colorRGB(0,0,0)
		font("Segoe Script")
		fontSize(26)
		bold("on")
		pixelText(610,545,"Yellow Turban Rebels")
		bold("off")
	}
}

function battleDrawUnits()
{
	setImageTransparent("Battle/Allies/LiuBeiIdle1.png",50,100,64,32,0,255,0)
	setImageTransparent("Battle/Enemies/YellowTurban1Idle.png",600,100,64,32,0,255,0)
	setImageTransparent("Battle/Enemies/YellowTurban2Idle.png",600,200,64,32,0,255,0)
}

