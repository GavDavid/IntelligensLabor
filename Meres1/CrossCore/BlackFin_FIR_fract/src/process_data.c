#include "frame.h"

#define N 5		    // number of filter coefficients
section("L1_data_b") fract coefs[N] = {
#include "FIR_lowpass_coef.dat"
};
// Set 3
//fract coefs_b[5] = {0.152843243788085, -0.611372975152342, 0.917059462728512,  -0.611372975152342, 0.152843243788085};
//fract coefs_a[4] = {-0.651471653594406, 0.620472122486497, -0.147379460605609, 0.0261686639228548};
// Set 4
//fract coefs_b[5] = {0.499814997569879, -1.99925999027952, 2.99888998541927, -1.99925999027952, 0.499814997569879};
//fract coefs_a[4] = {-2.63862774389125, 2.76930978615149, -1.33928076126520, 0.249821669810126};
// Set 4 / 2^2
fract coefs_b[5] = {0.1250, -0.4998, 0.7497, -0.4998, 0.1250};
fract coefs_a[4] = {-0.6597, 0.6923, -0.3348, 0.0625};
fract section("L1_data_a") input[N];
fract output[N];
accum out = 0;
volatile fract outVal;
int i = 0;		

fract konv;
uint16_t *konvi;
uint32_t konvi32;

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

	iChannel0LeftOut = iChannel0RightIn;

	input[i] = rbits((iChannel0RightIn>>8));
				
	int j;
	int ix;

	ix  = i;
	out = 0;
			
	// Filter loop
	for (j=0;j<N;j++)
	{
		out += input[ix%N]*coefs_b[j] +  (-coefs_a[j])*output[ix%N];

		ix++;
	}

	i--;
	
	if (i<0)
	{
		i = N-1;
	}
	output[i] = out * 2 * 2;
	iChannel0RightOut = bitsr(out) << 8;
}

