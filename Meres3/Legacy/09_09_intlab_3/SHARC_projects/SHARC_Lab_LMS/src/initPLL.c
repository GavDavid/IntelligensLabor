/********************************************************************************************
**
**  File:   Init_PLL.c
**  Date:   9-3-04
**  Author: BM
**  Use:    Initialize the DSP PLL for the required CCLK and HCLK rates
**  Note:
**      CLKIN will be 24.576MHz from an external oscillator.  The PLL is programmed
**      to generate a core clock (CCLK) of 330.7MHz - PLL multiplier = 0x001B and
**      divider = 0x02.
**
**
*********************************************************************************************/
#include    "tt.h"
int i;

void InitPLL(){

/********************************************************************************************/
// Enable Test 1 or Test 2 as required.
//24.576 MHz CLKIN
//(24.576MHz * 27) /2 = 331.776 MHz

int i, pmctlsetting;

pmctlsetting = *pPMCTL;
pmctlsetting &= ~(0x3f);

pmctlsetting |= PLLM27 | PLLD2 | DIVEN | PLLBP ;

*pPMCTL = pmctlsetting;

for (i=0;i<4096;i++)
          asm("nop;");

*pPMCTL ^= PLLBP; //Clear Bypass Mode
*pPMCTL |= (CLKOUTEN);  //and start clkout
}
