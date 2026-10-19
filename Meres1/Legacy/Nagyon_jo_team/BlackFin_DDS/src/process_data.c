#include "frame.h"

//--------------------------------------------------------------------------//
// Function:	Process_Data()												//
//																			//
// Description: This function is called from inside the SPORT0 ISR every 	//
//				time a complete audio frame has been received. The new 		//
//				input samples can be found in the variables iChannel0LeftIn //
//				and iChannel0RightIn respectively. The processed data should//
// 				be stored in iChannel0LeftOut and iChannel0RightOut.		//
//--------------------------------------------------------------------------//
void Process_Data(void)
{

	if (uart_rx_flag)
	{
		uart_rx_flag = false;
		uart_putch(uart_getch());
	}

	iChannel0LeftOut  = iChannel0LeftIn;
	iChannel0RightOut = iChannel0RightIn;
}
