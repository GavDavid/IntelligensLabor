	.file "..\src\init1835viaSPI.c";
//  Compilation time: Mon Oct  7 14:24:56 2024
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_ALE -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -ED -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\init1835viaSPI.d -o src\init1835viaSPI.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

.epctext:

_Delay:
.LN_Delay:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r2,i12,acc}
//  No call preserved registers used.
//-------------------------------------------------------------------
// line "..\src\init1835viaSPI.c":136
	modify(i7,-2);
	dm(-2,i6)=r4;
// Diagnostic: Optimizer now disabled
.LN0:
// line 137
	jump (pc,.P36L1);

.P36L6:
//-------------------------------------------------------------------
//   Part of Loop 1, depth 1
//-------------------------------------------------------------------
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------

.P36L1:
//-------------------------------------------------------------------
//   Loop at "..\src\init1835viaSPI.c" line 137 col 5
//-------------------------------------------------------------------
	r2=dm(-2,i6);
	r2=pass r2;
	if le jump (pc,.P36L3);


.LN1:
// line 138
	// ASM STATEMENT
	nop;
	// END ASM STATEMENT

.LN2:
// line 137
	r2=dm(-2,i6);
	r2=r2-1;
	dm(-2,i6)=r2;
	jump (pc,.P36L6);

.P36L3:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN3:
// line 139
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._Delay.end:
._Delay.end:
	.global _Delay;
	.type _Delay,STT_FUNC;

_DisableSPI1835:
.LN_DisableSPI1835:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {i4,i12}
//  No call preserved registers used.
//-------------------------------------------------------------------
.LN4:
// line "..\src\init1835viaSPI.c":64
	i4=786432;
	dm(4096)=i4;
.LN5:
// line 65
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._DisableSPI1835.end:
._DisableSPI1835.end:
	.global _DisableSPI1835;
	.type _DisableSPI1835,STT_FUNC;

_SetupSPI1835:
.LN_SetupSPI1835:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {i4,i12}
//  No call preserved registers used.
//-------------------------------------------------------------------
.LN6:
// line "..\src\init1835viaSPI.c":47
	i4=786432;
	dm(4096)=i4;
.LN7:
// line 48
	dm(4097)=m5;
.LN8:
// line 51
	i4=100;
	dm(4101)=i4;
.LN9:
// line 54
	i4=63240;
	dm(4097)=i4;
.LN10:
// line 57
	i4=21121;
	dm(4096)=i4;
.LN11:
// line 59
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._SetupSPI1835.end:
._SetupSPI1835.end:
	.global _SetupSPI1835;
	.type _SetupSPI1835,STT_FUNC;

_Configure1835Register:
.LN_Configure1835Register:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r1-r2,r4,i12,scc}
//  No call preserved registers used.
//  Registers that could be clobbered by function calls: {r0-r2,r4,r8,r12,s0-s15,i4,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\init1835viaSPI.c":69
	modify(i7,-2);
	dm(-2,i6)=r4;
// Diagnostic: Optimizer now disabled
.LN12:
// line 70
	dm(4099)=r4;
.LN13:
// line 71
	r4=100;
	cjump _Delay (db); dm(i7,m7)=r2; dm(i7,m7)=pc;

.P39L1:
//-------------------------------------------------------------------
//   Loop at "..\src\init1835viaSPI.c" line 74 col 5
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in an estimated 10 
//   cycles (includes 5 stalls).
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     dm dag                          used   4 out of   10 ( 40.0%)
//     multifunction alu               used   4 out of   10 ( 40.0%)
//     multifunction float multiply    used   4 out of   10 ( 40.0%)
//     multifunction integer add sub   used   4 out of   10 ( 40.0%)
//     multifunction integer multiply  used   4 out of   10 ( 40.0%)
//     multifunction mult              used   4 out of   10 ( 40.0%)
//     pm dag                          used   4 out of   10 ( 40.0%)
//     shift immediate                 used   4 out of   10 ( 40.0%)
//     memory access                   used   4 out of   20 ( 20.0%)
//-------------------------------------------------------------------

	// -- 2 stalls --
.LN14:
// line 76
	r2=dm(4098);                            // Use of volatile in loops precludes optimizations. 
	r1=m5;
	btst r2 by r1;
	// -- stall --
	if sz jump (pc,.P39L5);

//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN15:
// line 77
	jump (pc,.P39L7);

.P39L5:
//-------------------------------------------------------------------
//   Part of Loop 1, depth 1
//-------------------------------------------------------------------
	// -- 2 stalls --
	jump (pc,.P39L1);
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------

.P39L7:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN16:
// line 79
	r4=100;
	cjump _Delay (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN17:
// line 80
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._Configure1835Register.end:
._Configure1835Register.end:
	.global _Configure1835Register;
	.type _Configure1835Register,STT_FUNC;

_Get1835Register:
.LN_Get1835Register:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r0-r2,r4,i12,scc}
//  No call preserved registers used.
//  Registers that could be clobbered by function calls: {r0-r2,r4,r8,r12,s0-s15,i4,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\init1835viaSPI.c":84
	modify(i7,-2);
	dm(-2,i6)=r4;
// Diagnostic: Optimizer now disabled
.LN18:
// line 85
	dm(4099)=r4;
.LN19:
// line 86
	r4=100;
	cjump _Delay (db); dm(i7,m7)=r2; dm(i7,m7)=pc;

.P40L1:
//-------------------------------------------------------------------
//   Loop at "..\src\init1835viaSPI.c" line 89 col 5
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in an estimated 10 
//   cycles (includes 5 stalls).
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     dm dag                          used   4 out of   10 ( 40.0%)
//     multifunction alu               used   4 out of   10 ( 40.0%)
//     multifunction float multiply    used   4 out of   10 ( 40.0%)
//     multifunction integer add sub   used   4 out of   10 ( 40.0%)
//     multifunction integer multiply  used   4 out of   10 ( 40.0%)
//     multifunction mult              used   4 out of   10 ( 40.0%)
//     pm dag                          used   4 out of   10 ( 40.0%)
//     shift immediate                 used   4 out of   10 ( 40.0%)
//     memory access                   used   4 out of   20 ( 20.0%)
//-------------------------------------------------------------------

	// -- 2 stalls --
.LN20:
// line 91
	r2=dm(4098);                            // Use of volatile in loops precludes optimizations. 
	r1=m5;
	btst r2 by r1;
	// -- stall --
	if sz jump (pc,.P40L5);

//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN21:
// line 92
	jump (pc,.P40L7);

.P40L5:
//-------------------------------------------------------------------
//   Part of Loop 1, depth 1
//-------------------------------------------------------------------
	// -- 2 stalls --
	jump (pc,.P40L1);
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------

.P40L7:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN22:
// line 94
	r4=100;
	cjump _Delay (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN23:
// line 95
	r0=dm(4100);
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._Get1835Register.end:
._Get1835Register.end:
	.global _Get1835Register;
	.type _Get1835Register,STT_FUNC;

_Init1835viaSPI:
.LN_Init1835viaSPI:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r1-r2,r4,i4,i12,m4,acc}
//  No call preserved registers used.
//  Registers that could be clobbered by function calls: {r0-r2,r4,r8,r12,s0-s15,i4,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\init1835viaSPI.c":101
	modify(i7,-2);
// Diagnostic: Optimizer now disabled
.LN24:
// line 102
	i12=13;
	dm(-3,i6)=i12;
.LN25:
// line 105
	cjump _SetupSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN26:
// line 107
	dm(-2,i6)=m13;

.P41L1:
//-------------------------------------------------------------------
//   Loop at "..\src\init1835viaSPI.c" line 107 col 5
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in an estimated 19 
//   cycles (includes 5 stalls but excludes the cost of function calls).
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     dm dag                          used  10 out of   19 ( 52.6%)
//     pm dag                          used  10 out of   19 ( 52.6%)
//     shift immediate                 used  10 out of   19 ( 52.6%)
//     multifunction alu               used   6 out of   19 ( 31.6%)
//     multifunction float multiply    used   6 out of   19 ( 31.6%)
//     multifunction integer add sub   used   6 out of   19 ( 31.6%)
//     multifunction integer multiply  used   6 out of   19 ( 31.6%)
//     multifunction mult              used   6 out of   19 ( 31.6%)
//     memory access                   used  10 out of   38 ( 26.3%)
//-------------------------------------------------------------------
	// -- 2 stalls --
	r2=dm(-2,i6);
	r1=dm(-3,i6);
	comp(r1,r2);
	// -- stall --
	if le jump (pc,.P41L3);

	m4=r2;
.LN27:
// line 109
	i4=_Config1835Param;
	// -- 2 stalls --
	r4=dm(m4,i4);
.LN28:
	cjump _Configure1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN29:
// line 107
	r2=dm(-2,i6);
	r2=r2+1;
	dm(-2,i6)=r2;
	jump (pc,.P41L1);
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------

.P41L3:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN30:
// line 112
	cjump _DisableSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN31:
// line 114
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._Init1835viaSPI.end:
._Init1835viaSPI.end:
	.global _Init1835viaSPI;
	.type _Init1835viaSPI,STT_FUNC;

_Init1835viaSPI_PowerDwn:
.LN_Init1835viaSPI_PowerDwn:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r1-r2,r4,i4,i12,m4,acc}
//  No call preserved registers used.
//  Registers that could be clobbered by function calls: {r0-r2,r4,r8,r12,s0-s15,i4,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\init1835viaSPI.c":118
	modify(i7,-2);
// Diagnostic: Optimizer now disabled
.LN32:
// line 119
	i12=13;
	dm(-3,i6)=i12;
.LN33:
// line 122
	cjump _SetupSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN34:
// line 124
	dm(-2,i6)=m13;

.P42L1:
//-------------------------------------------------------------------
//   Loop at "..\src\init1835viaSPI.c" line 124 col 5
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in an estimated 19 
//   cycles (includes 5 stalls but excludes the cost of function calls).
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     dm dag                          used  10 out of   19 ( 52.6%)
//     pm dag                          used  10 out of   19 ( 52.6%)
//     shift immediate                 used  10 out of   19 ( 52.6%)
//     multifunction alu               used   6 out of   19 ( 31.6%)
//     multifunction float multiply    used   6 out of   19 ( 31.6%)
//     multifunction integer add sub   used   6 out of   19 ( 31.6%)
//     multifunction integer multiply  used   6 out of   19 ( 31.6%)
//     multifunction mult              used   6 out of   19 ( 31.6%)
//     memory access                   used  10 out of   38 ( 26.3%)
//-------------------------------------------------------------------
	// -- 2 stalls --
	r2=dm(-2,i6);
	r1=dm(-3,i6);
	comp(r1,r2);
	// -- stall --
	if le jump (pc,.P42L3);

	m4=r2;
.LN35:
// line 126
	i4=_Config1835ParamPowerDwn;
	// -- 2 stalls --
	r4=dm(m4,i4);
.LN36:
	cjump _Configure1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN37:
// line 124
	r2=dm(-2,i6);
	r2=r2+1;
	dm(-2,i6)=r2;
	jump (pc,.P42L1);
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------

.P42L3:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN38:
// line 129
	cjump _DisableSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN39:
// line 131
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._Init1835viaSPI_PowerDwn.end:
._Init1835viaSPI_PowerDwn.end:
	.global _Init1835viaSPI_PowerDwn;
	.type _Init1835viaSPI_PowerDwn,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_ALE";
	.file_attr FuncName="_Delay";
	.file_attr FuncName="_DisableSPI1835";
	.file_attr FuncName="_SetupSPI1835";
	.file_attr FuncName="_disable_interrupts";
	.file_attr FuncName="_enable_interrupts";
	.file_attr FuncName="_Configure1835Register";
	.file_attr FuncName="_Get1835Register";
	.file_attr FuncName="_Init1835viaSPI";
	.file_attr FuncName="_Init1835viaSPI_PowerDwn";
	.file_attr Encoding="NW";
	.file_attr Content="CodeData";
.epctext.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\init1835viaSPI.sbn", 0, 260;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0xD4,0x0B,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x69,0x6E,0x69,
		0x74,0x31,0x38,0x33,0x35,0x76,0x69,0x61,0x53,0x50,0x49,0x2E,
		0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\init1835viaSPI.sbn", 260, 2411;
	.var = .LN_Delay;
	.var = .LN._Delay.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x69,0x00,0xF8,0x01,0x00,0x00,0x02,0x86,
		0x7E,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._Delay.end;
	.byte =
		0x00,0x00,0x0C,0xE8,0x09,0x00,0x00,0x44,0x69,0x73,0x61,0x62,
		0x6C,0x65,0x53,0x50,0x49,0x31,0x38,0x33,0x35,0x00,0x01;
	.var = .LN_DisableSPI1835;
	.var = .LN._DisableSPI1835.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN4;
	.var = .LN._DisableSPI1835.end;
	.byte =
		0x00,0x00,0x0C,0x15,0x0A,0x00,0x00,0x53,0x65,0x74,0x75,0x70,
		0x53,0x50,0x49,0x31,0x38,0x33,0x35,0x00,0x01;
	.var = .LN_SetupSPI1835;
	.var = .LN._SetupSPI1835.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN6;
	.var = .LN._SetupSPI1835.end;
	.byte =
		0x00,0x00,0x0C,0x58,0x0A,0x00,0x00,0x43,0x6F,0x6E,0x66,0x69,
		0x67,0x75,0x72,0x65,0x31,0x38,0x33,0x35,0x52,0x65,0x67,0x69,
		0x73,0x74,0x65,0x72,0x00,0x01;
	.var = .LN_Configure1835Register;
	.var = .LN._Configure1835Register.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x76,0x61,0x6C,0x00,0xF8,0x01,0x00,0x00,
		0x02,0x86,0x7E,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN12;
	.var = .LN._Configure1835Register.end;
	.byte =
		0x00,0x00,0x0F,0x99,0x0A,0x00,0x00,0x47,0x65,0x74,0x31,0x38,
		0x33,0x35,0x52,0x65,0x67,0x69,0x73,0x74,0x65,0x72,0x00,0x01;
	.var = .LN_Get1835Register;
	.var = .LN._Get1835Register.end;
	.byte =
		0x01,0x0F,0x02,0x00,0x00,0x01,0x00,0x0D,0x76,0x61,0x6C,0x00,
		0xF8,0x01,0x00,0x00,0x02,0x86,0x7E,0x00,0x0E,0x00,0x00,0x00,
		0x00;
	.var = .LN18;
	.var = .LN._Get1835Register.end;
	.byte =
		0x00,0x00,0x0C,0xF1,0x0A,0x00,0x00,0x49,0x6E,0x69,0x74,0x31,
		0x38,0x33,0x35,0x76,0x69,0x61,0x53,0x50,0x49,0x00,0x01;
	.var = .LN_Init1835viaSPI;
	.var = .LN._Init1835viaSPI.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN24;
	.var = .LN._Init1835viaSPI.end;
	.byte =
		0x10,0x63,0x6F,0x6E,0x66,0x69,0x67,0x53,0x69,0x7A,0x65,0x00,
		0x01,0xF8,0x01,0x00,0x00,0x02,0x86,0x7D;
	.var = .LN24-.LN_Init1835viaSPI;
	.byte =
		0x00,0x10,0x69,0x00,0x01,0xF8,0x01,0x00,0x00,0x02,0x86,0x7E;
	.var = .LN24-.LN_Init1835viaSPI;
	.byte =
		0x00,0x00,0x00,0x0C,0x52,0x0B,0x00,0x00,0x49,0x6E,0x69,0x74,
		0x31,0x38,0x33,0x35,0x76,0x69,0x61,0x53,0x50,0x49,0x5F,0x50,
		0x6F,0x77,0x65,0x72,0x44,0x77,0x6E,0x00,0x01;
	.var = .LN_Init1835viaSPI_PowerDwn;
	.var = .LN._Init1835viaSPI_PowerDwn.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN32;
	.var = .LN._Init1835viaSPI_PowerDwn.end;
	.byte =
		0x10,0x63,0x6F,0x6E,0x66,0x69,0x67,0x53,0x69,0x7A,0x65,0x00,
		0x01,0xF8,0x01,0x00,0x00,0x02,0x86,0x7D;
	.var = .LN32-.LN_Init1835viaSPI_PowerDwn;
	.byte =
		0x00,0x10,0x69,0x00,0x01,0xF8,0x01,0x00,0x00,0x02,0x86,0x7E;
	.var = .LN32-.LN_Init1835viaSPI_PowerDwn;
	.byte =
		0x00,0x00,0x00,0x10,0x43,0x6F,0x6E,0x66,0x69,0x67,0x31,0x38,
		0x33,0x35,0x50,0x61,0x72,0x61,0x6D,0x00,0x01,0xC8,0x0B,0x00,
		0x00,0x05,0x03;
	.var = _Config1835Param;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x43,0x6F,0x6E,0x66,0x69,0x67,
		0x31,0x38,0x33,0x35,0x50,0x61,0x72,0x61,0x6D,0x50,0x6F,0x77,
		0x65,0x72,0x44,0x77,0x6E,0x00,0x01,0xBA,0x0B,0x00,0x00,0x05,
		0x03;
	.var = _Config1835ParamPowerDwn;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x73,0x70,0x69,0x46,0x6C,0x61,
		0x67,0x00,0x01,0xB5,0x0B,0x00,0x00,0x05,0x03;
	.var = _spiFlag;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x11,0xF8,0x01,0x00,0x00,0x12,0xC8,
		0x0B,0x00,0x00,0x0F,0x02,0x00,0x00,0x13,0x02,0x00,0x01,0x00,
		0x12,0xD6,0x0B,0x00,0x00,0x0F,0x02,0x00,0x00,0x13,0x0D,0x00,
		0x0C,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\init1835viaSPI.sbn", 2671, 666;
	.var = .LN_Delay;
	.byte =
		0x04,0x01,0x05,0x01,0x90,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x05,0x0F,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._Delay.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_DisableSPI1835;
	.byte =
		0x04,0x01,0x05,0x01,0x47,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._DisableSPI1835.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_SetupSPI1835;
	.byte =
		0x04,0x01,0x05,0x01,0x34,0x00,0x05,0x02;
	.var = .LN6;
	.byte =
		0x05,0x05,0x0C,0x00,0x05,0x02;
	.var = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN8;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN9;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN10;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN11;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._SetupSPI1835.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Configure1835Register;
	.byte =
		0x04,0x01,0x05,0x01,0x4D,0x00,0x05,0x02;
	.var = .LN12;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN13;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.var = .LN14;
	.byte =
		0x05,0x09,0x0E,0x00,0x05,0x02;
	.var = .LN15;
	.byte =
		0x05,0x0D,0x0A,0x00,0x05,0x02;
	.var = .LN16;
	.byte =
		0x05,0x0B,0x0B,0x00,0x05,0x02;
	.var = .LN17;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._Configure1835Register.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Get1835Register;
	.byte =
		0x04,0x01,0x05,0x01,0x5C,0x00,0x05,0x02;
	.var = .LN18;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN19;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.var = .LN20;
	.byte =
		0x05,0x09,0x0E,0x00,0x05,0x02;
	.var = .LN21;
	.byte =
		0x05,0x0D,0x0A,0x00,0x05,0x02;
	.var = .LN22;
	.byte =
		0x05,0x0B,0x0B,0x00,0x05,0x02;
	.var = .LN23;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN._Get1835Register.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Init1835viaSPI;
	.byte =
		0x04,0x01,0x05,0x01,0x6D,0x00,0x05,0x02;
	.var = .LN24;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN25;
	.byte =
		0x05,0x12,0x0C,0x00,0x05,0x02;
	.var = .LN26;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN27;
	.byte =
		0x05,0x09,0x0B,0x00,0x05,0x02;
	.var = .LN28;
	.byte =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN29;
	.byte =
		0x05,0x21,0x03,0x7E,0x01,0x00,0x05,0x02;
	.var = .LN30;
	.byte =
		0x05,0x14,0x0E,0x00,0x05,0x02;
	.var = .LN31;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._Init1835viaSPI.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Init1835viaSPI_PowerDwn;
	.byte =
		0x04,0x01,0x05,0x01,0x7E,0x00,0x05,0x02;
	.var = .LN32;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN33;
	.byte =
		0x05,0x12,0x0C,0x00,0x05,0x02;
	.var = .LN34;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN35;
	.byte =
		0x05,0x09,0x0B,0x00,0x05,0x02;
	.var = .LN36;
	.byte =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN37;
	.byte =
		0x05,0x21,0x03,0x7E,0x01,0x00,0x05,0x02;
	.var = .LN38;
	.byte =
		0x05,0x14,0x0E,0x00,0x05,0x02;
	.var = .LN39;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._Init1835viaSPI_PowerDwn.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0xD5,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.inc/binary ".\src\init1835viaSPI.sbn", 3337, 207;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x48,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x01,0x00;
	.var = .LN_Delay;
	.var = .LN._Delay.end-.LN_Delay;
	.var = .LN_DisableSPI1835;
	.var = .LN._DisableSPI1835.end-.LN_DisableSPI1835;
	.var = .LN_SetupSPI1835;
	.var = .LN._SetupSPI1835.end-.LN_SetupSPI1835;
	.var = .LN_Configure1835Register;
	.var = .LN._Configure1835Register.end-.LN_Configure1835Register;
	.var = .LN_Get1835Register;
	.var = .LN._Get1835Register.end-.LN_Get1835Register;
	.var = .LN_Init1835viaSPI;
	.var = .LN._Init1835viaSPI.end-.LN_Init1835viaSPI;
	.var = .LN_Init1835viaSPI_PowerDwn;
	.var = .LN._Init1835viaSPI_PowerDwn.end-.LN_Init1835viaSPI_PowerDwn;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DM/DOUBLE32 seg_dmda;

	.align 2;
	.global _Config1835Param;
	.type _Config1835Param,STT_OBJECT;
	.var _Config1835Param[] =
		 0x00000000, 0x00001000, 0x000023FF, 0x000033FF,
		 0x000043FF, 0x000053FF, 0x000063FF, 0x000073FF,
		 0x000083FF, 0x000093FF, 0x0000C000, 0x0000D000,
		 0x0000E000;
	.align 2;
	.global _Config1835ParamPowerDwn;
	.type _Config1835ParamPowerDwn,STT_OBJECT;
	.var _Config1835ParamPowerDwn[] =
		 0x00000004, 0x0000C080;

	.align 1;
	.var _spiFlag[1];
	.weak _spiFlag;
