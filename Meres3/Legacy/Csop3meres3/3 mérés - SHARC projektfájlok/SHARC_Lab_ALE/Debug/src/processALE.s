	.file "..\src\processALE.c";
//  Compilation time: Mon Oct 26 14:59:20 2026
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_ALE -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -ED -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\processALE.d -o src\processALE.doj
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
// line "..\src\processALE.c":188
	// ASM STATEMENT
	 r2 = flags;
		// END ASM STATEMENT

.LN1:
// line 194
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
// line "..\src\processALE.c":174
	i4=i6;
// Diagnostic: Optimizer now optimizing for speed
.LN3:
// line 170
	modify(i7,-2);
	dm(-2,i6)=r4;
.LN4:
// line 172
	dm(6144)=m5;
.LN5:
// line 174
	modify(i4,-2);
	dm(6168)=i4;
.LN6:
// line 175
	dm(6169)=m6;
.LN7:
// line 176
	dm(6170)=m6;
.LN8:
// line 177
	dm(6161)=m6;
.LN9:
// line 178
	dm(6162)=m6;
.LN10:
// line 179
	i4=4194304;
.LN11:
// line 182
	i12=dm(m7,i6);
.LN12:
// line 179
	dm(6160)=i4;
.LN13:
// line 181
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
//  Frame size            = 8 words
//  Scratch registers used: {r0-r2,r4,r8,r12,i4,i12-i13,b4,m4,acc,mcc,scc,lcntr}
//  Call preserved registers used: {r7,r14-r15,i5,l4}
//  Registers that could be clobbered by function calls: {r0-r1,r4,r8,r12,s0-s15,i4,i6-i7,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\processALE.c":42
	modify(i7,-4);
// Diagnostic: Optimizer now optimizing for speed
	r2=i5;
	dm(-3,i6)=r15;
	dm(-5,i6)=r7;
	dm(-4,i6)=r14;
	r14=r14-r14, dm(-2,i6)=r2;
.LN14:
// line 44
	dm(_isProcessing)=m6;
	// -- stall --
.LN15:
// line 46
	cjump _setDAIproc (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN16:
// line 54
	r2=dm(_i);
	r15=_x;
.LN17:
// line 50
	r1=dm(_xDCfiltParam);
	r0=1065353216;
.LN18:
// line 54
	r8=r15+r2;
.LN19:
// line 48
	r12=dm(_leftIn);
.LN20:
// line 50
	r4=dm(_xDCfilt);
	f0=f0-f1, i4=r8;
	f1=f1*f4;
	f0=f12*f0;
	f1=f1+f0;
	r2=leftz r2;
.LN21:
// line 51
	f0=f12-f1;
.LN22:
// line 54
	r2=dm(_delay);
.LN23:
// line 53
	dm(_kd)=m5;
.LN24:
// line 50
	dm(_xDCfilt)=r1;
.LN25:
// line 51
	dm(_y)=r0;
.LN26:
// line 59
	if not sv jump (pc,.P63L3) (db);
.LN27:
// line 55
	dm(_delay)=r0;
.LN28:
// line 54
	dm(i4,m5)=r2;

.LN29:
// line 60
	r2=dm(_x);
	dm(_x+100)=r2;

.P63L3:
.LN30:
// line 63
	r2=100;
	dm(i7,m7)=r2;
	dm(i7,m7)=101;
	r12=_x;
	r4=_coefw;
.LN31:
// line 65
	i5=0;
	// -- stall --
.LN32:
// line 63
	cjump _conv_asm_var (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

	modify(i7,2);
	b4=_x;
.LN33:
// line 67
	dm(_j)=m5;
.LN34:
// line 68
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
.LN35:
// line 65
	dm(_y_est)=i5;
.LN36:
// line 68
	lcntr=98, do (pc,.P63L124_end) until lce;

.P63L124:
//-------------------------------------------------------------------
//   Loop at "..\src\processALE.c" line 67 col 2
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
.P63L124_end:
	f8=f2*f4, f14=f8+f14, r4=dm(i4,m6), r2=pm(i12,m14);
	// end loop .P63L124;
//-------------------------------------------------------------------
//   End Kernel for Loop L124
//-------------------------------------------------------------------

.P63L125:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	l4=0;
	b4=_x;
	f1=f2*f4, f2=f8+f14, i4=m4;
	l4=100;
	f2=f1+f2;
	dm(_y_est)=r2;
.LN37:
// line 74
	r0=dm(i4,m6);
.LN38:
// line 71
	r2=dm(_y);
	r1=dm(_y_est);
	f2=f2-f1, r12=dm(i4,m6);
	dm(_e)=r2;
.LN39:
// line 74
	r1=dm(_mu);
	f4=f1*f12;
	f0=f1*f0;
	lcntr=49, do (pc,.P63L120_end) until lce;

.P63L120:
//-------------------------------------------------------------------
//   Loop at "..\src\processALE.c" line 73 col 2
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
.P63L120_end:
	f4=f1*f8, pm(i13,m14)=r12;
	// end loop .P63L120;
//-------------------------------------------------------------------
//   End Kernel for Loop L120
//-------------------------------------------------------------------

.P63L121:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	f8=f2*f0, r12=pm(i13,m13);
	f0=f2*f4, f1=f8+f12, r2=pm(m14,i13);
	f2=f0+f2, pm(i13,m14)=r1;
	pm(i13,m14)=r2;
	l4=0;
.LN40:
// line 80
	r2=dm(_y_est);
	dm(_leftOut2)=r2;
.LN41:
// line 81
	dm(_rightOut2)=r2;
.LN42:
// line 83
	r2=dm(_e);
	dm(_leftOut3)=r2;
.LN43:
// line 84
	dm(_rightOut3)=r2;
.LN44:
// line 86
	r2=dm(_i);
	i4=100;
	dm(_j)=i4;
	r2=pass r2, i4=r15;
	m4=r2;
.LN45:
// line 77
	r1=dm(_y);
	dm(_leftOut1)=r1;
.LN46:
// line 86
	r0=dm(m4,i4);
.LN47:
// line 78
	dm(_rightOut1)=r1;
.LN48:
// line 89
	if gt jump (pc,.P63L11) (db);
.LN49:
// line 86
	dm(_leftOut4)=r0;
.LN50:
// line 87
	dm(_rightOut4)=r0;

	jump (pc,.P63L12) (db);
.LN51:
// line 90
	i4=99;
	dm(_i)=i4;

.P63L11:
.LN52:
// line 92
	r2=r2-1;
	dm(_i)=r2;

.P63L12:
.LN53:
// line 95
	r2=dm(_k);
	r2=pass r2;
.LN54:
// line 109
	r4=4;
.LN55:
// line 95
	if gt jump (pc,.P63L14);

	jump (pc,.P63L15) (db);
.LN56:
// line 96
	dm(_k)=m5;
.LN57:
// line 106
	r2=dm(_channelToOutput4);

.P63L14:
.LN58:
// line 98
	r2=r2-1;
	dm(_k)=r2;
.LN59:
// line 106
	r2=dm(_channelToOutput4);

.P63L15:
	dm(_channelToOutput4Old)=r2;
.LN60:
// line 110
	i4=4;
	// -- stall --
.LN61:
// line 109
	cjump _flagTest (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

	r2=leftz r0;
.LN62:
	if sv jump (pc,.P63L18) (db);
.LN63:
	r15=4;
.LN64:
// line 114
	r4=16;

.LN65:
// line 110
	dm(_channelToOutput4)=i4;
.LN66:
// line 114
	r4=16;

.P63L18:
	cjump _flagTest (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

	r2=leftz r0;
.LN67:
// line 119
	r4=262144;
.LN68:
// line 114
	if sv jump (pc,.P63L21);

.LN69:
// line 115
	i4=3;
	dm(_channelToOutput4)=i4;

.P63L21:
	// -- stall --
.LN70:
// line 119
	cjump _readDAIpin (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN71:
	r2=pass r0;
.LN72:
// line 124
	r4=524288;
.LN73:
// line 119
	if le jump (pc,.P63L24);

.LN74:
// line 120
	i4=2;
	dm(_channelToOutput4)=i4;

.P63L24:
	// -- stall --
.LN75:
// line 124
	cjump _readDAIpin (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN76:
	r2=pass r0;
.LN77:
// line 129
	r2=dm(_channelToOutput4Old);
.LN78:
// line 124
	if le jump (pc,.P63L27);

.LN79:
// line 125
	dm(_channelToOutput4)=m6;

.P63L27:
.LN80:
// line 129
	r1=dm(_LEDval);
.LN81:
// line 130
	r0=dm(_channelToOutput4);
.LN82:
// line 129
	r2=r15-r2;
	r2=bclr r1 by r2;
.LN83:
// line 130
	r1=r15-r0;
	r2=bset r2 by r1;
.LN84:
// line 133
	r1=btgl r0 by 0;
	// -- stall --
	if not sz jump (pc,.P63L30) (db);
.LN85:
// line 130
	dm(_LEDval)=r2;
.LN86:
// line 138
	r2=btgl r0 by 1;

.LN87:
// line 135
	r2=dm(_leftOut1);
	dm(_leftOut4)=r2;
.LN88:
// line 134
	r2=dm(_rightOut1);
	dm(_rightOut4)=r2;
.LN89:
// line 138
	r2=btgl r0 by 1;

.P63L30:
.LN90:
// line 140
	r2=dm(_leftOut2);
.LN91:
// line 138
	if not sz jump (pc,.P63L33);

.LN92:
// line 140
	dm(_leftOut4)=r2;
.LN93:
// line 139
	r2=dm(_rightOut2);
	dm(_rightOut4)=r2;

.P63L33:
.LN94:
// line 143
	r2=3;
	comp(r0,r2);
.LN95:
// line 152
	r0=-1083808154;
.LN96:
// line 143
	if ne jump (pc,.P63L36);

.LN97:
// line 145
	r2=dm(_leftOut3);
	dm(_leftOut4)=r2;
.LN98:
// line 144
	r2=dm(_rightOut3);
	dm(_rightOut4)=r2;

.P63L36:
.LN99:
// line 152
	r2=dm(_rightOut1);
	comp(f2,f0);
.LN100:
	r1=1063675494;
.LN101:
	if ge jump (pc,.P63L39);

.LN102:
	i4=-1083808154;
	r2=-1083808154;
	dm(_rightOut1)=i4;

.P63L39:
.LN103:
	comp(f1,f2);
.LN104:
// line 153
	r2=dm(_leftOut1);
.LN105:
// line 152
	if ge jump (pc,.P63L42);

.LN106:
	i4=1063675494;
	dm(_rightOut1)=i4;

.P63L42:
.LN107:
// line 153
	comp(f2,f0);
.LN108:
	i4=-1083808154;
.LN109:
	if ge jump (pc,.P63L45);

	r2=-1083808154;
.LN110:
	dm(_leftOut1)=i4;

.P63L45:
.LN111:
	comp(f1,f2);
.LN112:
// line 154
	r2=dm(_rightOut2);
.LN113:
// line 153
	if ge jump (pc,.P63L48);

.LN114:
	i4=1063675494;
	dm(_leftOut1)=i4;

.P63L48:
.LN115:
// line 154
	comp(f2,f0);
.LN116:
	i4=-1083808154;
.LN117:
	if ge jump (pc,.P63L51);

	r2=-1083808154;
.LN118:
	dm(_rightOut2)=i4;

.P63L51:
.LN119:
	comp(f1,f2);
.LN120:
// line 155
	r2=dm(_leftOut2);
.LN121:
// line 154
	if ge jump (pc,.P63L54);

.LN122:
	i4=1063675494;
	dm(_rightOut2)=i4;

.P63L54:
.LN123:
// line 155
	comp(f2,f0);
.LN124:
	i4=-1083808154;
.LN125:
	if ge jump (pc,.P63L57);

	r2=-1083808154;
.LN126:
	dm(_leftOut2)=i4;

.P63L57:
.LN127:
	comp(f1,f2);
.LN128:
// line 156
	r2=dm(_rightOut3);
.LN129:
// line 155
	if ge jump (pc,.P63L60);

.LN130:
	i4=1063675494;
	dm(_leftOut2)=i4;

.P63L60:
.LN131:
// line 156
	comp(f2,f0);
.LN132:
	i4=-1083808154;
.LN133:
	if ge jump (pc,.P63L63);

	r2=-1083808154;
.LN134:
	dm(_rightOut3)=i4;

.P63L63:
.LN135:
	comp(f1,f2);
.LN136:
// line 157
	r2=dm(_leftOut3);
.LN137:
// line 156
	if ge jump (pc,.P63L66);

.LN138:
	i4=1063675494;
	dm(_rightOut3)=i4;

.P63L66:
.LN139:
// line 157
	comp(f2,f0);
.LN140:
	i4=-1083808154;
.LN141:
	if ge jump (pc,.P63L69);

	r2=-1083808154;
.LN142:
	dm(_leftOut3)=i4;

.P63L69:
.LN143:
	comp(f1,f2);
.LN144:
// line 158
	r2=dm(_rightOut4);
.LN145:
// line 157
	if ge jump (pc,.P63L72);

.LN146:
	i4=1063675494;
	dm(_leftOut3)=i4;

.P63L72:
.LN147:
// line 158
	comp(f2,f0);
.LN148:
	i4=-1083808154;
.LN149:
	if ge jump (pc,.P63L75);

	r2=-1083808154;
.LN150:
	dm(_rightOut4)=i4;

.P63L75:
.LN151:
	comp(f1,f2);
.LN152:
// line 159
	r2=dm(_leftOut4);
.LN153:
// line 158
	if ge jump (pc,.P63L78);

.LN154:
	i4=1063675494;
	dm(_rightOut4)=i4;

.P63L78:
.LN155:
// line 159
	comp(f2,f0);
.LN156:
	i4=-1083808154;
.LN157:
	if ge jump (pc,.P63L81);

	r2=-1083808154;
.LN158:
	dm(_leftOut4)=i4;

.P63L81:
.LN159:
	comp(f1,f2);
.LN160:
	i4=1063675494;
.LN161:
	if ge jump (pc,.P63L84);

.LN162:
	dm(_leftOut4)=i4;

.P63L84:
.LN163:
// line 161
	cjump _clrDAIproc (db);
	dm(i7,m7)=r2;
	dm(i7,m7)=pc;

.LN164:
// line 166
	i12=dm(m7,i6);
.LN165:
// line 165
	dm(_isProcessing)=m5;
.LN166:
// line 166
	i5=dm(-2,i6);
	r7=dm(-5,i6);
	r14=dm(-4,i6);
	jump (m14,i12) (db);
	r15=dm(-3,i6);
	rframe;
.LN._process.end:
._process.end:
	.global _process;
	.type _process,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_ALE";
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
	.inc/binary ".\src\processALE.sbn", 0, 253;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0xD4,0x0C,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x41,0x4C,0x45,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\processALE.sbn", 253, 2415;
	.var = .LN_flagTest;
	.var = .LN._flagTest.end;
	.byte =
		0x01,0xF5,0x01,0x00,0x00,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._flagTest.end;
	.byte =
		0x00,0x00,0x0E,0xF0,0x09,0x00,0x00,0x68,0x61,0x6E,0x64,0x6C,
		0x65,0x5F,0x4C,0x45,0x44,0x00,0x01;
	.var = .LN_handle_LED;
	.var = .LN._handle_LED.end;
	.byte =
		0x01,0x01,0x00,0x0F,0x6C,0x65,0x64,0x5F,0x76,0x61,0x6C,0x75,
		0x65,0x00,0xF5,0x01,0x00,0x00,0x02,0x86,0x7E,0x00,0x0D,0x00,
		0x00,0x00,0x00;
	.var = .LN2;
	.var = .LN._handle_LED.end;
	.byte =
		0x00,0x00,0x0E,0x18,0x0A,0x00,0x00,0x70,0x72,0x6F,0x63,0x65,
		0x73,0x73,0x00,0x01;
	.var = .LN_process;
	.var = .LN._process.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN14;
	.var = .LN._process.end;
	.byte =
		0x00,0x00,0x10,0x69,0x73,0x50,0x72,0x6F,0x63,0x65,0x73,0x73,
		0x69,0x6E,0x67,0x00,0x01,0xF5,0x01,0x00,0x00,0x05,0x03;
	.var = _isProcessing;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x49,0x6E,
		0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _leftIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x31,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut1;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x31,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut1;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x32,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut2;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x32,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut2;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x33,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut3;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x33,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut3;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x72,0x69,0x67,0x68,0x74,0x4F,
		0x75,0x74,0x34,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _rightOut4;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x6C,0x65,0x66,0x74,0x4F,0x75,
		0x74,0x34,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _leftOut4;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x4C,0x45,0x44,0x76,0x61,0x6C,
		0x00,0x01,0xF5,0x01,0x00,0x00,0x05,0x03;
	.var = _LEDval;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x63,0x6F,0x65,0x66,0x77,0x00,
		0x01,0xC8,0x0C,0x00,0x00,0x05,0x03;
	.var = _coefw;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x78,0x00,0x01,0xBA,0x0C,0x00,
		0x00,0x05,0x03;
	.var = _x;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x64,0x65,0x6C,0x61,0x79,0x00,
		0x01,0xAC,0x0C,0x00,0x00,0x05,0x03;
	.var = _delay;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x69,0x00,0x01,0xF5,0x01,0x00,
		0x00,0x05,0x03;
	.var = _i;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6A,0x00,0x01,0xF5,0x01,0x00,
		0x00,0x05,0x03;
	.var = _j;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6B,0x00,0x01,0xF5,0x01,0x00,
		0x00,0x05,0x03;
	.var = _k;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6B,0x64,0x00,0x01,0xF5,0x01,
		0x00,0x00,0x05,0x03;
	.var = _kd;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6D,0x75,0x00,0x01,0x19,0x03,
		0x00,0x00,0x05,0x03;
	.var = _mu;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x78,0x44,0x43,0x66,0x69,0x6C,
		0x74,0x00,0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _xDCfilt;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x78,0x44,0x43,0x66,0x69,0x6C,
		0x74,0x50,0x61,0x72,0x61,0x6D,0x00,0x01,0x19,0x03,0x00,0x00,
		0x05,0x03;
	.var = _xDCfiltParam;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x79,0x00,0x01,0x19,0x03,0x00,
		0x00,0x05,0x03;
	.var = _y;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x72,0x65,0x66,0x00,0x01,0x19,
		0x03,0x00,0x00,0x05,0x03;
	.var = _ref;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x79,0x5F,0x65,0x73,0x74,0x00,
		0x01,0x19,0x03,0x00,0x00,0x05,0x03;
	.var = _y_est;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x65,0x00,0x01,0x19,0x03,0x00,
		0x00,0x05,0x03;
	.var = _e;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x63,0x68,0x61,0x6E,0x6E,0x65,
		0x6C,0x54,0x6F,0x4F,0x75,0x74,0x70,0x75,0x74,0x34,0x00,0x01,
		0xF5,0x01,0x00,0x00,0x05,0x03;
	.var = _channelToOutput4;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x63,0x68,0x61,0x6E,0x6E,0x65,
		0x6C,0x54,0x6F,0x4F,0x75,0x74,0x70,0x75,0x74,0x34,0x4F,0x6C,
		0x64,0x00,0x01,0xF5,0x01,0x00,0x00,0x05,0x03;
	.var = _channelToOutput4Old;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x11,0xBA,0x0C,0x00,0x00,0x19,0x03,
		0x00,0x00,0x12,0x01,0x00,0x00,0x00,0x11,0xC8,0x0C,0x00,0x00,
		0x19,0x03,0x00,0x00,0x12,0x65,0x00,0x64,0x00,0x11,0xD6,0x0C,
		0x00,0x00,0x19,0x03,0x00,0x00,0x12,0x64,0x00,0x63,0x00,0x00,
		0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\processALE.sbn", 2668, 645;
	.var = .LN_flagTest;
	.byte =
		0x04,0x01,0x05,0x17,0xC1,0x00,0x05,0x02;
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
		0x04,0x01,0x05,0x1F,0xB2,0x00,0x05,0x02;
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
		0x04,0x01,0x05,0x13,0x32,0x00,0x05,0x02;
	.var = .LN14;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN15;
	.byte =
		0x05,0x0F,0x0B,0x00,0x05,0x02;
	.var = .LN16;
	.byte =
		0x05,0x02,0x11,0x00,0x05,0x02;
	.var = .LN17;
	.byte =
		0x05,0x05,0x03,0x7C,0x01,0x00,0x05,0x02;
	.var = .LN18;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.var = .LN19;
	.byte =
		0x05,0x05,0x03,0x7A,0x01,0x00,0x05,0x02;
	.var = .LN20;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN21;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN22;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.var = .LN23;
	.byte =
		0x05,0x05,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN24;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN26;
	.byte =
		0x11,0x00,0x05,0x02;
	.var = .LN27;
	.byte =
		0x05,0x02,0x03,0x7C,0x01,0x00,0x05,0x02;
	.var = .LN28;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN29;
	.byte =
		0x05,0x06,0x0F,0x00,0x05,0x02;
	.var = .LN30;
	.byte =
		0x05,0x16,0x0C,0x00,0x05,0x02;
	.var = .LN31;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.var = .LN32;
	.byte =
		0x05,0x16,0x03,0x7E,0x01,0x00,0x05,0x02;
	.var = .LN33;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.var = .LN34;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.var = .LN35;
	.byte =
		0x05,0x02,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN36;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.var = .LN37;
	.byte =
		0x0F,0x00,0x05,0x02;
	.var = .LN38;
	.byte =
		0x05,0x02,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN39;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.var = .LN40;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.var = .LN41;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN42;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN43;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN44;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN45;
	.byte =
		0x05,0x05,0x03,0x77,0x01,0x00,0x05,0x02;
	.var = .LN46;
	.byte =
		0x05,0x02,0x12,0x00,0x05,0x02;
	.var = .LN47;
	.byte =
		0x03,0x78,0x01,0x00,0x05,0x02;
	.var = .LN48;
	.byte =
		0x05,0x05,0x14,0x00,0x05,0x02;
	.var = .LN49;
	.byte =
		0x05,0x02,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN50;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN51;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.var = .LN52;
	.byte =
		0x05,0x06,0x0B,0x00,0x05,0x02;
	.var = .LN53;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.var = .LN54;
	.byte =
		0x05,0x11,0x17,0x00,0x05,0x02;
	.var = .LN55;
	.byte =
		0x05,0x02,0x03,0x72,0x01,0x00,0x05,0x02;
	.var = .LN56;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.var = .LN57;
	.byte =
		0x05,0x05,0x13,0x00,0x05,0x02;
	.var = .LN58;
	.byte =
		0x05,0x06,0x03,0x78,0x01,0x00,0x05,0x02;
	.var = .LN59;
	.byte =
		0x05,0x05,0x11,0x00,0x05,0x02;
	.var = .LN60;
	.byte =
		0x05,0x06,0x0D,0x00,0x05,0x02;
	.var = .LN61;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN62;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN63;
	.byte =
		0x05,0x11,0x01,0x00,0x05,0x02;
	.var = .LN64;
	.byte =
		0x0E,0x00,0x05,0x02;
	.var = .LN65;
	.byte =
		0x05,0x06,0x03,0x7C,0x01,0x00,0x05,0x02;
	.var = .LN66;
	.byte =
		0x05,0x11,0x0D,0x00,0x05,0x02;
	.var = .LN67;
	.byte =
		0x05,0x13,0x0E,0x00,0x05,0x02;
	.var = .LN68;
	.byte =
		0x05,0x05,0x03,0x7B,0x01,0x00,0x05,0x02;
	.var = .LN69;
	.byte =
		0x05,0x06,0x0A,0x00,0x05,0x02;
	.var = .LN70;
	.byte =
		0x05,0x13,0x0D,0x00,0x05,0x02;
	.var = .LN71;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN72;
	.byte =
		0x05,0x13,0x0E,0x00,0x05,0x02;
	.var = .LN73;
	.byte =
		0x05,0x05,0x03,0x7B,0x01,0x00,0x05,0x02;
	.var = .LN74;
	.byte =
		0x05,0x06,0x0A,0x00,0x05,0x02;
	.var = .LN75;
	.byte =
		0x05,0x13,0x0D,0x00,0x05,0x02;
	.var = .LN76;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN77;
	.byte =
		0x0E,0x00,0x05,0x02;
	.var = .LN78;
	.byte =
		0x03,0x7B,0x01,0x00,0x05,0x02;
	.var = .LN79;
	.byte =
		0x05,0x06,0x0A,0x00,0x05,0x02;
	.var = .LN80;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.var = .LN81;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN82;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN83;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN84;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN85;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN86;
	.byte =
		0x11,0x00,0x05,0x02;
	.var = .LN87;
	.byte =
		0x05,0x0A,0x03,0x7D,0x01,0x00,0x05,0x02;
	.var = .LN88;
	.byte =
		0x05,0x09,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN89;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.var = .LN90;
	.byte =
		0x05,0x0A,0x0B,0x00,0x05,0x02;
	.var = .LN91;
	.byte =
		0x05,0x05,0x03,0x7E,0x01,0x00,0x05,0x02;
	.var = .LN92;
	.byte =
		0x05,0x0A,0x0B,0x00,0x05,0x02;
	.var = .LN93;
	.byte =
		0x05,0x09,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN94;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.var = .LN95;
	.byte =
		0x05,0x02,0x12,0x00,0x05,0x02;
	.var = .LN96;
	.byte =
		0x05,0x05,0x03,0x77,0x01,0x00,0x05,0x02;
	.var = .LN97;
	.byte =
		0x05,0x0A,0x0B,0x00,0x05,0x02;
	.var = .LN98;
	.byte =
		0x05,0x09,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN99;
	.byte =
		0x05,0x02,0x11,0x00,0x05,0x02;
	.var = .LN100;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN101;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN102;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN103;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN104;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN105;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN106;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN107;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN108;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN109;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN110;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN111;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN112;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN113;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN114;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN115;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN116;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN117;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN118;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN119;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN120;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN121;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN122;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN123;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN124;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN125;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN126;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN127;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN128;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN129;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN130;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN131;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN132;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN133;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN134;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN135;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN136;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN137;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN138;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN139;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN140;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN141;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN142;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN143;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN144;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN145;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN146;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN147;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN148;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN149;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN150;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN151;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN152;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN153;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN154;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN155;
	.byte =
		0x0A,0x00,0x05,0x02;
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
		0x01,0x00,0x05,0x02;
	.var = .LN162;
	.byte =
		0x01,0x00,0x05,0x02;
	.var = .LN163;
	.byte =
		0x05,0x0F,0x0B,0x00,0x05,0x02;
	.var = .LN164;
	.byte =
		0x05,0x01,0x0E,0x00,0x05,0x02;
	.var = .LN165;
	.byte =
		0x05,0x05,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN166;
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
		0xE3,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.inc/binary ".\src\processALE.sbn", 3313, 221;
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
	.global _k;
	.type _k,STT_OBJECT;
	.var _k[] =
		 0x00000000;
	.align 1;
	.global _mu;
	.type _mu,STT_OBJECT;
	.var _mu[] =
		 0x3C23D70A;
	.align 1;
	.global _xDCfilt;
	.type _xDCfilt,STT_OBJECT;
	.var _xDCfilt[] =
		 0x00000000;
	.align 1;
	.global _xDCfiltParam;
	.type _xDCfiltParam,STT_OBJECT;
	.var _xDCfiltParam[] =
		 0x3F7FFF58;
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
	.align 4;
	.var _delay[1];
	.weak _delay;
	.align 1;
	.var _kd[1];
	.weak _kd;
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
