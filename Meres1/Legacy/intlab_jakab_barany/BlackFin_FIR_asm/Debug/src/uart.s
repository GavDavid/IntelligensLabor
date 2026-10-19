	.file "..\src\uart.c";
//  Compilation time: Mon Oct 28 16:55:34 2024
//  Compiler options: -c -file-attr ProjectName=BlackFin_FIR_asm -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\uart.d -o src\uart.doj
//  Compiler version: 8.15.1.0 (944d964b07b43641c9beb96c0dedb3360eadda96)
//  Architecture: ADSP-BF537
//  Silicon revision: 0.3
//  Anomalies summary:
//   Never on: w_05000046
//   Disabled: w_05000048, w_05000103, w_05000104, w_05000120, w_05000127, w_05000157, w_05000198, w_05000202, w_05000209, w_05000227, w_05000244, w_05000246, w_05000248, w_05000262, w_05000264, w_05000283, w_F3_F_021, w_F3_F_008_F3_F_013, w_05000428, w_05000412, w_05000010, w_19000010, w_19000019, w_19000058
//   Enabled: w_05000074_16000015, w_05000122, w_05000310_16000013, w_05000245_16000014, w_05000312, w_05000371, w_05000426_16000012, w_05000443_16000010, w_05000477_16000009, w_05000506_16000043

.MESSAGE/SUPPRESS 5500;
.MESSAGE/SUPPRESS 5508;


	.section/DOUBLE32 program;

.epctext:

	.align 4;
_uart_getch:
.LN_uart_getch:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0,P0-P1}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\uart.c":80
	LINK 0;
	.align 2
	P1.L = _uart_ch;
	P1.H = _uart_ch;
.LN0:
// line 81
	R0 = W[P1] (X);
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._uart_getch.end:
._uart_getch.end:
	.global _uart_getch;
	.type _uart_getch,STT_FUNC;

	.align 2;
_uart_print:
.LN_uart_print:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 12 
//  Scratch registers used: {R0,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//  Call preserved registers used: {P5,RETS}
//-------------------------------------------------------------------
	P0 = R0;
// line "..\src\uart.c":56
	LINK 0;
	[--SP] = P5;
	P5.L = _uart_tx_active;
	P5.H = _uart_tx_active;
.LN1:
// line 58
	R0 = B[P0] (X);
	CC = R0 == 0;
	if CC jump .P39L5 ;

	R0 = B[P5] (Z);
	CC = R0 == 0;
	if !CC jump .P39L5 ;

	P1 = P0;
	P0 += 1;
	P2.L = _uart_str;
	P2.H = _uart_str;
.LN2:
// line 64
	[P2] = P0;
	P0 = -1;
.LN3:
// line 67
	P2 = 1044 /* -4193260 */;
	P2.H = -64 /* -4193260 */;

.P39L14:
//-------------------------------------------------------------------
//   Loop at "..\src\uart.c" line 67 col 2 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	LOOP .P39L7L LC0 = P0;

.P39L7:
//-------------------------------------------------------------------
//   Loop at "..\src\uart.c" line 67 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   6 out of    6 (100.0%)
//     Group 1             used   3 out of    3 (100.0%)
//     32-bit Instruction  used   2 out of    3 ( 66.7%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P39L7L;
	R0 = W[P2] (Z);                         // Use of volatile in loops precludes optimizations. 
	CC = BITTST(R0, 5);
	if CC jump .P39L8 ;

	LOOP_END .P39L7L;
//-------------------------------------------------------------------
//   End Loop L7
//-------------------------------------------------------------------

//-------------------------------------------------------------------
//   Part of Loop 14, depth 1
//-------------------------------------------------------------------
	jump.s .P39L14;
//-------------------------------------------------------------------
//   End Loop L14
//-------------------------------------------------------------------

.P39L8:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN4:
// line 68
	R0 = 1;
	B[P5] = R0;
.LN5:
// line 71
	R0 = B[P1] (X);
	P1 = 1024 /* -4193280 */;
	P1.H = -64 /* -4193280 */;
	W[P1] = R0.L;

.P39L5:
.LN6:
// line 72
	P0 = [FP + 4];
	P5 = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._uart_print.end:
._uart_print.end:
	.global _uart_print;
	.type _uart_print,STT_FUNC;

	.align 4;
_uart_putch:
.LN_uart_putch:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R1,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\uart.c":31
	LINK 0;
	.align 2
	P0.L = _uart_tx_active;
	P0.H = _uart_tx_active;
.LN7:
// line 33
	R1 = B[P0] (Z);
	CC = R1 == 0;
	if !CC jump .P40L4 ;

	P1.L = _tx_ch;
	P1.H = _tx_ch;
.LN8:
// line 39
	R1 = 0;
	B[P1] = R1;
	R1 = P1;
	P1.L = _uart_str;
	P1.H = _uart_str;
.LN9:
// line 40
	[P1] = R1;
	P1 = -1;
.LN10:
// line 43
	P2 = 1044 /* -4193260 */;
	P2.H = -64 /* -4193260 */;

.P40L12:
//-------------------------------------------------------------------
//   Loop at "..\src\uart.c" line 43 col 2 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	LOOP .P40L6L LC0 = P1;

.P40L6:
//-------------------------------------------------------------------
//   Loop at "..\src\uart.c" line 43 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   6 out of    6 (100.0%)
//     Group 1             used   3 out of    3 (100.0%)
//     32-bit Instruction  used   2 out of    3 ( 66.7%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L6L;
	R1 = W[P2] (Z);                         // Use of volatile in loops precludes optimizations. 
	CC = BITTST(R1, 5);
	if CC jump .P40L7 ;

	LOOP_END .P40L6L;
//-------------------------------------------------------------------
//   End Loop L6
//-------------------------------------------------------------------

//-------------------------------------------------------------------
//   Part of Loop 12, depth 1
//-------------------------------------------------------------------
	jump.s .P40L12;
//-------------------------------------------------------------------
//   End Loop L12
//-------------------------------------------------------------------

.P40L7:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN11:
// line 44
	R1 = 1;
	B[P0] = R1;
.LN12:
// line 47
	P1 = 1024 /* -4193280 */;
	P1.H = -64 /* -4193280 */;
	W[P1] = R0.L;

.P40L4:
.LN13:
// line 48
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._uart_putch.end:
._uart_putch.end:
	.global _uart_putch;
	.type _uart_putch,STT_FUNC;

	.align 4;
_uart_setup:
.LN_uart_setup:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0,P0-P2}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\uart.c":19
	LINK 0;
	.align 2
.LN14:
// line 20
	R0 = 0;
	P0.L = _uart_rx_flag;
	P0.H = _uart_rx_flag;
	B[P0] = R0;
	P1.L = _tx_ch;
	P1.H = _tx_ch;
.LN15:
// line 21
	B[P1] = R0;
	R0 = P1;
	P1.L = _uart_str;
	P1.H = _uart_str;
.LN16:
// line 22
	[P1] = R0;
.LN17:
// line 23
	P2 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P2);
.LN._uart_setup.end:
._uart_setup.end:
	.global _uart_setup;
	.type _uart_setup,STT_FUNC;

	.file_attr ProjectName="BlackFin_FIR_asm";
	.file_attr FuncName="_uart_getch";
	.file_attr FuncName="_uart_print";
	.file_attr FuncName="_uart_putch";
	.file_attr FuncName="_uart_setup";
	.file_attr FuncName="_atof";
	.file_attr FuncName="_atoi";
	.file_attr FuncName="_atol";
	.file_attr FuncName="_strtod";
	.file_attr FuncName="_strtoul";
	.file_attr FuncName="_atoll";
	.file_attr FuncName="_strtof";
	.file_attr FuncName="_strtold";
	.file_attr FuncName="_strtoll";
	.file_attr FuncName="_strtoull";
	.file_attr Content="CodeData";
.epctext.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\uart.sbn", 0, 250;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0xD3,0x11,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x75,0x61,0x72,
		0x74,0x2E,0x63,0x00,0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\uart.sbn", 250, 4214;
	.byte4 = .LN_uart_getch;
	.byte4 = .LN._uart_getch.end;
	.byte =
		0x01,0xAC,0x01,0x00,0x00,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._uart_getch.end;
	.byte =
		0x00,0x00,0x12,0xDE,0x10,0x00,0x00,0x75,0x61,0x72,0x74,0x5F,
		0x70,0x72,0x69,0x6E,0x74,0x00,0x01;
	.byte4 = .LN_uart_print;
	.byte4 = .LN._uart_print.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN1;
	.byte4 = .LN._uart_print.end;
	.byte =
		0x00,0x00,0x12,0x09,0x11,0x00,0x00,0x75,0x61,0x72,0x74,0x5F,
		0x70,0x75,0x74,0x63,0x68,0x00,0x01;
	.byte4 = .LN_uart_putch;
	.byte4 = .LN._uart_putch.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN7;
	.byte4 = .LN._uart_putch.end;
	.byte =
		0x00,0x00,0x12,0x34,0x11,0x00,0x00,0x75,0x61,0x72,0x74,0x5F,
		0x73,0x65,0x74,0x75,0x70,0x00,0x01;
	.byte4 = .LN_uart_setup;
	.byte4 = .LN._uart_setup.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN14;
	.byte4 = .LN._uart_setup.end;
	.byte =
		0x00,0x00,0x13,0x75,0x61,0x72,0x74,0x5F,0x72,0x78,0x5F,0x66,
		0x6C,0x61,0x67,0x00,0x01,0xC1,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _uart_rx_flag;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x13,0x75,0x61,0x72,0x74,0x5F,0x73,
		0x74,0x72,0x00,0x01,0xD1,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _uart_str;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x13,0x75,0x61,0x72,0x74,0x5F,0x63,
		0x68,0x00,0x01,0xC6,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _uart_ch;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x13,0x75,0x61,0x72,0x74,0x5F,0x74,
		0x78,0x5F,0x61,0x63,0x74,0x69,0x76,0x65,0x00,0x01,0xC1,0x11,
		0x00,0x00,0x05,0x03;
	.byte4 = _uart_tx_active;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x13,0x74,0x78,0x5F,0x63,0x68,0x00,
		0x01,0xBC,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _tx_ch;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x84,0x01,0x00,0x00,0x0E,0x71,
		0x01,0x00,0x00,0x0E,0xAC,0x01,0x00,0x00,0x05,0x00,0xBC,0x11,
		0x00,0x00,0x0E,0xCB,0x11,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\uart.sbn", 4464, 804;
	.byte4 = .LN_uart_getch;
	.byte =
		0x04,0x01,0x05,0x01,0x58,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._uart_getch.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_uart_print;
	.byte =
		0x04,0x01,0x05,0x01,0x40,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._uart_print.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_uart_putch;
	.byte =
		0x04,0x01,0x05,0x01,0x27,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._uart_putch.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_uart_setup;
	.byte =
		0x04,0x01,0x05,0x01,0x1B,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._uart_setup.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x91,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary ".\src\uart.sbn", 5268, 139;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x34,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_uart_getch;
	.byte4 = .LN._uart_getch.end-.LN_uart_getch;
	.byte4 = .LN_uart_print;
	.byte4 = .LN._uart_print.end-.LN_uart_print;
	.byte4 = .LN_uart_putch;
	.byte4 = .LN._uart_putch.end-.LN_uart_putch;
	.byte4 = .LN_uart_setup;
	.byte4 = .LN._uart_setup.end-.LN_uart_setup;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 1;
	.global _uart_rx_flag;
	.type _uart_rx_flag,STT_OBJECT;
	.byte _uart_rx_flag[1];
	.align 4;
	.global _uart_str;
	.type _uart_str,STT_OBJECT;
	.byte _uart_str[4];
	.align 2;
	.global _uart_ch;
	.type _uart_ch,STT_OBJECT;
	.byte _uart_ch[2];
	.align 1;
	.global _uart_tx_active;
	.type _uart_tx_active,STT_OBJECT;
	.byte _uart_tx_active[1];
	.align 1;
	.global _tx_ch;
	.type _tx_ch,STT_OBJECT;
	.byte _tx_ch[1];
