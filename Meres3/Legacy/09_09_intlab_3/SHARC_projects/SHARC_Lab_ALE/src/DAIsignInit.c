#include "tt.h"
#include <SRU21364.h>
asm("#include <def21364.h>");
#define PORT_JEL 15

//------------------------------------------------------------------------


void setDAIproc(){
    SRU(HIGH,DAI_PB15_I);
	
}

void clrDAIproc(){
    SRU(LOW,DAI_PB15_I);
	
}

void DAIsigInit(){

    SRU(HIGH,PBEN15_I);  //DAI15 out
     
    SRU(LOW,DAI_PB15_I); //DAI15: LOW
    

//route so that DAI pin buffer 02 connects to FLAG14_I
    SRU(DAI_PB02_O,FLAG14_I);
    asm("bit clr flags FLG14O;");
//Pin Buffer Disable in SRU_PINEN02 (Group F)
    //assign pin 02low so it is an input
    SRU(LOW,PBEN02_I);
    SRU(LOW,DAI_PB02_I);

    
    //  Frame sync of SP4
    SRU(DAI_PB02_O,SPORT4_FS_I);
    //  Data in of SP4
    SRU(DAI_PB02_O,SPORT4_DA_I);

    //  Data out of SP5 enable
    SRU(HIGH, DAI_PB04_I);
    SRU(HIGH, PBEN04_I);
    //  Data out of SP5
    SRU(SPORT5_DA_O, DAI_PB04_I); 

        
	*pDAI_PIN_PULLUP &= ~( (1<<(4-1)) | (1<<(4-1)) ); //4. and 4. pin pullup disable
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
