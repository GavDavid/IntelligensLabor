#include "frame.h"

/* FILTER_IIR = 1: IIR szuro.
 * FILTER_IIR = 0: FIR alulatereszto szuro.
 * IIR_FILTER_TYPE = 0: 4. egyutthatokeszlet.
 * IIR_FILTER_TYPE = 1: Butterworth, 12 kHz.
 * IIR_FILTER_TYPE = 2: Csebisev I, 4 kHz.
 */
#define FILTER_IIR 1
#define IIR_FILTER_TYPE 0

#if FILTER_IIR
#define IIR_B_COUNT 5
#define IIR_A_COUNT 4

#if IIR_FILTER_TYPE == 0
#define IIR_COEF_SCALE 4
section("L1_data_a") fract iir_b[IIR_B_COUNT] = {
    0.1249537494, -0.4998149976, 0.7497224968,
    -0.4998149976, 0.1249537494
};
section("L1_data_a") fract iir_a[IIR_A_COUNT] = {
    -0.6596569359, 0.6923274466, -0.3348201903, 0.0624554175
};
#elif IIR_FILTER_TYPE == 1
#define IIR_COEF_SCALE 1
section("L1_data_a") fract iir_b[IIR_B_COUNT] = {
#include "Butterworth_b.dat"
};
section("L1_data_a") fract iir_a[IIR_A_COUNT] = {
#include "Butterworth_a.dat"
};
#elif IIR_FILTER_TYPE == 2
#define IIR_COEF_SCALE 8
section("L1_data_a") fract iir_b[IIR_B_COUNT] = {
#include "Cheby1_b.dat"
};
section("L1_data_a") fract iir_a[IIR_A_COUNT] = {
#include "Cheby1_a.dat"
};
#else
#error IIR_FILTER_TYPE erteke csak 0, 1 vagy 2 lehet
#endif

section("L1_data_b") fract iir_x_history[IIR_B_COUNT] = {0};
section("L1_data_b") fract iir_y_history[IIR_A_COUNT] = {0};
#else
section("L1_data_a") fract fir_coefs[] = {
#include "FIR_lowpass_coef.dat"
};
#define FIR_TAPS (sizeof(fir_coefs) / sizeof(fir_coefs[0]))
section("L1_data_b") fract fir_history[FIR_TAPS] = {0};
int fir_index = 0;
#endif

//--------------------------------------------------------------------------//
// Function: Process_Data()
//
// Description: Called from the SPORT0 ISR for each received audio frame.
// The left output carries the unfiltered input, while the right output
// carries the filtered signal.
//--------------------------------------------------------------------------//
void Process_Data(void)
{
    int j;
    int index;
    accum acc = 0;
    fract x;
    fract y;

    if (uart_rx_flag)
    {
        uart_rx_flag = false;
        uart_putch(uart_getch());
    }

    iChannel0LeftOut = iChannel0RightIn;
    x = rbits((iChannel0RightIn >> 8));

#if FILTER_IIR
    acc = x * iir_b[0];
    for (j = 1; j < IIR_B_COUNT; j++)
    {
        acc += iir_x_history[j - 1] * iir_b[j];
    }
    for (j = 0; j < IIR_A_COUNT; j++)
    {
        acc -= iir_y_history[j] * iir_a[j];
    }

    y = (fract)(acc * IIR_COEF_SCALE);

    for (j = IIR_B_COUNT - 1; j > 0; j--)
    {
        iir_x_history[j] = iir_x_history[j - 1];
    }
    iir_x_history[0] = x;

    for (j = IIR_A_COUNT - 1; j > 0; j--)
    {
        iir_y_history[j] = iir_y_history[j - 1];
    }
    iir_y_history[0] = y;
#else
    fir_history[fir_index] = x;
    index = fir_index;
    for (j = 0; j < FIR_TAPS; j++)
    {
        acc += fir_history[index] * fir_coefs[j];
        index = (index == 0) ? FIR_TAPS - 1 : index - 1;
    }
    y = (fract)acc;

    fir_index++;
    if (fir_index >= FIR_TAPS)
    {
        fir_index = 0;
    }
#endif

    iChannel0RightOut = bitsr(y) << 8;
}
