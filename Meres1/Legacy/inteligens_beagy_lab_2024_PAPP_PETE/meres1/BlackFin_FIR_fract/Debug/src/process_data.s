	.file "..\src\process_data.c";
//  Compilation time: Mon Sep 16 18:16:01 2024
//  Compiler options: -c -file-attr ProjectName=BlackFin_FIR_fract -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\process_data.d -o src\process_data.doj
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
//  Frame size            = 28 
//  Scratch registers used: {R0-R3,P0-P2,I0-I2,B1-B2,A0-A1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//  Call preserved registers used: {R6-R7,P3-P5,L1-L2,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _Process_Data:
//  ..\src\process_data.c:87:27'_bitsr
//  ..\src\process_data.c:56:18'_rbits
//-------------------------------------------------------------------
// line "..\src\process_data.c":47
	LINK 0;
	.align 2
	[--SP] = (R7:6, P5:3);
	SP += -12;
	P1.L = _uart_rx_flag;
	P1.H = _uart_rx_flag;
.LN0:
// line 48
	R0 = B[P1] (Z);
	CC = R0 == 0;
	if !CC jump .P40L1 ;

.P40L10:
	P3.L = _coefsA;
	P3.H = _coefsA;
.LN1:
// line 56
	A1 = A0 = 0 || P0 = [P3 + 36];
	I2.L = _iChannel0RightIn;
	I2.H = _iChannel0RightIn;
.LN2:
// line 54
	R0 = [I2];
	I0.L = _iChannel0LeftOut;
	I0.H = _iChannel0LeftOut;
	[I0] = R0;
.LN3:
// line 56
	R0 = [I2];
	P2.L = _input;
	P2.H = _input;
	P1 = P2 + (P0<<1);
	R0 >>>= 8;
	P5.L = _output;
	P5.H = _output;
	W[P1] = R0.L;
	P0 = P5 + (P0<<1);
	I1 = P1;
.LN4:
// line 62
	R1 = 0;
	P1 = 4;
	[P3 + 12] = R1;
	B[P3 + 16] = R1;
.LN5:
// line 63
	[P3 + 20] = R1;
	B[P3 + 24] = R1;
	I2 = P0;
	P4.L = _coefsB;
	P4.H = _coefsB;
	LOOP .P40L5L LC0 = P1;

.P40L5:
//-------------------------------------------------------------------
//   Loop at "..\src\process_data.c" line 68 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 12 
//   cycles.
//-------------------------------------------------------------------
//   Trip Count  = 4
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  11 out of   12 ( 91.7%)
//     16-bit Instruction  used  20 out of   24 ( 83.3%)
//     32-bit Instruction  used   8 out of   12 ( 66.7%)
//-------------------------------------------------------------------
//  This loop was not modulo scheduled because it contains calls or volatile 
//  operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L5L;
.LN6:
// line 74
	B2 = P5;
	B1 = P2;
.LN7:
// line 70
	R0.L = W[I2] || R1.L = W[I1];
.LN8:
// line 74
	L2 = 10;
	L1 = 10;
	I2 += 2;
.LN9:
// line 70
	R2 = W[P3++] (X);
	A0 -= R2.L * R0.L || R0 = W[P4++] (X);
.LN10:
// line 74
	A1 += R0.L * R1.L || I1 += 2;
	L2 = 0;
	L1 = 0;
	I0 = I1;
	LOOP_END .P40L5L;
//-------------------------------------------------------------------
//   End Loop L5
//-------------------------------------------------------------------

//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN11:
// line 70
	R1 = W[P3] (X) || R0.L = W[I2];
	A0 -= R1.L * R0.L || R1 = W[P4] (X) || R0.L = W[I0];
	A1 += R1.L * R0.L;
	R7 = A0.W; R1 = A0.X;
.LN12:
// line 76
	R0 = R1 << 3;
	R3 = R7 >> 29;
	R3 = R0 | R3;
	R0 = R7 << 3;
	R3 = R3 << 24 (S);
	I1 = I2;
.LN13:
// line 74
	B2 = P2;
	I2 = I0;
.LN14:
// line 76
	CC = V;
	R6 = R3 >>> 24;
.LN15:
// line 74
	B1 = P5;
	L2 = 10;
.LN16:
// line 76
	R3 = R3 << 1 || I2 += 2;
.LN17:
// line 74
	L1 = 10;
.LN18:
// line 76
	R3 = R3 >>> 31 || I1 += 2;
	L2 = 0;
	IF CC R0 = R3;
	L1 = 0;
	A0.W = R0; A0.X = R6;
	B[P3 + 8] = R1;
	A0 += A1 || R1 = [P3 + 28];
.LN19:
// line 77
	R0 = A0 || [P3 + 4] = R7;
.LN20:
// line 80
	R1 += -1;
.LN21:
// line 77
	R0 = R0 >>> 16 || W[P0] = R0.H;
.LN22:
// line 82
	CC = R1 < 0;
	R2 = 4;
	IF CC R1 = R2;
.LN23:
// line 87
	R0 = R0 << 8 || [P3 + 28] = R1;
	P1.L = _iChannel0RightOut;
	P1.H = _iChannel0RightOut;
	[P1] = R0;
.LN24:
// line 76
	R0 = A0.W; R1 = A0.X;
	[P3 + 20] = R0;
	B[P3 + 24] = R1;
.LN25:
// line 72
	R0 = A1.W; R1 = A1.X;
	[P3 + 12] = R0;
	B[P3 + 16] = R1;
.LN26:
// line 88
	SP += 12;
	P2 = [FP + 4];
	(R7:6, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P2);

.P40L1:
.LN27:
// line 50
	R0 = 0;
	B[P1] = R0;
.LN28:
// line 51
	CALL.X _uart_getch;
	R0 = R0.b (X);
.LN29:
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
	.byte _coefsA[] =
		0x00,0x00,0x0F,0xCA,0x15,0x48,0x11,0xD3,0x01,0x0B;
	.global _coefsA;
	.type _coefsA,STT_OBJECT;
	.byte =
		0x00,0x00;
	.byte _outA[8];
	.global _outA;
	.type _outA,STT_OBJECT;
	.byte _outB[8];
	.global _outB;
	.type _outB,STT_OBJECT;
	.byte _out[8];
	.global _out;
	.type _out,STT_OBJECT;
	.byte _i[4];
	.global _i;
	.type _i,STT_OBJECT;
.epcdata.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.type .epcbss,STT_OBJECT;
.epcbss:
	.byte _output[10];
	.global _output;
	.type _output,STT_OBJECT;
	.byte _konv[2];
	.global _konv;
	.type _konv,STT_OBJECT;
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
		0xB2,0x12,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x5F,0x64,0x61,0x74,0x61,0x2E,0x63,0x00,
		0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\process_data.sbn", 247, 4241;
	.byte4 = .LN_Process_Data;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x00,0x00,0x12,0x75,0x61,0x72,0x74,0x5F,0x72,0x78,0x5F,0x66,
		0x6C,0x61,0x67,0x00,0x01,0xB0,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _uart_rx_flag;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x49,0x6E,0x00,0x01,
		0xAB,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x4F,0x75,0x74,0x00,0x01,
		0xAB,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x4F,0x75,0x74,0x00,
		0x01,0xAB,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x63,0x6F,0x65,0x66,0x73,0x42,
		0x00,0x01,0x9D,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _coefsB;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x63,0x6F,0x65,0x66,0x73,0x41,
		0x00,0x01,0x8F,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _coefsA;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x6E,0x70,0x75,0x74,0x00,
		0x01,0x81,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _input;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x70,0x75,0x74,
		0x00,0x01,0x73,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _output;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x41,0x00,0x01,
		0xA7,0x02,0x00,0x00,0x05,0x03;
	.byte4 = _outA;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x42,0x00,0x01,
		0xA7,0x02,0x00,0x00,0x05,0x03;
	.byte4 = _outB;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x00,0x01,0xA7,
		0x02,0x00,0x00,0x05,0x03;
	.byte4 = _out;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6F,0x75,0x74,0x56,0x61,0x6C,
		0x00,0x01,0x6E,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _outVal;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x69,0x00,0x01,0xF8,0x01,0x00,
		0x00,0x05,0x03;
	.byte4 = _i;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6B,0x6F,0x6E,0x76,0x00,0x01,
		0xC3,0x03,0x00,0x00,0x05,0x03;
	.byte4 = _konv;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6B,0x6F,0x6E,0x76,0x69,0x00,
		0x01,0x68,0x12,0x00,0x00,0x05,0x03;
	.byte4 = _konvi;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x6B,0x6F,0x6E,0x76,0x69,0x33,
		0x32,0x00,0x01,0x0B,0x06,0x00,0x00,0x05,0x03;
	.byte4 = _konvi32;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x05,0x00,0xFC,0x05,0x00,0x00,0x0E,
		0xC3,0x03,0x00,0x00,0x13,0x81,0x12,0x00,0x00,0xC3,0x03,0x00,
		0x00,0x14,0x05,0x00,0x04,0x00,0x13,0x8F,0x12,0x00,0x00,0xC3,
		0x03,0x00,0x00,0x14,0x05,0x00,0x04,0x00,0x13,0x9D,0x12,0x00,
		0x00,0xC3,0x03,0x00,0x00,0x14,0x05,0x00,0x04,0x00,0x13,0xAB,
		0x12,0x00,0x00,0xC3,0x03,0x00,0x00,0x14,0x05,0x00,0x04,0x00,
		0x0E,0xF8,0x01,0x00,0x00,0x0E,0x92,0x01,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\process_data.sbn", 4488, 812;
	.byte4 = .LN_Process_Data;
	.byte =
		0x04,0x01,0x05,0x01,0x37,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x11,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x03,0x14,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x03,0x75,0x01,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x06,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x01,0x19,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x03,0x03,0x5A,0x01,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x18,0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
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
		0x94,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary ".\src\process_data.sbn", 5300, 142;
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
	.byte _coefsB[] =
		0x15,0x00,0x55,0x00,0x80,0x00,0x55,0x00,0x15,0x00;
	.global _coefsB;
	.type _coefsB,STT_OBJECT;
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
