	.file "..\src\process_data.c";
//  Compilation time: Tue Dec  9 09:19:09 2025
//  Compiler options: -c -file-attr ProjectName=BlackFin_Frame -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\process_data.d -o src\process_data.doj
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
//  Frame size            = 20 
//  Scratch registers used: {R0,P0-P1,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\process_data.c":13
	LINK 12;
	.align 2
	P1.L = _uart_rx_flag;
	P1.H = _uart_rx_flag;
.LN0:
// line 15
	R0 = B[P1] (Z);
	CC = R0 == 0;
	if !CC jump .P38L1 ;

.P38L3:
	P1.L = _iChannel0LeftIn;
	P1.H = _iChannel0LeftIn;
.LN1:
// line 21
	R0 = [P1];
	P1.L = _iChannel0LeftOut;
	P1.H = _iChannel0LeftOut;
	[P1] = R0;
	P1.L = _iChannel0RightIn;
	P1.H = _iChannel0RightIn;
.LN2:
// line 22
	R0 = [P1];
	P1.L = _iChannel0RightOut;
	P1.H = _iChannel0RightOut;
	[P1] = R0;
.LN3:
// line 23
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

.P38L1:
.LN4:
// line 17
	R0 = 0;
	B[P1] = R0;
.LN5:
// line 18
	CALL.X _uart_getch;
	R0 = R0.b (X);
.LN6:
	CALL.X _uart_putch;
	jump.s .P38L3;
.LN._Process_Data.end:
._Process_Data.end:
	.global _Process_Data;
	.type _Process_Data,STT_FUNC;

	.align 4;
_sin2pi_pm:
.LN_sin2pi_pm:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R1,P0}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\process_data.c":49
	LINK 12;
	.align 2
.LN7:
// line 50
	R1 = 4059 /* 1086918619 */;
	R1.H = 16585 /* 1086918619 */;
	CALL.X ___float32_mul;                  // floating-point multiplication is implemented as a library call. There is 1 more instruction related to this call. 
.LN8:
	CALL.X __sinf;
.LN9:
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._sin2pi_pm.end:
._sin2pi_pm.end:
	.global _sin2pi_pm;
	.type _sin2pi_pm,STT_FUNC;

	.align 4;
_signal_callback:
.LN_signal_callback:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 28 
//  Scratch registers used: {R0-R3,P0,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {R4-R7,P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\process_data.c":55
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:5);
	SP += -12;
	P5.L = _freq;
	P5.H = _freq;
.LN10:
// line 57
	R5 = [P5 + 12];
	CC = R5 == 0;
	if CC jump .P44L3 ;

.LN11:
// line 59
	R0 = [P5 + 36];
	CALL.X ___unsigned_int32_to_float32;    // integral to floating-point conversion is implemented as a library call. 
	R1 = -32768 /* 1195081728 */;
	R1.H = 18235 /* 1195081728 */;
	CALL.X ___float32_div;                  // floating-point division is implemented as a library call. There is 1 more instruction related to this call. 
.LN12:
// line 60
	R1 = [P5 + 24];
	CALL.X ___float32_div;                  // floating-point division is implemented as a library call. 
.LN13:
// line 62
	R1 = ROT R0 BY 1;
	R1 >>= 1;
	R7 = R0;
	R2 = - R1;
	R0 = R1;
	IF CC R1 = R2;
	R2 = 0 /* 1065353216 */;
	R2.H = 16256 /* 1065353216 */;
	CC = R2 <= R1;
	R1 = 1 /* 2139095041 */;
	R1.H = 32640 /* 2139095041 */;
	R0 = R0 - R1;
	CC &= AN;
	if !CC jump .P44L6 ;

.LN14:
// line 63
	R7 = 0;
	[P5 + 36] = R7;

.P44L6:
.LN15:
// line 67
	CC = R5 == 1;
	if !CC jump .P44L9 ;

.LN16:
// line 68
	R6 = [P5 + 16];
	R1 = ROT R6 BY 0 || R0 = [P5 + 20];
	CALL.X ___float32_sub;                  // floating-point subtraction is implemented as a library call. 
	R1 = R7;
	CALL.X ___float32_mul;                  // floating-point multiplication is implemented as a library call. 
	R1 = R6;
	CALL.X ___float32_add;                  // floating-point addition is implemented as a library call. 
	[P5] = R0;

.P44L9:
.LN17:
// line 70
	CC = R5 == 2;
	if CC jump .P44L10 ;

.P44L12:
.LN18:
// line 73
	R0 = [P5 + 36];
	R0 += 1;
	[P5 + 36] = R0;

.P44L3:
.LN19:
// line 76
	R7 = 0;
	BITSET(R7, 30);
	R1 = ROT R7 BY 0 || R0 = [P5];
	CALL.X ___float32_mul;                  // floating-point multiplication is implemented as a library call. 
	R1 = -32768 /* 1195081728 */;
	R1.H = 18235 /* 1195081728 */;
	CALL.X ___float32_div;                  // floating-point division is implemented as a library call. There is 1 more instruction related to this call. 
.LN20:
// line 79
	R1 = [P5 + 28];
.LN21:
// line 76
	[P5 + 32] = R0;
.LN22:
// line 79
	CALL.X ___float32_add;                  // floating-point addition is implemented as a library call. 
.LN23:
// line 80
	R1 = ROT R0 BY 1 || R2 = [P5 + 8];
	R3 = R1 >> 1;
	R4 = - R3;
	R1 = R3;
	IF CC R1 = R4;
	R5 = 0 /* 1065353216 */;
	R5.H = 16256 /* 1065353216 */;
	CC = R5 <= R1;
.LN24:
	R4 = 1 /* 2139095041 */;
	R4.H = 32640 /* 2139095041 */;
.LN25:
	R3 = R3 - R4;
	CC &= AN;
	R6 = 0 /* -1082130432 */;
	R6.H = -16512 /* -1082130432 */;
	IF CC R0 = R6;
.LN26:
// line 86
	CC = R2 == 0;
	[P5 + 28] = R0;
	if CC jump .P44L16 ;

.LN27:
// line 89
	CC = R2 == 1;
	if CC jump .P44L19 ;

.LN28:
// line 92
	CC = R2 == 2;
	if CC jump .P44L25 ;

.LN29:
// line 98
	CC = R2 == 3;
	R1 = 0;
	IF !CC R0 = R1;

.P44L18:
.LN30:
// line 101
	R1 = [P5 + 4];
	CALL.X ___float32_mul;                  // floating-point multiplication is implemented as a library call. 
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:5) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P44L25:
	CC = !BITTST(R0, 31);
	R2 = 0 /* 2139095040 */;
	R2.H = 32640 /* 2139095040 */;
	R1 = CC;
	CC = R0 <= R2;
	R2 = 0;
	IF !CC R1 = R2;
	CC = R0 == 0;
	IF CC R1 = R0;
.LN31:
// line 94
	CC = R1 == 0;
	R1 = R0;
	BITTGL(R0, 31);
	IF !CC R1 = R0;
.LN32:
// line 95
	R0 = R1;
	R1 = 0 /* 1056964608 */;
	R1.H = 16128 /* 1056964608 */;
	CALL.X ___float32_add;                  // floating-point addition is implemented as a library call. There is 1 more instruction related to this call. 
	R1 = R7;
	CALL.X ___float32_mul;                  // floating-point multiplication is implemented as a library call. 
	jump.s .P44L18;

.P44L19:
	CC = !BITTST(R0, 31);
	R3 = 0 /* 2139095040 */;
	R3.H = 32640 /* 2139095040 */;
	R1 = CC;
	CC = R0 <= R3;
	R7 = 0;
	BITTGL(R0, 31);
	IF !CC R1 = R7;
	CC = R0 == 0;
	IF CC R1 = R2;
	CC = R1 == 0;
	IF !CC R6 = R5;
	R0 = R6;
	jump.s .P44L18;

	.align 4
.P44L16:
.LN33:
// line 87
	CALL.X _sin2pi_pm;
	.align 2
	jump.s .P44L18;

.P44L10:
.LN34:
// line 71
	R0 = [P5 + 20];
	R1 = [P5 + 16];
	CALL.X ___float32_div;                  // floating-point division is implemented as a library call. 
.LN35:
	R1 = R7;
	CALL.X __powf;
.LN36:
	R1 = [P5 + 16];
	CALL.X ___float32_mul;                  // floating-point multiplication is implemented as a library call. 
	[P5] = R0;
	jump.s .P44L12;
.LN._signal_callback.end:
._signal_callback.end:
	.global _signal_callback;
	.type _signal_callback,STT_FUNC;

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
	.file_attr FuncName="_Process_Data";
	.file_attr FuncName="_sin2pi_pm";
	.file_attr FuncName="_signal_callback";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _uart_getch;
	.type _uart_getch,STT_FUNC;
	.extern _uart_putch;
	.type _uart_putch,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern __sinf;
	.type __sinf,STT_FUNC;
	.extern ___unsigned_int32_to_float32;
	.type ___unsigned_int32_to_float32,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern __powf;
	.type __powf,STT_FUNC;

	.section/DOUBLE32 data1;

	.align 4;
	.type .epcdata,STT_OBJECT;
.epcdata:
	.byte _freq[] =
		0x00,0x00,0x7A,0x44;
	.global _freq;
	.type _freq,STT_OBJECT;
	.byte _amp[] =
		0xCD,0xCC,0x4C,0x3F;
	.global _amp;
	.type _amp,STT_OBJECT;
	.byte _waveform[] =
		0x01,0x00,0x00,0x00;
	.global _waveform;
	.type _waveform,STT_OBJECT;
	.byte _sweep_mode[4];
	.global _sweep_mode;
	.type _sweep_mode,STT_OBJECT;
	.byte _f_start[] =
		0x00,0x00,0xFA,0x43;
	.global _f_start;
	.type _f_start,STT_OBJECT;
	.byte _f_end[] =
		0x00,0x00,0xFA,0x45;
	.global _f_end;
	.type _f_end,STT_OBJECT;
	.byte _sweep_time[] =
		0x00,0x00,0x00,0x40;
	.global _sweep_time;
	.type _sweep_time,STT_OBJECT;
	.byte _g_phase[4];
	.global _g_phase;
	.type _g_phase,STT_OBJECT;
	.byte _g_phase_step[4];
	.global _g_phase_step;
	.type _g_phase_step,STT_OBJECT;
	.byte _sweep_n[4];
	.global _sweep_n;
	.type _sweep_n,STT_OBJECT;
.epcdata.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\process_data.sbn", 0, 270;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x41,0x13,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x5F,0x64,0x61,0x74,0x61,0x2E,0x63,0x00,
		0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\process_data.sbn", 270, 4312;
	.byte4 = .LN_Process_Data;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x00,0x00,0x14,0x47,0x11,0x00,0x00,0x73,0x69,0x6E,0x32,0x70,
		0x69,0x5F,0x70,0x6D,0x00,0x01;
	.byte4 = .LN_sin2pi_pm;
	.byte4 = .LN._sin2pi_pm.end;
	.byte =
		0x01,0x90,0x04,0x00,0x00,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN7;
	.byte4 = .LN._sin2pi_pm.end;
	.byte =
		0x00,0x00,0x14,0x97,0x11,0x00,0x00,0x73,0x69,0x67,0x6E,0x61,
		0x6C,0x5F,0x63,0x61,0x6C,0x6C,0x62,0x61,0x63,0x6B,0x00,0x01;
	.byte4 = .LN_signal_callback;
	.byte4 = .LN._signal_callback.end;
	.byte =
		0x01,0x90,0x04,0x00,0x00,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN10;
	.byte4 = .LN._signal_callback.end;
	.byte =
		0x13,0x87,0x11,0x00,0x00;
	.byte4 = .LN11;
	.byte4 = .LN._signal_callback.end;
	.byte =
		0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN31;
	.byte4 = .LN33;
	.byte =
		0x00,0x00,0x00,0x15,0x75,0x61,0x72,0x74,0x5F,0x72,0x78,0x5F,
		0x66,0x6C,0x61,0x67,0x00,0x01,0x3F,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _uart_rx_flag;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x15,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x49,0x6E,0x00,0x01,0x3A,
		0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x15,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x49,0x6E,0x00,0x01,
		0x3A,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x15,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x4F,0x75,0x74,0x00,0x01,
		0x3A,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x15,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x4F,0x75,0x74,0x00,
		0x01,0x3A,0x13,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x15,0x66,0x72,0x65,0x71,0x00,0x01,
		0x90,0x04,0x00,0x00,0x05,0x03;
	.byte4 = _freq;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x61,0x6D,0x70,0x00,0x01,0x90,
		0x04,0x00,0x00,0x05,0x03;
	.byte4 = _amp;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x00,0x01,0xD4,0x01,0x00,0x00,0x05,0x03;
	.byte4 = _waveform;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x73,0x77,0x65,0x65,0x70,0x5F,
		0x6D,0x6F,0x64,0x65,0x00,0x01,0xD4,0x01,0x00,0x00,0x05,0x03;
	.byte4 = _sweep_mode;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x66,0x5F,0x73,0x74,0x61,0x72,
		0x74,0x00,0x01,0x90,0x04,0x00,0x00,0x05,0x03;
	.byte4 = _f_start;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x66,0x5F,0x65,0x6E,0x64,0x00,
		0x01,0x90,0x04,0x00,0x00,0x05,0x03;
	.byte4 = _f_end;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x73,0x77,0x65,0x65,0x70,0x5F,
		0x74,0x69,0x6D,0x65,0x00,0x01,0x90,0x04,0x00,0x00,0x05,0x03;
	.byte4 = _sweep_time;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x67,0x5F,0x70,0x68,0x61,0x73,
		0x65,0x00,0x01,0x90,0x04,0x00,0x00,0x05,0x03;
	.byte4 = _g_phase;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x67,0x5F,0x70,0x68,0x61,0x73,
		0x65,0x5F,0x73,0x74,0x65,0x70,0x00,0x01,0x90,0x04,0x00,0x00,
		0x05,0x03;
	.byte4 = _g_phase_step;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x15,0x73,0x77,0x65,0x65,0x70,0x5F,
		0x6E,0x00,0x01,0xE9,0x01,0x00,0x00,0x05,0x03;
	.byte4 = _sweep_n;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0xD4,0x01,0x00,0x00,0x0E,0x6E,
		0x01,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\process_data.sbn", 4582, 948;
	.byte4 = .LN_Process_Data;
	.byte =
		0x04,0x01,0x05,0x01,0x15,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x03,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x18,0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_sin2pi_pm;
	.byte =
		0x04,0x01,0x05,0x01,0x39,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x10,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.byte4 = .LN._sin2pi_pm.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_signal_callback;
	.byte =
		0x04,0x01,0x05,0x01,0x3F,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x11,0x0B,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x09,0x0B,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x0D,0x0A,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x09,0x0D,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x0D,0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x09,0x0B,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x05,0x0C,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x0A,0x0C,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x05,0x0C,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x11,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x16,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x0D,0x03,0x70,0x01,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x22,0x01,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN._signal_callback.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0xBC,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary ".\src\process_data.sbn", 5530, 182;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x2C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_Process_Data;
	.byte4 = .LN._Process_Data.end-.LN_Process_Data;
	.byte4 = .LN_sin2pi_pm;
	.byte4 = .LN._sin2pi_pm.end-.LN_sin2pi_pm;
	.byte4 = .LN_signal_callback;
	.byte4 = .LN._signal_callback.end-.LN_signal_callback;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;


	.extern _uart_rx_flag;
	.type _uart_rx_flag,STT_OBJECT;
	.extern _iChannel0LeftIn;
	.type _iChannel0LeftIn,STT_OBJECT;
	.extern _iChannel0RightIn;
	.type _iChannel0RightIn,STT_OBJECT;
	.extern _iChannel0LeftOut;
	.type _iChannel0LeftOut,STT_OBJECT;
	.extern _iChannel0RightOut;
	.type _iChannel0RightOut,STT_OBJECT;
