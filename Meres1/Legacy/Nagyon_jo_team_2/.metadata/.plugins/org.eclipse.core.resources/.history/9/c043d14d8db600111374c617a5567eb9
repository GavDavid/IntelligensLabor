#include "frame.h"


#define N 401		    // number of filter coefficients
section("L1_data_b") fract coefs[N] = {
#include "bp_fract.dat"
};


section("L1_data_a") fract input[N];
fract output[N];
int i = 0;		

extern fract conv_asm( fract *, fract *, fract * );

//--------------------------------------------------------------------------//
// Function:	Process_Data()												//
//																			//
// Description: This function is called from inside the SPORT0 ISR every 	//
//				time a complete audio frame has been received. The new 		//
//				input samples can be found in the variables iChannel0LeftIn,//
//				iChannel0RightIn, iChannel1LeftIn and iChannel1RightIn 		//
//				respectively. The processed	data should be stored in 		//
//				iChannel0LeftOut, iChannel0RightOut, iChannel1LeftOut,		//
//				iChannel1RightOut, iChannel2LeftOut and	iChannel2RightOut	//
//				respectively.												//
//--------------------------------------------------------------------------//
void Process_Data(void)
{

	if (uart_rx_flag)
	{
		uart_rx_flag = false;
		uart_putch(uart_getch());
	}

	iChannel0LeftOut = iChannel0RightIn;	// Talk through
				
	input[i] = rbits((iChannel0RightIn >> 8));
			
	fract out = 0;
			
	// Filter loop		
	out = conv_asm(coefs,&input[i],input);		
	output[i] = out;
	
	i--;	
	if (i<0){
		i = N-1;	
	}
	
	iChannel0RightOut = bitsr(out) << 8;
}

