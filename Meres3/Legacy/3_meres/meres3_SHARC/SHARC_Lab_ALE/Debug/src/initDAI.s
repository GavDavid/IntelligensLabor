	.file "..\src\initDAI.c";
//  Compilation time: Mon Oct 27 14:41:08 2025
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_ALE -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -ED -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\initDAI.d -o src\initDAI.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

.epctext:

_InitDAI:
.LN_InitDAI:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 8 words
//  Scratch registers used: {r0-r2,r4,r8,r12,i12,acc,scc}
//  Call preserved registers used: {r10-r11,r13-r15}
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 25 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 28 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 47 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 50 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 53 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 65 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 66 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 67 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 73 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 74 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 75 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 101 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 102 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 103 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 104 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 110 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 111 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 112 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 118 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 119 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 120 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 121 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 125 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 126 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 127 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 128 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 129 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 130 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\initDAI.c" line 131 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// line "..\src\initDAI.c":14
	modify(i7,-6);
	dm(-6,i6)=r10;
	dm(-5,i6)=r11;
	dm(-4,i6)=r13;
	dm(-3,i6)=r14;
	dm(-2,i6)=r15;
// Diagnostic: Optimizer now disabled

.LN0:
// line 25
	r2=dm(9316);
	r0=-128;
	r2=r2 and r0;
	r12=80;
	r2=r2 or r12;
	dm(9316)=r2;


.LN1:
// line 28
	r2=dm(9339);
	r8=-4033;
	r2=r2 and r8;
	dm(9339)=r2;


.LN2:
// line 47
	r2=dm(9264);
	r1=-32;
	r2=r2 and r1;
	r4=6;
	r2=r2 or r4;
	dm(9264)=r2;


.LN3:
// line 50
	r2=dm(9296);
	r2=r2 and r1;
	r1=7;
	r2=r2 or r1;
	dm(9296)=r2;


.LN4:
// line 53
	r2=dm(9280);
	r15=-64;
	r2=r2 and r15;
	r1=2;
	r2=bset r2 by r1;
	dm(9280)=r2;


.LN5:
// line 65
	r2=dm(9313);
	r2=r2 and r0;
	r2=r2 or r12;
	dm(9313)=r2;


.LN6:
// line 66
	r2=dm(9313);
	r12=-2080769;
	r2=r2 and r12;
	r1=1310720;
	r2=r2 or r1;
	dm(9313)=r2;


.LN7:
// line 67
	r2=dm(9313);
	r14=-266338305;
	r2=r2 and r14;
	r1=167772160;
	r2=r2 or r1;
	dm(9313)=r2;


.LN8:
// line 73
	r2=dm(9336);
	r13=-1056964609;
	r2=r2 and r13;
	dm(9336)=r2;


.LN9:
// line 74
	r2=dm(9337);
	r2=r2 and r8;
	dm(9337)=r2;


.LN10:
// line 75
	r2=dm(9337);
	r11=-258049;
	r2=r2 and r11;
	dm(9337)=r2;


.LN11:
// line 101
	r2=dm(9314);
	r2=r2 and r0;
	r1=25;
	r2=r2 or r1;
	dm(9314)=r2;


.LN12:
// line 102
	r2=dm(9314);
	r10=-16257;
	r2=r2 and r10;
	r1=3072;
	r2=r2 or r1;
	dm(9314)=r2;


.LN13:
// line 103
	r2=dm(9314);
	r2=r2 and r12;
	r1=376832;
	r2=r2 or r1;
	dm(9314)=r2;


.LN14:
// line 104
	r2=dm(9314);
	r2=r2 and r14;
	r1=46137344;
	r2=r2 or r1;
	dm(9314)=r2;


.LN15:
// line 110
	r2=dm(9315);
	r2=r2 and r0;
	r2=r2 or r4;
	dm(9315)=r2;


.LN16:
// line 111
	r2=dm(9315);
	r2=r2 and r10;
	r1=896;
	r2=r2 or r1;
	dm(9315)=r2;


.LN17:
// line 112
	r2=dm(9313);
	r2=r2 and r10;
	r1=11;
	r2=bset r2 by r1;
	dm(9313)=r2;


.LN18:
// line 118
	r2=dm(9264);
	r1=-993;
	r2=r2 and r1;
	r0=192;
	r2=r2 or r0;
	dm(9264)=r2;


.LN19:
// line 119
	r2=dm(9264);
	r0=-31745;
	r2=r2 and r0;
	r12=6144;
	r2=r2 or r12;
	dm(9264)=r2;


.LN20:
// line 120
	r2=dm(9296);
	r2=r2 and r1;
	r1=224;
	r2=r2 or r1;
	dm(9296)=r2;


.LN21:
// line 121
	r2=dm(9296);
	r2=r2 and r0;
	r1=7168;
	r2=r2 or r1;
	dm(9296)=r2;


.LN22:
// line 125
	r2=dm(9337);
	r2=r2 and r15;
	r0=m5;
	r2=bset r2 by r0;
	dm(9337)=r2;


.LN23:
// line 126
	r2=dm(9337);
	r12=-16515073;
	r2=r2 and r12;
	r14=18;
	r2=bset r2 by r14;
	dm(9337)=r2;


.LN24:
// line 127
	r2=dm(9337);
	r2=r2 and r13;
	r1=24;
	r2=bset r2 by r1;
	dm(9337)=r2;


.LN25:
// line 128
	r2=dm(9338);
	r2=r2 and r15;
	r2=bset r2 by r0;
	dm(9338)=r2;


.LN26:
// line 129
	r2=dm(9338);
	r2=r2 and r8;
	r2=bset r2 by r4;
	dm(9338)=r2;


.LN27:
// line 130
	r2=dm(9338);
	r2=r2 and r11;
	r1=12;
	r2=bset r2 by r1;
	dm(9338)=r2;


.LN28:
// line 131
	r2=dm(9338);
	r2=r2 and r12;
	r2=bset r2 by r14;
	dm(9338)=r2;

.LN29:
// line 132
	r10=dm(-6,i6);
	r11=dm(-5,i6);
	r13=dm(-4,i6);
	r14=dm(-3,i6);
	r15=dm(-2,i6);
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._InitDAI.end:
._InitDAI.end:
	.global _InitDAI;
	.type _InitDAI,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_ALE";
	.file_attr FuncName="_InitDAI";
	.file_attr FuncName="_disable_interrupts";
	.file_attr FuncName="_enable_interrupts";
	.file_attr Encoding="NW";
	.file_attr Content="Code";
.epctext.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\initDAI.sbn", 0, 180;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x96,0x09,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x69,0x6E,0x69,
		0x74,0x44,0x41,0x49,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\initDAI.sbn", 180, 2396;
	.var = .LN_InitDAI;
	.var = .LN._InitDAI.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._InitDAI.end;
	.byte =
		0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\initDAI.sbn", 2576, 642;
	.var = .LN_InitDAI;
	.byte =
		0x04,0x01,0x05,0x0F,0x16,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x05,0x14,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x1C,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x0C,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x15,0x00,0x05,0x02;
	.var = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN8;
	.byte =
		0x0F,0x00,0x05,0x02;
	.var = .LN9;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN10;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN11;
	.byte =
		0x23,0x00,0x05,0x02;
	.var = .LN12;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN13;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN14;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN15;
	.byte =
		0x0F,0x00,0x05,0x02;
	.var = .LN16;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN17;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN18;
	.byte =
		0x0F,0x00,0x05,0x02;
	.var = .LN19;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN20;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN21;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN22;
	.byte =
		0x0D,0x00,0x05,0x02;
	.var = .LN23;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN24;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN26;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN27;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN28;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN29;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.var = .LN._InitDAI.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x1A,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x9A,0x09,0x00,0x00,0x70,0x09,0x00,0x00,0x49,0x6E,0x69,0x74,
		0x44,0x41,0x49,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x18,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x01,0x00;
	.var = .LN_InitDAI;
	.var = .LN._InitDAI.end-.LN_InitDAI;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
