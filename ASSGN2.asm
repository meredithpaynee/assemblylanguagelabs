**************************************
*
* Name:Meredith Payne
* PawPrint ID:MAPCPX
* Date:9/24/23
* Lab2
*
* Program description:This program takes a dividend and a divisor and 
* subtracts the divisor from the dividend until it cannot anymore. The 
* remaining value is the remainder, and a quotient variable is incremented  * to count the number of subtractions executed. 
*
* Pseudocode:
*   #define dividend 201;
*   #define divisor 6;
*    
*   unsigned int quotient;
*   unsigned int remainder;
*   unsigned int zero;
*
*   quotient = 0;
*   zero = 0;
*   remainder = 0;
*   remainder = dividend;
*   
*   if (divisor == 0)
*   {
*       quotient = $FF;
*       remainder = $FF;
*   }
*   else
*   {
*       while(remainder >= divisor)
*       {
*           remainder -= divisor;
*           quotient++;
*       }
*   }
*
*
**************************************

* start of data section

	ORG $B000
DIVIDEND	FCB     254         The dividend
DIVISOR		FCB     54         The divisor.

	ORG $B010
QUOTIENT	RMB       1         The quotient.
REMAINDER	RMB       1         The remainder.
ZERO		RMB	  1	    Zero
* define any other variables that you might need here

	ORG $C000
* start of your program
		CLR	QUOTIENT	quotient = 0;
		CLR	ZERO		zero = 0;
		CLR	REMAINDER	remainder = 0;
		LDAA 	REMAINDER	
		ADDA	DIVIDEND
		STA	REMAINDER	remainder = dividend;
		CLRA
IF		LDAA	DIVISOR		if(divisor == 0)
		CMPA	ZERO
		BNE	WHILE		//branches to while
		BEQ	THEN		//branches to then				
WHILE		LDAA	REMAINDER	while(remainder >= divisor)
		CMPA	DIVISOR
		BLO	ENDWHILE	//branches to endwhile
		LDAB	REMAINDER	 
		SUBB	DIVISOR
		STB	REMAINDER	remainder-divisor->remainder;
		INC	QUOTIENT	quotient++;
		BRA	WHILE		//branches to while
THEN		LDAA	#$FF		//then branch
		STA	QUOTIENT	quotient = $FF;
		STA	REMAINDER	quotient = $FF;			
ENDWHILE	STOP			//stop program		