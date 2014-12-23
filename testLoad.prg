:File
colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(0,100,0)
font("Times New Roman")
fontSize(32)
bold("on")
pixelText(50,25,"File Reader")
bold("off")

:FilePrompt
strFile = prompt("Please enter the location of the file to read from (eg: Save/RTK-Game.txt)")
strTitle = "File Reader: " + strFile

:FileTitle
colorRGB(0,0,0)
fillRect(0,0,800,600)
colorRGB(0,100,0)
font("Times New Roman")
fontSize(32)
bold("on")
pixelText(50,25,strTitle)
bold("off")

:FileOpen
txtFile = ioOpen(strFile,"r")
intLine = 0

:FileRead
intLine = intLine + 1
strLine = ioRead(txtFile)
intPosY = 35 * intLine + 45
strDraw = intLine + ": " + strLine
pixelText(50,intPosY,strDraw)
intResult = ioEndOfFile(txtFile)
if(intResult==1)
{
	intPosY = intPosY + 35
	pixelText(50,intPosY,"End of File")
	branch(:FileDone)
}
branch(:FileRead)

:FileDone
wait()
windows()

