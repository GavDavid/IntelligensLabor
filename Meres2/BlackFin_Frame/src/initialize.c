#include "frame.h"

/*****************************************************************************
 Function:	Init_Flags													
																		
 Description:	Configure PORTF flags to control ADC and DAC RESETs
 													
******************************************************************************/
void Init_Flags(void)
{
	int temp;
	// Configure programmable flags
	// Set PORTF function enable register (need workaround)
	temp = *pPORTF_FER;
	temp++;
    *pPORTF_FER = 0x0000;
    *pPORTF_FER = 0x0000;

    // Set PORTF direction register
    *pPORTFIO_DIR = 0x1FC0;
        
   	// Set PORTF input enable register
    *pPORTFIO_INEN = 0x003C;
         
	// Set PORTF clear register
    *pPORTFIO_CLEAR = 0x0FC0;
}


//--------------------------------------------------------------------------//
// Function:	Audio_Reset
//
// Description:	This function Resets the ADC and DAC.
//
//--------------------------------------------------------------------------//
void Audio_Reset(void)
{
	int i;
	// Give some time for reset to take effect
    for(i = 0; i< delay;i++){};
 	
    // Set PORTF set register
    *pPORTFIO_SET = PF12;
}

//--------------------------------------------------------------------------//
// Function:	Init_Sport0													//
//																			//
// Description:	Configure Sport0 for I2S mode, to transmit/receive data 	//
//				to/from the ADC/DAC.Configure Sport for external clocks and //
//				frame syncs.												//
//--------------------------------------------------------------------------//
void Init_Sport0(void)
{
	// Sport0 receive configuration
	// External CLK, External Frame sync, MSB first, Active Low
	// 24-bit data, Secondary side enable, Stereo frame sync enable
	*pSPORT0_RCR1 = RFSR | LRFS | RCKFE;
	*pSPORT0_RCR2 = SLEN_24 | RSFSE;
	
	// Sport0 transmit configuration
	// External CLK, External Frame sync, MSB first, Active Low
	// 24-bit data, Secondary side enable, Stereo frame sync enable
	*pSPORT0_TCR1 = TFSR | LTFS | TCKFE;
	*pSPORT0_TCR2 = SLEN_24 | TSFSE;	
}

//--------------------------------------------------------------------------//
// Function:	Init_DMA													//
//																			//
// Description:	Initialize DMA3 in autobuffer mode to receive and DMA4 in	//
//				autobuffer mode to transmit									//
//--------------------------------------------------------------------------//
void Init_DMA(void)
{
	// Configure DMA3
	// 32-bit transfers, Interrupt on completion, Autobuffer mode
	*pDMA3_CONFIG = WNR | WDSIZE_32 | DI_EN | FLOW_1;
	// Start address of data buffer
	*pDMA3_START_ADDR = (void *) iRxBuffer1;
	// DMA loop count
	*pDMA3_X_COUNT = 2;
	// DMA loop address increment
	*pDMA3_X_MODIFY = 4;
	

	// Configure DMA4
	// 32-bit transfers, Autobuffer mode
	*pDMA4_CONFIG = WDSIZE_32 | FLOW_1;
	// Start address of data buffer
	*pDMA4_START_ADDR = (void *) iTxBuffer1;
	// DMA loop count
	*pDMA4_X_COUNT = 2;
	// DMA loop address increment
	*pDMA4_X_MODIFY = 4;
}

//--------------------------------------------------------------------------//
// Function:	Init_UART													//
//																			//
// Description:	Initialize UART to receive and send bytes signaled by		//
//				interrupts													//
//--------------------------------------------------------------------------//
void Init_UART(void)
{
	volatile int temp;

	// Initialize UART global variables
	uart_setup();

	// Enable and set UART pins
	*pPORTF_FER = 0x0003;
	*pPORT_MUX  = 0;

	// First of all, enable UART clock.
	*pUART0_GCTL = UCEN;

	// Read period value and apply formula:  DL = PERIOD / 16 / 8
	*pUART0_LCR = DLAB | WLS(8);
	// Write result to the two 8-bit DL registers (DLH:DLL).
	*pUART0_DLL = BAUD_RATE_115200;
	*pUART0_DLH = (BAUD_RATE_115200 >> 8);

	// Clear DLAB again and set UART frame to 8 bits, no parity, 1 stop bit.
	*pUART0_LCR = WLS(8);

/*****************************************************************************
 *
 *  Finally enable interrupts inside UART module, by setting proper bits
 *  in the IER register. It is good programming style to clear potential
 *  UART interrupt latches in advance, by reading RBR, LSR and IIR.
 *
 *  Setting the ETBEI bit automatically fires a TX buffer empty interrupt request.
 *
 ****************************************************************************/
	temp = *pUART0_RBR;
	temp = *pUART0_LSR;
	temp = *pUART0_IIR;

	*pUART0_IER = ERBFI | ETBEI;
}

//--------------------------------------------------------------------------//
// Function:	Enable_DMA_Sport											//
//																			//
// Description:	Enable DMA3, DMA4, Sport0 TX and Sport0 RX					//
//--------------------------------------------------------------------------//
void Enable_DMA_Sport0(void)
{
	// Enable DMAs
	*pDMA4_CONFIG	= (*pDMA4_CONFIG | DMAEN);
	*pDMA3_CONFIG	= (*pDMA3_CONFIG | DMAEN);
	
	// Enable Sport0 TX and RX
	*pSPORT0_TCR1 	= (*pSPORT0_TCR1 | TSPEN);
	*pSPORT0_RCR1 	= (*pSPORT0_RCR1 | RSPEN);
}

//--------------------------------------------------------------------------//
// Function:	Init_Interrupts												//
//																			//
// Description:	Initialize Interrupt for Sport0 TX and RX					//
//--------------------------------------------------------------------------//
void Init_Interrupts(void)
{
	// Set Sport0 RX (DMA3) interrupt priority to 2 = IVG9
	// Set UART0 RX interrupt priority to 3 = IVG10
	// Set UART0 TX interrupt priority to 4 = IVG11
	*pSIC_IAR0 = 0xff2fffff;
	*pSIC_IAR1 = 0xfff43fff;
	*pSIC_IAR2 = 0xffffffff;
	*pSIC_IAR3 = 0xffffffff;

	// Assign ISRs to interrupt vectors
	// Sport0 RX ISR -> IVG 9
	// UART0 RX ISR  -> IVG10
	// UART0 TX ISR  -> IVG11
	register_handler(ik_ivg9, Sport0_RX_ISR);
	register_handler(ik_ivg10,UART0_RX_ISR);
	register_handler(ik_ivg11,UART0_TX_ISR);


	// Enable Sport0 RX, UART0 RX/TX interrupt
	*pSIC_IMASK  = 0x00001820;
}


	

