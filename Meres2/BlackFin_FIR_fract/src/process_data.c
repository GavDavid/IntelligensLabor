#include "frame.h"
#include "sin2pi_fx.h"

#define N 401		    // number of filter coefficients
section("L1_data_b") fract coefs[N] = {
#include "bp_fract.dat"
};

fract section("L1_data_a") input[N];
fract output[N];
accum out = 0;
volatile fract outVal;
int i = 0;		

fract konv;
uint16_t *konvi;
uint32_t konvi32;

uint32_t outFreq = 1000;
uint32_t sampleFreq = 48000;

fract phase = 0;
fract phaseOld = 0;
fract deltaPhase = 0;
uint32_t mask = 32767;
fract phaseRemaining = 0;
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

	deltaPhase = rbits(((outFreq<<15) / sampleFreq) & mask);
	if (uart_rx_flag)
	{
		uart_rx_flag = false;
		uart_putch(uart_getch());
	}

	iChannel0LeftOut = 0;

	phaseOld = phase;
	phase += deltaPhase;


	if (phase == FRACT_MAX)
	{
		phaseRemaining = FRACT_MAX - phaseOld;
		phase = deltaPhase - phaseRemaining;
	}

	iChannel0RightOut = bitsr(sin2pi_01_fx16(phase))<<8;


}

