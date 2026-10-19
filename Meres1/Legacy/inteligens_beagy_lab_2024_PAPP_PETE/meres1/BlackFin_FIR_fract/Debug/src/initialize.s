	.file "..\src\initialize.c";
//  Compilation time: Tue Sep 10 09:54:11 2024
//  Compiler options: -c -file-attr ProjectName=BlackFin_FIR_fract -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\initialize.d -o src\initialize.doj
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
_Enable_DMA_Sport0:
.LN_Enable_DMA_Sport0:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0,P0-P1,ASTAT0-ASTAT1}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\initialize.c":149
	LINK 0;
	.align 2
.LN0:
// line 151
	P1 = 3336 /* -4190968 */;
	P1.H = -64 /* -4190968 */;
	R0 = W[P1] (X);
	BITSET(R0, 0);
	W[P1] = R0.L;
.LN1:
// line 152
	P1 = 3272 /* -4191032 */;
	P1.H = -64 /* -4191032 */;
	R0 = W[P1] (X);
	BITSET(R0, 0);
	W[P1] = R0.L;
.LN2:
// line 155
	P1 = 2048 /* -4192256 */;
	P1.H = -64 /* -4192256 */;
	R0 = W[P1] (X);
	BITSET(R0, 0);
	W[P1] = R0.L;
.LN3:
// line 156
	P1 = 2080 /* -4192224 */;
	P1.H = -64 /* -4192224 */;
	R0 = W[P1] (X);
	BITSET(R0, 0);
	W[P1] = R0.L;
.LN4:
// line 157
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._Enable_DMA_Sport0.end:
._Enable_DMA_Sport0.end:
	.global _Enable_DMA_Sport0;
	.type _Enable_DMA_Sport0,STT_FUNC;

	.align 4;
_Init_DMA:
.LN_Init_DMA:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0-R2,P0-P1}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\initialize.c":75
	LINK 0;
	.align 2
	R0 = 4234;
.LN5:
// line 78
	P1 = 3272 /* -4191032 */;
	P1.H = -64 /* -4191032 */;
	W[P1] = R0.L;
	R0.L = _iRxBuffer1;
	R0.H = _iRxBuffer1;
.LN6:
// line 80
	P1 = 3268 /* -4191036 */;
	P1.H = -64 /* -4191036 */;
	[P1] = R0;
.LN7:
// line 82
	R0 = 2;
	P1 = 3280 /* -4191024 */;
	P1.H = -64 /* -4191024 */;
	W[P1] = R0.L;
.LN8:
// line 84
	R1 = 4;
	P1 = 3284 /* -4191020 */;
	P1.H = -64 /* -4191020 */;
	W[P1] = R1.L;
	R2 = 4104;
.LN9:
// line 89
	P1 = 3336 /* -4190968 */;
	P1.H = -64 /* -4190968 */;
	W[P1] = R2.L;
	R2.L = _iTxBuffer1;
	R2.H = _iTxBuffer1;
.LN10:
// line 91
	P1 = 3332 /* -4190972 */;
	P1.H = -64 /* -4190972 */;
	[P1] = R2;
.LN11:
// line 93
	P1 = 3344 /* -4190960 */;
	P1.H = -64 /* -4190960 */;
	W[P1] = R0.L;
.LN12:
// line 95
	P1 = 3348 /* -4190956 */;
	P1.H = -64 /* -4190956 */;
	W[P1] = R1.L;
.LN13:
// line 96
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._Init_DMA.end:
._Init_DMA.end:
	.global _Init_DMA;
	.type _Init_DMA,STT_FUNC;

	.align 4;
_Init_Sport0:
.LN_Init_Sport0:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0-R1,P0-P1}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\initialize.c":54
	LINK 0;
	.align 2
	R0 = 21504;
.LN14:
// line 58
	P1 = 2080 /* -4192224 */;
	P1.H = -64 /* -4192224 */;
	W[P1] = R0.L;
	R1 = 535;
.LN15:
// line 59
	P1 = 2084 /* -4192220 */;
	P1.H = -64 /* -4192220 */;
	W[P1] = R1.L;
.LN16:
// line 64
	P1 = 2048 /* -4192256 */;
	P1.H = -64 /* -4192256 */;
	W[P1] = R0.L;
.LN17:
// line 65
	P1 = 2052 /* -4192252 */;
	P1.H = -64 /* -4192252 */;
	W[P1] = R1.L;
.LN18:
// line 66
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._Init_Sport0.end:
._Init_Sport0.end:
	.global _Init_Sport0;
	.type _Init_Sport0,STT_FUNC;

	.align 4;
_Audio_Reset:
.LN_Audio_Reset:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0,P0-P1}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
//  Original Loop at "..\src\initialize.c" line 40 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// line "..\src\initialize.c":37
	LINK 0;
	.align 2
	R0 = 4096;
.LN19:
// line 43
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	W[P1] = R0.L;
.LN20:
// line 44
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._Audio_Reset.end:
._Audio_Reset.end:
	.global _Audio_Reset;
	.type _Audio_Reset,STT_FUNC;

	.align 4;
_Init_Flags:
.LN_Init_Flags:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0-R2,R3.L,P0-P1,ASTAT0-ASTAT1}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\initialize.c":10
	LINK 0;
	.align 2
.LN21:
// line 14
	P1 = 12800 /* -4181504 */;
	P1.H = -64 /* -4181504 */;
	R3.L = R3.L - R3.L (NS) || R2 = W[P1] (X);
.LN22:
// line 16
	W[P1] = R3.L;
.LN23:
// line 17
	W[P1] = R3.L;
	R0 = 8128;
.LN24:
// line 20
	P1 = 1840 /* -4192464 */;
	P1.H = -64 /* -4192464 */;
	W[P1] = R0.L;
.LN25:
// line 23
	R0 = 60;
	P1 = 1856 /* -4192448 */;
	P1.H = -64 /* -4192448 */;
	W[P1] = R0.L;
	R1 = 4032;
.LN26:
// line 26
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R1.L;
.LN27:
// line 27
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._Init_Flags.end:
._Init_Flags.end:
	.global _Init_Flags;
	.type _Init_Flags,STT_FUNC;

	.align 4;
_Init_UART:
.LN_Init_UART:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 24 
//  Scratch registers used: {R0-R3,P0-P2,ASTAT0-ASTAT1}
//  Call preserved registers used: {R7,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\initialize.c":105
	LINK 16;
	.align 2
	R7.L = R7.L - R7.L (NS) || [SP + 12] = R7;
.LN28:
// line 109
	CALL.X _uart_setup;
.LN29:
// line 112
	R0 = 3;
	P1 = 12800 /* -4181504 */;
	P1.H = -64 /* -4181504 */;
	R1.L = R1.L - R1.L (NS) || W[P1] = R0.L;
.LN30:
// line 113
	P1 = 12812 /* -4181492 */;
	P1.H = -64 /* -4181492 */;
	W[P1] = R1.L;
.LN31:
// line 116
	R1 = 1;
	P1 = 1060 /* -4193244 */;
	P1.H = -64 /* -4193244 */;
	W[P1] = R1.L;
	R2 = 131;
.LN32:
// line 119
	P1 = 1036 /* -4193268 */;
	P1.H = -64 /* -4193268 */;
	W[P1] = R2.L;
	R3 = 65;
.LN33:
// line 121
	P0 = 1024 /* -4193280 */;
	P0.H = -64 /* -4193280 */;
	W[P0] = R3.L;
.LN34:
// line 122
	P2 = 1028 /* -4193276 */;
	P2.H = -64 /* -4193276 */;
	W[P2] = R7.L;
.LN35:
// line 125
	W[P1] = R0.L;
.LN36:
// line 136
	R1 = W[P0] (Z);
	[SP + 24] = R1;
.LN37:
// line 137
	P1 = 1044 /* -4193260 */;
	P1.H = -64 /* -4193260 */;
	R1 = W[P1] (Z);
	[SP + 24] = R1;
.LN38:
// line 138
	P1 = 1032 /* -4193272 */;
	P1.H = -64 /* -4193272 */;
	R1 = W[P1] (Z);
	[SP + 24] = R1;
.LN39:
// line 140
	W[P2] = R0.L;
.LN40:
// line 141
	P0 = [FP + 4];
	R7 = [SP + 12];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._Init_UART.end:
._Init_UART.end:
	.global _Init_UART;
	.type _Init_UART,STT_FUNC;

	.align 4;
_Init_Interrupts:
.LN_Init_Interrupts:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0-R1,P0-P1}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\initialize.c":165
	LINK 12;
	.align 2
.LN41:
// line 169
	P1 = 272 /* -4194032 */;
	P1.H = -64 /* -4194032 */;
	R0 = -1 /* -13631489 */;
	R0.H = -209 /* -13631489 */;
	[P1] = R0;
.LN42:
// line 170
	R0 = 16383 /* -770049 */;
	R0.H = -12 /* -770049 */;
	P1 = 276 /* -4194028 */;
	P1.H = -64 /* -4194028 */;
	[P1] = R0;
.LN43:
// line 171
	R0 = -1;
	P1 = 280 /* -4194024 */;
	P1.H = -64 /* -4194024 */;
	[P1] = R0;
.LN44:
// line 172
	P1 = 284 /* -4194020 */;
	P1.H = -64 /* -4194020 */;
	[P1] = R0;
.LN45:
// line 178
	R1.L = _Sport0_RX_ISR;
	R1.H = _Sport0_RX_ISR;
	R0 = 9;
	CALL.X _register_handler;
.LN46:
// line 179
	R1.L = _UART0_RX_ISR;
	R1.H = _UART0_RX_ISR;
	R0 = 10;
	CALL.X _register_handler;
.LN47:
// line 180
	R1.L = _UART0_TX_ISR;
	R1.H = _UART0_TX_ISR;
	R0 = 11;
	CALL.X _register_handler;
.LN48:
// line 184
	P1 = 268 /* -4194036 */;
	P1.H = -64 /* -4194036 */;
	R0 = 6176;
	[P1] = R0;
.LN49:
// line 185
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._Init_Interrupts.end:
._Init_Interrupts.end:
	.global _Init_Interrupts;
	.type _Init_Interrupts,STT_FUNC;

	.file_attr ProjectName="BlackFin_FIR_fract";
	.file_attr FuncName="_Enable_DMA_Sport0";
	.file_attr FuncName="_Init_DMA";
	.file_attr FuncName="_Init_Sport0";
	.file_attr FuncName="_Audio_Reset";
	.file_attr FuncName="_Init_Flags";
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
	.file_attr FuncName="_Init_UART";
	.file_attr FuncName="_Init_Interrupts";
	.file_attr Content="Code";
.epctext.end:

	.extern _uart_setup;
	.type _uart_setup,STT_FUNC;
	.extern _Sport0_RX_ISR;
	.type _Sport0_RX_ISR,STT_FUNC;
	.extern _register_handler;
	.type _register_handler,STT_FUNC;
	.extern _UART0_RX_ISR;
	.type _UART0_RX_ISR,STT_FUNC;
	.extern _UART0_TX_ISR;
	.type _UART0_TX_ISR,STT_FUNC;

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\initialize.sbn", 0, 247;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x4D,0x12,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x69,0x6E,0x69,
		0x74,0x69,0x61,0x6C,0x69,0x7A,0x65,0x2E,0x63,0x00,0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\initialize.sbn", 247, 4246;
	.byte4 = .LN_Enable_DMA_Sport0;
	.byte4 = .LN._Enable_DMA_Sport0.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._Enable_DMA_Sport0.end;
	.byte =
		0x00,0x00,0x10,0xFE,0x10,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,
		0x44,0x4D,0x41,0x00,0x01;
	.byte4 = .LN_Init_DMA;
	.byte4 = .LN._Init_DMA.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN5;
	.byte4 = .LN._Init_DMA.end;
	.byte =
		0x00,0x00,0x10,0x2A,0x11,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,
		0x53,0x70,0x6F,0x72,0x74,0x30,0x00,0x01;
	.byte4 = .LN_Init_Sport0;
	.byte4 = .LN._Init_Sport0.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN14;
	.byte4 = .LN._Init_Sport0.end;
	.byte =
		0x00,0x00,0x10,0x56,0x11,0x00,0x00,0x41,0x75,0x64,0x69,0x6F,
		0x5F,0x52,0x65,0x73,0x65,0x74,0x00,0x01;
	.byte4 = .LN_Audio_Reset;
	.byte4 = .LN._Audio_Reset.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN19;
	.byte4 = .LN._Audio_Reset.end;
	.byte =
		0x00,0x00,0x10,0x81,0x11,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,
		0x46,0x6C,0x61,0x67,0x73,0x00,0x01;
	.byte4 = .LN_Init_Flags;
	.byte4 = .LN._Init_Flags.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN21;
	.byte4 = .LN._Init_Flags.end;
	.byte =
		0x00,0x00,0x10,0xBE,0x11,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,
		0x55,0x41,0x52,0x54,0x00,0x01;
	.byte4 = .LN_Init_UART;
	.byte4 = .LN._Init_UART.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN28;
	.byte4 = .LN._Init_UART.end;
	.byte =
		0x12,0x74,0x65,0x6D,0x70,0x00,0x01,0xBE,0x11,0x00,0x00,0x02,
		0x7F,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0E,0xF6,0x01,
		0x00,0x00,0x10,0xF3,0x11,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,
		0x49,0x6E,0x74,0x65,0x72,0x72,0x75,0x70,0x74,0x73,0x00,0x01;
	.byte4 = .LN_Init_Interrupts;
	.byte4 = .LN._Init_Interrupts.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN41;
	.byte4 = .LN._Init_Interrupts.end;
	.byte =
		0x00,0x00,0x12,0x69,0x52,0x78,0x42,0x75,0x66,0x66,0x65,0x72,
		0x31,0x00,0x01,0x3D,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iRxBuffer1;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x54,0x78,0x42,0x75,0x66,
		0x66,0x65,0x72,0x31,0x00,0x01,0x2B,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iTxBuffer1;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x13,0x3D,0x12,0x00,0x00,0xBE,0x11,
		0x00,0x00,0x14,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x0F,0x00,0x13,
		0x4F,0x12,0x00,0x00,0xBE,0x11,0x00,0x00,0x14,0x00,0x00,0xFF,
		0xFF,0xFF,0xFF,0x0F,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\initialize.sbn", 4493, 810;
	.byte4 = .LN_Enable_DMA_Sport0;
	.byte =
		0x04,0x01,0x05,0x01,0x9D,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._Enable_DMA_Sport0.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_Init_DMA;
	.byte =
		0x04,0x01,0x05,0x01,0x53,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._Init_DMA.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_Init_Sport0;
	.byte =
		0x04,0x01,0x05,0x01,0x3E,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._Init_Sport0.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_Audio_Reset;
	.byte =
		0x04,0x01,0x05,0x01,0x2D,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x05,0x0F,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._Audio_Reset.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_Init_Flags;
	.byte =
		0x04,0x01,0x05,0x01,0x12,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._Init_Flags.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_Init_UART;
	.byte =
		0x04,0x01,0x05,0x01,0x71,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x0C,0x0D,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x14,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._Init_UART.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_Init_Interrupts;
	.byte =
		0x04,0x01,0x05,0x01,0xAD,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x05,0x12,0x0F,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._Init_Interrupts.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x82,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x51,0x12,0x00,0x00,0xA3,0x10,0x00,0x00,0x45,0x6E,0x61,0x62,
		0x6C,0x65,0x5F,0x44,0x4D,0x41,0x5F,0x53,0x70,0x6F,0x72,0x74,
		0x30,0x00,0xD5,0x10,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,0x44,
		0x4D,0x41,0x00,0xFE,0x10,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,
		0x53,0x70,0x6F,0x72,0x74,0x30,0x00,0x2A,0x11,0x00,0x00,0x41,
		0x75,0x64,0x69,0x6F,0x5F,0x52,0x65,0x73,0x65,0x74,0x00,0x56,
		0x11,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,0x46,0x6C,0x61,0x67,
		0x73,0x00,0x81,0x11,0x00,0x00,0x49,0x6E,0x69,0x74,0x5F,0x55,
		0x41,0x52,0x54,0x00,0xC3,0x11,0x00,0x00,0x49,0x6E,0x69,0x74,
		0x5F,0x49,0x6E,0x74,0x65,0x72,0x72,0x75,0x70,0x74,0x73,0x00,
		0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x4C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_Enable_DMA_Sport0;
	.byte4 = .LN._Enable_DMA_Sport0.end-.LN_Enable_DMA_Sport0;
	.byte4 = .LN_Init_DMA;
	.byte4 = .LN._Init_DMA.end-.LN_Init_DMA;
	.byte4 = .LN_Init_Sport0;
	.byte4 = .LN._Init_Sport0.end-.LN_Init_Sport0;
	.byte4 = .LN_Audio_Reset;
	.byte4 = .LN._Audio_Reset.end-.LN_Audio_Reset;
	.byte4 = .LN_Init_Flags;
	.byte4 = .LN._Init_Flags.end-.LN_Init_Flags;
	.byte4 = .LN_Init_UART;
	.byte4 = .LN._Init_UART.end-.LN_Init_UART;
	.byte4 = .LN_Init_Interrupts;
	.byte4 = .LN._Init_Interrupts.end-.LN_Init_Interrupts;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;


	.extern _iRxBuffer1;
	.type _iRxBuffer1,STT_OBJECT;
	.extern _iTxBuffer1;
	.type _iTxBuffer1,STT_OBJECT;
