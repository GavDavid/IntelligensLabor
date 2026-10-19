	.file "..\src\main.c";
//  Compilation time: Tue Oct 13 17:34:34 2026
//  Compiler options: -c -file-attr ProjectName=BlackFin_Frame -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\main.d -o src\main.doj
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
_main:
.LN_main:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0-R2,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {R4-R7,P4-P5}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\main.c":67
	LINK 12;
	.align 2
.LN0:
// line 68
	CALL.X _Init_Flags;
.LN1:
// line 69
	CALL.X _Audio_Reset;
.LN2:
// line 70
	CALL.X _Init_Sport0;
.LN3:
// line 71
	CALL.X _Init_DMA;
.LN4:
// line 72
	CALL.X _Init_UART;
.LN5:
// line 73
	CALL.X _Init_Interrupts;
.LN6:
// line 74
	CALL.X _Enable_DMA_Sport0;
.LN7:
// line 84
	R0 = 0;
	BITSET(R0, 30);
	R1 = -32768 /* 1195081728 */;
	R1.H = 18235 /* 1195081728 */;
	R7.L = R7.L - R7.L (NS) || [SP + 24] = R0;
	[SP + 20] = R1;
	R6 = 0 /* 1140457472 */;
	R6.H = 17402 /* 1140457472 */;
	P5.L = _uart_rx_flag;
	P5.H = _uart_rx_flag;
	P4.L = _phase;
	P4.H = _phase;

.P44L1:
//-------------------------------------------------------------------
//   Loop at "..\src\main.c" line 81 col 2
//-------------------------------------------------------------------
	R5 = PACK(R5.H, R7.L) || R1 = [SP + 24];
.LN8:
// line 82
	R0 = R7.b (Z);
	CC = R0 == 0;
	if !CC jump .P44L6 ;

.LN9:
// line 84
	R0 = R6;
	CALL.X ___float32_mul;                  // floating-point multiplication is implemented as a library call. 
	R1 = [SP + 20];
	CALL.X ___float32_div;                  // floating-point division is implemented as a library call. 
	CALL.X ___float_to_fr16;                // instruction is implemented as a library call. 
	W[P4] = R0.L;                           // Use of volatile in loops precludes optimizations. 
	R5 = 1;

.P44L6:
	R1 = R6;
.LN10:
// line 87
	R7 = PACK(R7.H, R5.L) || 
	R0 = B[P5] (Z);                         // Use of volatile in loops precludes optimizations. 
	CC = R0 == 0;
	if !CC jump .P44L7 ;

.P44L28:
	R6 = R1;
	jump.s .P44L1;
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------

.P44L7:
.LN11:
// line 89
	R0 = 0;
.LN12:
	R7.L = R7.L - R7.L (NS) || 
	B[P5] = R0;                             // Use of volatile in loops precludes optimizations. 
.LN13:
// line 90
	CALL.X _uart_getch;
	R4 = R0;
	R0 = R0.b (X);
.LN14:
// line 91
	CALL.X _uart_putch;
.LN15:
// line 92
	R2 = 99;
.LN16:
	CC = R4 == R2;
	R1 = -32768 /* 1132625920 */;
	R1.H = 17282 /* 1132625920 */;
	if CC jump .P44L28 ;

.LN17:
// line 97
	R0 = 100;
.LN18:
	CC = R4 == R0;
	R1 = -32768 /* 1133674496 */;
	R1.H = 17298 /* 1133674496 */;
	if CC jump .P44L28 ;

.LN19:
// line 102
	R0 = 101;
.LN20:
	CC = R4 == R0;
	R1 = 0 /* 1134886912 */;
	R1.H = 17317 /* 1134886912 */;
	if CC jump .P44L28 ;

.LN21:
// line 107
	R0 = 102;
.LN22:
	CC = R4 == R0;
	R1 = -32768 /* 1135509504 */;
	R1.H = 17326 /* 1135509504 */;
	if CC jump .P44L28 ;

.LN23:
// line 112
	R0 = 103;
.LN24:
	CC = R4 == R0;
	R1 = 0 /* 1136918528 */;
	R1.H = 17348 /* 1136918528 */;
	if CC jump .P44L28 ;

.LN25:
// line 117
	R0 = 97;
.LN26:
	CC = R4 == R0;
	R7 = R5;
	R1 = R6;
	if !CC jump .P44L28 ;

	R7.L = 0;
	R1 = 0 /* 1138491392 */;
	R1.H = 17372 /* 1138491392 */;
	jump.s .P44L28;
.LN._main.end:
._main.end:
	.global _main;
	.type _main,STT_FUNC;

	.file_attr ProjectName="BlackFin_Frame";
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
	.file_attr FuncName="_main";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _Init_Flags;
	.type _Init_Flags,STT_FUNC;
	.extern _Audio_Reset;
	.type _Audio_Reset,STT_FUNC;
	.extern _Init_Sport0;
	.type _Init_Sport0,STT_FUNC;
	.extern _Init_DMA;
	.type _Init_DMA,STT_FUNC;
	.extern _Init_UART;
	.type _Init_UART,STT_FUNC;
	.extern _Init_Interrupts;
	.type _Init_Interrupts,STT_FUNC;
	.extern _Enable_DMA_Sport0;
	.type _Enable_DMA_Sport0,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern ___float_to_fr16;
	.type ___float_to_fr16,STT_FUNC;
	.extern _uart_getch;
	.type _uart_getch,STT_FUNC;
	.extern _uart_putch;
	.type _uart_putch,STT_FUNC;

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.type .epcbss,STT_OBJECT;
.epcbss:
	.byte _iTxBuffer1[8];
	.global _iTxBuffer1;
	.type _iTxBuffer1,STT_OBJECT;
	.byte _iRxBuffer1[8];
	.global _iRxBuffer1;
	.type _iRxBuffer1,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\main.sbn", 0, 247;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x11,0x14,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x6D,0x61,0x69,
		0x6E,0x2E,0x63,0x00,0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\main.sbn", 247, 4636;
	.byte4 = .LN_main;
	.byte4 = .LN._main.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._main.end;
	.byte =
		0x00,0x00,0x12,0x75,0x61,0x72,0x74,0x5F,0x72,0x78,0x5F,0x66,
		0x6C,0x61,0x67,0x00,0x01,0x0F,0x14,0x00,0x00,0x05,0x03;
	.byte4 = _uart_rx_flag;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x49,0x6E,0x00,0x01,0xE9,
		0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftIn;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x31,0x4C,0x65,0x66,0x74,0x49,0x6E,0x00,0x01,0xE9,
		0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel1LeftIn;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x49,0x6E,0x00,0x01,
		0xE9,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightIn;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x31,0x52,0x69,0x67,0x68,0x74,0x49,0x6E,0x00,0x01,
		0xE9,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel1RightIn;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x4F,0x75,0x74,0x00,0x01,
		0xE9,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftOut;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x31,0x4C,0x65,0x66,0x74,0x4F,0x75,0x74,0x00,0x01,
		0xE9,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel1LeftOut;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x4F,0x75,0x74,0x00,
		0x01,0xE9,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightOut;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x31,0x52,0x69,0x67,0x68,0x74,0x4F,0x75,0x74,0x00,
		0x01,0xE9,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel1RightOut;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x54,0x78,0x42,0x75,0x66,
		0x66,0x65,0x72,0x31,0x00,0x01,0x01,0x14,0x00,0x00,0x05,0x03;
	.byte4 = _iTxBuffer1;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x52,0x78,0x42,0x75,0x66,
		0x66,0x65,0x72,0x31,0x00,0x01,0xF3,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iRxBuffer1;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x70,0x68,0x61,0x73,0x65,0x00,
		0x01,0xEE,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _phase;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x6E,0x64,0x65,0x78,0x00,
		0x01,0xE9,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _index;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0xD0,0x01,0x00,0x00,0x0E,0x9B,
		0x03,0x00,0x00,0x13,0x01,0x14,0x00,0x00,0xE9,0x13,0x00,0x00,
		0x14,0x02,0x00,0x01,0x00,0x13,0x0F,0x14,0x00,0x00,0xE9,0x13,
		0x00,0x00,0x14,0x02,0x00,0x01,0x00,0x0E,0x6A,0x01,0x00,0x00,
		0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\main.sbn", 4883, 821;
	.byte4 = .LN_main;
	.byte =
		0x04,0x01,0x05,0x01,0x4B,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x0C,0x0A,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x0D,0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x11,0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x13,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x04,0x13,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x04,0x0B,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x04,0x0B,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x19,0x0A,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x0E,0x0A,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x09,0x0E,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN._main.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0xF1,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary ".\src\main.sbn", 5704, 235;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x1C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_main;
	.byte4 = .LN._main.end-.LN_main;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.global _iChannel0LeftIn;
	.type _iChannel0LeftIn,STT_OBJECT;
	.byte _iChannel0LeftIn[4];
	.align 4;
	.global _iChannel1LeftIn;
	.type _iChannel1LeftIn,STT_OBJECT;
	.byte _iChannel1LeftIn[4];
	.align 4;
	.global _iChannel0RightIn;
	.type _iChannel0RightIn,STT_OBJECT;
	.byte _iChannel0RightIn[4];
	.align 4;
	.global _iChannel1RightIn;
	.type _iChannel1RightIn,STT_OBJECT;
	.byte _iChannel1RightIn[4];
	.align 4;
	.global _iChannel0LeftOut;
	.type _iChannel0LeftOut,STT_OBJECT;
	.byte _iChannel0LeftOut[4];
	.align 4;
	.global _iChannel1LeftOut;
	.type _iChannel1LeftOut,STT_OBJECT;
	.byte _iChannel1LeftOut[4];
	.align 4;
	.global _iChannel0RightOut;
	.type _iChannel0RightOut,STT_OBJECT;
	.byte _iChannel0RightOut[4];
	.align 4;
	.global _iChannel1RightOut;
	.type _iChannel1RightOut,STT_OBJECT;
	.byte _iChannel1RightOut[4];
	.align 2;
	.global _phase;
	.type _phase,STT_OBJECT;
	.byte _phase[2];
	.align 4;
	.global _index;
	.type _index,STT_OBJECT;
	.byte _index[4];

	.section/DOUBLE32 data1;


	.extern _uart_rx_flag;
	.type _uart_rx_flag,STT_OBJECT;
