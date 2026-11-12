#include "frame.h"

//--------------------------------------------------------------------------//
// Function:	Sport0_RX_ISR												//
//																			//
// Description: This ISR is executed after a complete frame of input data 	//
//				has been received. The new samples are stored in 			//
//				iChannel0LeftIn and iChannel0RightIn.  Then the function 	//
//				Process_Data() is called in which user code can be executed.//
//				After that the processed values are copied from the 		//
//				variables iChannel0LeftOut and iChannel0RightOut into the  	//
//				DMA transmit buffer.										//
//--------------------------------------------------------------------------//
EX_INTERRUPT_HANDLER(Sport0_RX_ISR)
{
	// Confirm interrupt handling
	*pDMA3_IRQ_STATUS = 0x0001;

	// Copy input data from DMA input buffer into variables
	iChannel0LeftIn = iRxBuffer1[INTERNAL_ADC_L0];
	iChannel0RightIn = iRxBuffer1[INTERNAL_ADC_R0];
	
	// Call function that contains user code
	Process_Data();				

	// Copy processed data from variables into DMA output buffer
	iTxBuffer1[INTERNAL_DAC_L0] = iChannel0LeftOut;
	iTxBuffer1[INTERNAL_DAC_R0] = iChannel0RightOut;

}

//--------------------------------------------------------------------------//
// Function:	UART0_TX_ISR												//
//																			//
// Description: This ISR is executed after the transmission of a character.	//
//				It sends the next character of the null terminated string	//
//				uart_str or if the end was reached then it clears the		//
//				interrupt and signals the availability of the UART			//
//				peripheral for another transmission through uart_tx_active.	//
//--------------------------------------------------------------------------//
EX_INTERRUPT_HANDLER(UART0_TX_ISR)
{
	// End of string
	if (0 == *uart_str)
	{
		// Clear interrupt by reading register
		volatile short temp = *pUART0_IIR;
		uart_tx_active = false;
	} else {
		if ((*pUART0_LSR&(1 << 5)))
		{
			// Clear interrupt by writing register
			*pUART0_THR = (unsigned short) *uart_str;
			// Jump to the next character of the string
			uart_str++;
		}
	}
}

//--------------------------------------------------------------------------//
// Function:	UART0_RX_ISR												//
//																			//
// Description: This ISR is executed if a character was received through the//
//				UART peripheral. It reads the character from the peripheral	//
//				and signals its availability through the uart_rx_flag.		//
//--------------------------------------------------------------------------//
EX_INTERRUPT_HANDLER(UART0_RX_ISR)
{
	// Signal new data has arrived
	uart_rx_flag = true;
	// Clear interrupt by reading register
	// Store the newly received character
	uart_ch   = *pUART0_RBR;
}

