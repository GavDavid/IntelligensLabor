	.file "..\src\sin2pi_fx.c";
//  Compilation time: Mon Dec  1 14:18:00 2025
//  Compiler options: -c -file-attr ProjectName=BlackFin_FIR_fract -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\sin2pi_fx.d -o src\sin2pi_fx.doj
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

	.align 2;
_sin2pi_pm_fx16:
.LN_sin2pi_pm_fx16:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0-R1,P0,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _sin2pi_pm_fx16:
//  ..\src\sin2pi_fx.c:17:20'_sin_fx16
//  ..\src\sin2pi_fx.c:13:20'_sin_fx16
//  ..\src\sin2pi_fx.c:11:21'_sin_fx16
//-------------------------------------------------------------------
// line "..\src\sin2pi_fx.c":9
	R0 = R0.L (X);
.LN0:
// line 10
	R1 = -16384;
	CC = R0 < R1;
.LN1:
// line 9
	LINK 12;
.LN2:
// line 10
	if CC jump .P33L15 ;

.LN3:
// line 12
	R1 = 16384;
	CC = R1 < R0;
	if CC jump .P33L17 ;

.LN4:
// line 14
	CC = R0 == R1;
	if !CC jump .P33L19 ;

.LN5:
// line 19
	P0 = [FP + 4];
	UNLINK;
	R0 = 32767;
	// -- stall --
	JUMP (P0);

	.align 4
.P33L19:
.LN6:
// line 17
	R0.H = R0.L << 1 (S);
	.align 2
	R0 = R0 >>> 16;
.LN7:
// line "C:\Analog Devices\CrossCore Embedded Studio 2.11.1\Blackfin\include\math_bf.h":537
	CALL.X __sin_fr16;
.LN8:
// line "..\src\sin2pi_fx.c":19
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P33L17:
.LN9:
// line 13
	R0.H = 32767;
	.align 2
	R0.L = R0.H - R0.L (S);
	R0.H = R0.L << 1 (S);
	R0 = R0 >>> 16;
.LN10:
// line "C:\Analog Devices\CrossCore Embedded Studio 2.11.1\Blackfin\include\math_bf.h":537
	CALL.X __sin_fr16;
.LN11:
// line "..\src\sin2pi_fx.c":19
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P33L15:
.LN12:
// line 11
	R0.H = 32767;
	.align 2
	R0.L = R0.L + R0.H (S);
	R0.H = R0.L << 1 (S);
	R0 = R0 >>> 16;
.LN13:
// line "C:\Analog Devices\CrossCore Embedded Studio 2.11.1\Blackfin\include\math_bf.h":537
	CALL.X __sin_fr16;
.LN14:
// line "..\src\sin2pi_fx.c":19
	R0 = - R0 (V) || P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._sin2pi_pm_fx16.end:
._sin2pi_pm_fx16.end:
	.global _sin2pi_pm_fx16;
	.type _sin2pi_pm_fx16,STT_FUNC;

	.align 2;
_sin2pi_01_fx16:
.LN_sin2pi_01_fx16:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0-R1,P0,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _sin2pi_01_fx16:
//  ..\src\sin2pi_fx.c:32:24'_sin_fx16
//  ..\src\sin2pi_fx.c:30:25'_sin_fx16
//  ..\src\sin2pi_fx.c:28:24'_sin_fx16
//-------------------------------------------------------------------
// line "..\src\sin2pi_fx.c":26
	R0 = R0.L (X);
.LN15:
// line 27
	R1 = 8192;
	CC = R0 < R1;
.LN16:
// line 26
	LINK 12;
.LN17:
// line 27
	if CC jump .P35L11 ;

.LN18:
// line 29
	R1 = 24576;
	CC = R0 < R1;
	if !CC jump .P35L15 ;

.LN19:
// line 30
	R0.H = -16384;
	R0.L = R0.L + R0.H (S);
	R0.H = R0.L << 2 (S);
	R0 = R0 >>> 16;
.LN20:
// line "C:\Analog Devices\CrossCore Embedded Studio 2.11.1\Blackfin\include\math_bf.h":537
	CALL.X __sin_fr16;
.LN21:
// line "..\src\sin2pi_fx.c":34
	R0 = - R0 (V) || P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P35L15:
.LN22:
// line 32
	R0.H = -32768;
	.align 2
	R0.L = R0.L + R0.H (S);
	R0.H = R0.L << 2 (S);
	R0 = R0 >>> 16;
.LN23:
// line "C:\Analog Devices\CrossCore Embedded Studio 2.11.1\Blackfin\include\math_bf.h":537
	CALL.X __sin_fr16;
.LN24:
// line "..\src\sin2pi_fx.c":34
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P35L11:
.LN25:
// line 28
	R0.H = R0.L << 2 (S);
	.align 2
	R0 = R0 >>> 16;
.LN26:
// line "C:\Analog Devices\CrossCore Embedded Studio 2.11.1\Blackfin\include\math_bf.h":537
	CALL.X __sin_fr16;
.LN27:
// line "..\src\sin2pi_fx.c":34
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._sin2pi_01_fx16.end:
._sin2pi_01_fx16.end:
	.global _sin2pi_01_fx16;
	.type _sin2pi_01_fx16,STT_FUNC;

	.file_attr ProjectName="BlackFin_FIR_fract";
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
	.file_attr FuncName="_sin_fx16";
	.file_attr FuncName="_sin2pi_pm_fx16";
	.file_attr FuncName="_sin2pi_01_fx16";
	.file_attr Content="Code";
.epctext.end:

	.extern __sin_fr16;
	.type __sin_fr16,STT_FUNC;

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\sin2pi_fx.sbn", 0, 232;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x1F,0x0F,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x73,0x69,0x6E,
		0x32,0x70,0x69,0x5F,0x66,0x78,0x2E,0x63,0x00,0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\sin2pi_fx.sbn", 232, 3756;
	.byte4 = .LN_sin2pi_pm_fx16;
	.byte4 = .LN._sin2pi_pm_fx16.end;
	.byte =
		0x01,0xA0,0x03,0x00,0x00,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._sin2pi_pm_fx16.end;
	.byte =
		0x00,0x00,0x12,0x21,0x0F,0x00,0x00,0x73,0x69,0x6E,0x32,0x70,
		0x69,0x5F,0x30,0x31,0x5F,0x66,0x78,0x31,0x36,0x00,0x01;
	.byte4 = .LN_sin2pi_01_fx16;
	.byte4 = .LN._sin2pi_01_fx16.end;
	.byte =
		0x01,0xA0,0x03,0x00,0x00,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN15;
	.byte4 = .LN._sin2pi_01_fx16.end;
	.byte =
		0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\sin2pi_fx.sbn", 3988, 725;
	.byte4 = .LN_sin2pi_pm_fx16;
	.byte =
		0x04,0x01,0x05,0x1E,0x11,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x1E,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x0B,0x0B,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x01,0x0E,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x05,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x04,0x05,0x05,0x1E,0x03,0x88,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xFA,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x05,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x04,0x05,0x05,0x1E,0x03,0x8C,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xFA,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x05,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x04,0x05,0x05,0x1E,0x03,0x8E,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xFA,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN._sin2pi_pm_fx16.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_sin2pi_01_fx16;
	.byte =
		0x04,0x01,0x05,0x1E,0x22,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x1E,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x0C,0x0B,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x04,0x05,0x05,0x1E,0x03,0xFB,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x89,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x09,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x04,0x05,0x05,0x1E,0x03,0xF9,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x89,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x09,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x04,0x05,0x05,0x1E,0x03,0xFD,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x89,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN._sin2pi_01_fx16.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x34,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x23,0x0F,0x00,0x00,0xBB,0x0E,0x00,0x00,0x73,0x69,0x6E,0x32,
		0x70,0x69,0x5F,0x70,0x6D,0x5F,0x66,0x78,0x31,0x36,0x00,0xEE,
		0x0E,0x00,0x00,0x73,0x69,0x6E,0x32,0x70,0x69,0x5F,0x30,0x31,
		0x5F,0x66,0x78,0x31,0x36,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x24,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_sin2pi_pm_fx16;
	.byte4 = .LN._sin2pi_pm_fx16.end-.LN_sin2pi_pm_fx16;
	.byte4 = .LN_sin2pi_01_fx16;
	.byte4 = .LN._sin2pi_01_fx16.end-.LN_sin2pi_01_fx16;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
