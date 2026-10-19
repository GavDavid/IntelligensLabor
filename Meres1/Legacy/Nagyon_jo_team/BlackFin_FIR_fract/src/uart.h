#ifndef UART_DEFINED
#define UART_DEFINED

//--------------------------------------------------------------------------//
// Global variables															//
//--------------------------------------------------------------------------//
extern volatile char * volatile uart_str;
extern volatile short uart_ch;
extern volatile bool  uart_tx_active;

extern volatile bool  uart_rx_flag;

//--------------------------------------------------------------------------//
// Prototypes																//
//--------------------------------------------------------------------------//
void  uart_setup(void);

void  uart_putch(char);
void  uart_print(char*);
short uart_getch(void);

#endif //UART_DEFINED
