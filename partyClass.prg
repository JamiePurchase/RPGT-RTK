class party
{
	
	public:
		
		method party()
		{
			this->characterCount = 0
		}
		
		method addCharacter(objCharacter)
		{
			intPos = this->characterCount + 1
			this->characterArray[intPos] = objCharacter
			this->characterCount = intPos
		}

	method getCharacterArray()
	{
		return this->characterArray
	}
	
	private:
		
		var characterArray[]
		var characterCount

}
