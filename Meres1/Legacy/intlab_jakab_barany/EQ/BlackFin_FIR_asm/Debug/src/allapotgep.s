	.file "..\src\allapotgep.c";
//  Compilation time: Mon Nov 25 16:41:03 2024
//  Compiler options: -c -file-attr ProjectName=Eq -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\allapotgep.d -o src\allapotgep.doj
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
_allapotgep:
.LN_allapotgep:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 16 
//  Scratch registers used: {R0-R2,P0-P1,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {P4-P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":141
	LINK 0;
	.align 2
	[--SP] = (P5:4);
	SP += -12;
	P1.L = _newButtonPressed;
	P1.H = _newButtonPressed;
.LN0:
// line 149
	R0 = [P1];
	CC = R0 == 0;
	if !CC jump .P40L1 ;

.LN1:
// line 157
	SP += 12;
	P0 = [FP + 4];
	(P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P40L1:
.LN2:
// line 150
	R0 = 0;
	[P1] = R0;
	P4.L = _allapotValtozo;
	P4.H = _allapotValtozo;
.LN3:
// line 153
	R0 = [P4];
	P0.L = _ep;
	P0.H = _ep;
	R1 = R0 << 5 || R0 = [P0 + 0];
	R2.L = _vezerloTomb;
	R2.H = _vezerloTomb;
	R1 = R2 + R1;
	R0 <<= 3;
	R0 = R1 + R0;
	P1 = R0;
	P5.L = _ve;
	P5.H = _ve;
	// -- 3 stalls --
	R0 = [P1++];
	R1 = [P1];
	[P5++] = R0;
	[P5] = R1;
.LN4:
// line 154
	R0 = [P0 + 4];
	P1 = [P5 + 0];
	// -- 3 stalls --
.LN5:
	CALL (P1);
.LN6:
// line 155
	R0 = [P5 + -4];
	[P4] = R0;
.LN7:
// line 157
	SP += 12;
	P0 = [FP + 4];
	(P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._allapotgep.end:
._allapotgep.end:
	.global _allapotgep;
	.type _allapotgep,STT_FUNC;

	.align 4;
_initStateMachine:
.LN_initStateMachine:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {R0-R2,P0-P2,ASTAT0-ASTAT1}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
//  Original Loop at "..\src\allapotgep.c" line 121 col 9 - loop structure completely unrolled
//-------------------------------------------------------------------
//  Original Loop at "..\src\allapotgep.c" line 120 col 6 - loop flattened into Loop at "..\src\allapotgep.c" line 121 col 9
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":116
	LINK 0;
	.align 2
	P1.L = _possibleLevelValues;
	P1.H = _possibleLevelValues;
.LN8:
// line 136
	R1 = R1 - R1 (NS) || R0 = W[P1] (X);
	P1.L = _vezerloTomb;
	P1.H = _vezerloTomb;
.LN9:
// line 122
	R0.H = R0.L << 0 || [P1++] = R1;
.LN10:
	R2.L = _semmi;
	R2.H = _semmi;
	[P1++] = R2;
.LN11:
	[P1++] = R1;
.LN12:
	[P1++] = R2;
.LN13:
	[P1++] = R1;
.LN14:
	[P1++] = R2;
.LN15:
	[P1++] = R1;
.LN16:
	[P1++] = R2;
	P0.L = _levels;
	P0.H = _levels;
.LN17:
	[P1++] = R1;
	[P0] = R0;
.LN18:
// line 138
	W[P0 + 4] = R0;
.LN19:
// line 122
	[P1++] = R2;
.LN20:
// line 126
	R0 = 1;
	[P1 + -16] = R0;
.LN21:
// line 127
	[P1 + -24] = R0;
.LN22:
// line 128
	[P1 + -32] = R0;
.LN23:
// line 131
	[P1 + 16] = R0;
.LN24:
// line 132
	[P1 + 8] = R0;
.LN25:
	R0.L = _increaseLevel;
	R0.H = _increaseLevel;
	[P1 + 12] = R0;
.LN26:
// line 133
	R0.L = _gotoMainMenu;
	R0.H = _gotoMainMenu;
	[P1 + 4] = R0;
.LN27:
// line 131
	R0.L = _decreaseLevel;
	R0.H = _decreaseLevel;
	[P1 + 20] = R0;
.LN28:
// line 128
	R0.L = _setFrequencyParamHigh;
	R0.H = _setFrequencyParamHigh;
	[P1 + -28] = R0;
.LN29:
// line 127
	R0.L = _setFrequencyParamMid;
	R0.H = _setFrequencyParamMid;
	[P1 + -20] = R0;
.LN30:
// line 126
	R0.L = _setFrequencyParamBass;
	R0.H = _setFrequencyParamBass;
.LN31:
// line 133
	[P1 + 0] = R1;
.LN32:
// line 126
	[P1 + -12] = R0;
.LN33:
// line 139
	P2 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P2);
.LN._initStateMachine.end:
._initStateMachine.end:
	.global _initStateMachine;
	.type _initStateMachine,STT_FUNC;

	.align 4;
_semmi:
.LN_semmi:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 
//  Scratch registers used: {P0}
//  Call preserved registers used: {RETS}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":113
	LINK 0;
	.align 2
.LN34:
// line 114
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._semmi.end:
._semmi.end:
	.global _semmi;
	.type _semmi,STT_FUNC;

	.align 2;
_setLeds:
.LN_setLeds:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0-R1,P0-P1,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN35:
// line "..\src\allapotgep.c":80
	CC = R0 < 5 (IU);
	P1 = R0;
.LN36:
// line 79
	LINK 12;
.LN37:
// line 80
	if !CC jump .P50L2 ;

	P0.L = .SWITCH.0;
	P0.H = .SWITCH.0;
	P1 = P0 + (P1<<2);
	P1 = [P1];
.LN38:
// line 82
	R1 = 1984;
	// -- 2 stalls --
.LN39:
// line 80
	JUMP (P1);

	.align 4
.P50L2:
.LN40:
// line 101
	R1 = 1984;
	.align 2
	R0 = 0;
	CALL.X _adi_gpio_Clear;
.LN41:
// line 105
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P50L3:
.LN42:
// line 82
	CALL.X _adi_gpio_Set;
	.align 2
.LN43:
// line 105
	P0 = [FP + 4];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P50L4:
.LN44:
// line 85
	R1 = 960;
	.align 2
	R0 = 0;
	CALL.X _adi_gpio_Set;
.LN45:
// line 86
	R1 = 1024;
	R0 = 0;
	CALL.X _adi_gpio_Clear;
.LN46:
// line 105
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P50L5:
.LN47:
// line 89
	R1 = 448;
	.align 2
	R0 = 0;
	CALL.X _adi_gpio_Set;
.LN48:
// line 90
	R1 = 1536;
	R0 = 0;
	CALL.X _adi_gpio_Clear;
.LN49:
// line 105
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P50L6:
.LN50:
// line 93
	R1 = 192;
	.align 2
	R0 = 0;
	CALL.X _adi_gpio_Set;
.LN51:
// line 94
	R1 = 1792;
	R0 = 0;
	CALL.X _adi_gpio_Clear;
.LN52:
// line 105
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P50L7:
.LN53:
// line 97
	R1 = 64;
	.align 2
	R0 = 0;
	CALL.X _adi_gpio_Set;
.LN54:
// line 98
	R1 = 1920;
	R0 = 0;
	CALL.X _adi_gpio_Clear;
.LN55:
// line 105
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setLeds.end:
._setLeds.end:
	.global _setLeds;
	.type _setLeds,STT_FUNC;

	.align 4;
_setFrequencyParamBass:
.LN_setFrequencyParamBass:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 24 
//  Scratch registers used: {R0,P0-P1}
//  Call preserved registers used: {P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":36
	LINK 16;
	.align 2
	[SP + 12] = P5;
	P5 = R0;
	R0.L = .sBassse.1;
	R0.H = .sBassse.1;
.LN56:
// line 37
	CALL.X _printf;
.LN57:
// line 38
	R0 = 0;
	P1.L = _indeces;
	P1.H = _indeces;
	[P5] = R0;
.LN58:
// line 39
	R0 = [P1];
.LN59:
	CALL.X _setLeds;
.LN60:
// line 40
	P0 = [FP + 4];
	P5 = [SP + 12];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setFrequencyParamBass.end:
._setFrequencyParamBass.end:
	.global _setFrequencyParamBass;
	.type _setFrequencyParamBass,STT_FUNC;

	.align 4;
_setFrequencyParamMid:
.LN_setFrequencyParamMid:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 24 
//  Scratch registers used: {R0,P0-P1}
//  Call preserved registers used: {P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":42
	LINK 16;
	.align 2
	[SP + 12] = P5;
	P5 = R0;
	R0.L = .sMidsel.2;
	R0.H = .sMidsel.2;
.LN61:
// line 43
	CALL.X _printf;
.LN62:
// line 44
	R0 = 1;
	P1.L = _indeces+4;
	P1.H = _indeces+4;
	[P5] = R0;
.LN63:
// line 45
	R0 = [P1];
.LN64:
	CALL.X _setLeds;
.LN65:
// line 46
	P0 = [FP + 4];
	P5 = [SP + 12];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setFrequencyParamMid.end:
._setFrequencyParamMid.end:
	.global _setFrequencyParamMid;
	.type _setFrequencyParamMid,STT_FUNC;

	.align 4;
_setFrequencyParamHigh:
.LN_setFrequencyParamHigh:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 24 
//  Scratch registers used: {R0,P0-P1}
//  Call preserved registers used: {P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":48
	LINK 16;
	.align 2
	[SP + 12] = P5;
	P5 = R0;
	R0.L = .sHighse.3;
	R0.H = .sHighse.3;
.LN66:
// line 49
	CALL.X _printf;
.LN67:
// line 50
	R0 = 2;
	P1.L = _indeces+8;
	P1.H = _indeces+8;
	[P5] = R0;
.LN68:
// line 51
	R0 = [P1];
.LN69:
	CALL.X _setLeds;
.LN70:
// line 52
	P0 = [FP + 4];
	P5 = [SP + 12];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setFrequencyParamHigh.end:
._setFrequencyParamHigh.end:
	.global _setFrequencyParamHigh;
	.type _setFrequencyParamHigh,STT_FUNC;

	.align 4;
_decreaseLevel:
.LN_decreaseLevel:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0-R1,P0-P2,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {P3-P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":56
	LINK 0;
	.align 2
	[--SP] = (P5:3);
	P4 = R0;
	SP += -12;
	P5.L = _indeces;
	P5.H = _indeces;
.LN71:
// line 57
	R1 = 4;
	P1 = [P4];
	P3.L = _levels;
	P3.H = _levels;
	// -- stall --
	P1 = P5 + (P1<<2);
	R0 = [P1];
	CC = R0 < R1;
	if !CC jump .P45L2 ;

.LN72:
// line 58
	R0 += 1;
	[P1] = R0;
.LN73:
// line 59
	P2 = [P4];
	P1 = P5;
	P1 += -12;
	// -- stall --
	P0 = P5 + (P2<<2);
	P0 = [P0];
	P2 = P3 + (P2<<1);
	// -- 2 stalls --
	P1 = P1 + (P0<<1);
	R0 = W[P1] (X);
	W[P2] = R0.L;

.P45L3:
.LN74:
// line 64
	P1 = [P4];
	// -- 3 stalls --
	P1 = P5 + (P1<<2);
	R0 = [P1];
.LN75:
	CALL.X _setLeds;
.LN76:
// line 65
	SP += 12;
	P0 = [FP + 4];
	(P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P45L2:
	R0.L = .sLimitr.4;
	R0.H = .sLimitr.4;
	.align 2
.LN77:
// line 62
	CALL.X _printf;
	jump.s .P45L3;
.LN._decreaseLevel.end:
._decreaseLevel.end:
	.global _decreaseLevel;
	.type _decreaseLevel,STT_FUNC;

	.align 4;
_increaseLevel:
.LN_increaseLevel:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0,P0-P2,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {P3-P5,RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":67
	LINK 0;
	.align 2
	[--SP] = (P5:3);
	P4 = R0;
	SP += -12;
	P5.L = _indeces;
	P5.H = _indeces;
	P3.L = _levels;
	P3.H = _levels;
.LN78:
// line 68
	P1 = [P4];
	// -- 3 stalls --
	P1 = P5 + (P1<<2);
	R0 = [P1];
	CC = R0 <= 0;
	if CC jump .P43L2 ;

.LN79:
// line 69
	R0 += -1;
	[P1] = R0;
.LN80:
// line 70
	P2 = [P4];
	P1 = P5;
	P1 += -12;
	// -- stall --
	P0 = P5 + (P2<<2);
	P0 = [P0];
	P2 = P3 + (P2<<1);
	// -- 2 stalls --
	P1 = P1 + (P0<<1);
	R0 = W[P1] (X);
	W[P2] = R0.L;

.P43L3:
.LN81:
// line 75
	P1 = [P4];
	// -- 3 stalls --
	P1 = P5 + (P1<<2);
	R0 = [P1];
.LN82:
	CALL.X _setLeds;
.LN83:
// line 76
	SP += 12;
	P0 = [FP + 4];
	(P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P43L2:
	R0.L = .sLimitr.4;
	R0.H = .sLimitr.4;
	.align 2
.LN84:
// line 73
	CALL.X _printf;
	jump.s .P43L3;
.LN._increaseLevel.end:
._increaseLevel.end:
	.global _increaseLevel;
	.type _increaseLevel,STT_FUNC;

	.align 4;
_gotoMainMenu:
.LN_gotoMainMenu:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0,P0}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\allapotgep.c":108
	LINK 12;
	.align 2
	R0.L = .sReturn.5;
	R0.H = .sReturn.5;
.LN85:
// line 109
	CALL.X _printf;
.LN86:
// line 110
	R0 = 10;
	CALL.X _setLeds;
.LN87:
// line 112
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._gotoMainMenu.end:
._gotoMainMenu.end:
	.global _gotoMainMenu;
	.type _gotoMainMenu,STT_FUNC;

	.file_attr ProjectName="Eq";
	.file_attr FuncName="_allapotgep";
	.file_attr FuncName="_initStateMachine";
	.file_attr FuncName="_semmi";
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
	.file_attr FuncName="_setLeds";
	.file_attr FuncName="_setFrequencyParamBass";
	.file_attr FuncName="_setFrequencyParamMid";
	.file_attr FuncName="_setFrequencyParamHigh";
	.file_attr FuncName="_decreaseLevel";
	.file_attr FuncName="_increaseLevel";
	.file_attr FuncName="_gotoMainMenu";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _adi_gpio_Clear;
	.type _adi_gpio_Clear,STT_FUNC;
	.extern _adi_gpio_Set;
	.type _adi_gpio_Set,STT_FUNC;
	.extern _printf;
	.type _printf,STT_FUNC;

	.section/DOUBLE32 data1;

	.align 4;
	.type .epcdata,STT_OBJECT;
.epcdata:
	.byte _possibleLevelValues[] =
		0xFF,0x7F,0x9E,0x5A,0x26,0x40,0x6A,0x2D,0x26,0x20;
	.global _possibleLevelValues;
	.type _possibleLevelValues,STT_OBJECT;
	.byte =
		0x00,0x00;
	.byte _indeces[12];
	.global _indeces;
	.type _indeces,STT_OBJECT;
.epcdata.end:

	.section/DOUBLE32 constdata;

	.align 4;
	.type .epcrodata,STT_OBJECT;
.epcrodata:
	.byte .sBassse.1[] =
		0x42,0x61,0x73,0x73,0x20,0x73,0x65,0x6C,0x65,0x63,0x74,0x65,
		0x64,0x0A,0x00;
	.type .sBassse.1,STT_OBJECT;
	.byte =
		0x00;
	.byte .sMidsel.2[] =
		0x4D,0x69,0x64,0x20,0x73,0x65,0x6C,0x65,0x63,0x74,0x65,0x64,
		0x0A,0x00;
	.type .sMidsel.2,STT_OBJECT;
	.byte =
		0x00,0x00;
	.byte .sHighse.3[] =
		0x48,0x69,0x67,0x68,0x20,0x73,0x65,0x6C,0x65,0x63,0x74,0x65,
		0x64,0x0A,0x00;
	.type .sHighse.3,STT_OBJECT;
	.byte =
		0x00;
	.byte .sLimitr.4[] =
		0x4C,0x69,0x6D,0x69,0x74,0x20,0x72,0x65,0x61,0x63,0x68,0x65,
		0x64,0x0A,0x00;
	.type .sLimitr.4,STT_OBJECT;
.epcrodata.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.type .epcbss,STT_OBJECT;
.epcbss:
	.byte _parameter[4];
	.global _parameter;
	.type _parameter,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\allapotgep.sbn", 0, 247;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0xE0,0x1D,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x61,0x6C,0x6C,
		0x61,0x70,0x6F,0x74,0x67,0x65,0x70,0x2E,0x63,0x00,0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\allapotgep.sbn", 247, 6787;
	.byte4 = .LN_allapotgep;
	.byte4 = .LN._allapotgep.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._allapotgep.end;
	.byte =
		0x00,0x00,0x12,0xF3,0x1A,0x00,0x00,0x69,0x6E,0x69,0x74,0x53,
		0x74,0x61,0x74,0x65,0x4D,0x61,0x63,0x68,0x69,0x6E,0x65,0x00,
		0x01;
	.byte4 = .LN_initStateMachine;
	.byte4 = .LN._initStateMachine.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN8;
	.byte4 = .LN._initStateMachine.end;
	.byte =
		0x00,0x00,0x12,0x19,0x1B,0x00,0x00,0x73,0x65,0x6D,0x6D,0x69,
		0x00,0x01;
	.byte4 = .LN_semmi;
	.byte4 = .LN._semmi.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN34;
	.byte4 = .LN._semmi.end;
	.byte =
		0x00,0x00,0x12,0x41,0x1B,0x00,0x00,0x73,0x65,0x74,0x4C,0x65,
		0x64,0x73,0x00,0x01;
	.byte4 = .LN_setLeds;
	.byte4 = .LN._setLeds.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN35;
	.byte4 = .LN._setLeds.end;
	.byte =
		0x00,0x00,0x12,0x77,0x1B,0x00,0x00,0x73,0x65,0x74,0x46,0x72,
		0x65,0x71,0x75,0x65,0x6E,0x63,0x79,0x50,0x61,0x72,0x61,0x6D,
		0x42,0x61,0x73,0x73,0x00,0x01;
	.byte4 = .LN_setFrequencyParamBass;
	.byte4 = .LN._setFrequencyParamBass.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN56;
	.byte4 = .LN._setFrequencyParamBass.end;
	.byte =
		0x00,0x00,0x12,0xAC,0x1B,0x00,0x00,0x73,0x65,0x74,0x46,0x72,
		0x65,0x71,0x75,0x65,0x6E,0x63,0x79,0x50,0x61,0x72,0x61,0x6D,
		0x4D,0x69,0x64,0x00,0x01;
	.byte4 = .LN_setFrequencyParamMid;
	.byte4 = .LN._setFrequencyParamMid.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN61;
	.byte4 = .LN._setFrequencyParamMid.end;
	.byte =
		0x00,0x00,0x12,0xE2,0x1B,0x00,0x00,0x73,0x65,0x74,0x46,0x72,
		0x65,0x71,0x75,0x65,0x6E,0x63,0x79,0x50,0x61,0x72,0x61,0x6D,
		0x48,0x69,0x67,0x68,0x00,0x01;
	.byte4 = .LN_setFrequencyParamHigh;
	.byte4 = .LN._setFrequencyParamHigh.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN66;
	.byte4 = .LN._setFrequencyParamHigh.end;
	.byte =
		0x00,0x00,0x12,0x10,0x1C,0x00,0x00,0x64,0x65,0x63,0x72,0x65,
		0x61,0x73,0x65,0x4C,0x65,0x76,0x65,0x6C,0x00,0x01;
	.byte4 = .LN_decreaseLevel;
	.byte4 = .LN._decreaseLevel.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN71;
	.byte4 = .LN._decreaseLevel.end;
	.byte =
		0x00,0x00,0x12,0x3E,0x1C,0x00,0x00,0x69,0x6E,0x63,0x72,0x65,
		0x61,0x73,0x65,0x4C,0x65,0x76,0x65,0x6C,0x00,0x01;
	.byte4 = .LN_increaseLevel;
	.byte4 = .LN._increaseLevel.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN78;
	.byte4 = .LN._increaseLevel.end;
	.byte =
		0x00,0x00,0x12,0x6B,0x1C,0x00,0x00,0x67,0x6F,0x74,0x6F,0x4D,
		0x61,0x69,0x6E,0x4D,0x65,0x6E,0x75,0x00,0x01;
	.byte4 = .LN_gotoMainMenu;
	.byte4 = .LN._gotoMainMenu.end;
	.byte =
		0x01,0x01,0x00,0x13,0x00,0x00,0x00,0x00;
	.byte4 = .LN85;
	.byte4 = .LN._gotoMainMenu.end;
	.byte =
		0x00,0x00,0x14,0x76,0x65,0x7A,0x65,0x72,0x6C,0x6F,0x54,0x6F,
		0x6D,0x62,0x00,0x01,0xD4,0x1D,0x00,0x00,0x05,0x03;
	.byte4 = _vezerloTomb;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x66,0x72,0x65,0x71,0x75,0x65,
		0x6E,0x63,0x79,0x50,0x61,0x72,0x61,0x6D,0x00,0x01,0xC1,0x1D,
		0x00,0x00,0x05,0x03;
	.byte4 = _frequencyParam;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x76,0x65,0x00,0x01,0xBC,0x1D,
		0x00,0x00,0x05,0x03;
	.byte4 = _ve;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x6E,0x65,0x77,0x42,0x75,0x74,
		0x74,0x6F,0x6E,0x50,0x72,0x65,0x73,0x73,0x65,0x64,0x00,0x01,
		0xB7,0x1D,0x00,0x00,0x05,0x03;
	.byte4 = _newButtonPressed;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x65,0x70,0x00,0x01,0xB2,0x1D,
		0x00,0x00,0x05,0x03;
	.byte4 = _ep;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x70,0x61,0x72,0x61,0x6D,0x65,
		0x74,0x65,0x72,0x00,0x01,0x0A,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _parameter;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x61,0x6C,0x6C,0x61,0x70,0x6F,
		0x74,0x56,0x61,0x6C,0x74,0x6F,0x7A,0x6F,0x00,0x01,0xAD,0x1D,
		0x00,0x00,0x05,0x03;
	.byte4 = _allapotValtozo;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x70,0x6F,0x73,0x73,0x69,0x62,
		0x6C,0x65,0x4C,0x65,0x76,0x65,0x6C,0x56,0x61,0x6C,0x75,0x65,
		0x73,0x00,0x01,0x9F,0x1D,0x00,0x00,0x05,0x03;
	.byte4 = _possibleLevelValues;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x69,0x6E,0x64,0x65,0x63,0x65,
		0x73,0x00,0x01,0x91,0x1D,0x00,0x00,0x05,0x03;
	.byte4 = _indeces;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x14,0x6C,0x65,0x76,0x65,0x6C,0x73,
		0x00,0x01,0x83,0x1D,0x00,0x00,0x05,0x03;
	.byte4 = _levels;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0F,0x91,0x1D,0x00,0x00,0xAB,0x03,
		0x00,0x00,0x10,0x03,0x00,0x02,0x00,0x0F,0x9F,0x1D,0x00,0x00,
		0xE0,0x01,0x00,0x00,0x10,0x03,0x00,0x02,0x00,0x0F,0xAD,0x1D,
		0x00,0x00,0xAB,0x03,0x00,0x00,0x10,0x05,0x00,0x04,0x00,0x0E,
		0xA2,0x10,0x00,0x00,0x0E,0x5F,0x11,0x00,0x00,0x0E,0xE0,0x01,
		0x00,0x00,0x0E,0xAB,0x11,0x00,0x00,0x0E,0xFC,0x10,0x00,0x00,
		0x0F,0xD4,0x1D,0x00,0x00,0xAB,0x11,0x00,0x00,0x10,0x04,0x00,
		0x03,0x00,0x0F,0xE2,0x1D,0x00,0x00,0xC6,0x1D,0x00,0x00,0x10,
		0x02,0x00,0x01,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\allapotgep.sbn", 7034, 1142;
	.byte4 = .LN_allapotgep;
	.byte =
		0x04,0x01,0x05,0x12,0x95,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x11,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x01,0x11,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x03,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x10,0x01,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._allapotgep.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_initStateMachine;
	.byte =
		0x04,0x01,0x05,0x18,0x7C,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x06,0x1D,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x0D,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x34,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x34,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x34,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x34,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x06,0x19,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x34,0x03,0x70,0x01,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x06,0x0D,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x3A,0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x39,0x0A,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x3A,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x39,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x06,0x10,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x39,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x01,0x16,0x00,0x05,0x02;
	.byte4 = .LN._initStateMachine.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_semmi;
	.byte =
		0x04,0x01,0x05,0x17,0x79,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._semmi.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setLeds;
	.byte =
		0x04,0x01,0x05,0x18,0x57,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x05,0x18,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x19,0x0B,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x05,0x05,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0x18,0x1E,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x05,0x19,0x03,0x69,0x01,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0x01,0x20,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x19,0x03,0x6C,0x01,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x05,0x1B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x01,0x1C,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x19,0x03,0x70,0x01,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x05,0x1B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x05,0x01,0x18,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x05,0x19,0x03,0x74,0x01,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x05,0x1B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x05,0x01,0x14,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x05,0x19,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x05,0x1B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x05,0x01,0x10,0x00,0x05,0x02;
	.byte4 = .LN._setLeds.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setFrequencyParamBass;
	.byte =
		0x04,0x01,0x05,0x27,0x2C,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._setFrequencyParamBass.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setFrequencyParamMid;
	.byte =
		0x04,0x01,0x05,0x26,0x32,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._setFrequencyParamMid.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setFrequencyParamHigh;
	.byte =
		0x04,0x01,0x05,0x27,0x38,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._setFrequencyParamHigh.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_decreaseLevel;
	.byte =
		0x04,0x01,0x05,0x30,0x40,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x05,0x0F,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN._decreaseLevel.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_increaseLevel;
	.byte =
		0x04,0x01,0x05,0x30,0x4B,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN79;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN80;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN81;
	.byte =
		0x05,0x05,0x0E,0x00,0x05,0x02;
	.byte4 = .LN82;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x05,0x0F,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN._increaseLevel.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_gotoMainMenu;
	.byte =
		0x04,0x01,0x05,0x1E,0x74,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x05,0x0C,0x0A,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._gotoMainMenu.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x60,0x01,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary ".\src\allapotgep.sbn", 8176, 346;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x64,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_allapotgep;
	.byte4 = .LN._allapotgep.end-.LN_allapotgep;
	.byte4 = .LN_initStateMachine;
	.byte4 = .LN._initStateMachine.end-.LN_initStateMachine;
	.byte4 = .LN_semmi;
	.byte4 = .LN._semmi.end-.LN_semmi;
	.byte4 = .LN_increaseLevel;
	.byte4 = .LN._increaseLevel.end-.LN_increaseLevel;
	.byte4 = .LN_gotoMainMenu;
	.byte4 = .LN._gotoMainMenu.end-.LN_gotoMainMenu;
	.byte4 = .LN_decreaseLevel;
	.byte4 = .LN._decreaseLevel.end-.LN_decreaseLevel;
	.byte4 = .LN_setFrequencyParamHigh;
	.byte4 = .LN._setFrequencyParamHigh.end-.LN_setFrequencyParamHigh;
	.byte4 = .LN_setFrequencyParamMid;
	.byte4 = .LN._setFrequencyParamMid.end-.LN_setFrequencyParamMid;
	.byte4 = .LN_setFrequencyParamBass;
	.byte4 = .LN._setFrequencyParamBass.end-.LN_setFrequencyParamBass;
	.byte4 = .LN_setLeds;
	.byte4 = .LN._setLeds.end-.LN_setLeds;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.global _vezerloTomb;
	.type _vezerloTomb,STT_OBJECT;
	.byte _vezerloTomb[64];

	.section/DOUBLE32 data1;

	.align 4;
	.global _frequencyParam;
	.type _frequencyParam,STT_OBJECT;
	.byte _frequencyParam[] =
		0x00,0x00,0x00,0x00;

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.global _ve;
	.type _ve,STT_OBJECT;
	.byte _ve[8];

	.section/DOUBLE32 data1;

	.align 4;
	.global _newButtonPressed;
	.type _newButtonPressed,STT_OBJECT;
	.byte _newButtonPressed[] =
		0x00,0x00,0x00,0x00;

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.global _ep;
	.type _ep,STT_OBJECT;
	.byte _ep[8];

	.section/DOUBLE32 data1;

	.align 4;
	.global _allapotValtozo;
	.type _allapotValtozo,STT_OBJECT;
	.byte _allapotValtozo[] =
		0x00,0x00,0x00,0x00;

	.section/DOUBLE32 L1_data_b;

	.align 4;
.epcdataL1_data_b:
	.type .epcdataL1_data_b,STT_OBJECT;
	.byte _levels[6];
	.global _levels;
	.type _levels,STT_OBJECT;
.epcdataL1_data_b.end:

	.section/DOUBLE32 constdata;

	.align 4;
	.type .SWITCH.0,STT_OBJECT;
.SWITCH.0:
	.byte4 = .P50L3;
	.byte4 = .P50L4;
	.byte4 = .P50L5;
	.byte4 = .P50L6;
	.byte4 = .P50L7;
.SWITCH.0.end:
	.align 4;
	.type .sReturn.5,STT_OBJECT;
	.byte .sReturn.5[] =
		0x52,0x65,0x74,0x75,0x72,0x6E,0x65,0x64,0x20,0x74,0x6F,0x20,
		0x4D,0x61,0x69,0x6E,0x4D,0x65,0x6E,0x75,0x0A,0x00;
