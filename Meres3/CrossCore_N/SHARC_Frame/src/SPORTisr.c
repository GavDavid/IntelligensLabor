///////////////////////////////////////////////////////////////////////////////////////
//NAME:     SPORTisr.c (Block-based Talkthrough)
//DATE:     7/15/04
//PURPOSE:  Talkthrough framework for sending and receiving samples to the AD1835.
//
//USAGE:    This file contains SPORT0 Interrupt Service Routine. Three buffers are used
//          for this example. One is filled by the ADC, another is sent to the DAC, and
//          the final buffer is processed. Each buffer rotates between these functions
//          upon each SP0 interrupt received.
///////////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <cycle_count.h>
#include "tt.h"

#define RIGHT  0
#define LEFT   1


//#define TOMB_X_MERET_ISR  100


float rightIn  , leftIn;
float rightOut1, leftOut1;
float rightOut2, leftOut2;
float rightOut3, leftOut3;
float rightOut4, leftOut4;


float rightInD  , leftInD;
float rightOut1D, leftOut1D;
float rightOut2D, leftOut2D;
float rightOut3D, leftOut3D;
float rightOut4D, leftOut4D;


int rightIn_i  , leftIn_i;
int rightOut1_i, leftOut1_i;
int rightOut2_i, leftOut2_i;
int rightOut3_i, leftOut3_i;
int rightOut4_i, leftOut4_i;


int mode1RegSPisr, mode1RegSPisr2;

unsigned test = 0;
unsigned tast = 0;


// Semaphore to indicate to the isr that the processing has not completed before the
// buffer will be overwritten.
int isProcessing=0;

int dataReady=0;

//If the processing takes too long, the program will be stuck in this infinite loop.
void ProcessingTooLong(void)
{
    while(1);
}

#pragma optimize_for_speed

//ISR routine for audio codec without decimation
void receive(uint32_t sig_int, void* handlerArg)
{
// Uncomment the following line and put a breakpoint into ProcessingTooLong()
// to see whether process() runs out of time before a new sample is received.
//    if(isProcessing){  ProcessingTooLong();}


#ifdef DAC2
	*pTXSP1B = leftOut2_i;
	*pTXSP1B = rightOut2_i;
#endif

#ifdef DAC3
	*pTXSP2A = leftOut3_i;
	*pTXSP2A = rightOut3_i;
#endif

#ifdef DAC4
	*pTXSP2B = leftOut4_i;
	*pTXSP2B = rightOut4_i;
#endif

#ifdef DAC1
	*pTXSP1A = leftOut1_i;
	*pTXSP1A = rightOut1_i;
#endif


	if (1==isProcessing	){
		asm volatile(
	     		"%0 = mode1;\n\t"
	     		: "=d" (mode1RegSPisr): :);//PEYEN
					}

	if (0==isProcessing	){
		asm volatile(
	     		"%0 = mode1;\n\t"
	     		: "=d" (mode1RegSPisr2): :);//PEYEN
					}

	
	leftIn_i = (int) Block_A[RIGHT];
	rightIn_i  = (int) Block_A[LEFT];


	rightIn = (float)rightIn_i / (float)SCALE;
	leftIn  = (float)leftIn_i  / (float)SCALE;

	rightOut1D = rightOut1;                        
	 leftOut1D =  leftOut1;                        
	rightOut2D = rightOut2;                        
	 leftOut2D =  leftOut2;                        
	rightOut3D = rightOut3;                        
	 leftOut3D =  leftOut3;                        
	rightOut4D = rightOut4;                        
	 leftOut4D =  leftOut4;                        


	// Type conversion and scaling
	rightOut1_i = (int)(rightOut1D * SCALE);
	leftOut1_i  = (int)( leftOut1D * SCALE);

	rightOut2_i = (int)(rightOut2D * SCALE);
	leftOut2_i  = (int)( leftOut2D * SCALE);

	rightOut3_i = (int)(rightOut3D * SCALE);
	leftOut3_i  = (int)( leftOut3D * SCALE);

	rightOut4_i = (int)(rightOut4D * SCALE);
	leftOut4_i  = (int)( leftOut4D * SCALE);

	// Signal the availability of a new sample
  	dataReady   = 1;
}
