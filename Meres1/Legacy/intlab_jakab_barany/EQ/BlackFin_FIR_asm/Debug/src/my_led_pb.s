	.file "..\src\my_led_pb.c";
//  Compilation time: Mon Nov 25 16:41:05 2024
//  Compiler options: -c -file-attr ProjectName=Eq -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\my_led_pb.d -o src\my_led_pb.doj
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
_CheckResult:
.LN_CheckResult:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0-R1,P0-P1,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\my_led_pb.c":22
	LINK 12;
	.align 2
	P1.L = _ind;
	P1.H = _ind;
.LN0:
// line 24
	R1 = [P1];
.LN1:
// line 23
	CC = R0 == 0;
	R0 = R1;
.LN2:
// line 24
	R0 += 1;
	[P1] = R0;
.LN3:
// line 23
	if CC jump .P38L2 ;

	R0.L = .sdGPIOf.0;
	R0.H = .sdGPIOf.0;
.LN4:
// line 24
	CALL.X _printf;
	P1.L = _bError;
	P1.H = _bError;
.LN5:
// line 25
	R0 = 1;
	B[P1] = R0;
.LN6:
// line 29
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P38L2:
	R0.L = .sdOK.1;
	R0.H = .sdOK.1;
	.align 2
.LN7:
// line 27
	CALL.X _printf;
.LN8:
// line 29
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._CheckResult.end:
._CheckResult.end:
	.type _CheckResult,STT_FUNC;

	.align 2;
_gpioCallback:
.LN_gpioCallback:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0,R2,P0-P1,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN9:
// line "..\src\my_led_pb.c":34
	CC = R0 == 0;
.LN10:
// line 32
	LINK 12;
.LN11:
// line 34
	if CC jump .P40L1 ;

.LN12:
// line 77
	R0 = 0;
	P1.L = _count;
	P1.H = _count;
	[P1++] = R0;
	[P1] = R0;
.LN13:
// line 78
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

.P40L1:
.LN14:
// line 42
	R2 = 8;
	CC = R1 < R2 (IU);
	P1.L = _ep;
	P1.H = _ep;
	if CC jump .P40L11 ;

	CC = R1 == R2;
	if CC jump .P40L7 ;

	R0 = 16;
	CC = R1 < R0 (IU);
	if CC jump .P40L10 ;

	CC = R1 == R0;
	if CC jump .P40L8 ;

	R0 = 32;
	CC = R1 == R0;
	if !CC jump .P40L10 ;

.LN15:
// line 46
	R0 = 3;
	[P1] = R0;

.P40L10:
	P1.L = _newButtonPressed;
	P1.H = _newButtonPressed;
.LN16:
// line 51
	R0 = 1;
	[P1] = R0;
.LN17:
// line 53
	CALL.X _allapotgep;
.LN18:
// line 77
	R0 = 0;
	P1.L = _count;
	P1.H = _count;
	[P1++] = R0;
	[P1] = R0;
.LN19:
// line 78
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

.P40L8:
.LN20:
// line 45
	R0 = 2;
	[P1] = R0;
	jump.s .P40L10;

.P40L7:
.LN21:
// line 44
	R0 = 1;
	[P1] = R0;
	jump.s .P40L10;

.P40L11:
.LN22:
// line 42
	R2 = 4;
	CC = R1 == R2;
	if !CC jump .P40L10 ;

.LN23:
// line 43
	[P1] = R0;
	jump.s .P40L10;
.LN._gpioCallback.end:
._gpioCallback.end:
	.global _gpioCallback;
	.type _gpioCallback,STT_FUNC;

	.align 4;
_PB_LED_set_up:
.LN_PB_LED_set_up:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 28 
//  Scratch registers used: {R0-R2,P0-P1,ASTAT0-ASTAT1}
//  Call preserved registers used: {R7,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\my_led_pb.c":80
	LINK 20;
	.align 2
.LN24:
// line 84
	R2 = FP;
.LN25:
// line 80
	[SP + 16] = R7;
.LN26:
// line 84
	R2 += 8;
	R1 = 32;
	R0.L = _gpioMemory;
	R0.H = _gpioMemory;
	CALL.X _adi_gpio_Init;
	R7 = R0;
.LN27:
// line 89
	CALL.X _adi_initComponents;
.LN28:
// line 90
	R0 = R7;
	CALL.X _CheckResult;
.LN29:
// line 98
	R2 = 0;
	R1 = 60;
	R0 = 0;
	CALL.X _adi_gpio_SetDirection;
.LN30:
// line 102
	CALL.X _CheckResult;
.LN31:
// line 104
	R2 = 2;
	R1 = 60;
	R0 = 0;
	CALL.X _adi_gpio_SetInputEdgeSense;
.LN32:
// line 108
	CALL.X _CheckResult;
.LN33:
// line 110
	P1 = 1;
	R2 = R2 - R2 (NS) || [SP + 12] = P1;
	R1 = 60;
	R0 = 0;
	CALL.X _adi_gpio_EnableInterruptMask;
.LN34:
// line 115
	CALL.X _CheckResult;
.LN35:
// line 118
	P1 = 0;
	R0 = R0 - R0 (NS) || [SP + 12] = P1;
	R2.L = _gpioCallback;
	R2.H = _gpioCallback;
	R1 = 60;
	CALL.X _adi_gpio_RegisterCallback;
.LN36:
// line 123
	CALL.X _CheckResult;
.LN37:
// line 131
	R2 = 1;
	R1 = 64;
	R0 = 0;
	CALL.X _adi_gpio_SetDirection;
.LN38:
// line 135
	CALL.X _CheckResult;
.LN39:
// line 138
	R2 = 1;
	R1 = 128;
	R0 = 0;
	CALL.X _adi_gpio_SetDirection;
.LN40:
// line 142
	CALL.X _CheckResult;
.LN41:
// line 145
	R2 = 1;
	R1 = 256;
	R0 = 0;
	CALL.X _adi_gpio_SetDirection;
.LN42:
// line 149
	CALL.X _CheckResult;
.LN43:
// line 152
	R2 = 1;
	R1 = 512;
	R0 = 0;
	CALL.X _adi_gpio_SetDirection;
.LN44:
// line 156
	CALL.X _CheckResult;
.LN45:
// line 159
	R2 = 1;
	R1 = 1024;
	R0 = 0;
	CALL.X _adi_gpio_SetDirection;
.LN46:
// line 163
	CALL.X _CheckResult;
.LN47:
// line 166
	R2 = 1;
	R1 = 2048;
	R0 = 0;
	CALL.X _adi_gpio_SetDirection;
.LN48:
// line 170
	CALL.X _CheckResult;
.LN49:
// line 171
	P0 = [FP + 4];
	R7 = [SP + 16];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._PB_LED_set_up.end:
._PB_LED_set_up.end:
	.global _PB_LED_set_up;
	.type _PB_LED_set_up,STT_FUNC;

	.file_attr ProjectName="Eq";
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
	.file_attr FuncName="_CheckResult";
	.file_attr FuncName="_gpioCallback";
	.file_attr FuncName="_PB_LED_set_up";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _printf;
	.type _printf,STT_FUNC;
	.extern _allapotgep;
	.type _allapotgep,STT_FUNC;
	.extern _adi_gpio_Init;
	.type _adi_gpio_Init,STT_FUNC;
	.extern _adi_initComponents;
	.type _adi_initComponents,STT_FUNC;
	.extern _adi_gpio_SetDirection;
	.type _adi_gpio_SetDirection,STT_FUNC;
	.extern _adi_gpio_SetInputEdgeSense;
	.type _adi_gpio_SetInputEdgeSense,STT_FUNC;
	.extern _adi_gpio_EnableInterruptMask;
	.type _adi_gpio_EnableInterruptMask,STT_FUNC;
	.extern _adi_gpio_RegisterCallback;
	.type _adi_gpio_RegisterCallback,STT_FUNC;

	.section/DOUBLE32 data1;

	.align 4;
	.type .epcdata,STT_OBJECT;
.epcdata:
	.byte _ind[4];
	.global _ind;
	.type _ind,STT_OBJECT;
.epcdata.end:

	.section/DOUBLE32 constdata;

	.align 4;
	.type .epcrodata,STT_OBJECT;
.epcrodata:
	.byte .sdOK.1[] =
		0x25,0x64,0x3A,0x09,0x20,0x4F,0x4B,0x0A,0x00;
	.type .sdOK.1,STT_OBJECT;
.epcrodata.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.type .epcbss,STT_OBJECT;
.epcbss:
	.byte _bError[1];
	.type _bError,STT_OBJECT;
	.align 4;
	.byte _count[8];
	.type _count,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\my_led_pb.sbn", 0, 247;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x1B,0x1C,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x6D,0x79,0x5F,
		0x6C,0x65,0x64,0x5F,0x70,0x62,0x2E,0x63,0x00,0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\my_led_pb.sbn", 247, 6788;
	.byte4 = .LN_CheckResult;
	.byte4 = .LN._CheckResult.end;
	.byte =
		0x01,0x00,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._CheckResult.end;
	.byte =
		0x00,0x00,0x12,0xFD,0x1A,0x00,0x00,0x67,0x70,0x69,0x6F,0x43,
		0x61,0x6C,0x6C,0x62,0x61,0x63,0x6B,0x00,0x01;
	.byte4 = .LN_gpioCallback;
	.byte4 = .LN._gpioCallback.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN9;
	.byte4 = .LN._gpioCallback.end;
	.byte =
		0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN14;
	.byte4 = .LN._gpioCallback.end;
	.byte =
		0x00,0x00,0x00,0x12,0x4A,0x1B,0x00,0x00,0x50,0x42,0x5F,0x4C,
		0x45,0x44,0x5F,0x73,0x65,0x74,0x5F,0x75,0x70,0x00,0x01;
	.byte4 = .LN_PB_LED_set_up;
	.byte4 = .LN._PB_LED_set_up.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN24;
	.byte4 = .LN._PB_LED_set_up.end;
	.byte =
		0x14,0x67,0x70,0x69,0x6F,0x4D,0x61,0x78,0x43,0x61,0x6C,0x6C,
		0x62,0x61,0x63,0x6B,0x73,0x00,0x01,0x10,0x0B,0x00,0x00,0x02,
		0x7F,0x08;
	.byte4 = .LN25-.LN_PB_LED_set_up;
	.byte =
		0x00,0x00,0x00,0x14,0x6E,0x65,0x77,0x42,0x75,0x74,0x74,0x6F,
		0x6E,0x50,0x72,0x65,0x73,0x73,0x65,0x64,0x00,0x01,0x19,0x1C,
		0x00,0x00,0x05,0x03;
	.byte4 = _newButtonPressed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x14,0x65,0x70,0x00,0x01,0x14,0x1C,
		0x00,0x00,0x05,0x03;
	.byte4 = _ep;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x14,0x6C,0x65,0x76,0x65,0x6C,0x73,
		0x00,0x01,0x06,0x1C,0x00,0x00,0x05,0x03;
	.byte4 = _levels;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x14,0x67,0x70,0x69,0x6F,0x4D,0x65,
		0x6D,0x6F,0x72,0x79,0x00,0x01,0xF8,0x1B,0x00,0x00,0x05,0x03;
	.byte4 = _gpioMemory;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x62,0x45,0x72,0x72,0x6F,0x72,
		0x00,0x01,0x79,0x01,0x00,0x00,0x05,0x03;
	.byte4 = _bError;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x63,0x6F,0x75,0x6E,0x74,0x00,
		0x01,0x38,0x0C,0x00,0x00,0x05,0x03;
	.byte4 = _count;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x69,0x6E,0x64,0x00,0x01,0xDF,
		0x01,0x00,0x00,0x05,0x03;
	.byte4 = _ind;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0F,0x06,0x1C,0x00,0x00,0xF3,0x0A,
		0x00,0x00,0x10,0x20,0x00,0x1F,0x00,0x0F,0x14,0x1C,0x00,0x00,
		0xAA,0x03,0x00,0x00,0x10,0x03,0x00,0x02,0x00,0x0E,0x34,0x1A,
		0x00,0x00,0x0E,0xDF,0x01,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\my_led_pb.sbn", 7035, 1160;
	.byte4 = .LN_CheckResult;
	.byte =
		0x04,0x01,0x05,0x01,0x1E,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x09,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x05,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x05,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x15,0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x12,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._CheckResult.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_gpioCallback;
	.byte =
		0x04,0x01,0x05,0x01,0x28,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x01,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x05,0x34,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x04,0x03,0x5C,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x20,0x0D,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x04,0x0E,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x0E,0x0B,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x05,0x21,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x20,0x03,0x5F,0x01,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x04,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x05,0x20,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._gpioCallback.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_PB_LED_set_up;
	.byte =
		0x04,0x01,0x05,0x15,0x58,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x2B,0x0D,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x15,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x2B,0x0D,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x17,0x0E,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x10,0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x20,0x11,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x25,0x0B,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x27,0x0B,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x0D,0x0E,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x24,0x0C,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x05,0x0D,0x0E,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x20,0x11,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x05,0x20,0x0C,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x20,0x0C,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0x20,0x0C,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x05,0x20,0x0C,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x20,0x0C,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x05,0x0D,0x0D,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._PB_LED_set_up.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x39,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x1F,0x1C,0x00,0x00,0xC2,0x1A,0x00,0x00,0x67,0x70,0x69,0x6F,
		0x43,0x61,0x6C,0x6C,0x62,0x61,0x63,0x6B,0x00,0xFD,0x1A,0x00,
		0x00,0x50,0x42,0x5F,0x4C,0x45,0x44,0x5F,0x73,0x65,0x74,0x5F,
		0x75,0x70,0x00,0xE3,0x1B,0x00,0x00,0x69,0x6E,0x64,0x00,0x00,
		0x00,0x00,0x00;
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
	.byte4 = .LN_CheckResult;
	.byte4 = .LN._CheckResult.end-.LN_CheckResult;
	.byte4 = .LN_gpioCallback;
	.byte4 = .LN._gpioCallback.end-.LN_gpioCallback;
	.byte4 = .LN_PB_LED_set_up;
	.byte4 = .LN._PB_LED_set_up.end-.LN_PB_LED_set_up;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.type _gpioMemory,STT_OBJECT;
	.byte _gpioMemory[32];

	.section/DOUBLE32 constdata;

	.align 4;
	.type .sdGPIOf.0,STT_OBJECT;
	.byte .sdGPIOf.0[] =
		0x25,0x64,0x3A,0x09,0x20,0x47,0x50,0x49,0x4F,0x20,0x66,0x61,
		0x69,0x6C,0x75,0x72,0x65,0x0A,0x00;

	.section/DOUBLE32 data1;


	.extern _newButtonPressed;
	.type _newButtonPressed,STT_OBJECT;
	.extern _ep;
	.type _ep,STT_OBJECT;
	.extern _levels;
	.type _levels,STT_OBJECT;
