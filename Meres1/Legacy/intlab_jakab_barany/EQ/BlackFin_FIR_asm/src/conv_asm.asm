// ********************************************************	//
// ASSEMBLY CONV FUNCTION                          			//
//												   			//
//                                                 			// 
// Created by Karoly Molnar 2007.                  			//
//                                                 			// 
// Declaration:												//
// extern int conv_asm( fract16 *, fract16 *, fract16 * );	//
// 															//
// Usage:													//	
// out = conv_asm(coefs,&input[i],input);					//
// ********************************************************	//

// *********************************************** //
// Important note:								   //
// The size of the two vectors (N_TAPS) has to be  //
// entered manually below:                         //
// *********************************************** //

#define N_TAPS 301

.section L1_code;

.global _conv_asm;
_conv_asm:

	P0 = R0;	// Start address of the coeffs.
	I0 = R1;	// Address of the latest data in the input buffer.
	B0 = R2;	// Start address of the input buffer.
	P1 = 2 * N_TAPS; 
	L0 = P1;
	M0 = 1;
		
	R0 = 0;
	NOP;
	NOP;
	R1 = W[P0++] (Z);
	R2.l = W[I0++];
	A0 = 0;	

	P1 = N_TAPS - 1; 	// has to be N-1	
	LSETUP (mac_loop,mac_loop) LC0 = P1;
	mac_loop: 	A0 += R1.l * R2.l || R2.l = W[I0 ++] || R1 = W[P0++](Z);
	
	A0 += 	R1.l * R2.l;
	R0.l = A0;
	RTS;

_conv_asm.end:


/*
//Previous working version:

	LSETUP (begin_loop, end_loop) LC0 = P1;
	begin_loop:	R1.l = R1.l * R2.l || R2.l = W[I0++];				
	end_loop:	R0.l = R0.l + R1.l (NS) || R1 = W[P0++](Z) || NOP;

	R1.l = R1.l * R2.l;
	R0.l = R0.l + R1.l (NS);
	RTS;
*/
