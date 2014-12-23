include("characterService.prg")

// Note: this loads the Data version (initial Character stats)

:File
colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(0,100,0)
font("Times New Roman")
fontSize(32)
bold("on")
pixelText(50,25,"Character Data")
bold("off")

:FilePrompt
strPrompt = prompt("Please enter the character to load (eg: LiuBei)")
strFile = "Data/Characters/" + strPrompt + ".txt"
strTitle = "Character Data: " + strFile

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
objCharacter = characterCreate(strPrompt)
strInfoName = objCharacter->getInfoName()
intStatHPC = objCharacter->getStatHPC()
intRankLVL = objCharacter->getRankLVL()

// Draw Item
pixelText(50,80,"Name")
pixelText(250,80,strDetailName)
pixelText(50,115,"Health")
pixelText(250,115,intStatHPC)
pixelText(50,150,"Level")
pixelText(250,150,intRankLVL)

wait()
windows()

