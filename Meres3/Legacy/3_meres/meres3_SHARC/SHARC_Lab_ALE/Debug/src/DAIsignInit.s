	.file "..\src\DAIsignInit.c";
//  Compilation time: Mon Oct 27 14:41:04 2025
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_ALE -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -ED -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\DAIsignInit.d -o src\DAIsignInit.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

#include <def21364.h>
_readDAIpin:
.LN_readDAIpin:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r0-r2,i12,acc}
//  No call preserved registers used.
//-------------------------------------------------------------------
// line "..\src\DAIsignInit.c":50
	modify(i7,-2);
	dm(-3,i6)=r4;
// Diagnostic: Optimizer now disabled

.LN0:
// line 53
	// ASM STATEMENT
	f2 = flags;
		// END ASM STATEMENT

	dm(-2,i6)=r2;
.LN1:
// line 60
	r1=268435456;
	r2=r2 and r1;
	dm(-2,i6)=r2;
.LN2:
// line 62
	r2=dm(9401);
	r1=dm(-3,i6);
	r0=r2 and r1;
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._readDAIpin.end:
._readDAIpin.end:
	.global _readDAIpin;
	.type _readDAIpin,STT_FUNC;

_DAIsigInit:
.LN_DAIsigInit:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {r0-r2,r8,r12,i12,acc,scc}
//  No call preserved registers used.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 21 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 23 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 27 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 31 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 32 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 36 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 38 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 41 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 42 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 44 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------

.LN3:
// line "..\src\DAIsignInit.c":21
	r2=dm(9338);
	r1=-1056964609;
	r2=r2 and r1;
	r1=24;
	r2=bset r2 by r1;
	dm(9338)=r2;


.LN4:
// line 23
	r2=dm(9315);
	r1=-2080769;
	r2=r2 and r1;
	r1=1310720;
	r2=r2 or r1;
	dm(9315)=r2;


.LN5:
// line 27
	r2=dm(9328);
	r1=-993;
	r2=r2 and r1;
	r1=5;
	r2=bset r2 by r1;
	dm(9328)=r2;


.LN6:
// line 28
	// ASM STATEMENT
	bit clr flags FLG14O;
	// END ASM STATEMENT


.LN7:
// line 31
	r2=dm(9336);
	r1=-4033;
	r2=r2 and r1;
	dm(9336)=r2;


.LN8:
// line 32
	r2=dm(9312);
	r1=-16257;
	r2=r2 and r1;
	r1=10240;
	r2=r2 or r1;
	dm(9312)=r2;


.LN9:
// line 36
	r2=dm(9296);
	r1=-32505857;
	r2=r2 and r1;
	r1=20;
	r2=bset r2 by r1;
	dm(9296)=r2;


.LN10:
// line 38
	r2=dm(9281);
	r1=-16515073;
	r2=r2 and r1;
	r0=18;
	r2=bset r2 by r0;
	dm(9281)=r2;


.LN11:
// line 41
	r2=dm(9312);
	r12=-266338305;
	r2=r2 and r12;
	r8=169869312;
	r2=r2 or r8;
	dm(9312)=r2;


.LN12:
// line 42
	r2=dm(9336);
	r2=r2 and r1;
	r2=bset r2 by r0;
	dm(9336)=r2;


.LN13:
// line 44
	r2=dm(9312);
	r2=r2 and r12;
	r1=62914560;
	r2=r2 or r1;
	dm(9312)=r2;

.LN14:
// line 47
	r2=dm(9341);
	r1=3;
	r2=bclr r2 by r1;
	dm(9341)=r2;
.LN15:
// line 48
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._DAIsigInit.end:
._DAIsigInit.end:
	.global _DAIsigInit;
	.type _DAIsigInit,STT_FUNC;

_clrDAIproc:
.LN_clrDAIproc:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {r1-r2,i12,acc}
//  No call preserved registers used.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 15 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------

.LN16:
// line "..\src\DAIsignInit.c":15
	r2=dm(9315);
	r1=-2080769;
	r2=r2 and r1;
	r1=1310720;
	r2=r2 or r1;
	dm(9315)=r2;

.LN17:
// line 17
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._clrDAIproc.end:
._clrDAIproc.end:
	.global _clrDAIproc;
	.type _clrDAIproc,STT_FUNC;

_setDAIproc:
.LN_setDAIproc:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {r1-r2,i12,acc}
//  No call preserved registers used.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 10 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------

.LN18:
// line "..\src\DAIsignInit.c":10
	r2=dm(9315);
	r1=-2080769;
	r2=r2 and r1;
	r1=1327104;
	r2=r2 or r1;
	dm(9315)=r2;

.LN19:
// line 12
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._setDAIproc.end:
._setDAIproc.end:
	.global _setDAIproc;
	.type _setDAIproc,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_ALE";
	.file_attr FuncName="_readDAIpin";
	.file_attr FuncName="_DAIsigInit";
	.file_attr FuncName="_clrDAIproc";
	.file_attr FuncName="_setDAIproc";
	.file_attr FuncName="_disable_interrupts";
	.file_attr FuncName="_enable_interrupts";
	.file_attr Encoding="NW";
	.file_attr Content="Code";
.epctext.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\DAIsignInit.sbn", 0, 233;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x43,0x0A,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x44,0x41,0x49,
		0x73,0x69,0x67,0x6E,0x49,0x6E,0x69,0x74,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\DAIsignInit.sbn", 233, 2399;
	.var = .LN_readDAIpin;
	.var = .LN._readDAIpin.end;
	.byte =
		0x01,0xE4,0x01,0x00,0x00,0x01,0x00,0x0D,0x6D,0x61,0x73,0x6B,
		0x00,0xE4,0x01,0x00,0x00,0x02,0x86,0x7D,0x00,0x0E,0x00,0x00,
		0x00,0x00;
	.var = .LN0;
	.var = .LN._readDAIpin.end;
	.byte =
		0x0F,0x74,0x6D,0x70,0x52,0x00,0x01,0xE4,0x01,0x00,0x00,0x02,
		0x86,0x7E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0xEF,0x09,
		0x00,0x00,0x44,0x41,0x49,0x73,0x69,0x67,0x49,0x6E,0x69,0x74,
		0x00,0x01;
	.var = .LN_DAIsigInit;
	.var = .LN._DAIsigInit.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN3;
	.var = .LN._DAIsigInit.end;
	.byte =
		0x00,0x00,0x10,0x1A,0x0A,0x00,0x00,0x63,0x6C,0x72,0x44,0x41,
		0x49,0x70,0x72,0x6F,0x63,0x00,0x01;
	.var = .LN_clrDAIproc;
	.var = .LN._clrDAIproc.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN16;
	.var = .LN._clrDAIproc.end;
	.byte =
		0x00,0x00,0x10,0x45,0x0A,0x00,0x00,0x73,0x65,0x74,0x44,0x41,
		0x49,0x70,0x72,0x6F,0x63,0x00,0x01;
	.var = .LN_setDAIproc;
	.var = .LN._setDAIproc.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.var = .LN18;
	.var = .LN._setDAIproc.end;
	.byte =
		0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\DAIsignInit.sbn", 2632, 646;
	.var = .LN_readDAIpin;
	.byte =
		0x04,0x01,0x05,0x19,0x3A,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x10,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN._readDAIpin.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_DAIsigInit;
	.byte =
		0x04,0x01,0x05,0x12,0x1B,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x0D,0x00,0x05,0x02;
	.var = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN7;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN8;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN9;
	.byte =
		0x0D,0x00,0x05,0x02;
	.var = .LN10;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN11;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN12;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN13;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN14;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.var = .LN15;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._DAIsigInit.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_clrDAIproc;
	.byte =
		0x04,0x01,0x05,0x12,0x16,0x00,0x05,0x02;
	.var = .LN16;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN17;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._clrDAIproc.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_setDAIproc;
	.byte =
		0x04,0x01,0x05,0x12,0x11,0x00,0x05,0x02;
	.var = .LN18;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN19;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._setDAIproc.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x4A,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x47,0x0A,0x00,0x00,0x74,0x09,0x00,0x00,0x72,0x65,0x61,0x64,
		0x44,0x41,0x49,0x70,0x69,0x6E,0x00,0xC4,0x09,0x00,0x00,0x44,
		0x41,0x49,0x73,0x69,0x67,0x49,0x6E,0x69,0x74,0x00,0xEF,0x09,
		0x00,0x00,0x63,0x6C,0x72,0x44,0x41,0x49,0x70,0x72,0x6F,0x63,
		0x00,0x1A,0x0A,0x00,0x00,0x73,0x65,0x74,0x44,0x41,0x49,0x70,
		0x72,0x6F,0x63,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x30,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x01,0x00;
	.var = .LN_readDAIpin;
	.var = .LN._readDAIpin.end-.LN_readDAIpin;
	.var = .LN_DAIsigInit;
	.var = .LN._DAIsigInit.end-.LN_DAIsigInit;
	.var = .LN_clrDAIproc;
	.var = .LN._clrDAIproc.end-.LN_clrDAIproc;
	.var = .LN_setDAIproc;
	.var = .LN._setDAIproc.end-.LN_setDAIproc;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
