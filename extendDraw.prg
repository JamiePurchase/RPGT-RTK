function drawFrame(intPosX1,intPosY1,intPosX2,intPosY2)
{
	drawFrame(intPosX1,intPosY1,intPosX2,intPosY2,"none")
	kill(intPosX1)
	kill(intPosY1)
	kill(intPosX2)
	kill(intPosY2)
}

function drawFrame(intPosX1,intPosY1,intPosX2,intPosY2,cnvDraw)
{
	// Draw Shadow
	colorRGB(15,50,15)
	if(cnvDraw=="none")
	{
		drawRect(intPosX1+1,intPosY1+1,intPosX2+1,intPosY2+1)
		drawRect(intPosX1+2,intPosY1+2,intPosX2+2,intPosY2+2)
	}
	else
	{
		drawRect(intPosX1+1,intPosY1+1,intPosX2+1,intPosY2+1,cnvDraw)
		drawRect(intPosX1+2,intPosY1+2,intPosX2+2,intPosY2+2,cnvDraw)
	}

	// Draw Background
	colorRGB(57,150,44)
	if(cnvDraw=="none")
	{
		fillRect(intPosX1,intPosY1,intPosX2,intPosY2)
	}
	else
	{
		fillRect(intPosX1,intPosY1,intPosX2,intPosY2,cnvDraw)
	}

	// Draw Border
	colorRGB(0,0,0)
	if(cnvDraw=="none")
	{
		drawRect(intPosX1,intPosY1,intPosX2,intPosY2)
	}
	else
	{
		drawRect(intPosX1,intPosY1,intPosX2,intPosY2,cnvDraw)
	}

	// Kill Variables
	kill(intPosX1)
	kill(intPosY1)
	kill(intPosX2)
	kill(intPosY2)
	kill(cnvDraw)
}


