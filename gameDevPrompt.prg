include("modelPromptService.prg")

:PromptStart
devPrompt()
branch(:PromptBuild)

:PromptBuild
devPromptBuild()
branch(:PromptDraw)

:PromptDraw
devPromptDraw()
branch(:PromptWait)

:PromptWait
intResult = devPromptWait()
if(intResult==1){branch(:PromptDraw)}
if(intResult==2){branch(:PromptEnter)}
if(intResult==3){branch(:PromptExit)}
branch(:PromptWait)

:PromptEnter
strResult = devPromptEnter()
if(strResult~="")
{
	devPromptDraw()
	delay(0.5)
	branch(:PromptExecute)
}
branch(:PromptDraw)

:PromptExecute
run(strResult)
branch(:PromptExit)

:PromptExit
devPromptKill()

// FUNCTIONS

function devPrompt()
{
	promptCommandLine = 1
	promptCommandString[1] = ""
}

function devPromptBuild()
{
	// Save Screen
	createCanvas(800,600,promptCanvasBkg)
	canvasGetScreen(promptCanvasBkg)

	// Build Prompt
	devPromptBuildInput()
}

function devPromptBuildInput()
{
	createCanvas(800,600,promptCanvasInput)
	drawCanvas(promptCanvasBkg,0,0,800,600,promptCanvasInput)
	colorRGB(15,50,15)
	drawRect(26,461,776,576,promptCanvasInput)
	drawRect(27,462,777,577,promptCanvasInput)
	colorRGB(57,150,44)
	fillRect(25,459,775,575,promptCanvasInput)
	colorRGB(0,0,0)
	drawRect(25,459,775,575,promptCanvasInput)
}

function devPromptDraw()
{
	drawCanvas(promptCanvasInput,0,0,800,600)
	devPromptDrawPointer()
	devPromptDrawCommand()
}

function devPromptDrawCommand()
{
	strCommand[1] = ""
	strCommand[2] = ""
	strCommand[3] = ""
	colorRGB(0,0,0)
	font("courier new")
	fontSize(32)
	if(promptCommandLine<=3)
	{
		strCommand[1] = promptCommandString[1]
		strCommand[2] = promptCommandString[2]
		strCommand[3] = promptCommandString[3]
		if(promptCommandLine==1){strCommand[1] = strCommand[1] + "_"}
		if(promptCommandLine==2){strCommand[2] = strCommand[2] + "_"}
		if(promptCommandLine==3){strCommand[3] = strCommand[3] + "_"}
	}
	if(promptCommandLine>3)
	{
		intOffset1 = promptCommandLine - 3
		intOffset2 = intOffset + 1
		intOffset3 = intOffset + 2
		strCommand[1] = promptCommandString[intOffset1]
		strCommand[2] = promptCommandString[intOffset2]
		strCommand[3] = promptCommandString[intOffset3] + "_"
	}
	pixelText(70,470,strCommand[1])
	pixelText(70,505,strCommand[2])
	pixelText(70,540,strCommand[3])
}

function devPromptDrawPointer()
{
	if(promptCommandLine==1){intCursor = 470}
	if(promptCommandLine==2){intCursor = 505}
	if(promptCommandLine>=3){intCursor = 540}
	colorRGB(0,0,0)
	font("courier new")
	fontSize(32)
	pixelText(50,intCursor,">")
}

function devPromptEnter()
{
	strResult = ""
	strCommand = promptGetCommand(promptCommandString[promptCommandLine])
	if(strCommand[1]=="")
	{
		strMessage = "Error: unknown command " + promptCommandString[promptCommandLine]
		devPromptWrite(strMessage)
	}
	else
	{
		strResult = strCommand[2]
		strMessage = "Executing..."
		devPromptWrite(strMessage)
	}
	return(strResult)
}

function devPromptKill()
{
	kill(promptCommandLine)
	kill(promptCommandString)
	killCanvas(promptCanvasBkg)
	killCanvas(promptCanvasInput)
}

function devPromptWait()
{
	intResult = 0
	strKey = wait()
	if(strKey=="ENTER"){intResult = 2}
	if(strKey=="ESC"){intResult = 3}
	if(intResult==0)
	{
		intResultKey = promptGetKey(strKey)
		if(intResultKey==1)
		{
			promptCommandString[promptCommandLine] = promptCommandString[promptCommandLine] + strKey
			intResult = 1
		}
	}
	kill(strKey)
	return(intResult)
}

function devPromptWrite(strOutput)
{
	intLine = promptCommandLine + 1
	promptCommandString[intLine] = strOutput
	promptCommandLine = intLine + 1
}

