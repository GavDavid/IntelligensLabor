#include "frame.h"
#include "uart.h"

// Public global variables
volatile bool  uart_rx_flag;
volatile char * volatile uart_str;
volatile short uart_ch;
volatile bool  uart_tx_active;

// Private global variables
volatile char tx_ch;

//--------------------------------------------------------------------------//
// Function:	uart_setup													//
//																			//
// Description: Initializes the global variables used to control the UART.	//
//--------------------------------------------------------------------------//
void uart_setup(void)
{
	uart_rx_flag= false;
	tx_ch		= 0;
	uart_str	= &tx_ch;
}

//--------------------------------------------------------------------------//
// Function:	uart_putch													//
//																			//
// Description: Sends one character to UART. Nonblocking function.			//
//--------------------------------------------------------------------------//
void uart_putch(char ch)
{
	// Abort in case of active transmission
	if (uart_tx_active)
	{
		return;
	}

	// Set up temporary empty string for IT handler
	tx_ch      = 0;
	uart_str   = &tx_ch;

	// Wait in case of active transmission
	while (!(*pUART0_LSR&(1 << 5)));
	uart_tx_active = true;

	// Send the character
	*pUART0_THR = ch;
}

//--------------------------------------------------------------------------//
// Function:	uart_print													//
//																			//
// Description: Sends a null terminted string to UART. Nonblocking function.//
//--------------------------------------------------------------------------//
void uart_print(char *str)
{
	// Abort in case of active transmission or empty string
	if (0 == str[0] || uart_tx_active)
	{
		return;
	}

	// Set up string for IT handler
	uart_str   = &str[1];

	// Wait in case of active transmission
	while (!(*pUART0_LSR&(1 << 5)));
	uart_tx_active = true;

	// Start transfer by sending first character
	*pUART0_THR = str[0];
}

//--------------------------------------------------------------------------//
// Function:	uart_getch													//
//																			//
// Description: Returns the value of the last received character on UART.	//
//--------------------------------------------------------------------------//
short uart_getch(void)
{
	return uart_ch;
}

