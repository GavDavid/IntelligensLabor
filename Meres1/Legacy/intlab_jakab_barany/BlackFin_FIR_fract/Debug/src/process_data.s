	.file "..\src\process_data.c";
//  Compilation time: Mon Nov  4 17:25:04 2024
//  Compiler options: -c -file-attr ProjectName=BlackFin_FIR_fract -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -no-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\process_data.d -o src\process_data.doj
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
_Process_Data:
.LN_Process_Data:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 36 
//  Scratch registers used: {R0-R3,P0-P2,I0-I2,A0-A1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//  Call preserved registers used: {R4-R7,P3-P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _Process_Data:
//  ..\src\process_data.c:84:27'_bitsr
//  ..\src\process_data.c:54:20'_rbits
//-------------------------------------------------------------------
// line "..\src\process_data.c":45
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
	P1.L = _uart_rx_flag;
	P1.H = _uart_rx_flag;
.LN0:
// line 46
	R0 = B[P1] (Z);
	CC = R0 == 0;
	if !CC jump .P40L1 ;

.P40L10:
	P5.L = _i_b;
	P5.H = _i_b;
.LN1:
// line 54
	R1.L = R1.L - R1.L (NS) || R0 = [P5];
.LN2:
// line 66
	R7 = 26215 /* 1717986919 */;
	R7.H = 26214 /* 1717986919 */;
	R3 = (A1 = R0.L * R7.L) (FU) || P4 = [P5];
	A1 = A1 >> 16 || R5 = [P5];
	A1 += R7.H * R0.L (M, IS);
	A1 += R0.H * R7.L (M, IS);
	A1 = A1 >>> 16;
	R3 = (A1 += R0.H * R7.H) (IS);
	R4 = R0 >>> 31;
	R3 >>>= 1;
	R3 = R3 - R4;
.LN3:
	R4 = 5;
	P2.L = _b;
	P2.H = _b;
.LN4:
// line 60
	A0 = 0 || R6 = [P2 + 8];
.LN5:
// line 66
	R3 *= R4;
	R3 = R0 - R3 (NS) || R2 = W[P2++] (X);
	I2.L = _iChannel0RightIn;
	I2.H = _iChannel0RightIn;
.LN6:
// line 52
	R4 = [I2];
	I1.L = _iChannel0LeftOut;
	I1.H = _iChannel0LeftOut;
	P1 = R3;
	[I1] = R4;
.LN7:
// line 54
	R4 = [I2];
	R4 >>>= 8;
	P3.L = _input;
	P3.H = _input;
	P4 = P3 + (P4<<1);
.LN8:
// line 60
	R1.H = R4.L * R6.L (T) || W[P4] = R4.L;
.LN9:
// line 66
	P4 = P3 + (P1<<1);
.LN10:
// line 60
	R6 = R1 >>> 31 || R3 = W[P4] (X);
	A1.W = R1; A1.X = R6;
.LN11:
// line 66
	A1 += R2.L * R3.L;
	R5 += 1;
.LN12:
	P4 = 4;
	I0.L = _a;
	I0.H = _a;
	P0.L = _output;
	P0.H = _output;
.LN13:
	R3 = A1.W; R2 = A1.X;
	LOOP .P40L22L LC0 = P4;

.P40L22:
//-------------------------------------------------------------------
//   Loop at "..\src\process_data.c" line 64 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 25 
//   cycles.
//-------------------------------------------------------------------
//   Trip Count  = 4
//-------------------------------------------------------------------
//   Found modulo schedule with:
//     Initiation Interval (II)                                  = 25
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 20
//     Minimum initiation interval due to resources (res MII)    = 18.00
//   This loop's modulo schedule was invalidated.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used  18 out of   25 ( 72.0%)
//     Group 1             used  13 out of   25 ( 52.0%)
//     16-bit Instruction  used  24 out of   50 ( 48.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L22L;
	R1 = (A1 = R5.L * R7.L) (FU) || R4.L = W[I0++];
	A1 = A1 >> 16;
	A1 += R7.H * R5.L (M, IS);
	A1 += R5.H * R7.L (M, IS);
	A1 = A1 >>> 16;
	R1 = (A1 += R5.H * R7.H) (IS);
	R6 = R5 >>> 31;
	R1 >>>= 1;
	R1 = R1 - R6;
.LN14:
	R6 = 5;
.LN15:
// line 69
	P4 = P0 + (P1<<1);
.LN16:
// line 66
	R1 *= R6;
	R1 = R5 - R1 (NS) || R6 = W[P4] (X);
	P1 = R1;
.LN17:
// line 69
	A0 -= R4.L * R6.L || R4 = W[P2++] (X);
	A1.W = R3; A1.X = R2;
	R5 += 1;
.LN18:
// line 66
	P4 = P3 + (P1<<1);
	R1 = W[P4] (X);
	A1 += R4.L * R1.L;
	R3 = A1.W; R2 = A1.X;
	LOOP_END .P40L22L;
//-------------------------------------------------------------------
//   End Loop L22
//-------------------------------------------------------------------

//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN19:
// line 69
	P1 = P0 + (P1<<1);
	R1 = W[P1] (X) || R7.L = W[I0++];
	A0 -= R7.L * R1.L;
	P1 = P0;
	R1 = A0.W; R7 = A0.X;
	P0 += 20;
	R6 = R1 >> 29 || [P0--] = R1;
	B[P0 + 8] = R7;
	R1 = R1 << 3 || B[P0] = R2;
	[P0 + -4] = R3;
	R3 = 4;
.LN20:
// line 74
	R2 = B[P0 + 8] (X);
	R2 <<= 3;
	R2 = R2 | R6;
	R2 = R2 << 24 (S);
	CC = V;
	R6 = R2 >>> 24 || R7 = [P0];
	B[P0 + 8] = R6;
	R2 <<= 1;
	R2 >>>= 31;
.LN21:
// line 76
	R0 += -1;
.LN22:
// line 74
	IF CC R1 = R2;
.LN23:
// line 78
	CC = R0 < 0;
	IF CC R0 = R3;
	P2 = R0;
	[P5] = R0;
.LN24:
// line 84
	R2 = [P0 + 8];
	R0 = [P0 + -4];
	A0.W = R0; A0.X = R7;
	A1.W = R1; A1.X = R2;
	A0 += A1 || [P0 + 4] = R1;
	R0 = A0;
.LN25:
// line 87
	P1 = P1 + (P2<<1);
.LN26:
// line 84
	R1 = R0 >>> 16 || W[P1] = R0.H;
	R0 = R1 << 8;
	P4.L = _iChannel0RightOut;
	P4.H = _iChannel0RightOut;
	[P4] = R0;
.LN27:
// line 88
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P40L1:
.LN28:
// line 48
	R0 = 0;
	B[P1] = R0;
.LN29:
// line 49
	CALL.X _uart_getch;
	R0 = R0.b (X);
.LN30:
	CALL.X _uart_putch;
	jump.s .P40L10;
.LN._Process_Data.end:
._Process_Data.end:
	.global _Process_Data;
	.type _Process_Data,STT_FUNC;

	.file_attr ProjectName="BlackFin_FIR_fract";
	.file_attr FuncName="_rbits";
	.file_attr FuncName="_bitsr";
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
	.file_attr FuncName="_Process_Data";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _uart_getch;
	.type _uart_getch,STT_FUNC;
	.extern _uart_putch;
	.type _uart_putch,STT_FUNC;

	.section/DOUBLE32 data1;

	.align 4;
	.type .epcdata,STT_OBJECT;
.epcdata:
	.byte _output[10];
	.global _output;
	.type _output,STT_OBJECT;
	.byte =
		0x00,0x00;
	.byte _outb[8];
	.global _outb;
	.type _outb,STT_OBJECT;
	.byte _outa[8];
	.global _outa;
	.type _outa,STT_OBJECT;
	.byte _i_a[4];
	.global _i_a;
	.type _i_a,STT_OBJECT;
.epcdata.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.type .epcbss,STT_OBJECT;
.epcbss:
	.byte _i_b[4];
	.global _i_b;
	.type _i_b,STT_OBJECT;
	.byte _konv[2];
	.global _konv;
	.type _konv,STT_OBJECT;
	.byte .epcpad0[2];
	.byte _konvi[4];
	.global _konvi;
	.type _konvi,STT_OBJECT;
	.byte _konvi32[4];
	.global _konvi32;
	.type _konvi32,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\process_data.sbn", 0, 247;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x93,0x12,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x5F,0x64,0x61,0x74,0x61,0x2E,0x63,0x00,
		0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\process_data.sbn", 247, 4218;
	.byte4 = .LN_Process_Data;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x00,0x00,0x12,0x75,0x61,0x72,0x74,0x5F,0x72,0x78,0x5F,0x66,
		0x6C,0x61,0x67,0x00,0x01,0x91,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _uart_rx_flag;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x49,0x6E,0x00,0x01,
		0x8C,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x4F,0x75,0x74,0x00,0x01,
		0x8C,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x4F,0x75,0x74,0x00,
		0x01,0x8C,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x62,0x00,0x01,0x7E,0x12,0x00,
		0x00,0x05,0x03;
	.byte4 = _b;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x61,0x00,0x01,0x70,0x12,0x00,
		0x00,0x05,0x03;
	.byte4 = _a;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x6E,0x70,0x75,0x74,0x00,
		0x01,0x62,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _input;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x70,0x75,0x74,
		0x00,0x01,0x54,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _output;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x62,0x00,0x01,
		0x90,0x02,0x00,0x00,0x05,0x03;
	.byte4 = _outb;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x61,0x00,0x01,
		0x90,0x02,0x00,0x00,0x05,0x03;
	.byte4 = _outa;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x56,0x61,0x6C,
		0x00,0x01,0x4F,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _outVal;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x5F,0x62,0x00,0x01,0xE1,
		0x01,0x00,0x00,0x05,0x03;
	.byte4 = _i_b;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x5F,0x61,0x00,0x01,0xE1,
		0x01,0x00,0x00,0x05,0x03;
	.byte4 = _i_a;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6B,0x6F,0x6E,0x76,0x00,0x01,
		0xAC,0x03,0x00,0x00,0x05,0x03;
	.byte4 = _konv;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6B,0x6F,0x6E,0x76,0x69,0x00,
		0x01,0x49,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _konvi;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6B,0x6F,0x6E,0x76,0x69,0x33,
		0x32,0x00,0x01,0xF4,0x05,0x00,0x00,0x05,0x03;
	.byte4 = _konvi32;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x05,0x00,0xE5,0x05,0x00,0x00,0x0E,
		0xAC,0x03,0x00,0x00,0x13,0x62,0x12,0x00,0x00,0xAC,0x03,0x00,
		0x00,0x14,0x05,0x00,0x04,0x00,0x13,0x70,0x12,0x00,0x00,0xAC,
		0x03,0x00,0x00,0x14,0x05,0x00,0x04,0x00,0x13,0x7E,0x12,0x00,
		0x00,0xAC,0x03,0x00,0x00,0x14,0x04,0x00,0x03,0x00,0x13,0x8C,
		0x12,0x00,0x00,0xAC,0x03,0x00,0x00,0x14,0x05,0x00,0x04,0x00,
		0x0E,0xE1,0x01,0x00,0x00,0x0E,0x7B,0x01,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\process_data.sbn", 4465, 812;
	.byte4 = .LN_Process_Data;
	.byte =
		0x04,0x01,0x05,0x01,0x35,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x11,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x03,0x15,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x02,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x02,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x02,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x03,0x03,0x58,0x01,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x18,0x0A,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x8C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary ".\src\process_data.sbn", 5277, 134;
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
	.byte4 = .LN_Process_Data;
	.byte4 = .LN._Process_Data.end-.LN_Process_Data;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 L1_data_b;

	.align 4;
.epcdataL1_data_b:
	.type .epcdataL1_data_b,STT_OBJECT;
	.byte _b[] =
		0x15,0x00,0x55,0x00,0x80,0x00,0x55,0x00,0x15,0x00;
	.global _b;
	.type _b,STT_OBJECT;
	.byte =
		0x00,0x00;
	.byte _a[] =
		0x0F,0xCA,0x15,0x48,0x11,0xD3,0x01,0x0B;
	.global _a;
	.type _a,STT_OBJECT;
.epcdataL1_data_b.end:

	.section/DOUBLE32 L1_data_a;

	.align 4;
.epcdataL1_data_a:
	.type .epcdataL1_data_a,STT_OBJECT;
	.byte _input[10];
	.global _input;
	.type _input,STT_OBJECT;
.epcdataL1_data_a.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 2;
	.global _outVal;
	.type _outVal,STT_OBJECT;
	.byte _outVal[2];

	.section/DOUBLE32 data1;


	.extern _uart_rx_flag;
	.type _uart_rx_flag,STT_OBJECT;
	.extern _iChannel0RightIn;
	.type _iChannel0RightIn,STT_OBJECT;
	.extern _iChannel0LeftOut;
	.type _iChannel0LeftOut,STT_OBJECT;
	.extern _iChannel0RightOut;
	.type _iChannel0RightOut,STT_OBJECT;
