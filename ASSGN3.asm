**************************************
*
* Name:Meredith Payne
* PawPrint ID: MAPCPX
* Date: 9/29/23
* Lab3
*
*Program description: This program tests if a number N is a prime number 
*(divisible by only 1 and itself) by using division through subtraction.
*If N is prime, the PRIME variable is set to 1, otherwise it is set to 0. 
*All numbers are unsigned.
*
* Pseudocode:
*
*	#define N 251
*
*   	unsigned int prime;
*   	unsigned int remain;
*   	unsigned int count;
*  	unsigned int x;
*
*	remain = 0;
*   	count = 0;
*    	prime = 0;
*    	x = 2;
*   	
*	if(N == 1)
*	{
*	     prime = 0;
*	}
*	else
*	{
*    	     while (x < N)
*   	     {
*   	     	remain = N;
*	
*            	while(remain >= x)
*            	{
*            	   remain -= x;
*            	}
*            	if (remain == 0)
*            	{
*           	   count++;
*            	}
*            	x++;
*            }
*
*   	     if (count == 0)
*   	     {
*            	prime = 1;
*    	     }
*  	     else
*  	     {
*            	prime = 0;
*	     }
*	}
*
**************************************

* start of data section

	ORG $B000
N	FCB     87	     
    
	ORG $B010
PRIME	RMB       1

* define any other variables that you might need here
REMAIN	RMB	  1
COUNT	RMB	  1
X	RMB	  1 

	ORG $C000
* start of your program
	CLR	REMAIN		remainder = 0;
	CLR	COUNT			count = 0;
	CLR	PRIME			prime = 0;
	LDAA	#$02	
	STAA	X			x = 2;
IF1	LDAA	N
	CMPA	#$01	
	BNE	ELSE1			if(N == 1){
	CLR	PRIME			prime = 0;}
	BRA	DONE
ELSE1					
WHL1	LDAA	X			else{
	CMPA	N
	BHS	ENDWHL1		while(x < N){
	LDAB	N
	STAB	REMAIN		remain = N;
WHL2	LDAA	REMAIN
	CMPA	X
	BLO	ENDWHL2		while(remain >= x){
	LDAB	REMAIN
	SUBB	X			remain -= x;
	STAB	REMAIN
	BRA	WHL2			}
ENDWHL2	
IF2	LDAA	REMAIN		if(remainder == 0){
	CMPA	#$00
	BNE	EDIF2
	INC	COUNT			count++;
	BRA	EDIF2			}	//this branch is needed so x will be incremented regardless
EDIF2 INC	X			x++;
	BRA	WHL1
ENDWHL1
IF3	LDAA	COUNT	
	CMPA 	#$00
	BNE	ELSE3			if(count == 0){
	LDAA	#$01
	STAA	PRIME			prime == 1;
	BRA	DONE			}
ELSE3	CLR	PRIME			else{
	BRA	DONE			prime == 0;}
DONE	STOP