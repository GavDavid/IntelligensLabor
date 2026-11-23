// ********************************************************	//
// ASSEMBLY FUNCTION                          			//
//												   			//
//                                                 			// 
//                                                 			// 
// Declaration:												//
// extern float conv( float * coef, float * inCur, float * inBase, unsigned int bufSize, float * outPointer);	//
// 						r4				r8			r12				stack									//
// Usage:													//	
// out = conv(coefs,&input[i],input,bufSize);				//
//
//Warning!!! The size of the input array must be bufSize+1	//
//and input[0] == input[bufSize] must be satisfied.			//

//Saves mode1 reg into the 'a' stack -> Callable multiple times
// ********************************************************	//

// *********************************************** //
// Important note:								   //
// The size of the two vectors (N_TAPS) has to be  //
// entered manually below:                         //
// *********************************************** //
#define N_TAPS 401
#include <asm_sprt.h>
#include <def21364.h>

.SECTION/PM seg_pmda;
.var mode1MentUH;



.SECTION/PM seg_pmco;
.global _conv_asm_int;


_conv_asm_int:

leaf_entry;

/*
//The stack:
//  N: Param
//-----------
//	i6 old		<--i6
//-----------
//  PC back
//-----------
//  local var		<-- régi i7 = i6 - 2 : reads(-2)
//-----------
//					<--i7 after modify
//-----------
//

//leaf_exit restores i7 to i6, which is the first free space after the calling
//functions stack so it is not necessary to restore i7

modify(i7,-1); //step backwards i7. This will be the place for a local variable
*/

/*
puts = s2;
puts = astatx;
puts = astaty;
puts = mode1;
puts = r0;
puts = s0;
puts = r2;
puts = r4;
puts = s4;
puts = r8;
puts = s8;
puts = r12;
puts = s12;
r0 = i4;
puts = r0;
r0 = m4;
puts = r0;
r0 = l4;
puts = r0;
r0 = b4;
puts = r0;
puts = i12;
puts = m12;
puts = l12;
puts = b12;
*/

/*extern float rightInD  , leftInD;
extern float rightOut1D, leftOut1D;
extern float rightOut2D, leftOut2D;
extern float rightOut3D, leftOut3D;
extern float rightOut4D, leftOut4D;*/

r0 = mode1;
pm(mode1MentUH) = r0;

	bit set MODE1 CBUFEN;				// Circular Buffer Enable, one cycle effect latency 
	bit set MODE1 PEYEN;				// SIMD Mode Enable, one cycle effect latency 

m4  = 2;  // In SIMD mode its mandatory to step by 2, the other one is automatic
m12 = 2;  // In SIMD mode its mandatory to step by 2, the other one is automatic

r2 = reads(1); //bufSize parameter from the stack dm(1,i6)
//i4 : input, i12: coef
b12 = r4;
l12 = r2;

b4 = r12;
l4 = r2;
i4 = r8;
//dm(-2, i6) = r8; //save where the pointer pointed
  
 
		
	r2 = ashift r2 by -1;
	r2 = r2 - 1; //bufSize-1, because one iteration is done outside the loop

	lcntr = 8, do DAChannelsInt until lce;
		 
 		f8  = 0.0;	
		f12 = 0.0;
		f0  = dm(i4,m4) , f4 = pm(i12,m12); //f0=x(n), f4=w0
		
		lcntr = r2, do convLoop1 until lce;
convLoop1:	f12 = f0 * f4,	f8 = f8 + f12, f0 = dm(i4,m4), f4 = pm(i12,m12);
			f12 = f0 * f4,	f8 = f8 + f12;
			f8 = f8 + f12;
//the secondary and primary results together
			f0 = s8;
			f4 = f0 + f8;	//the result of the filtering in f4
		
	bit clr MODE1 PEYEN;				// otherwise it would be overwritten
		r0 = i4;  //the previous array; saved into r0 --> !!do not modify
		i4 = reads(2);	//the place to save the result
		dm(i4,1) = f4;	//save the result of filtering, step to the next
		r4 = i4;		//i4 is not saveable directly
		dm(2,i6) = r4;	//so it is saved to the next place
	bit set MODE1 PEYEN;				// enable again
		
		//next data in the array
		r4 = b4;  
		r8 = l4;
		r8 = r8 + 1;	//the array has length bufSize + 1
		r4 = r4 + r8;	//calculate the position of the next array
		b4 = r4;		//step to the next array position
		i4 = r0;		//previous array position
		m4 = r8;		//this is the number of data to modify
		modify(i4,m4);  
		m4 = 2;			//restore m4
DAChannelsInt: nop;


//bit clr mode1 0x0200000; nop; // exit SIMD mode

/*
b12 = gets(1);
l12 = gets(2);
m12 = gets(3);
i12 = gets(4);
b4  = gets(5);
l4  = gets(6);
m4  = gets(7);
i4  = gets(8);
s12 = gets(9);
r12 = gets(10);
s8  = gets(11);
r8  = gets(12);
s4  = gets(13);
r4  = gets(14);
r2  = gets(15);
s0  = gets(16);
r0  = gets(17);
mode1  = gets(18);
astatx = gets(19);
astaty = gets(20);
s2  = gets(21);

alter(21);
*/

r2 = pm(mode1MentUH);  
mode1 = r2;  
l12 = 0;  
l4  = 0;  

leaf_exit;

_conv_asm_int.end: nop;


