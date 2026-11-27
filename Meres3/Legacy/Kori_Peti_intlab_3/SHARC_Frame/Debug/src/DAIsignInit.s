	.file "..\src\DAIsignInit.c";
//  Compilation time: Mon Oct  7 14:22:22 2024
//  Compiler options: -c -file-attr ProjectName=SHARC_Frame -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\DAIsignInit.d -o src\DAIsignInit.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

.epctext:

_DAIsigInit:
.LN_DAIsigInit:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 2 words
//  Scratch registers used: {r1-r2,i12,acc,scc}
//  No call preserved registers used.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 21 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
//  Original Loop at "..\src\DAIsignInit.c" line 23 col 5 - loop structure removed due to dead code elimination.
//-------------------------------------------------------------------

.LN0:
// line "..\src\DAIsignInit.c":21
	r2=dm(9338);
	r1=-1056964609;
	r2=r2 and r1;
	r1=24;
	r2=bset r2 by r1;
	dm(9338)=r2;


.LN1:
// line 23
	r2=dm(9315);
	r1=-2080769;
	r2=r2 and r1;
	r1=1310720;
	r2=r2 or r1;
	dm(9315)=r2;

.LN2:
// line 25
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

.LN3:
// line "..\src\DAIsignInit.c":15
	r2=dm(9315);
	r1=-2080769;
	r2=r2 and r1;
	r1=1310720;
	r2=r2 or r1;
	dm(9315)=r2;

.LN4:
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

.LN5:
// line "..\src\DAIsignInit.c":10
	r2=dm(9315);
	r1=-2080769;
	r2=r2 and r1;
	r1=1327104;
	r2=r2 or r1;
	dm(9315)=r2;

.LN6:
// line 12
	i12=dm(m7,i6);
	jump (m14,i12) (db); rframe; nop;
.LN._setDAIproc.end:
._setDAIproc.end:
	.global _setDAIproc;
	.type _setDAIproc,STT_FUNC;

	.file_attr ProjectName="SHARC_Frame";
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
	.inc/binary ".\src\DAIsignInit.sbn", 0, 180;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x02,0x0A,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x44,0x41,0x49,
		0x73,0x69,0x67,0x6E,0x49,0x6E,0x69,0x74,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\DAIsignInit.sbn", 180, 2414;
	.var = .LN_DAIsigInit;
	.var = .LN._DAIsigInit.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._DAIsigInit.end;
	.byte =
		0x00,0x00,0x0C,0xD9,0x09,0x00,0x00,0x63,0x6C,0x72,0x44,0x41,
		0x49,0x70,0x72,0x6F,0x63,0x00,0x01;
	.var = .LN_clrDAIproc;
	.var = .LN._clrDAIproc.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN3;
	.var = .LN._clrDAIproc.end;
	.byte =
		0x00,0x00,0x0C,0x04,0x0A,0x00,0x00,0x73,0x65,0x74,0x44,0x41,
		0x49,0x70,0x72,0x6F,0x63,0x00,0x01;
	.var = .LN_setDAIproc;
	.var = .LN._setDAIproc.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN5;
	.var = .LN._setDAIproc.end;
	.byte =
		0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\DAIsignInit.sbn", 2594, 646;
	.var = .LN_DAIsigInit;
	.byte =
		0x04,0x01,0x05,0x12,0x1B,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x0B,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._DAIsigInit.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_clrDAIproc;
	.byte =
		0x04,0x01,0x05,0x12,0x16,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.var = .LN._clrDAIproc.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.var = .LN_setDAIproc;
	.byte =
		0x04,0x01,0x05,0x12,0x11,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.var = .LN6;
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
		0x3B,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0x06,0x0A,0x00,0x00,0x83,0x09,0x00,0x00,0x44,0x41,0x49,0x73,
		0x69,0x67,0x49,0x6E,0x69,0x74,0x00,0xAE,0x09,0x00,0x00,0x63,
		0x6C,0x72,0x44,0x41,0x49,0x70,0x72,0x6F,0x63,0x00,0xD9,0x09,
		0x00,0x00,0x73,0x65,0x74,0x44,0x41,0x49,0x70,0x72,0x6F,0x63,
		0x00,0x00,0x00,0x00,0x00;
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
	.var = .LN_DAIsigInit;
	.var = .LN._DAIsigInit.end-.LN_DAIsigInit;
	.var = .LN_clrDAIproc;
	.var = .LN._clrDAIproc.end-.LN_clrDAIproc;
	.var = .LN_setDAIproc;
	.var = .LN._setDAIproc.end-.LN_setDAIproc;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
