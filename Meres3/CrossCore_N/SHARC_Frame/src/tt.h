///////////////////////////////////////////////////////////////////////////////////////
//NAME:     tt.h
//DATE:     7/15/04
//PURPOSE:  Header file with definitions use in the C-based examples
//
////////////////////////////////////////////////////////////////////////////////////////
#ifndef _TT_H_
#define _TT_H_

#include <cdef21364.h>
#include <def21364.h>
#include <signal.h>
#include <services/int/adi_int.h>

#define NUM_SAMPLES 2
#define SCALE   (16777216/2)

#define DAC1
#define DAC2
#define DAC3
#define DAC4

// Function prototypes for this talkthrough code

#pragma optimize_off
extern void InitPLL(void);
extern void process(void);

extern void InitDAI(void);
extern void DAIsigInit(void);
extern void setDAIproc(void);
extern void clrDAIproc(void);

extern float conv_asm( float * coef, float * inCur, float * inBase, unsigned int bufSize);	//

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

#endif
