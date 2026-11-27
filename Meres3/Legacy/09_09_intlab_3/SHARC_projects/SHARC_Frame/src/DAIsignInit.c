#include "tt.h"
#include <SRU21364.h>

#define PORT_JEL 15

//------------------------------------------------------------------------


void setDAIproc(){
    SRU(HIGH,DAI_PB15_I);
	
}

void clrDAIproc(){
    SRU(LOW,DAI_PB15_I);
	
}

void DAIsigInit(){

    SRU(HIGH,PBEN15_I);
    
    SRU(LOW,DAI_PB15_I);

}
