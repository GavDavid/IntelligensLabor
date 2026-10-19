#include "frame.h"
#include "allapotgep.h"

#define N 301		    // number of filter coefficients

// Low pass filter
section("L1_data_b") fract lpf[N] = {
	#include "lpf.dat"
};
// Band pass filrer
section("L1_data_b") fract bpf[N] = {
	#include "bpf.dat"
};
// High pass filrer
section("L1_data_b") fract hpf[N] = {
	#include "hpf.dat"
};



section("L1_data_a") fract input[N];	// Array for input

fract output[N];				// Array for diagnosis
fract bass[N], mid[N], high[N];

int i = 0;						// Index for array (size N)

//uint8_t amp_indexes[3] = {0};	// Indexes for amps
// Include convolution assambly function
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
void Process_Data(void){
	//allapotgep();
	if (uart_rx_flag){
		uart_rx_flag = false;
		uart_putch(uart_getch());
	}

	//iChannel0LeftOut = iChannel0RightIn;	// Talk through
				
	input[i] = rbits((iChannel0RightIn >> 8));
			
	fract out = 0;

	// Create samples based on freq with filtering
	fract lfs = conv_asm(lpf,&input[i],input);	// Low freqency sample
	fract mfs = conv_asm(bpf,&input[i],input);	// Middle freqency sample
	fract hfs = conv_asm(hpf,&input[i],input);	// High freqency sample

	// Creation of the output
	out = levels[0]*lfs + levels[1]*mfs + levels[2]*hfs;

	//out = lfs + mfs + hfs;
	//out = input[i];

	output[i] = out;
	bass[i] = lfs; mid[i] = mfs; high[i] = hfs;
	
	if (0>--i){
		i = N-1;	
	}
	//iChannel0RightOut = iChannel0RightIn;		// ECHO
	iChannel0RightOut = bitsr(out) << 8;
}

