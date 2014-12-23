function promptGetCommand(strInput)
{
	strCommand = ""
	arrCommands = promptGetCommandArray()
	for(x=1;x<=promptGetCommandArrayMax();x=x+1)
	{
		if(strInput==arrCommands[x])
		{
			strCommand[1] = arrCommands[x][1]
			strCommand[2] = arrCommands[x][2]
			x = promptGetCommandArrayMax() + 1
		}
	}
	kill(arrCommands)
	return(strCommand)
}

function promptGetCommandArray()
{
	arrCommands[1][1] = "file.save"
	arrCommands[1][2] = "tempFileSave.prg"
	return(arrCommands)
}

function promptGetCommandArrayMax()
{
	return(1)
}

function promptGetKey(strInput)
{
	intType = 0
	arrKeys = promptGetKeyArray()
	for(x=1;x<=promptGetKeyArrayMax();x=x+1)
	{
		if(strInput==arrKeys[x])
		{
			intType = 1
			x = promptGetKeyArrayMax() + 1
		}
	}
	kill(arrKeys)
	return(intType)
}

function promptGetKeyArray()
{
	arrKeys[1] = "a"
	arrKeys[2] = "b"
	arrKeys[3] = "c"
	arrKeys[4] = "d"
	arrKeys[5] = "e"
	arrKeys[6] = "f"
	arrKeys[7] = "g"
	arrKeys[8] = "h"
	arrKeys[9] = "i"
	arrKeys[10] = "j"
	arrKeys[11] = "k"
	arrKeys[12] = "l"
	arrKeys[13] = "m"
	arrKeys[14] = "n"
	arrKeys[15] = "o"
	arrKeys[16] = "p"
	arrKeys[17] = "q"
	arrKeys[18] = "r"
	arrKeys[19] = "s"
	arrKeys[20] = "t"
	arrKeys[21] = "u"
	arrKeys[22] = "v"
	arrKeys[23] = "w"
	arrKeys[24] = "x"
	arrKeys[25] = "y"
	arrKeys[26] = "z"
	arrKeys[27] = "A"
	arrKeys[28] = "B"
	arrKeys[29] = "C"
	arrKeys[30] = "D"
	arrKeys[31] = "E"
	arrKeys[32] = "F"
	arrKeys[33] = "G"
	arrKeys[34] = "H"
	arrKeys[35] = "I"
	arrKeys[36] = "J"
	arrKeys[37] = "K"
	arrKeys[38] = "L"
	arrKeys[39] = "M"
	arrKeys[40] = "N"
	arrKeys[41] = "O"
	arrKeys[42] = "P"
	arrKeys[43] = "Q"
	arrKeys[44] = "R"
	arrKeys[45] = "S"
	arrKeys[46] = "T"
	arrKeys[47] = "U"
	arrKeys[48] = "V"
	arrKeys[49] = "W"
	arrKeys[50] = "X"
	arrKeys[51] = "Y"
	arrKeys[52] = "Z"
	arrKeys[53] = "0"
	arrKeys[54] = "1"
	arrKeys[55] = "2"
	arrKeys[56] = "3"
	arrKeys[57] = "4"
	arrKeys[58] = "5"
	arrKeys[59] = "6"
	arrKeys[60] = "7"
	arrKeys[61] = "8"
	arrKeys[62] = "9"
	arrKeys[63] = " "
	arrKeys[64] = "("
	arrKeys[65] = ")"
	arrKeys[66] = "."
	arrKeys[67] = ","
	arrKeys[68] = "'"
	return(arrKeys)
}

function promptGetKeyArrayMax()
{
	return(68)
}

