///////////////////////////////////////////////////////////////////////////////////////
//NAME:     initSPORT.c (Block-based Talkthrough)
//DATE:     7/15/04
//PURPOSE:  Talkthrough framework for sending and receiving samples to the AD1835.
//
//USAGE:    This file initializes the SPORTs for DMA Chaining
//
////////////////////////////////////////////////////////////////////////////////////////
#include "tt.h"
/*
   Here is the mapping between the SPORTS and the DACS
   ADC -> DSP  : SPORT0A : IIS
   DSP -> DAC1 : SPORT1A : IIS
   DSP -> DAC2 : SPORT1B : IIS
   DSP -> DAC3 : SPORT2A : IIS
   DSP -> DAC4 : SPORT2B : IIS
*/

unsigned int PCI = 0x00080000 ;
unsigned int OFFSET = 0x00080000 ;

// TCB blocks for Chaining
//Each block will be used for:
//      Filling from the ADC
//      Processing filled data
//      Sending to DAC
//
//Each one is doing only one of these steps for each SPORT interrupt.

//For this example the startup state is
// Start to 1st interrupt: Block_A is filled first, Block_C is sent
// 1st int to 2nd int: Block_C filled, Block_A processed, Block_B sent
// 2nd int to 3rd int: Block_B filled, Block_C processed, Block_A sent
// 3rd int to 4th int: Block_A filled, Block_B processed, Block_C sent
unsigned int Block_A[NUM_SAMPLES] ;
unsigned int Block_B[NUM_SAMPLES] ;
unsigned int Block_C[NUM_SAMPLES] ;

//Set up the TCBs to rotate automatically
int TCB_Block_A[4] = { 0, sizeof(Block_A), 1, 0};;
int TCB_Block_B[4] = { 0, sizeof(Block_B), 1, 0};
int TCB_Block_C[4] = { 0, sizeof(Block_C), 1, 0};

void InitSPORT()
{
    TCB_Block_A[0] = (int) TCB_Block_A + 3 - OFFSET + PCI ;
    TCB_Block_A[3] = (unsigned int) Block_A - OFFSET ;
	

    *pSPMCTL01 = 0;
    *pSPMCTL23 = 0;

    *pSPCTL0 = 0 ;
    *pSPCTL1 = 0 ;
    *pSPCTL2 = 0 ;
    *pSPCTL3 = 0 ; //UART tr.
    *pSPCTL4 = 0 ; //UART rec.
    *pSPCTL5 = 0 ; //UART tr.


    
    //============================================================
    //
    // Configure SPORTs 1 & 2 for output to DACs 1-4
    //
    //------------------------------------------------------------

    
// Maybe |DITFS could be enabled: Data Independent Frame Signal
    #ifdef DAC1
    *pSPCTL1 = (SPTRAN | OPMODE | SLEN24 | SPEN_A | BHD /*| SCHEN_A | SDEN_A*/| DTYPE1 /*| DITFS*/) ;
    *pTXSP1A = 10;
    *pTXSP1A = 10;
    #endif

    #ifdef DAC2
    *pSPCTL1 |= (SPTRAN | OPMODE | SLEN24 | SPEN_B | BHD /*| SCHEN_B | SDEN_B*/| DTYPE1 /*| DITFS*/) ;
    *pTXSP1B = 0;
    *pTXSP1B = 0;

    #endif

    #ifdef DAC3
    *pSPCTL2 = (SPTRAN | OPMODE | SLEN24 | SPEN_A | BHD /*| SCHEN_A | SDEN_A*/| DTYPE1 /*| DITFS*/) ;
    *pTXSP2A = 0;
    *pTXSP2A = 0;
    #endif

    #ifdef DAC4
    *pSPCTL2 |= (SPTRAN | OPMODE | SLEN24 | SPEN_B | BHD /*| SCHEN_B | SDEN_B*/| DTYPE1 /*| DITFS*/) ;
    *pTXSP2B = 0;
    *pTXSP2B = 0;
    #endif
    
    //============================================================
    //
    // Configure SPORT 0 for input from ADC
    //
    //------------------------------------------------------------


    *pSPCTL0 = (BHD | OPMODE | SLEN24 | SPEN_A | SCHEN_A | SDEN_A | DTYPE1);

    // Enabling Chaining
    // Block A will be filled first
    *pCPSP0A = (unsigned int) TCB_Block_A - OFFSET + 3 + PCI;

    
    
//UART config
	*pPCG_CTLA_1 = 71; 				//divisor = 24.576e6/(3*115200)=71 ; XTAL clock source
	*pPCG_CTLA_0 = ENCLKA ;
	SRU(PCG_CLKA_O,SPORT4_CLK_I) 	//receiver

    
    
	REC_CTL = ( BHD | LFS | FSR | /*ICLK |*/ SLEN32 | DTYPE0 | SPEN_A);
    
    TRANS_CTL = (ICLK); //generate FS. Transmitter mode
	TRANS_DIV   = (20<<16)|747; //32 bit=1 frame, clk: 333e6*2/8/(115200*1)-1=722: for 8 bit data

	TRANS_CTL   =(SPTRAN | BHD | LFS | IFS | FSR | ICLK | SLEN12 | DTYPE0 | SPEN_A | LSBF ); 
	TRANS_BUFF  = 0x000000000;
	int i;
   	for (i=0;i<35000;i++) {asm("nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;");}
	TRANS_CTL   = 0; 

	
//SPORT4	
// ---- SPEN_A	=1  (BIT_0)	 			// SPORT enable primary A channel
// ---- DTYPE0	=0 (0x00000000)		// right justify, fill unused MSBs with 0s
// ---- LSBF	=0 (MSB) (BIT_3)	 			// MSB or LSB first
// ---- SLEN32   (BIT_4|BIT_5|BIT_6|BIT_7|BIT_8) // serial length 32
// ---- PACK	=0     (BIT_9)				// 16-to-32 data packing
// ---- ICLK	=1     (BIT_10)	// internally ('1') or externally ('0') generated transmit or recieve SCLKx
// ---- OPMODE 	=0     (BIT_11)	// I2S mode enable ('1') or DSP Serial Mode/Multichannel mode ('0')
// ---- CKRE	=0     (BIT_12)	// Clock edge for data and frame sync sampling (rx) or driving (tx)
// ---- FSR		=1     (BIT_13)	// transmit or receive frame sync (FSx) required
// ---- IFS		=0     (BIT_14)	// internally generated transmit or receive frame sync (FSx)
// ---- DITFS	=0     (BIT_15)	// (I2S & DSP serial modes only) Data Independent 'tx' FSx when DDIR bit = 1
// ---- LFS		=1(LOW)(BIT_16)	// Active Low transmit or receive frame sync (FSx)
// ---- LAFS	=0(ea) (BIT_17)	// (DSP Serial Mode only) Late (vs early) frame sync FSx
// ---- SDEN_A	=0     (BIT_18)	// SPORT TXnA/RXnA DMA enable primary A channel
// ---- SCHEN_A =0     (BIT_19)	// SPORT TXnA/RXnA DMA chaining enable primary A channel
// ---- SDEN_B  (BIT_20)	// SPORT TXnB/RXnB DMA enable primary B channel
// ---- SCHEN_B (BIT_21)	// SPORT TXnB/RXnB DMA chaining enable primary B channel
// ---- FS_BOTH =0     (BIT_22)	// (DSP Serial & I2S modes only) Issue FSx only if data is in both TXnA & TXnB regs
// ---- BHD		=1     (BIT_23)	// Ignore a core hang
// ---- SPEN_B  (BIT_24)	// SPORTx secondary B channel enable
// ---- SPTRAN  =0     (BIT_25)	// SPORT data buffer data dirrection '1' = transmitter, '0' = receiver
// ---- DERR_B  (BIT_26)	// SPORTx secondary B overflow/underflow error status in DSP serial & I2S modes (read-only)
// ---- DXS0_B  (BIT_27)	// SPORTx secondary B data buffer status in DSP Serial & I2S modes (read-only)
// ---- DXS1_B  (BIT_28)	// SPORTx secondary B data buffer status in DSP Serial & I2S modes (read-only)
// ---- DERR_A  (BIT_29)	// SPORTx primary A overflow/underflow error status in DSP Serial & I2S modes (read-only)
// ---- DXS0_A  (BIT_30)	// SPORTx primary A data buffer status in DSP serial and I2S modes (read-only)
// ---- DXS1_A  (BIT_31)	// SPORTx primary A data buffer status in DSP serial and I2S modes (read-only)


}
