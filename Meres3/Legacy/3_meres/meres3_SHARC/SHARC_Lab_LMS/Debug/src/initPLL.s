	.file "..\src\initPLL.c";
//  Compilation time: Mon Oct 27 15:58:22 2025
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_LMS -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\initPLL.d -o src\initPLL.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

.epctext:

_InitPLL:
.LN_InitPLL:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r1-r2,i12,acc,scc}
//  No call preserved registers used.
//-------------------------------------------------------------------
// line "..\src\initPLL.c":17
	modify(i7,-2);
// Diagnostic: Optimizer now disabled
.LN0:
// line 26
	r2=dm(8192);
	dm(-2,i6)=r2;
.LN1:
// line 27
	r1=-64;
	r2=r2 and r1;
	dm(-2,i6)=r2;
.LN2:
// line 29
	r1=33371;
	r2=r2 or r1;
	dm(-2,i6)=r2;
.LN3:
// line 31
	dm(8192)=r2;
.LN4:
// line 33
	dm(-3,i6)=m13;
	jump (pc,.P34L1);

.P34L6:
//-------------------------------------------------------------------
//   Part of Loop 1, depth 1
//-------------------------------------------------------------------
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------

.P34L1:
//-------------------------------------------------------------------
//   Loop at "..\src\initPLL.c" line 33 col 1
//-------------------------------------------------------------------
	r2=dm(-3,i6);
	r1=4096;
	comp(r2,r1);
	if ge jump (pc,.P34L3);


.LN5:
// line 34
	// ASM STATEMENT
	nop;
	// END ASM STATEMENT

.LN6:
// line 33
	r2=dm(-3,i6);
	r2=r2+1;
	dm(-3,i6)=r2;
	jump (pc,.P34L6);

.P34L3:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN7:
// line 36
	r2=dm(8192);
	r1=15;
	r2=btgl r2 by r1;
	dm(8192)=r2;
.LN8:
// line 37
	r2=dm(8192);
	r1=12;
	r2=bset r2 by r1;
	dm(8192)=r2;
.LN9:
// line 38
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._InitPLL.end:
._InitPLL.end:
	.global _InitPLL;
	.type _InitPLL,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_LMS";
	.file_attr FuncName="_InitPLL";
	.file_attr FuncName="_disable_interrupts";
	.file_attr FuncName="_enable_interrupts";
	.file_attr Encoding="NW";
	.file_attr Content="CodeData";
.epctext.end:

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\initPLL.sbn", 0, 197;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0xD0,0x09,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x69,0x6E,0x69,
		0x74,0x50,0x4C,0x4C,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\initPLL.sbn", 197, 2393;
	.var = .LN_InitPLL;
	.var = .LN._InitPLL.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._InitPLL.end;
	.byte =
		0x0E,0x69,0x00,0x01,0xDD,0x01,0x00,0x00,0x02,0x86,0x7D,0x00,
		0x00,0x00,0x00,0x00,0x0E,0x70,0x6D,0x63,0x74,0x6C,0x73,0x65,
		0x74,0x74,0x69,0x6E,0x67,0x00,0x01,0xDD,0x01,0x00,0x00,0x02,
		0x86,0x7E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0E,0x69,0x00,
		0x01,0xDD,0x01,0x00,0x00,0x05,0x03;
	.var = _i;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\initPLL.sbn", 2590, 642;
	.var = .LN_InitPLL;
	.byte =
		0x04,0x01,0x05,0x0F,0x19,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x01,0x12,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.var = .LN6;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.var = .LN7;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.var = .LN8;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN9;
	.byte =
		0x0A,0x00,0x05,0x02;
	.var = .LN._InitPLL.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x20,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0xD4,0x09,0x00,0x00,0x6D,0x09,0x00,0x00,0x49,0x6E,0x69,0x74,
		0x50,0x4C,0x4C,0x00,0xC0,0x09,0x00,0x00,0x69,0x00,0x00,0x00,
		0x00,0x00;
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
	.var = .LN_InitPLL;
	.var = .LN._InitPLL.end-.LN_InitPLL;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DM/DOUBLE32 seg_dmda;


	.align 1;
	.var _i[1];
	.weak _i;
