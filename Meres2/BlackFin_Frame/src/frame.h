#ifndef FRAME_DEFINED
#define FRAME_DEFINED

//--------------------------------------------------------------------------//
// Header files																//
//--------------------------------------------------------------------------//
#include <sys\exception.h>
#include <cdefBF537.h>
#include <stdfix.h>
#include "uart.h"

//--------------------------------------------------------------------------//
// Symbolic constants														//
//--------------------------------------------------------------------------//
// names for registers in AD1854/AD187 converters
#define INTERNAL_ADC_L0			0
#define INTERNAL_ADC_R0			1
#define INTERNAL_DAC_L0			0
#define INTERNAL_DAC_R0			1

// Duration after reset for DAC/ADC
#define delay 					0xf00

// SPORT0 word length
#define SLEN_24					0x0017

// DMA flow mode
#define FLOW_1					0x1000

// UART speed
#define BAUD_RATE_115200     	(65)

//--------------------------------------------------------------------------//
// Global variables															//
//--------------------------------------------------------------------------//
extern volatile int iChannel0LeftIn;
extern volatile int iChannel0RightIn;
extern volatile int iChannel0LeftOut;
extern volatile int iChannel0RightOut;

extern volatile int iRxBuffer1[];
extern volatile int iTxBuffer1[];

//--------------------------------------------------------------------------//
// Prototypes																//
//--------------------------------------------------------------------------//
// in file Initialize.c
void Init_Flags(void);
void Audio_Reset(void);
void Init_Sport0(void);
void Init_DMA(void);
void Init_UART(void);
void Init_Interrupts(void);
void Enable_DMA_Sport0(void);

// in file Process_data.c
void Process_Data(void);

// in file ISR.c
EX_INTERRUPT_HANDLER(Sport0_RX_ISR);
EX_INTERRUPT_HANDLER(UART0_RX_ISR);
EX_INTERRUPT_HANDLER(UART0_TX_ISR);

#endif //FRAME_DEFINED
