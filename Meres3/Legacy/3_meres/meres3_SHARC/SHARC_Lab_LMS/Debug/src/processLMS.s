	.file "..\src\processLMS.c";
//  Compilation time: Mon Oct 27 16:30:43 2025
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_LMS -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\processLMS.d -o src\processLMS.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

.epctext:

_flagTest:
.LN_flagTest:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {r0,r2,i12,acc}
//  No call preserved registers used.
//-------------------------------------------------------------------
// Diagnostic: Optimizer now optimizing for speed

.LN0:
// line "..\src\processLMS.c":191
	// ASM STATEMENT
	 r2 = flags;
		// END ASM STATEMENT

.LN1:
// line 197
	r0=r4 and r2, i12=dm(m7,i6);
	// -- 2 stalls --
	jump (m14,i12) (db);
	rframe;
	nop;
.LN._flagTest.end:
._flagTest.end:
	.global _flagTest;
	.type _flagTest,STT_FUNC;

_handle_LED:
.LN_handle_LED:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {i4,i12}
//  No call preserved registers used.
//-------------------------------------------------------------------
.LN2:
// line "..\src\processLMS.c":177
	i4=i6;
// Diagnostic: Optimizer now optimizing for speed
.LN3:
// line 173
	modify(i7,-2);
	dm(-2,i6)=r4;
.LN4:
// line 175
	dm(6144)=m5;
.LN5:
// line 177
	modify(i4,-2);
	dm(6168)=i4;
.LN6:
// line 178
	dm(6169)=m6;
.LN7:
// line 179
	dm(6170)=m6;
.LN8:
// line 180
	dm(6161)=m6;
.LN9:
// line 181
	dm(6162)=m6;
.LN10:
// line 182
	i4=4194304;
.LN11:
// line 185
	i12=dm(m7,i6);
.LN12:
// line 182
	dm(6160)=i4;
.LN13:
// line 184
	i4=871;
	dm(6144)=i4;
	jump (m14,i12) (db);
	rframe;
	nop;
.LN._handle_LED.end:
._handle_LED.end:
	.global _handle_LED;
	.type _handle_LED,STT_FUNC;

_process:
.LN_process:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 10 words
//  Scratch registers used: {r0-r2,r4,r8,r12,i4,i12-i13,b4,m4,acc,mcc,scc,lcntr}
//  Call preserved registers used: {r7,r14-r15,i5,l4,m3}
//  Registers that could be clobbered by function calls: {r0-r1,r4,r8,r12,s0-s15,i4,i6-i7,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\processLMS.c":39
	modify(i7,-6);
// Diagnostic: Optimizer now optimizing for speed
	r2=m3;
	dm(-3,i6)=r2;
	r2=i5;
	dm(-4,i6)=r15;
	dm(-6,i6)=r7;
	dm(-5,i6)=r14;
	dm(-2,i6)=r2;
.LN14:
// line 41
	dm(_isProcessing)=m6;
.LN15:
// line 43
	cjump _setDAIproc (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN16:
// line 49
	r2=dm(_iYDelayPtr);
	r2=r2+1, m4=r2;
.LN17:
// line 50
	r1=80;
	compu(r2,r1);
	if lt r1=m5;
	r2=r2-r1;
.LN18:
// line 49
	i5=_faYDelayBuff;
.LN19:
// line 53
	r1=dm(_i);
	r15=_x;
	r8=r15+r1, m3=r2;
	r2=leftz r1, i4=r8;
.LN20:
// line 45
	r2=dm(_leftIn);
.LN21:
// line 49
	r14=r14-r14, dm(m4,i5)=r2;
.LN22:
// line 46
	r0=dm(_rightIn);
.LN23:
// line 50
	r2=dm(m3,i5);
.LN24:
// line 46
	dm(_ref)=r0;
.LN25:
// line 56
	if not sv jump (pc,.P61L3) (db);
.LN26:
// line 53
	dm(i4,m5)=r0;
.LN27:
// line 50
	dm(_y)=r2;

.LN28:
// line 57
	r2=dm(_x);
	dm(_x+100)=r2;

.P61L3:
.LN29:
// line 60
	r2=100;
	dm(i7,m7)=r2;
	dm(i7,m7)=101;
	r12=_x;
	r4=_coefw;
.LN30:
// line 62
	i5=0;
	// -- stall --
.LN31:
// line 60
	cjump _conv_asm_var (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

	modify(i7,2);
	b4=_x;
.LN32:
// line 63
	dm(_j)=m5;
.LN33:
// line 64
	r2=dm(_i);
	r2=r15+r2;
	m4=r2;
	i4=m4;
	i13=_coefw;
	i12=_coefw;
	l4=100;
	// -- stall --
	r1=pm(i12,m14);
	r0=dm(i4,m6), r2=pm(i12,m14);
	f8=f1*f0, r4=dm(i4,m6);
.LN34:
// line 62
	dm(_y_est)=i5;
.LN35:
// line 64
	lcntr=98, do (pc,.P61L130_end) until lce;

.P61L130:
//-------------------------------------------------------------------
//   Loop at "..\src\processLMS.c" line 63 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 1 cycle.
//-------------------------------------------------------------------
//   Trip Count  = 98
//-------------------------------------------------------------------
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 1
//     Stage Count (SC)                                          = 3
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 1
//     Minimum initiation interval due to resources (res MII)    = 1.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     dm dag                          used   1 out of    1 (100.0%)
//     memory access                   used   2 out of    2 (100.0%)
//     multifunction alu               used   1 out of    1 (100.0%)
//     multifunction float multiply    used   1 out of    1 (100.0%)
//     multifunction integer multiply  used   1 out of    1 (100.0%)
//     multifunction mult              used   1 out of    1 (100.0%)
//     pm dag                          used   1 out of    1 (100.0%)
//-------------------------------------------------------------------
.P61L130_end:
	f8=f2*f4, f14=f8+f14, r4=dm(i4,m6), r2=pm(i12,m14);
	// end loop .P61L130;
//-------------------------------------------------------------------
//   End Kernel for Loop L130
//-------------------------------------------------------------------

.P61L131:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	l4=0;
	b4=_x;
	f1=f2*f4, f2=f8+f14, i4=m4;
	l4=100;
	f2=f1+f2;
	dm(_y_est)=r2;
.LN36:
// line 70
	r0=dm(i4,m6);
.LN37:
// line 67
	r2=dm(_y);
	r1=dm(_y_est);
	f2=f2-f1, r12=dm(i4,m6);
	dm(_e)=r2;
.LN38:
// line 70
	r1=dm(_mu);
	f4=f1*f12;
	f0=f1*f0;
	lcntr=49, do (pc,.P61L126_end) until lce;

.P61L126:
//-------------------------------------------------------------------
//   Loop at "..\src\processLMS.c" line 69 col 2
//-------------------------------------------------------------------
//   This loop executes 2 iterations of the original loop in estimated 4 
//   cycles.
//-------------------------------------------------------------------
//   Trip Count  = 49
//-------------------------------------------------------------------
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 4
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 4
//     Minimum initiation interval due to resources (res MII)    = 4.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     multifunction alu               used   4 out of    4 (100.0%)
//     multifunction float multiply    used   4 out of    4 (100.0%)
//     multifunction integer multiply  used   4 out of    4 (100.0%)
//     multifunction mult              used   4 out of    4 (100.0%)
//     pm dag                          used   4 out of    4 (100.0%)
//     dm dag                          used   3 out of    4 ( 75.0%)
//     memory access                   used   6 out of    8 ( 75.0%)
//     multifunction integer add sub   used   2 out of    4 ( 50.0%)
//     shift immediate                 used   1 out of    4 ( 25.0%)
//-------------------------------------------------------------------
//   Loop was vectorized by a factor of 2.
//-------------------------------------------------------------------
	f8=f2*f0, r7=dm(i4,m6), r12=pm(i13,m13);
	f8=f2*f4, f4=f8+f12, r12=pm(m14,i13);
	f0=f1*f7, f12=f8+f12, r8=dm(i4,m6), pm(i13,m14)=r4;
.P61L126_end:
	f4=f1*f8, pm(i13,m14)=r12;
	// end loop .P61L126;
//-------------------------------------------------------------------
//   End Kernel for Loop L126
//-------------------------------------------------------------------

.P61L127:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	f8=f2*f0, r12=pm(i13,m13);
	f0=f2*f4, f1=f8+f12, r2=pm(m14,i13);
	f2=f0+f2, pm(i13,m14)=r1;
	pm(i13,m14)=r2;
	l4=0;
.LN39:
// line 76
	r2=dm(_y_est);
	dm(_leftOut2)=r2;
.LN40:
// line 77
	dm(_rightOut2)=r2;
.LN41:
// line 79
	r2=dm(_e);
	dm(_leftOut3)=r2;
.LN42:
// line 80
	dm(_rightOut3)=r2;
.LN43:
// line 82
	r2=dm(_i);
	i4=100;
	dm(_j)=i4;
	r2=pass r2, i4=r15;
	m4=r2;
.LN44:
// line 73
	r1=dm(_y);
	dm(_leftOut1)=r1;
.LN45:
// line 82
	r0=dm(m4,i4);
.LN46:
// line 74
	dm(_rightOut1)=r1;
.LN47:
// line 85
	if gt jump (pc,.P61L11) (db);
.LN48:
// line 82
	dm(_leftOut4)=r0;
.LN49:
// line 83
	dm(_rightOut4)=r0;

	jump (pc,.P61L12) (db);
.LN50:
// line 86
	i4=99;
	dm(_i)=i4;

.P61L11:
.LN51:
// line 88
	r2=r2-1;
	dm(_i)=r2;

.P61L12:
.LN52:
// line 91
	r2=dm(_iYDelayPtr);
	r2=r2+1;
.LN53:
// line 92
	r1=80;
	comp(r2,r1);
	if lt jump (pc,.P61L15) (db);
.LN54:
// line 91
	dm(_iYDelayPtr)=r2;
.LN55:
// line 105
	r4=4;

.LN56:
// line 93
	dm(_iYDelayPtr)=m5;
.LN57:
// line 105
	r4=4;

.P61L15:
.LN58:
// line 102
	r2=dm(_channelToOutput4);
	dm(_channelToOutput4Old)=r2;
.LN59:
// line 105
	cjump _flagTest (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

	r2=leftz r0;
.LN60:
	if sv jump (pc,.P61L18) (db);
.LN61:
	r15=4;
.LN62:
// line 110
	r4=16;

.LN63:
// line 106
	i4=4;
	dm(_channelToOutput4)=i4;
.LN64:
// line 110
	r4=16;

.P61L18:
	cjump _flagTest (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

	r2=leftz r0;
.LN65:
// line 115
	r4=262144;
.LN66:
// line 110
	if sv jump (pc,.P61L21);

.LN67:
// line 111
	i4=3;
	dm(_channelToOutput4)=i4;

.P61L21:
	// -- stall --
.LN68:
// line 115
	cjump _readDAIpin (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN69:
	r2=pass r0;
.LN70:
// line 120
	r4=524288;
.LN71:
// line 115
	if le jump (pc,.P61L24);

.LN72:
// line 116
	i4=2;
	dm(_channelToOutput4)=i4;

.P61L24:
	// -- stall --
.LN73:
// line 120
	cjump _readDAIpin (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN74:
	r2=pass r0;
.LN75:
// line 125
	r2=dm(_channelToOutput4Old);
.LN76:
// line 120
	if le jump (pc,.P61L27);

.LN77:
// line 121
	dm(_channelToOutput4)=m6;

.P61L27:
.LN78:
// line 125
	r1=dm(_LEDval);
.LN79:
// line 126
	r0=dm(_channelToOutput4);
.LN80:
// line 125
	r2=r15-r2;
	r2=bclr r1 by r2;
.LN81:
// line 126
	r1=r15-r0;
	r2=bset r2 by r1;
.LN82:
// line 129
	r1=btgl r0 by 0;
	// -- stall --
	if not sz jump (pc,.P61L30) (db);
.LN83:
// line 126
	dm(_LEDval)=r2;
.LN84:
// line 134
	r2=btgl r0 by 1;

.LN85:
// line 131
	r2=dm(_leftOut1);
	dm(_leftOut4)=r2;
.LN86:
// line 130
	r2=dm(_rightOut1);
	dm(_rightOut4)=r2;
.LN87:
// line 134
	r2=btgl r0 by 1;

.P61L30:
.LN88:
// line 136
	r2=dm(_leftOut2);
.LN89:
// line 134
	if not sz jump (pc,.P61L33);

.LN90:
// line 136
	dm(_leftOut4)=r2;
.LN91:
// line 135
	r2=dm(_rightOut2);
	dm(_rightOut4)=r2;

.P61L33:
.LN92:
// line 139
	r2=3;
	comp(r0,r2);
.LN93:
// line 154
	r0=-1083808154;
.LN94:
// line 139
	if ne jump (pc,.P61L36);

.LN95:
// line 141
	r2=dm(_leftOut3);
	dm(_leftOut4)=r2;
.LN96:
// line 140
	r2=dm(_rightOut3);
	dm(_rightOut4)=r2;

.P61L36:
.LN97:
// line 154
	r2=dm(_rightOut1);
	comp(f2,f0);
.LN98:
	r1=1063675494;
.LN99:
	if ge jump (pc,.P61L42);

.LN100:
	i4=-1083808154;
	r2=-1083808154;
	dm(_rightOut1)=i4;

.P61L42:
.LN101:
	comp(f1,f2);
.LN102:
// line 155
	r2=dm(_leftOut1);
.LN103:
// line 154
	if ge jump (pc,.P61L45);

.LN104:
	i4=1063675494;
	dm(_rightOut1)=i4;

.P61L45:
.LN105:
// line 155
	comp(f2,f0);
.LN106:
	i4=-1083808154;
.LN107:
	if ge jump (pc,.P61L48);

	r2=-1083808154;
.LN108:
	dm(_leftOut1)=i4;

.P61L48:
.LN109:
	comp(f1,f2);
.LN110:
// line 156
	r2=dm(_rightOut2);
.LN111:
// line 155
	if ge jump (pc,.P61L51);

.LN112:
	i4=1063675494;
	dm(_leftOut1)=i4;

.P61L51:
.LN113:
// line 156
	comp(f2,f0);
.LN114:
	i4=-1083808154;
.LN115:
	if ge jump (pc,.P61L54);

	r2=-1083808154;
.LN116:
	dm(_rightOut2)=i4;

.P61L54:
.LN117:
	comp(f1,f2);
.LN118:
// line 157
	r2=dm(_leftOut2);
.LN119:
// line 156
	if ge jump (pc,.P61L57);

.LN120:
	i4=1063675494;
	dm(_rightOut2)=i4;

.P61L57:
.LN121:
// line 157
	comp(f2,f0);
.LN122:
	i4=-1083808154;
.LN123:
	if ge jump (pc,.P61L60);

	r2=-1083808154;
.LN124:
	dm(_leftOut2)=i4;

.P61L60:
.LN125:
	comp(f1,f2);
.LN126:
// line 158
	r2=dm(_rightOut3);
.LN127:
// line 157
	if ge jump (pc,.P61L63);

.LN128:
	i4=1063675494;
	dm(_leftOut2)=i4;

.P61L63:
.LN129:
// line 158
	comp(f2,f0);
.LN130:
	i4=-1083808154;
.LN131:
	if ge jump (pc,.P61L66);

	r2=-1083808154;
.LN132:
	dm(_rightOut3)=i4;

.P61L66:
.LN133:
	comp(f1,f2);
.LN134:
// line 159
	r2=dm(_leftOut3);
.LN135:
// line 158
	if ge jump (pc,.P61L69);

.LN136:
	i4=1063675494;
	dm(_rightOut3)=i4;

.P61L69:
.LN137:
// line 159
	comp(f2,f0);
.LN138:
	i4=-1083808154;
.LN139:
	if ge jump (pc,.P61L72);

	r2=-1083808154;
.LN140:
	dm(_leftOut3)=i4;

.P61L72:
.LN141:
	comp(f1,f2);
.LN142:
// line 160
	r2=dm(_rightOut4);
.LN143:
// line 159
	if ge jump (pc,.P61L75);

.LN144:
	i4=1063675494;
	dm(_leftOut3)=i4;

.P61L75:
.LN145:
// line 160
	comp(f2,f0);
.LN146:
	i4=-1083808154;
.LN147:
	if ge jump (pc,.P61L78);

	r2=-1083808154;
.LN148:
	dm(_rightOut4)=i4;

.P61L78:
.LN149:
	comp(f1,f2);
.LN150:
// line 161
	r2=dm(_leftOut4);
.LN151:
// line 160
	if ge jump (pc,.P61L81);

.LN152:
	i4=1063675494;
	dm(_rightOut4)=i4;

.P61L81:
.LN153:
// line 161
	comp(f2,f0);
.LN154:
	i4=-1083808154;
.LN155:
	if ge jump (pc,.P61L84);

	r2=-1083808154;
.LN156:
	dm(_leftOut4)=i4;

.P61L84:
.LN157:
	comp(f1,f2);
.LN158:
	i4=1063675494;
.LN159:
	if ge jump (pc,.P61L87);

.LN160:
	dm(_leftOut4)=i4;

.P61L87:
.LN161:
// line 163
	cjump _clrDAIproc (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN162:
// line 169
	i12=dm(m7,i6);
.LN163:
// line 168
	dm(_isProcessing)=m5;
.LN164:
// line 169
	m3=dm(-3,i6);
	i5=dm(-2,i6);
	r7=dm(-6,i6);
	r14=dm(-5,i6);
	jump (m14,i12) (db);
	r15=dm(-4,i6);
	rframe;
.LN._process.end:
._process.end:
	.global _process;
	.type _process,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_LMS";
	.file_attr FuncName="_flagTest";
	.file_attr FuncName="_handle_LED";
	.file_attr FuncName="_disable_interrupts";
	.file_attr FuncName="_enable_interrupts";
	.file_attr FuncName="_process";
	.file_attr Encoding="NW";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _setDAIproc;
	.type _setDAIproc,STT_FUNC;
	.extern _conv_asm_var;
	.type _conv_asm_var,STT_FUNC;
	.extern _readDAIpin;
	.type _readDAIpin,STT_FUNC;
	.extern _clrDAIproc;
	.type _clrDAIproc,STT_FUNC;

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\processLMS.sbn", 0, 253;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x9D,0x0C,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x4C,0x4D,0x53,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\processLMS.sbn", 253, 2394;
	.var = .LN_flagTest;
	.var = .LN._flagTest.end;
	.byte =
		0x01,0xE0,0x01,0x00,0x00,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._flagTest.end;
	.byte =
		0x00,0x00,0x0E,0xDB,0x09,0x00,0x00,0x68,0x61,0x6E,0x64,0x6C,
		0x65,0x5F,0x4C,0x45,0x44,0x00,0x01;
	.var = .LN_handle_LED;
	.var = .LN._handle_LED.end;
	.byte =
		0x01,0x01,0x00,0x0F,0x6C,0x65,0x64,0x5F,0x76,0x61,0x6C,0x75,
		0x65,0x00,0xE0,0x01,0x00,0x00,0x02,0x86,0x7E,0x00,0x0D,0x00,
		0x00,0x00,0x00;
	.var = .LN2;
	.var = .LN._handle_LED.end;
	.byte =
		0x00,0x00,0x0E,0x03,0x0A,0x00,0x00,0x70,0x72,0x6F,0x63,0x65,
		0x73,0x73,0x00,0x01;
	.var = .LN_process;
	.var = .LN._process.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN14;
	.var = .LN._process.end;
	.byte =
		0x00,0x00,0x10,0x69,0x73,0x50,0x72,0x6F,0x63,0x65,0x73,0x73,
		0x69,0x6E,0x67,0x00,0x01,0xE0,0x01,0x00,0x00,0x05,0x03;
	.var = _isProcessing;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x49,
		0x6E,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _rightIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x49,0x6E,
		0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _leftIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x31,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut1;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x31,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut1;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x32,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut2;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x32,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut2;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x33,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut3;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x33,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut3;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x34,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut4;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x34,0x00,0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut4;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x4C,0x45,0x44,0x76,0x61,0x6C,
		0x00,0x01,0xE0,0x01,0x00,0x00,0x05,0x03;
	.var = _LEDval;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x63,0x6F,0x65,0x66,0x77,0x00,
		0x01,0x91,0x0C,0x00,0x00,0x05,0x03;
	.var = _coefw;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x78,0x00,0x01,0x83,0x0C,0x00,
		0x00,0x05,0x03;
	.var = _x;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x69,0x00,0x01,0xE0,0x01,0x00,
		0x00,0x05,0x03;
	.var = _i;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6A,0x00,0x01,0xE0,0x01,0x00,
		0x00,0x05,0x03;
	.var = _j;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x66,0x61,0x59,0x44,0x65,0x6C,
		0x61,0x79,0x42,0x75,0x66,0x66,0x00,0x01,0x75,0x0C,0x00,0x00,
		0x05,0x03;
	.var = _faYDelayBuff;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x69,0x59,0x44,0x65,0x6C,0x61,
		0x79,0x50,0x74,0x72,0x00,0x01,0xE0,0x01,0x00,0x00,0x05,0x03;
	.var = _iYDelayPtr;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6D,0x75,0x00,0x01,0x04,0x03,
		0x00,0x00,0x05,0x03;
	.var = _mu;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x79,0x00,0x01,0x04,0x03,0x00,
		0x00,0x05,0x03;
	.var = _y;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x72,0x65,0x66,0x00,0x01,0x04,
		0x03,0x00,0x00,0x05,0x03;
	.var = _ref;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x79,0x5F,0x65,0x73,0x74,0x00,
		0x01,0x04,0x03,0x00,0x00,0x05,0x03;
	.var = _y_est;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x65,0x00,0x01,0x04,0x03,0x00,
		0x00,0x05,0x03;
	.var = _e;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x63,0x68,0x61,0x6E,0x6E,0x65,
		0x6C,0x54,0x6F,0x4F,0x75,0x74,0x70,0x75,0x74,0x34,0x00,0x01,
		0xE0,0x01,0x00,0x00,0x05,0x03;
	.var = _channelToOutput4;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x63,0x68,0x61,0x6E,0x6E,0x65,
		0x6C,0x54,0x6F,0x4F,0x75,0x74,0x70,0x75,0x74,0x34,0x4F,0x6C,
		0x64,0x00,0x01,0xE0,0x01,0x00,0x00,0x05,0x03;
	.var = _channelToOutput4Old;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x11,0x83,0x0C,0x00,0x00,0x04,0x03,
		0x00,0x00,0x12,0x50,0x00,0x4F,0x00,0x11,0x91,0x0C,0x00,0x00,
		0x04,0x03,0x00,0x00,0x12,0x65,0x00,0x64,0x00,0x11,0x9F,0x0C,
		0x00,0x00,0x04,0x03,0x00,0x00,0x12,0x64,0x00,0x63,0x00,0x00,
		0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\processLMS.sbn", 2647, 645;
	.var = .LN_flagTest;
	.byte =
		0x04,0x01,0x05,0x17,0xC4,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x05,0x01,0x0F,0x00,0x05,0x02;
	.var = .LN._flagTest.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_handle_LED;
	.byte =
		0x04,0x01,0x05,0x1F,0xB5,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x05,0x1F,0x03,0x7C,0x01,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN8;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN9;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN10;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN11;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.var = .LN12;
	.byte =
		0x05,0x05,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN13;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN._handle_LED.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_process;
	.byte =
		0x04,0x01,0x05,0x13,0x2F,0x00,0x05,0x02;
	.var = .LN14;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN15;
	.byte =
		0x05,0x0F,0x0B,0x00,0x05,0x02;
	.var = .LN16;
	.byte =
		0x05,0x05,0x0F,0x00,0x05,0x02;
	.var = .LN17;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN18;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN19;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.var = .LN20;
	.byte =
		0x05,0x05,0x03,0x78,0x01,0x00,0x05,0x02;
	.var = .LN21;
	.byte =
		0x0D,0x00,0x05,0x02;
	.var = .LN22;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN23;
	.byte =
		0x0D,0x00,0x05,0x02;
	.var = .LN24;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.var = .LN25;
	.byte =
		0x13,0x00,0x05,0x02;
	.var = .LN26;
	.byte =
		0x05,0x02,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN27;
	.byte =
		0x05,0x05,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN28;
	.byte =
		0x05,0x06,0x10,0x00,0x05,0x02;
	.var = .LN29;
	.byte =
		0x05,0x16,0x0C,0x00,0x05,0x02;
	.var = .LN30;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.var = .LN31;
	.byte =
		0x05,0x16,0x03,0x7E,0x01,0x00,0x05,0x02;
	.var = .LN32;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.var = .LN33;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.var = .LN34;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.var = .LN35;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.var = .LN36;
	.byte =
		0x0F,0x00,0x05,0x02;
	.var = .LN37;
	.byte =
		0x05,0x02,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN38;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.var = .LN39;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.var = .LN40;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN41;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN42;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN43;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN44;
	.byte =
		0x05,0x05,0x03,0x77,0x01,0x00,0x05,0x02;
	.var = .LN45;
	.byte =
		0x05,0x02,0x12,0x00,0x05,0x02;
	.var = .LN46;
	.byte =
		0x03,0x78,0x01,0x00,0x05,0x02;
	.var = .LN47;
	.byte =
		0x05,0x05,0x14,0x00,0x05,0x02;
	.var = .LN48;
	.byte =
		0x05,0x02,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN49;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN50;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.var = .LN51;
	.byte =
		0x05,0x06,0x0B,0x00,0x05,0x02;
	.var = .LN52;
	.byte =
		0x05,0x05,0x0C,0x00,0x05,0x02;
	.var = .LN53;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN54;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN55;
	.byte =
		0x05,0x11,0x17,0x00,0x05,0x02;
	.var = .LN56;
	.byte =
		0x05,0x09,0x03,0x74,0x01,0x00,0x05,0x02;
	.var = .LN57;
	.byte =
		0x05,0x11,0x15,0x00,0x05,0x02;
	.var = .LN58;
	.byte =
		0x05,0x05,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN59;
	.byte =
		0x05,0x11,0x0C,0x00,0x05,0x02;
	.var = .LN60;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN61;
	.byte =
		0x05,0x11,0x01,0x00,0x05,0x02;
	.var = .LN62;
	.byte =
		0x0E,0x00,0x05,0x02;
	.var = .LN63;
	.byte =
		0x05,0x06,0x03,0x7C,0x01,0x00,0x05,0x02;
	.var = .LN64;
	.byte =
		0x05,0x11,0x0D,0x00,0x05,0x02;
	.var = .LN65;
	.byte =
		0x05,0x13,0x0E,0x00,0x05,0x02;
	.var = .LN66;
	.byte =
		0x05,0x05,0x03,0x7B,0x01,0x00,0x05,0x02;
	.var = .LN67;
	.byte =
		0x05,0x06,0x0A,0x00,0x05,0x02;
	.var = .LN68;
	.byte =
		0x05,0x13,0x0D,0x00,0x05,0x02;
	.var = .LN69;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN70;
	.byte =
		0x05,0x13,0x0E,0x00,0x05,0x02;
	.var = .LN71;
	.byte =
		0x05,0x05,0x03,0x7B,0x01,0x00,0x05,0x02;
	.var = .LN72;
	.byte =
		0x05,0x06,0x0A,0x00,0x05,0x02;
	.var = .LN73;
	.byte =
		0x05,0x13,0x0D,0x00,0x05,0x02;
	.var = .LN74;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN75;
	.byte =
		0x0E,0x00,0x05,0x02;
	.var = .LN76;
	.byte =
		0x03,0x7B,0x01,0x00,0x05,0x02;
	.var = .LN77;
	.byte =
		0x05,0x06,0x0A,0x00,0x05,0x02;
	.var = .LN78;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.var = .LN79;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN80;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN81;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN82;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN83;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN84;
	.byte =
		0x11,0x00,0x05,0x02;
	.var = .LN85;
	.byte =
		0x05,0x0A,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN86;
	.byte =
		0x05,0x09,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN87;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.var = .LN88;
	.byte =
		0x05,0x0A,0x0B,0x00,0x05,0x02;
	.var = .LN89;
	.byte =
		0x05,0x05,0x03,0x7E,0x01,0x00,0x05,0x02;
	.var = .LN90;
	.byte =
		0x05,0x0A,0x0B,0x00,0x05,0x02;
	.var = .LN91;
	.byte =
		0x05,0x09,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN92;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.var = .LN93;
	.byte =
		0x05,0x02,0x18,0x00,0x05,0x02;
	.var = .LN94;
	.byte =
		0x05,0x05,0x03,0x71,0x01,0x00,0x05,0x02;
	.var = .LN95;
	.byte =
		0x05,0x0A,0x0B,0x00,0x05,0x02;
	.var = .LN96;
	.byte =
		0x05,0x09,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN97;
	.byte =
		0x05,0x02,0x17,0x00,0x05,0x02;
	.var = .LN98;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN99;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN100;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN101;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN102;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN103;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN104;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN105;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN106;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN107;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN108;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN109;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN110;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN111;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN112;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN113;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN114;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN115;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN116;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN117;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN118;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN119;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN120;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN121;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN122;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN123;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN124;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN125;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN126;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN127;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN128;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN129;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN130;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN131;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN132;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN133;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN134;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN135;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN136;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN137;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN138;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN139;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN140;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN141;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN142;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN143;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN144;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN145;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN146;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN147;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN148;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN149;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN150;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN151;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN152;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN153;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN154;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN155;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN156;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN157;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN158;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN159;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN160;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN161;
	.byte =
		0x05,0x0F,0x0B,0x00,0x05,0x02;
	.var = .LN162;
	.byte =
		0x05,0x01,0x0F,0x00,0x05,0x02;
	.var = .LN163;
	.byte =
		0x05,0x05,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN164;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._process.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0xCF,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.inc/binary ".\src\processLMS.sbn", 3292, 201;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x28,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x01,0x00;
	.var = .LN_flagTest;
	.var = .LN._flagTest.end-.LN_flagTest;
	.var = .LN_handle_LED;
	.var = .LN._handle_LED.end-.LN_handle_LED;
	.var = .LN_process;
	.var = .LN._process.end-.LN_process;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DM/DOUBLE32 seg_dmda;

	.align 1;
	.global _LEDval;
	.type _LEDval,STT_OBJECT;
	.var _LEDval[] =
		 0x00000000;

	.section/PM/DOUBLE32 seg_pmda;

	.align 4;
	.global _coefw;
	.type _coefw,STT_OBJECT;
	.var _coefw[100];

	.section/DM/DOUBLE32 seg_dmda;

	.align 1;
	.global _i;
	.type _i,STT_OBJECT;
	.var _i[] =
		 0x00000000;
	.align 1;
	.global _j;
	.type _j,STT_OBJECT;
	.var _j[] =
		 0x00000000;
	.align 1;
	.global _iYDelayPtr;
	.type _iYDelayPtr,STT_OBJECT;
	.var _iYDelayPtr[] =
		 0x00000000;
	.align 1;
	.global _mu;
	.type _mu,STT_OBJECT;
	.var _mu[] =
		 0x3AC49BA6;
	.align 1;
	.global _channelToOutput4;
	.type _channelToOutput4,STT_OBJECT;
	.var _channelToOutput4[] =
		 0x00000004;
	.align 1;
	.global _channelToOutput4Old;
	.type _channelToOutput4Old,STT_OBJECT;
	.var _channelToOutput4Old[] =
		 0x00000004;

	.align 4;
	.var _x[101];
	.weak _x;
	.align 2;
	.var _faYDelayBuff[80];
	.weak _faYDelayBuff;
	.align 1;
	.var _y[1];
	.weak _y;
	.align 1;
	.var _ref[1];
	.weak _ref;
	.align 1;
	.var _y_est[1];
	.weak _y_est;
	.align 1;
	.var _e[1];
	.weak _e;

	.extern _isProcessing;
	.type _isProcessing,STT_OBJECT;
	.extern _rightIn;
	.type _rightIn,STT_OBJECT;
	.extern _leftIn;
	.type _leftIn,STT_OBJECT;
	.extern _rightOut1;
	.type _rightOut1,STT_OBJECT;
	.extern _leftOut1;
	.type _leftOut1,STT_OBJECT;
	.extern _rightOut2;
	.type _rightOut2,STT_OBJECT;
	.extern _leftOut2;
	.type _leftOut2,STT_OBJECT;
	.extern _rightOut3;
	.type _rightOut3,STT_OBJECT;
	.extern _leftOut3;
	.type _leftOut3,STT_OBJECT;
	.extern _rightOut4;
	.type _rightOut4,STT_OBJECT;
	.extern _leftOut4;
	.type _leftOut4,STT_OBJECT;
