include("classBackpack.prg")

function fileLoad()
{
	txtLoad = ioOpen("Save/data.txt","r")
	x = 0
	while(done=0)
	{
		x = x + 1
		myData[x] = ioRead(txtLoad)
		mwin(myData[x])
		*done = ioEndOfFile(txtLoad)
	}
	// Game Settings
	// Stats
	// Party
	// Items
	// Location
	// Quests
}

function fileSave()
{
	fileSaveAnimBuild()
	fileSaveAnimDraw(0)
	fileSaveDataGame()
	fileSaveAnimDraw(50)
	fileSaveDataBackpack()
	fileSaveAnimDraw(100)
	fileSaveKill()
}

function fileSaveAnimBuild()
{
	createCanvas(800,600,fileAnimCanvas)
	canvasGetScreen(fileAnimCanvas)
	colorRGB(15,50,15)
	fillRect(300,526,502,576,fileAnimCanvas)
	fillRect(301,527,503,577,fileAnimCanvas)
	colorRGB(57,150,44)
	fillRect(299,525,501,575,fileAnimCanvas)
	colorRGB(0,0,0)
	drawRect(299,525,501,575,fileAnimCanvas)
}

function fileSaveAnimDraw(intPercent)
{
	drawCanvas(fileAnimCanvas,0,0,800,600)
	intPos = 2 * intPercent + 300
	colorRGB(46,191,38)
	fillRect(300,526,intPos,574)
	kill(intPercent)
	kill(intPos)
}

function fileSaveDataBackpack()
{
	// Open File
	txtSave = ioOpen("Save/RTK-Backpack.txt","w")

	// Write Data
	ioWrite(txtSave,"RTK Save Data")

	// Close File
	ioClose(txtSave)
	kill(txtSave)
}

function fileSaveDataGame()
{
	// Open File
	txtSave = ioOpen("Save/RTK-Game.txt","w")

	// Write Data
	ioWrite(txtSave,"RTK Save Data")

	// Close File
	ioClose(txtSave)
	kill(txtSave)
}

function fileSaveKill()
{
	killCanvas(fileAnimCanvas)
}
