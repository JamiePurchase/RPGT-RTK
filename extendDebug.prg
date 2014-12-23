function debugInit()
{
	debugLogCount = 0
}

function debugLogAdd(strLog)
{
	debugLogCount = debugLogCount + 1
	debugLogValue[debugLogCount] = strLog
	kill(strLog)
}

function debugLogDraw()
{
	// Save Screen
	createCanvas(800,600,debugCanvasBkg)
	canvasGetScreen(debugCanvasBkg)

	// Draw Log
	colorRGB(0,0,0)
	fillRect(0,0,800,600)
	colorRGB(0,100,0)
	font("Times New Roman")
	fontSize(32)
	bold("on")
	pixelText(50,25,"Debug Log")
	bold("off")
	fontSize(16)
	for(intLog=1;intLog<=debugLogCount;intLog=intLog+1)
	{
		intPosY = 20 * intLog + 60
		pixelText(50,intPosY,debugLogValue[intLog])
	}
	// NOTE: If there are more than a certain amount, draw them elsewhere OR wait for a keypress then draw the next set on a new page
	wait()

	// Restore Screen
	drawCanvas(debugCanvasBkg,0,0)

	// Kill Variables
	kill(intLog)
	kill(intPosY)
	killCanvas(debugCanvasBkg)
}

function debugKill()
{
	kill(debugLogCount)
	kill(debugLogValue)
	killCanvas(debugCanvasBkg)
}
