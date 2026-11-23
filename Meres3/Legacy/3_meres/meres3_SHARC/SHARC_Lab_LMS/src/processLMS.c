#include "tt.h"
int	LEDval = 0;

// Place the audio processing algorith here. The input and output are given
// as unsigned integer pointers.

#define N 100	 // legyen paros   // number of filter coefficients


#pragma align 4
//segment("bigCodeSeg")
float pm coefw[N];

#pragma align 4
float dm x[N+1];

#pragma optimize_for_speed

int i = 0;
int j = 0;

#define Y_DELAY_BUFF_SIZE  80
float   faYDelayBuff[Y_DELAY_BUFF_SIZE];
int     iYDelayPtr = 0;

float mu = 0.0015;

float y;
float ref;

float y_est;
float e;

int  channelToOutput4    = 4;
int  channelToOutput4Old = 4;

int flagTest(int mask);

void process(void){
    //Set the Processing Active Semaphore before starting processing
    isProcessing = 1;

    setDAIproc();    

    y = leftIn;
    ref = rightIn;
    
    //  delay path for the input 'y'
    faYDelayBuff[iYDelayPtr] = leftIn;
    y = faYDelayBuff[(iYDelayPtr+1)%Y_DELAY_BUFF_SIZE];
    
    
	x[i] = ref; // aktualis
	
	
    if (i==0){
	    x[N] = x[0];  //vege=eleje
    }

	y_est = conv_asm_var(coefw, &(x[i]), x, N+1, N);
	//szûrés a for ciklusban
	y_est = 0.0;
	for(j=0; j<N; j++){
		y_est += coefw[j] * x[(i+j)%N];
	}	
	
	e = y - y_est;
	
	for(j=0; j<N; j++){
		coefw[j] = coefw[j] + mu * x[(i+j)%N] * e;
	}
	    
    leftOut1  = y;  
	rightOut1 = y;
	
	leftOut2  = y_est;  
	rightOut2 = y_est;
	
	leftOut3  = e;  
	rightOut3 = e;
	
	leftOut4  = x[i];  
	rightOut4 = x[i];

    if (i <= 0){
		i = N-1;
    } else { 
	    i--;
    }
    
    iYDelayPtr++;
    if (iYDelayPtr>= Y_DELAY_BUFF_SIZE){
        iYDelayPtr = 0;
    }

    
        
//******************************************
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

// A csatornák közöti csere: a 4-es csatornára lehet kirakni a jeleket, ahova fejhallgató is csatlakoztatható        
    channelToOutput4Old = channelToOutput4;
    
    //   4-->4 
    if (flagTest(FLG1)!=0){  // FLG1
    	channelToOutput4 = 4;
    }
    
    //   3-->4 
    if (flagTest(FLG2)!=0){  // FLG4
    	channelToOutput4 = 3;
    }
    
    //   2-->4 
    if (readDAIpin(1<<18)>0) {  //DAI_P19
    	channelToOutput4 = 2;
	}
    
    //   1-->4 
    if (readDAIpin(1<<19)>0) {  //DAI_P20
    	channelToOutput4 = 1;
	}
	
	
    LEDval &= ~(1<<(4-channelToOutput4Old));
    LEDval |=  (1<<(4-channelToOutput4)   );
    
    //   1-->4 
    if (1 == channelToOutput4){
        rightOut4 = rightOut1;
         leftOut4 =  leftOut1;
    }
    //   2-->4 
    if (2 == channelToOutput4){
        rightOut4 = rightOut2;
         leftOut4 =  leftOut2;
    }
    //   3-->4 
    if (3 == channelToOutput4){
        rightOut4 = rightOut3;
         leftOut4 =  leftOut3;
    }
    //   4-->4 
    if (4 == channelToOutput4){
        //rightOut4 = rightOut4;
        // leftOut4 =  leftOut4;
    }
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    
//******************************************
    

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




