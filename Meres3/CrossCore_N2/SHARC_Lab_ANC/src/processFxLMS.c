#include "tt.h"
#include <math.h>
int	LEDval = 0;

int flagTest(int);

#define I 200   // number of secondary filter coefficients
#define N 100	// number of noise filter coefficients

#pragma align 4
float pm coef_s[I];

#pragma align 4
float pm coef_w[N];

#pragma align 4
float dm x_i[I+1]; // identifikacios gerjesztes

#pragma align 4
float dm x[I+N+1];

#pragma align 4
float dm yy[I+N+1]; // for debug

#pragma align 4
float dm xx_c[I+N+1];

#pragma optimize_for_speed

int i = 0;	// ANC index
int ii = 0; // ident index
int j = 0;	// adaptive correction index

float mu_i = 0.005;
float mu   = 0.0001;

float x_c;
float y;
float y_est;
float e;

float rDCfilt      = 0.0;
float rDCfiltParam = 0.99999;
float lDCfilt      = 0.0;
float lDCfiltParam = 0.99999;


unsigned int lfsr = 1;
float randseq;

void process(void){
    
    //Set the Processing Active Semaphore before starting processing
    isProcessing = 1;

    setDAIproc();    


    
    if (flagTest(FLG1)!=0){  // FLG1
    	// identification mode
    	
		LEDval |= 1; 
		
		// Noise generator
		// Galois LFSR
		lfsr = (lfsr >> 1) ^ (-(lfsr & 1u) & 0xd0000001);
  		randseq = (lfsr * 0.1) / pow(2,32) ;	// normalization
		
  		x_i[ii] = randseq;
  		
  		if (ii == 0)
	    	x_i[I] = x_i[0];  //vege=eleje
    	  		
    	y = leftIn;
    	
    	yy[ii] = y; // for debug
  		
    	y_est = conv_asm_var(coef_s, &(x_i[ii]), x_i, I, I);
		
    	e = y - y_est;
    	
    	for(j=0; j<I; j++){
			coef_s[j] = coef_s[j] + 2 * mu_i * x_i[(ii+j)%I] * e;
		}
    	
		leftOut1  = randseq;  
		rightOut1 = randseq;
		leftOut2  = e;  
		rightOut2 = e;
		leftOut3  = 0;  
		rightOut3 = 0;
		leftOut4  = 0;  
		rightOut4 = 0;

		if (ii==0)
			ii = I-1;
		else 
	    	ii--;
	    	
	} else {
		// ANC mode
		
		LEDval &= ~1; 
		
    rDCfilt = (rDCfiltParam)*rDCfilt + (1-rDCfiltParam)*rightIn;
    lDCfilt = (lDCfiltParam)*lDCfilt + (1-lDCfiltParam)* leftIn;
    
    rightIn = rightIn - rDCfilt;
     leftIn =  leftIn - lDCfilt;
		
		
		x[i] = rightIn;
		
		e = leftIn;
		
		if (i == 0)
	    	x[I+N] = x[0];  //vege=eleje
    	
		y_est = conv_asm_var(coef_w, &(x[i]), x, I+N, N);
		
		x_c = conv_asm_var(coef_s, &(x[i]), x, I+N, I);
		
		xx_c[i] = x_c;
		
		leftOut1  = y_est * (-1); 
		rightOut1 = y_est * (-1);
		leftOut2  = e;  
		rightOut2 = e;
		leftOut3  = 0;  
		rightOut3 = 0;
		leftOut4  = 0;  
		rightOut4 = 0;
		
		
		for(j=0; j<N; j++){
		    if (readDAIpin(1<<19)>0)
				leftOut1 = 0;
			else
				coef_w[j] = coef_w[j] + 2 * mu * xx_c[(i+j)%(N+I)] * e;
		}
		
		

		if (i==0)
			i = N+I-1;
		else 
	    	i--;
		
	}
    
    if (flagTest(FLG2)!=0){  
       	for(j=0; j<N; j++){
			coef_w[j] = 0;
		}
    }
    
    if (readDAIpin(1<<18)>0) {
		for(j=0; j<I; j++){
			coef_s[j] = 0;
		} 
	}
	
	leftOut3 = leftOut1;
	rightOut3=rightOut1;
	leftOut4 = leftOut2;
	rightOut4=rightOut2;
	
	

	
#define SATURATE(x,sat)   if (x<-sat) {x=-sat;} if (x>sat) {x=sat;}
float satOut = 0.90;
	SATURATE(rightOut1,satOut);
	SATURATE( leftOut1,satOut);
	SATURATE(rightOut2,satOut);
	SATURATE( leftOut2,satOut);
	SATURATE(rightOut3,satOut);
	SATURATE( leftOut3,satOut);
	SATURATE(rightOut4,satOut);
	SATURATE( leftOut4,satOut);	
				
/**/

    clrDAIproc();    

    
     //Clear the Processing Active Semaphore after processing is complete
   
    isProcessing = 0;
}



void handle_LED(int led_value){
//lights as described at the top of the file
    *pPPCTL=0;

    *pIIPP=(int)&led_value;  // 
    *pIMPP=1;
    *pICPP=1;
    *pEMPP=1;
    *pECPP=1;
    *pEIPP=0x400000;   //    *pEIPP=0x1400000;   is jó

    *pPPCTL=PPTRAN|PPBHC|PPDUR20|PPDEN|PPEN;
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
