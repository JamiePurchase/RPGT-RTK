:Title
titleBuild()
branch(:TitleDraw)

:TitleDraw

// Test
drawCanvas(titleCanvasBackground,0,0,800,600)
wait()

titleDraw()
branch(:TitleWait)

:TitleWait
strKey = wait()

// Testing
if(strKey=="t")
{
	testMode = 1
	titleKill()
	run("gameCampaignNew.prg")
}
//

if(strKey=="ENTER" || strKey==" "){branch(:TitleSelect)}
if(strKey=="UP" && titleMenuPos>1)
{
	titleMenuPos = titleMenuPos - 1
	branch(:TitleDraw)
}
if(strKey=="DOWN" && titleMenuPos<titleMenuMax)
{
	titleMenuPos = titleMenuPos + 1
	branch(:TitleDraw)
}
branch(:TitleWait)

:TitleSelect
if(titleMenuPos==1)
{
	branch(:TitleCampaign)
}
if(titleMenuPos==2)
{
	titleKill()
	run("gameSkirmish.prg")
}
if(titleMenuPos==3)
{
	run("gameOptionsMenu.prg")
}
if(titleMenuPos==4)
{
	titleKill()
	fade(2)
	windows()
}

:TitleCampaign
drawCanvas(titleCanvas,0,0)
createCanvas(800,600,titleCanvasCampaign)
canvasGetScreen(titleCanvasCampaign)
colorRGB(50,200,50)
font("Segoe Script")
fontSize(32)
pixelText(400,250,"New Story",titleCanvasCampaign)
pixelText(400,290,"Continue",titleCanvasCampaign)
titleMenuPos2 = 1
titleMenuMax2 = 2
branch(:TitleCampaignDraw)

:TitleCampaignDraw
drawCanvas(titleCanvasCampaign,0,0)
colorRGB(50,200,50)
font("Segoe Script")
fontSize(32)
intCursor = 40 * titleMenuPos2 + 210
pixelText(375,intCursor,">")
kill(intCursor)
branch(:TitleCampaignWait)

:TitleCampaignWait
strKey = wait()
if(strKey=="ENTER" || strKey==" "){branch(:TitleCampaignSelect)}
if(strKey=="ESC"){branch(:TitleDraw)}
if(strKey=="UP" && titleMenuPos2>1)
{
	titleMenuPos2 = titleMenuPos2 - 1
	branch(:TitleCampaignDraw)
}
if(strKey=="DOWN" && titleMenuPos2<titleMenuMax2)
{
	titleMenuPos2 = titleMenuPos2 + 1
	branch(:TitleCampaignDraw)
}
branch(:TitleCampaignWait)

:TitleCampaignSelect
if(titleMenuPos2==1)
{
	titleKill()
	run("gameCampaignNew.prg")
}
if(titleMenuPos2==1)
{
	titleKill()
	run("gameCampaignLoad.prg")
}

// FUNCTIONS

function titleBuild()
{
	titleBuildBackground()
	titleBuildOptions()
	titleMenuPos = 1
	titleMenuMax = 3
}

function titleBuildBackground()
{
	createCanvas(800,600,titleCanvasBackground)
	setImage("Artwork/background1a.png",0,0,800,600,titleCanvasBackground)
	colorRGB(50,200,50)
	font("Segoe Script")
	fontSize(54)
	bold("on")
	pixelText(90,25,"Romance of the Three Kingdoms",titleCanvasBackground)
	bold("off")
	fontSize(32)
	pixelText(25,550,"Twisted Kinaesthetix 2014",titleCanvasBackground)
	
	// Test
	colorRGB(25,80,40)
	fillRect(575,250,801,280,titleCanvasBackground)
	fillRect(575,290,801,320,titleCanvasBackground)
	fillRect(575,330,801,360,titleCanvasBackground)
	colorRGB(255,255,255)
	drawRect(575,250,801,280,titleCanvasBackground)
	drawRect(575,290,801,320,titleCanvasBackground)
	drawRect(575,330,801,360,titleCanvasBackground)
	colorRGB(50,50,50)
	font("Segoe Script")
	fontSize(32)
	pixelText(602,252,"Campaign",titleCanvasBackground)
	pixelText(602,292,"Skirmish",titleCanvasBackground)
	pixelText(602,332,"Options",titleCanvasBackground)
	colorRGB(255,255,255)
	pixelText(600,250,"Campaign",titleCanvasBackground)
	pixelText(600,290,"Skirmish",titleCanvasBackground)
	pixelText(600,330,"Options",titleCanvasBackground)
}

function titleBuildOptions()
{
	for(x=1;x<=3;x=x+1)
	{
		createCanvas(800,600,titleCanvasOption[x])
		drawCanvas(titleCanvasBackground,0,0,800,600,titleCanvasOption[x])
		colorRGB(50,200,50)
		font("Segoe Script")
		fontSize(32)
		pixelText(700,250,"Campaign",titleCanvasOption[x])
		pixelText(700,290,"Skirmish",titleCanvasOption[x])
		pixelText(700,330,"Options",titleCanvasOption[x])
		cursorY = 35 * x + 215
		pixelText(675,cursorY,">",titleCanvasOption[x])
	}
	kill(x)
	kill(cursorY)
}

function titleDraw()
{
	drawCanvas(titleCanvasOption[titleMenuPos],0,0,800,600)
}

function titleKill()
{
	kill(titleMenuPos)
	kill(titleMenuMax)
	killCanvas(titleCanvasBackground)
	killCanvas(titleCanvasOption)
}
