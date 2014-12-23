autoLocal(true)
include("partyClass.prg")

function partyInit()
{
	global(party) = party()
}

function partyAddCharacter(objCharacter)
{
	global(party)->addCharacter(objCharacter)
}

function partyGetArmy(intPos)
{
	// return an army item?
}

function partyGetCharacterArray()
{
	return global(party)->getCharacterArray()
}

function partyGetCharacterCount()
{
	return global(party)->getCharacterCount()
}

