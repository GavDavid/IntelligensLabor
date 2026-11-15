#include "tt.h"

// Place the audio processing algorithm here. The input and output are given
// as unsigned integer pointers.

#define N 500		    // number of filter coefficients

// A small MATLAB code snippet on how to generate the coefficients:
/*
B = fir1(500-1,1000/24000);
FID=fopen('coef_1.dat','w');fprintf(FID,'%f,\n',B);fclose(FID);
B = firls(N-1, [0 5000 6e3 10e3 11e3 24e3]/(fs/2), [0 0 1 1 0 0]);
FID=fopen('coef_2.dat','w');fprintf(FID,'%f,\n',B);fclose(FID);
*/


#pragma align 4
float pm coefs_1[N] = {
	#include "coef_1.dat"
	};  

#pragma align 4
float pm coefs_2[N] = {
	#include "coef_2.dat"
	};  

#pragma align 4
float dm inputR[N+1];

#pragma align 4
float dm inputL[N+1];



#pragma optimize_for_speed
int i = 0;
int j;
int ix;
float out_1;
float out_2;


int flagTest(int mask);
int readDAIpin(int mask);
void handle_LED(int led_value);
int led_value=0;

void process(void)
{
    //Set the Processing Active Semaphore before starting processing
    isProcessing = 1;

    
    setDAIproc();    
	//   ****************   START of program   **************** 

	 
    i--;
	if (0>i)
	{
		i = N-1;
	}
	
	inputR[i] = rightIn;
    inputL[i] =  leftIn;
	
    if (0==i){
   	    inputR[N] = rightIn;  //inputR[0] == inputR[N] needed for conv_asm
	    inputL[N] =  leftIn;  //inputL[0] == inputL[N] needed for conv_asm
    }
	
    

	  out_1 = conv_asm( coefs_1, &(inputR[i]), inputR, N);	
	  out_2 = conv_asm( coefs_2, &(inputR[i]), inputR, N);	
	    
// A small code snippet which computes the same result as conv_asm.
/*
    ix = i;
    out_1 = 0.0;      
	for (j=0; j<N; j++){
	    out_1 += coefs_1[j]*inputR[(ix++)%N];
	}
	
    ix = i;
    out_2 = 0.0;      	
	for (j=0; j<N; j++){
	    out_2 += coefs_2[j]*inputR[(ix++)%N];
	}
*/	

//   ****************   handle buttons and leds   ****************

	if(readDAIpin(1<<19)>0){
	    led_value |= 1 << 0;
	} else{
	    led_value &= ~(1 << 0);
	}
	


	if(readDAIpin(1<<18)>0){
	    led_value |= 1 << 1;
	} else{
	    led_value &= ~(1 << 1);
	}


	if(flagTest(FLG2)!=0){
	    led_value |= 1 << 2;
	} else{
	    led_value &= ~(1 << 2);
	}


	if(flagTest(FLG1)!=0){
	    led_value |= 1 << 3;
	} else{
	    led_value &= ~(1 << 3);
	}
	
	
	//   ****************   setup of outputs   **************** 

	rightOut1 = rightIn;
	 leftOut1 = leftIn;
	rightOut2 = rightIn;
	 leftOut2 = leftIn;
	rightOut3 = out_2;
	 leftOut3 = out_2;
	rightOut4 = out_1*0.5;
	 leftOut4 = out_1*0.5;


	//   ****************   END of program   **************** 
    clrDAIproc();    
	handle_LED(led_value);
	
    //Clear the Processing Active Semaphore after processing is complete
    isProcessing = 0;
}

int flagTest(int mask){
        int tmpANC0;

        asm volatile(
                " %0 = flags;\n\t"
                : "=&d" (tmpANC0)
                :
                :
                );
return (   (tmpANC0&mask)    );

}



int readDAIpin(int mask){
int tmpR;

 	asm volatile(
 	     		"%0 = flags;\n\t"
 	     		: "=&F" (tmpR)
 	     		:
 	     		:
 	     		);

 	tmpR &= FLG14;
 	//return tmpR;
     return ((*pDAI_PIN_STAT)&mask);

}




void handle_LED(int led_value){
    *pPPCTL=0;

    *pIIPP=(int)&led_value;
    *pIMPP=1;
    *pICPP=1;
    *pEMPP=1;
    *pECPP=1;
    *pEIPP=0x400000;

    *pPPCTL=PPTRAN|PPBHC|PPDUR20|PPDEN|PPEN;
}


