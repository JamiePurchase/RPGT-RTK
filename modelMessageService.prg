function messageTalk(strSpeaker,strMessage1)
{
	messageTalk(strSpeaker,strMessage1,"")
}

function messageTalk(strSpeaker,strMessage1,strMessage2)
{
	createCanvas(800,600,messageCanvasBkg)
	canvasGetScreen(messageCanvasBkg)

	createCanvas(800,600,messageCanvasDraw)
	drawCanvas(messageCanvasBkg,0,0,800,600,messageCanvasDraw)
	colorRGB(15,50,15)
	drawRect(26,461,776,576,messageCanvasDraw)
	drawRect(27,462,777,577,messageCanvasDraw)
	colorRGB(57,150,44)
	fillRect(25,459,775,575,messageCanvasDraw)
	colorRGB(0,0,0)
	drawRect(25,459,775,575,messageCanvasDraw)
	colorRGB(0,0,0)
	font("Segoe Script")
	fontSize(32)
	bold("on")
	pixelText(50,470,strSpeaker,messageCanvasDraw)
	bold("off")
	pixelText(75,505,strMessage1,messageCanvasDraw)
	pixelText(75,540,strMessage2,messageCanvasDraw)

	drawCanvas(messageCanvasDraw,0,0)
	wait()
	drawCanvas(messageCanvasBkg,0,0)

	kill(strMessage1)
	kill(strMessage2)
	killCanvas(messageCanvasBkg)
	killCanvas(messageCanvasDraw)
}

function messageWrite(strMessage1)
{
	createCanvas(800,600,messageCanvasBkg)
	canvasGetScreen(messageCanvasBkg)

	createCanvas(800,600,messageCanvasDraw)
	drawCanvas(messageCanvasBkg,0,0,800,600,messageCanvasDraw)
	colorRGB(15,50,15)
	drawRect(26,461,776,576,messageCanvasDraw)
	drawRect(27,462,777,577,messageCanvasDraw)
	colorRGB(57,150,44)
	fillRect(25,459,775,575,messageCanvasDraw)
	colorRGB(0,0,0)
	drawRect(25,459,775,575,messageCanvasDraw)
	colorRGB(0,0,0)
	font("Segoe Script")
	fontSize(32)
	pixelText(50,470,strMessage1,messageCanvasDraw)

	drawCanvas(messageCanvasDraw,0,0)
	wait()
	drawCanvas(messageCanvasBkg,0,0)

	kill(strMessage1)
	killCanvas(messageCanvasBkg)
	killCanvas(messageCanvasDraw)
}
