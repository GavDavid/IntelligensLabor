///////////////////////////////////////////////////////////////////////////////////////
//NAME:     tt.h
//DATE:     7/15/04
//PURPOSE:  Header file with definitions use in the C-based examples
//
////////////////////////////////////////////////////////////////////////////////////////
//DSP RCA csatlakozó jobb oldal: fehér


#ifndef _TT_H_
#define _TT_H_

#include <cdef21364.h>
#include <def21364.h>
#include <signal.h>
#include <SRU21364.h>
#include <services/int/adi_int.h>

//#define CYCLE_COUNT_START( cntr ) asm("r0 = emuclk; %0 = r0;": \
//									"=k" (cntr):"d" (cntr): \
//									"r0")
//#define CYCLE_COUNT_STOP( cntr ) asm("r0 = emuclk; r1 = %1; r2 = 4; r0 = r0 - r2; r0 = r0 - r1; %0 = r0;" : \
//						"=k" (cntr) : \
//						"d" (cntr) : "r0", "r1")


//asm("#include <def21364.h>");

#define NUM_SAMPLES 2
#define SCALE   (16777216/2)

#define DAC1
#define DAC2
#define DAC3
#define DAC4  //eredetileg csak ez.

#define FS 2000.0
#define PI 3.14159265358979
// Function prototypes for this talkthrough code


#pragma optimize_off
extern void InitPLL(void);
extern void process(void);

extern void InitDAI(void);
extern void DAIsigInit(void);
extern void setDAIproc(void);
extern void clrDAIproc(void);
extern int readDAIpin(int mask);

extern float conv_asm( float * coef, float * inCur, float * inBase, unsigned int bufSize);	//
extern float conv_asm_var( float * coef, float * inCur, float * inBase, unsigned int bufSize, unsigned int filSize);	//
extern float conv_asm_int( float * coef, float * inCur, float * inBase, unsigned int bufSize, float* outDest);	//
extern float conv_asm_int_SISD( float * coef, float * inCur, float * inBase, unsigned int bufSize, float* outDest);	//

extern void Init1835viaSPI(void);

extern void InitSPORT(void);
extern void receive(uint32_t, void*);
extern void ClearSPORT(void);

extern void SetupSPI1835 () ;
extern void DisableSPI1835 () ;
extern void Configure1835Register (int i) ;
extern unsigned int Get1835Register (int i) ;
extern void Init1835viaSPI_PowerDwn();

extern void SetupIRQ12 () ;
extern void Irq1ISR (int i) ;
extern void Irq2ISR (int i) ;

extern void Delay (int i) ;


extern int isProcessing;
extern int dataReady;



extern unsigned int Block_A[NUM_SAMPLES] ;
extern unsigned int Block_B[NUM_SAMPLES] ;
extern unsigned int Block_C[NUM_SAMPLES] ;


extern float rightIn  , leftIn;
extern float rightOut1, leftOut1;
extern float rightOut2, leftOut2;
extern float rightOut3, leftOut3;
extern float rightOut4, leftOut4;

extern int rightIn_i  , leftIn_i;
extern int rightOut1_i, leftOut1_i;
extern int rightOut2_i, leftOut2_i;
extern int rightOut3_i, leftOut3_i;
extern int rightOut4_i, leftOut4_i;

//decimáló és interpoláció START
#define DAC_CH_NUM       8		//csatornák száma
#define DAC_INT_FIL_LEN  10		//interp. szûrõ egy részének mérete
#define INTERP_RAT       6		//interpoláció

extern float rightInD  , leftInD;
extern float rightOut1D, leftOut1D;
extern float rightOut2D, leftOut2D;
extern float rightOut3D, leftOut3D;
extern float rightOut4D, leftOut4D;
//decimáló és interpoláció STOP


//extern unsigned int *src_pointer[3];
//extern int int_cntr;

#define SP5_CMD_SET_AB (SPTRAN | BHD | LFS | IFS | FSR | ICLK | SLEN32 | DTYPE0 | SPEN_A | LSBF | SDEN_A| SPEN_B)
#define SP5_CMD_SET_B  (SPTRAN | BHD | LFS | IFS | FSR | ICLK | SLEN32 | DTYPE0 | SPEN_B | LSBF)

#define TRANS_DMA_II	*pIISP5A
#define TRANS_DMA_IM	*pIMSP5A 
#define TRANS_DMA_CS	*pCSP5A
#define TRANS_CTL		*pSPCTL5
#define TRANS_CONT			(SPTRAN | BHD | LFS | IFS | FSR | ICLK | SLEN32 | DTYPE0 | SPEN_A | LSBF | SDEN_A)
#define TRANS_CONT_8BIT		(SPTRAN | BHD | LFS | IFS | FSR | ICLK | SLEN12 | DTYPE0 | SPEN_A | LSBF | SDEN_A)
#define TRANS_IT		SIG_SP5
#define TRANS_DIV		*pDIV5
#define TRANS_DA_O		SPORT5_DA_O
#define TRANS_BUFF		*pTXSP5A

#define REC_DMA_II		*pIISP4A
#define REC_DMA_IM		*pIMSP4A 
#define REC_DMA_CS		*pCSP4A
#define REC_CTL			*pSPCTL4
#define REC_CONT		(BHD | LFS | FSR | /*ICLK |*/ SLEN32 | DTYPE0 | SPEN_A)
#define REC_IT			SIG_SP4
#define REC_DA_I		SPORT4_DA_I
#define REC_FS_I		SPORT4_FS_I
#define REC_CLK_I		SPORT4_CLK_I
#define REC_BUFF		*pRXSP4A

//P4I : SPORT3
//-- UART Handle
extern void UARTrec(int);
extern void UARTtrans(int);
extern void sendDataCont(void);
extern int  dataSendPend;
#define START_FRAME	(1<<10)
#define    IN_FRAME	0
//a motehoz: invertált
#define CONVERT_DATA_UART_G_SF(data) (-1 -(  ( ((data)&0x0FF)<<2 )| START_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))
#define CONVERT_DATA_UART_G_IF(data) (-1 -(  ( ((data)&0x0FF)<<2 )|    IN_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))
////normál mûködés
#define CONVERT_DATA_UART_N_SF(data) (( ( ((data)&0x0FF)<<2 )| START_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))
#define CONVERT_DATA_UART_N_IF(data) (( ( ((data)&0x0FF)<<2 )|    IN_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))
////a motehoz: invertált
//#define CONVERT_DATA_UART_G_SF(data) (-1 -(  ( ((data)&0x0FF)<<2 )| START_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))
//#define CONVERT_DATA_UART_G_IF(data) (-1 -(  ( ((data)&0x0FF)<<2 )|    IN_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))
////normál mûködés
//#define CONVERT_DATA_UART_N_SF(data) (( ( ((data)&0x0FF)<<2 )| START_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))
//#define CONVERT_DATA_UART_N_IF(data) (( ( ((data)&0x0FF)<<2 )|    IN_FRAME | 0x0FFFFF800 | 1 | (1<<31)  ))

//-- UART Handle


//-- mote rez rec
extern float * getCurrBuff(void);
#define MOTE_NUM		8
#define MOTE_REZ_NUM	5
#define TOTAL_DAT_NUM	((MOTE_REZ_NUM+1)*MOTE_NUM*2)
#define TOTAL_DAT_NUM_PER_MOTE	((MOTE_REZ_NUM+1)*2)

#define FS_MOTE  1800.0
#define TS_MOTE (1/FS_MOTE)
//-- mote rez rec

extern int dataRecSig;
extern int lastRecUARTdata;
extern void sendData(unsigned int * data, unsigned int dataNum);
extern unsigned int convertData(int data, int startFrame);


//LED-eket kezelõ függévny
extern void handle_LED(int led_value);
extern int   LEDval;
#define UART_LED	64



#endif
