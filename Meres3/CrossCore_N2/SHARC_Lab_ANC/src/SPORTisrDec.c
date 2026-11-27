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

//SPORT testing
int FSlowTime    = 16;
int FShighTime   = 15;
int FSnextChTime = 15;
int FSactState   = 0;
int FScurrTime   = 0;
int DAlowTime    = 15;
int DAhighTime   = 15;
int DAnextChTime = 15;
int DAactState   = 0;
int DAcurrTime   = 0;
int event1 = 0;
int event2 = 0;
//SPORT testing


float rightIn  , leftIn;
float rightOut1, leftOut1;
float rightOut2, leftOut2;
float rightOut3, leftOut3;
float rightOut4, leftOut4;


//Decimation filter START
#define N_DEC 5

float rightIn_samp[N_DEC]  , leftIn_samp[N_DEC]; 
int rightIn_sampMark= 0,  leftIn_sampMark= 0;

float rightIn_rec[N_DEC]  , leftIn_rec[N_DEC];
int rightIn_recMark= 0,  leftIn_recMark= 0;




float decimCoefsB[N_DEC] ={
	#include "coefsB.dat"
				};

float decimCoefsA[N_DEC-1] = {
	#include "coefsA.dat"
				};

//Decimation filter STOP
float rightInD  , leftInD;
float rightOut1D, leftOut1D;
float rightOut2D, leftOut2D;
float rightOut3D, leftOut3D;
float rightOut4D, leftOut4D;

float dm interpFiltData[DAC_CH_NUM][DAC_INT_FIL_LEN+1];
float pm interpFiltCoef[INTERP_RAT][DAC_INT_FIL_LEN] = {
	#include "interp_filter.dat"
	};

int rightIn_i  , leftIn_i;
int rightOut1_i, leftOut1_i;
int rightOut2_i, leftOut2_i;
int rightOut3_i, leftOut3_i;
int rightOut4_i, leftOut4_i;

int tmp=0;
int decI = 0;
int interpStage = 0;
int mode1RegSPisr, mode1RegSPisr2;

int timeMeasTmp,timeMeas;

// Semaphore to indicate to the ISR that the processing has not completed before the
// buffer will be overwritten.
int isProcessing=0;

int dataReady=0;


//LED handling
extern int LEDval;
//If the processing takes too long, the program will be stuck in this infinite loop.
void ProcessingTooLong()
{
    while(1);
}

#pragma optimize_for_speed

//channel check
bool channelCheck;

void receive(uint32_t sig_int, void* handlerArg)
{
	// Uncomment the following line and put a breakpoint into ProcessingTooLong()
	// to see whether process() runs out of time before a new sample is received.
	//if(isProcessing){  ProcessingTooLong();}


channelCheck = !!((*pDAI_PIN_STAT)&DAI_PB14);

if ( channelCheck	){ // Compatibility with older IDEs.
    #ifdef DAC2
        *pTXSP1B = rightOut2_i;
        *pTXSP1B = leftOut2_i;
    #endif
        
    #ifdef DAC3
        *pTXSP2A = rightOut3_i;
        *pTXSP2A = leftOut3_i;
    #endif
        
    #ifdef DAC4
        *pTXSP2B = rightOut4_i;
        *pTXSP2B = leftOut4_i;
    #endif    

    #ifdef DAC1
        *pTXSP1A = rightOut1_i;
        *pTXSP1A = leftOut1_i;
	#endif
	
} else {
    
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
    
    
}

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
        


					
		rightInD = (float)((int) Block_A[RIGHT]) / (float)SCALE;
		
if ( channelCheck	){ // Compatibility with older IDEs
   	rightInD = (float)((int) Block_A[RIGHT]) / (float)SCALE;
   	 leftInD = (float)((int) Block_A[LEFT]) / (float)SCALE;
        	
} else{
   	rightInD = (float)((int) Block_A[LEFT]) / (float)SCALE;   
   	 leftInD = (float)((int) Block_A[RIGHT]) / (float)SCALE;   
}   
//Decimation START        	

//decimation for right channel
		
		//replace old input data
		for (rightIn_sampMark=N_DEC-1;rightIn_sampMark>0;rightIn_sampMark--){
			rightIn_samp[rightIn_sampMark] = rightIn_samp[rightIn_sampMark-1];
		}
		rightIn_samp[0] = rightInD;  //save new data
		
		rightInD = 0;
		//calculating b*x
		for(rightIn_sampMark=0;rightIn_sampMark<N_DEC;rightIn_sampMark++){
			rightInD += rightIn_samp[rightIn_sampMark]*decimCoefsB[rightIn_sampMark];
		}

    
		//calculating -a*y
		for(rightIn_sampMark=0;rightIn_sampMark<N_DEC-1;rightIn_sampMark++){
			rightInD -= rightIn_rec[rightIn_sampMark]*decimCoefsA[rightIn_sampMark];
		}

		//replace old output
		for (rightIn_sampMark=N_DEC-1;rightIn_sampMark>0;rightIn_sampMark--){
			rightIn_rec[rightIn_sampMark] = rightIn_rec[rightIn_sampMark-1];
		}
		rightIn_rec[0] = rightInD;


//decimation for left channel
		
		//replace old input datas
		for (leftIn_sampMark=N_DEC-1;leftIn_sampMark>0;leftIn_sampMark--){
			leftIn_samp[leftIn_sampMark] = leftIn_samp[leftIn_sampMark-1];
		}
		leftIn_samp[0] = leftInD;  //save new data
		
		leftInD = 0;
		//calculating b*x
		for(leftIn_sampMark=0;leftIn_sampMark<N_DEC;leftIn_sampMark++){
			leftInD += leftIn_samp[leftIn_sampMark]*decimCoefsB[leftIn_sampMark];
		}

    
		//calculating -a*y
		for(leftIn_sampMark=0;leftIn_sampMark<N_DEC-1;leftIn_sampMark++){
			leftInD -= leftIn_rec[leftIn_sampMark]*decimCoefsA[leftIn_sampMark];
		}

		//replace old output
		for (leftIn_sampMark=N_DEC-1;leftIn_sampMark>0;leftIn_sampMark--){
			leftIn_rec[leftIn_sampMark] = leftIn_rec[leftIn_sampMark-1];
		}
		leftIn_rec[0] = leftInD;

	    
	    

//Decimation STOP							
										
					
//Reading data and scaling
//~413 clock cycles

		interpStage++;
		if (INTERP_RAT == interpStage) {
if ( channelCheck	){   //Compatibility with older IDEs
	        rightIn_i = (int) Block_A[RIGHT];  
        	leftIn_i  = (int) Block_A[LEFT];  
} else {
        	leftIn_i  = (int) Block_A[RIGHT];
 	        rightIn_i = (int) Block_A[LEFT];
}       	
	
        	rightIn = (float)rightIn_i / SCALE;        
        	leftIn  = (float)leftIn_i  / SCALE; 
        	
        	rightIn = rightInD;
        	leftIn  = leftInD;

			interpStage = 0;	// This stages is run once again
		    dataReady   = 1;	// New data available
		

	
                        
// Writing output data into array
	    	decI--;
			if (0>decI)
			{
				decI = DAC_INT_FIL_LEN-1;
			}

			interpFiltData[0][decI] = rightOut1;
			interpFiltData[1][decI] =  leftOut1;
			interpFiltData[2][decI] = rightOut2;
			interpFiltData[3][decI] =  leftOut2;
			interpFiltData[4][decI] = rightOut3;
			interpFiltData[5][decI] =  leftOut3;
			interpFiltData[6][decI] = rightOut4;
			interpFiltData[7][decI] =  leftOut4;

	
	    	if (0==decI){
			interpFiltData[0][DAC_INT_FIL_LEN] = rightOut1;
			interpFiltData[1][DAC_INT_FIL_LEN] =  leftOut1;
			interpFiltData[2][DAC_INT_FIL_LEN] = rightOut2;
			interpFiltData[3][DAC_INT_FIL_LEN] =  leftOut2;
			interpFiltData[4][DAC_INT_FIL_LEN] = rightOut3;
			interpFiltData[5][DAC_INT_FIL_LEN] =  leftOut3;
			interpFiltData[6][DAC_INT_FIL_LEN] = rightOut4;
			interpFiltData[7][DAC_INT_FIL_LEN] =  leftOut4;
	    	}
		}

	
    conv_asm_int( &(interpFiltCoef[interpStage][0]),  &(interpFiltData[0][decI]), &(interpFiltData[0][0]), DAC_INT_FIL_LEN, &rightOut1D);


    	// Type conversion and scaling
        rightOut1_i = (unsigned int)(rightOut1D * SCALE);
        leftOut1_i  = (unsigned int)( leftOut1D * SCALE);

        rightOut2_i = (unsigned int)(rightOut2D * SCALE);
        leftOut2_i  = (unsigned int)( leftOut2D * SCALE);

        rightOut3_i = (unsigned int)(rightOut3D * SCALE);
        leftOut3_i  = (unsigned int)( leftOut3D * SCALE);

        rightOut4_i = (unsigned int)(rightOut4D * SCALE);
        leftOut4_i  = (unsigned int)( leftOut4D * SCALE);



#define SET_FS_HIGH	SRU(HIGH,SPORT4_FS_I);

#define SET_FS_LOW	SRU(LOW,SPORT4_FS_I);

					
	FScurrTime++;
    if (FScurrTime==FSnextChTime){
    	if (0==FSactState){
			FSactState = 1;
   			FScurrTime = 0;
    		FSnextChTime = FShighTime;
    	}else{
			FSactState = 0;
   			FScurrTime = 0;
    		FSnextChTime = FSlowTime;
   	}
	}
      	
	handle_LED(LEDval);
}
