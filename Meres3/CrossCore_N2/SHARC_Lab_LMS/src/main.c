#include "tt.h"
extern void process(void);

extern void SetupSPI1835(void);
extern void DisableSPI1835(void) ;
extern void SetupSPI1835 (void);
extern void Init1835viaSPI_PowerDwn(void);
extern void DAIsigInit(void);

void main(void)
{
	InitPLL ();
	
    // Need to initialize DAI because the sport signals
     Init1835viaSPI_PowerDwn();
    // need to be routed
    InitSPORT();
    

    DAIsigInit();
    InitDAI();

    
    // This function will configure the codec on the kit
    Init1835viaSPI();

    // Finally setup the sport to receive / transmit the data
    adi_int_InstallHandler(ADI_CID_SP0I, receive, 0, true);

    // Be in infinite loop and do nothing until done.
    while(1)
    {
     if(dataReady){
     	dataReady = 0;
          process();}
    }
    
}
