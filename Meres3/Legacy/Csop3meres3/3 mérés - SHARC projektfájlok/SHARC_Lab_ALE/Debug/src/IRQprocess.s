	.file "..\src\IRQprocess.c";
//  Compilation time: Mon Oct 26 14:59:16 2026
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_ALE -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -ED -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\IRQprocess.d -o src\IRQprocess.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

.epctext:

_SetupIRQ12:
.LN_SetupIRQ12:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {r1-r2,i12,acc}
//  No call preserved registers used.
//-------------------------------------------------------------------
.LN0:
// line "..\src\IRQprocess.c":26
	r2=dm(196644);
	r1=393216;
	r2=r2 or r1;
	dm(196644)=r2;

.LN1:
// line 27
	// ASM STATEMENT
	#include <def21364.h>
	// END ASM STATEMENT


.LN2:
// line 29
	// ASM STATEMENT
	bit set mode2 IRQ1E;
	// END ASM STATEMENT


.LN3:
// line 30
	// ASM STATEMENT
	bit set mode2 IRQ2E;
	// END ASM STATEMENT

.LN4:
// line 31
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._SetupIRQ12.end:
._SetupIRQ12.end:
	.global _SetupIRQ12;
	.type _SetupIRQ12,STT_FUNC;

_Irq1ISR:
.LN_Irq1ISR:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 6 words
//  Scratch registers used: {r1-r2,r4,r8,r12,i12,acc,scc}
//  No call preserved registers used.
//  Registers that could be clobbered by function calls: {r0-r2,r4,r8,r12,s0-s15,i4,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\IRQprocess.c":34
	modify(i7,-4);
	dm(-4,i6)=r4;
// Diagnostic: Optimizer now disabled
.LN5:
// line 38
	cjump _SetupSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN6:
// line 39
	r4=34816;
	cjump _Get1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN7:
	dm(-3,i6)=r0;
.LN8:
// line 40
	r4=38912;
	cjump _Get1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN9:
	dm(-2,i6)=r0;
.LN10:
// line 43
	r8=dm(-3,i6);
	r12=-63;
	r2=r8+r12;
	dm(-3,i6)=r2;
.LN11:
// line 44
	r1=r0+r12;
	dm(-2,i6)=r1;
	r2=pass r2;
.LN12:
// line 46
	if le jump (pc,.P34L2);

.LN13:
// line 47
	r1=15;
	r4=bset r2 by r1;
.LN14:
	cjump _Configure1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
	jump (pc,.P34L3);

.P34L2:

.P34L3:
.LN15:
// line 49
	r2=dm(-2,i6);
	r2=pass r2;
	if le jump (pc,.P34L5);

.LN16:
// line 50
	r1=36864;
	r4=r2 or r1;
.LN17:
	cjump _Configure1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
	jump (pc,.P34L6);

.P34L5:

.P34L6:
.LN18:
// line 52
	cjump _DisableSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN19:
// line 53
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._Irq1ISR.end:
._Irq1ISR.end:
	.global _Irq1ISR;
	.type _Irq1ISR,STT_FUNC;

_Irq2ISR:
.LN_Irq2ISR:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 6 words
//  Scratch registers used: {r1-r2,r4,r8,r12,i12,acc,scc}
//  Call preserved registers used: {r15}
//  Registers that could be clobbered by function calls: {r0-r2,r4,r8,r12,s0-s15,i4,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
// line "..\src\IRQprocess.c":56
	modify(i7,-4);
	dm(-5,i6)=r15;
	dm(-4,i6)=r4;
// Diagnostic: Optimizer now disabled
.LN20:
// line 61
	cjump _SetupSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN21:
// line 62
	r4=34816;
	cjump _Get1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN22:
	dm(-3,i6)=r0;
.LN23:
// line 63
	r4=38912;
	cjump _Get1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN24:
	dm(-2,i6)=r0;
.LN25:
// line 66
	r8=dm(-3,i6);
	r12=63;
	r2=r8+r12;
	dm(-3,i6)=r2;
.LN26:
// line 67
	r1=r0+r12;
	dm(-2,i6)=r1;
	r15=1023;
	comp(r2,r15);
.LN27:
// line 69
	if ge jump (pc,.P39L2);

.LN28:
// line 70
	r1=15;
	r4=bset r2 by r1;
.LN29:
	cjump _Configure1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
	jump (pc,.P39L3);

.P39L2:

.P39L3:
.LN30:
// line 72
	r2=dm(-2,i6);
	comp(r2,r15);
	if ge jump (pc,.P39L5);

.LN31:
// line 73
	r1=36864;
	r4=r2 or r1;
.LN32:
	cjump _Configure1835Register (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
	jump (pc,.P39L6);

.P39L5:

.P39L6:
.LN33:
// line 75
	cjump _DisableSPI1835 (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN34:
// line 76
	r15=dm(-5,i6);
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._Irq2ISR.end:
._Irq2ISR.end:
	.global _Irq2ISR;
	.type _Irq2ISR,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_ALE";
	.file_attr FuncName="_SetupIRQ12";
	.file_attr FuncName="_disable_interrupts";
	.file_attr FuncName="_enable_interrupts";
	.file_attr FuncName="_Irq1ISR";
	.file_attr FuncName="_Irq2ISR";
	.file_attr Encoding="NW";
	.file_attr Content="Code";
.epctext.end:

	.extern _SetupSPI1835;
	.type _SetupSPI1835,STT_FUNC;
	.extern _Get1835Register;
	.type _Get1835Register,STT_FUNC;
	.extern _Configure1835Register;
	.type _Configure1835Register,STT_FUNC;
	.extern _DisableSPI1835;
	.type _DisableSPI1835,STT_FUNC;

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\IRQprocess.sbn", 0, 210;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x7E,0x0A,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x49,0x52,0x51,
		0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\IRQprocess.sbn", 210, 2417;
	.var = .LN_SetupIRQ12;
	.var = .LN._SetupIRQ12.end;
	.byte =
		0x00,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._SetupIRQ12.end;
	.byte =
		0x00,0x00,0x0C,0x18,0x0A,0x00,0x00,0x49,0x72,0x71,0x31,0x49,
		0x53,0x52,0x00,0x01;
	.var = .LN_Irq1ISR;
	.var = .LN._Irq1ISR.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x69,0x00,0xF5,0x01,0x00,0x00,0x02,0x86,
		0x7C,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN5;
	.var = .LN._Irq1ISR.end;
	.byte =
		0x0F,0x6C,0x65,0x66,0x74,0x44,0x41,0x43,0x34,0x56,0x6F,0x6C,
		0x00,0x01,0xF5,0x01,0x00,0x00,0x02,0x86,0x7D,0x00,0x00,0x00,
		0x00,0x00,0x0F,0x72,0x69,0x67,0x68,0x74,0x44,0x41,0x43,0x34,
		0x56,0x6F,0x6C,0x00,0x01,0xF5,0x01,0x00,0x00,0x02,0x86,0x7E,
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0C,0x80,0x0A,0x00,0x00,
		0x49,0x72,0x71,0x32,0x49,0x53,0x52,0x00,0x01;
	.var = .LN_Irq2ISR;
	.var = .LN._Irq2ISR.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x69,0x00,0xF5,0x01,0x00,0x00,0x02,0x86,
		0x7C,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN20;
	.var = .LN._Irq2ISR.end;
	.byte =
		0x0F,0x6C,0x65,0x66,0x74,0x44,0x41,0x43,0x34,0x56,0x6F,0x6C,
		0x00,0x01,0xF5,0x01,0x00,0x00,0x02,0x86,0x7D,0x00,0x00,0x00,
		0x00,0x00,0x0F,0x72,0x69,0x67,0x68,0x74,0x44,0x41,0x43,0x34,
		0x56,0x6F,0x6C,0x00,0x01,0xF5,0x01,0x00,0x00,0x02,0x86,0x7E,
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\IRQprocess.sbn", 2627, 662;
	.var = .LN_SetupIRQ12;
	.byte =
		0x04,0x01,0x05,0x01,0x20,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._SetupIRQ12.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Irq1ISR;
	.byte =
		0x04,0x01,0x05,0x01,0x2A,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x05,0x12,0x0D,0x00,0x05,0x02;
	.var = .LN6;
	.byte =
		0x05,0x23,0x0A,0x00,0x05,0x02;
	.var = .LN7;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN8;
	.byte =
		0x05,0x24,0x0A,0x00,0x05,0x02;
	.var = .LN9;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN10;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN11;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN12;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN13;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN14;
	.byte =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN15;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN16;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN17;
	.byte =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN18;
	.byte =
		0x05,0x14,0x0B,0x00,0x05,0x02;
	.var = .LN19;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._Irq1ISR.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_Irq2ISR;
	.byte =
		0x04,0x01,0x05,0x01,0x40,0x00,0x05,0x02;
	.var = .LN20;
	.byte =
		0x05,0x12,0x0E,0x00,0x05,0x02;
	.var = .LN21;
	.byte =
		0x05,0x23,0x0A,0x00,0x05,0x02;
	.var = .LN22;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN23;
	.byte =
		0x05,0x24,0x0A,0x00,0x05,0x02;
	.var = .LN24;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.var = .LN25;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN26;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN27;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN28;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN29;
	.byte =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN30;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN31;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.var = .LN32;
	.byte =
		0x05,0x1F,0x01,0x00,0x05,0x02;
	.var = .LN33;
	.byte =
		0x05,0x14,0x0B,0x00,0x05,0x02;
	.var = .LN34;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._Irq2ISR.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x35,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x82,0x0A,0x00,0x00,0x85,0x09,0x00,0x00,0x53,0x65,0x74,0x75,
		0x70,0x49,0x52,0x51,0x31,0x32,0x00,0xB0,0x09,0x00,0x00,0x49,
		0x72,0x71,0x31,0x49,0x53,0x52,0x00,0x18,0x0A,0x00,0x00,0x49,
		0x72,0x71,0x32,0x49,0x53,0x52,0x00,0x00,0x00,0x00,0x00;
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
	.var = .LN_SetupIRQ12;
	.var = .LN._SetupIRQ12.end-.LN_SetupIRQ12;
	.var = .LN_Irq1ISR;
	.var = .LN._Irq1ISR.end-.LN_Irq1ISR;
	.var = .LN_Irq2ISR;
	.var = .LN._Irq2ISR.end-.LN_Irq2ISR;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
