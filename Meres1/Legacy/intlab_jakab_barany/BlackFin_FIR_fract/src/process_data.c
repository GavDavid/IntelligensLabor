#include "frame.h"

//#define N 50		    // number of filter coefficients
//section("L1_data_b") fract coefs[N] = {
//#include "bp_fract.dat"
//};
//

#define Na 4
#define Nb 5
//section("L1_data_b") fract b[Nb] = {-0.611372975152342, 0.917059462728512, -0.611372975152342, 0.152843243788085, 0.152843243788085};
//section("L1_data_b") fract a[Na] = {-0.651471653594406, 0.620472122486497, -0.147379460605609, 0.0261686639228548};

//section("L1_data_b") fract b[Nb] = {0.093980851433795,   0.375923405735178,   0.563885108602768,   0.375923405735178,   0.093980851433795};
//section("L1_data_b") fract a[Na] = {0.000000000000001,   0.486028822068270,   0.000000000000000,   0.017664800872442};

section("L1_data_b") fract b[Nb] = {0.000651540758433,   0.002606163033733,   0.003909244550599,   0.002606163033733,   0.000651540758433};
section("L1_data_b") fract a[Na] = {-0.421430366109431,   0.563165667411575,  -0.351070830080256,   0.085976011213335};


fract section("L1_data_a") input[Nb];
fract output[Nb] = {0};

accum outb = 0, outa = 0;
volatile fract outVal;
int i_b, i_a = 0;

fract konv;
uint16_t *konvi;
uint32_t konvi32;

//--------------------------------------------------------------------------//
// Function:	Process_Data()												//
//																			//
// Description: This function is called from inside the SPORT0 ISR every 	//
//				time a complete audio frame has been received. The new 		//
//				input samples can be found in the variables iChannel0LeftIn,//
//				iChannel0RightIn, iChannel1LeftIn and iChannel1RightIn 		//
//				respectively. The processed	data should be stored in 		//
//				iChannel0LeftOut, iChannel0RightOut, iChannel1LeftOut,		//
//				iChannel1RightOut, iChannel2LeftOut and	iChannel2RightOut	//
//				respectively.												//
//--------------------------------------------------------------------------//
void Process_Data(void)
{
	if (uart_rx_flag)
	{
		uart_rx_flag = false;
		uart_putch(uart_getch());
	}

	iChannel0LeftOut = iChannel0RightIn;

	input[i_b] = rbits((iChannel0RightIn>>8));
				
	int j;
	int ix, iy;

	ix  = i_b;
	outb = b[Nb-1] * input[ix];
	outa = 0;
			
	// Filter loop
	for (j=0; j<Nb; j++)
	{
		outb += input[ix%Nb]*b[j];


		outa -= output[ix%Nb]*a[j];

		ix++;
	}

	outa = outa << 3; //külön kell outa, azt skálázzuk vissza bitshift a gyors szorzáshoz, lehetne szorzást írni, compiler megoldaná

	i_b--;

	if (i_b<0)
	{
		i_b = Nb-1;
	}
	

	iChannel0RightOut = bitsr(outb + outa) << 8;


	output[i_b] = outb + outa;
}

