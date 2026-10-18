
class InterpretComplexNumber extends ComplexNumber{
	
	//constructor
	public InterpretComplexNumber(String complexString){
		boolean debugModeOn = false;
		double signOfTheNumber = 1.0;
		double currentNumber   = 0.0;
		boolean nextCharMaybeSign = true; //indicates that the next character may be a sign (+/-) character
		boolean processingANewNumber = false;
		char c = ' ', c_old=' ';
		char cArray[] = new char[1];
		String currentNumberString = new String("");

		this.real = 0.0;
		this.imag = 0.0;
		complexString = makeComplexNumberString(complexString);
		
		if (debugModeOn) System.out.println(complexString);
				
		nextCharMaybeSign = true;
		for(int forVar = 0; forVar<complexString.length();forVar++){
			c = complexString.charAt(forVar);
			if (debugModeOn) System.out.println("Actual char = " + c);
			if (nextCharMaybeSign){
				if (c=='-'){
					signOfTheNumber = -signOfTheNumber;
				} else if (c=='+'){
					signOfTheNumber = signOfTheNumber;
				} else {
					nextCharMaybeSign    = false;
					processingANewNumber = true;
				}
			}//if (nextCharMaybeSign)
			
			boolean thisCharBelongsToNumber = (  ((c>='0') & (c<='9')) || (c=='.') || (c=='e')|| (c=='E') || 
						 (  ((c_old=='e')|| (c_old=='E')) && ((c=='-') || (c=='+'))  )
				);
			
			if (thisCharBelongsToNumber){
				cArray[0] = c; 
				//currentNumberString.concat(new String(cArray));
				currentNumberString += c;
			} //if (thisCharBelongsToNumber)
			
			//if a real or imag number is finished: the interpreter has found i/j or a next part follows that begins with +/-
			if ((!thisCharBelongsToNumber) & ( ((c=='-') || (c=='+'))&(processingANewNumber) || (c=='i') || (c=='j')) ){
				double numericalValue = 0.0;
				try{
					numericalValue = Double.parseDouble(currentNumberString);
				}catch(NumberFormatException NFErr){
					numericalValue = 0.0;
				}
				if ((c=='i') || (c=='j')){
					if (currentNumberString.equals("")){
						numericalValue = 1.0;
					}
					this.imag += signOfTheNumber*numericalValue;
					if (debugModeOn) System.out.println("New imag number part is found: " + signOfTheNumber*numericalValue);
				} else{
					this.real += signOfTheNumber*numericalValue;
					//forVar--;
					if (debugModeOn) System.out.println("New real number part is found: " + signOfTheNumber*numericalValue);
				}
				currentNumberString = "";
				if (c=='-'){
					signOfTheNumber     = -1.0;
				} else {
					signOfTheNumber     = 1.0;
				}
				nextCharMaybeSign   = true;
				processingANewNumber= false;
			} //if ((!thisCharBelongsToNumber) & ((c=='-') || (c=='+') || (c=='i') || (c=='j')) )
			
			
			//if parenthesis found
			if (c=='('){
				String stringInPar = "";
				int diffOfOpenAndClosePar = 1;
				do{
					forVar++;
					char cA = complexString.charAt(forVar);
					if (cA=='('){
						diffOfOpenAndClosePar++;
					}
					if (cA==')'){
						diffOfOpenAndClosePar--;
					}
					if (diffOfOpenAndClosePar!=0) {
						stringInPar += cA;
					}
				} while (diffOfOpenAndClosePar!=0);
				if (debugModeOn) System.out.println("string in parenthesis: " + stringInPar);
				ComplexNumber compNumInPar = new InterpretComplexNumber(stringInPar);
				this.real += signOfTheNumber*compNumInPar.getReal();
				this.imag += signOfTheNumber*compNumInPar.getImag();
				
				signOfTheNumber     = 1.0;
				nextCharMaybeSign   = true;
				processingANewNumber= false;
			} //if (c=='(')

			c_old = c;
		}//for(int forVar = 0; forVar<complexString.length();forVar++)
		
		//if we are at the end of the string but there is unprocessed string segment
		if (!currentNumberString.equals("")){
			double numericalValue = 0.0;
			try{
				numericalValue = Double.parseDouble(currentNumberString);
			}catch(NumberFormatException NFErr){
				numericalValue = 0.0;
			}
			this.real += signOfTheNumber*numericalValue;
			if (debugModeOn) System.out.println("New real number part is found: " + signOfTheNumber*numericalValue);
		} //if (!currentNumberString.equals(""))
		
	} //InterpretComplexNumber(String complexString)
	// E N D   of the constructor

/**
* removes those characters from the input string that are not allowed in a complex number
*
*/
	String makeComplexNumberString(String inNumP){
		String newString = new String();
		char c;
		int writePosInStr = 0;
		String inNum = inNumP.replace(','  ,  '.');
		for(int forVar = 0; forVar<inNum.length();forVar++){
			c = inNum.charAt(forVar);
			if (  ((c>='0') & (c<='9')) || (c=='-')  || (c=='+') || (c=='.') || (c=='e')|| (c=='E') || (c=='i') || (c=='j')  || (c=='(') || (c==')')){
				newString = newString + c;
			}
		}
		
		return newString;
	} //String makeComplexNumberString(String inNumP){	


}