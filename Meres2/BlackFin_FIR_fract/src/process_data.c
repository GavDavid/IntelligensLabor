#include "frame.h"
#include "sin2pi_fx.h"
#include "stdio.h"
#include <stdint.h>
#include <inttypes.h>

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
char* initMessage = "The system is in initialization mode, choose a signal type\n\r";
char* sinMode = "Sine mode chosen, pick a frequency, current frequency is: ";
char* squareMode = "Square mode chosen, pick a frequency, current frequency is: ";
char* sawMode = "Sawtooth mode chosen, pick a frequency, current frequency is: ";
char* actualFreqMsg = "The actual frequency is: ";
uint8_t state = 0; //0 - init, 1 - sine, 2 - square, 3 - sawtooth
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
	//115200 baud
	deltaPhase = rbits(((outFreq<<15) / sampleFreq) & mask);
	if (uart_rx_flag)
	{
		uart_rx_flag = false;
		//uart_putch(uart_getch());
		if (state == 0){
			switch (uart_getch()){
				case 's':
					state = 1;
					char buffer[128];
					snprintf(buffer, sizeof(buffer), "%s%u%s" , sinMode, outFreq, "\r\n");
					char* szoveg = buffer;
					uart_print(szoveg);
					break;
				case 'q':
					state = 2;
					char buffer2[128];
					snprintf(buffer2, sizeof(buffer2), "%s%u%s" , squareMode, outFreq, "\r\n");
					char* szoveg2 = buffer2;
					uart_print(szoveg2);
					break;
				case 't':
					state = 3;
					char buffer3[128];
					snprintf(buffer3, sizeof(buffer3), "%s%u%s" , sawMode, outFreq, "\r\n");
					char* szoveg3 = buffer3;
					uart_print(szoveg3);
					break;
				default:
					uart_print(initMessage);
					break;
		}
		}
		if (state != 0){
			switch (uart_getch()){
			case 'h':
				outFreq -= 1;
				break;
			case 'z':
				outFreq += 1;
				break;
			case 'j':
				outFreq -= 10;
				break;
			case 'u':
				outFreq += 10;
				break;
			case 'k':
				outFreq -= 100;
				break;
			case 'i':
				outFreq += 100;
				break;
			case 'l':
				outFreq -= 1000;
				break;
			case 'o':
				outFreq += 1000;
				break;
			case 'e':
				state = 0;
				uart_print(initMessage);
			}
			if (outFreq < 0)
				outFreq = 0;
			if (state != 0){
				char buffer4[128];
				snprintf(buffer4, sizeof(buffer4), "%s%u%s" , actualFreqMsg, outFreq, "\r\n");
				char* szoveg4 = buffer4;
				uart_print(szoveg4);
			}
		}
	}
	iChannel0LeftOut = 0;
	phaseOld = phase;
	phase += deltaPhase;
	if (phase == FRACT_MAX)
	{
		phaseRemaining = FRACT_MAX - phaseOld;
		phase = deltaPhase - phaseRemaining;
	}
	switch (state){
		case 1:
			iChannel0RightOut = bitsr(sin2pi_01_fx16(phase))<<8;
			break;
		case 2:
			iChannel0RightOut = bitsr(square2pi_01_fx16(phase))<<8;
			break;
		case 3:
			iChannel0RightOut = bitsr(saw2pi_01_fx16(phase))<<8;
			break;
		default:
			iChannel0RightOut = 0;
	}

}

