	.file "..\src\main.c";
//  Compilation time: Mon Oct 26 14:59:20 2026
//  Compiler options: -c -file-attr ProjectName=SHARC_Lab_ALE -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output .\src -ED -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo src\main.d -o src\main.doj
//  Compiler version: 8.15.1.0 (61a2eff16741378b1ae40f6392a0806696679a50)
//  Architecture: ADSP-21364
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w_anomaly_45, w_anomaly_2126x_4, w_dag_stall, w_2136x_multi, w_09000014, w_09000018, w_09000020, w_07000009_1, w_09000021, w_15000003, w_09000022, w_15000004, w_15000011, w_09000023, w_15000005, w_15000016, w_15000023, w_20000002, w_20000022, w_20000020, w_20000024, w_20000023, w_20000009, w_20000069, w_20000083
//   Enabled: w_2136x_mem_write, w_07000009_2
//   Always on: w_simd, w_restore_loop_stack

	.section/PM/DOUBLE32 seg_pmco;

.epctext:

_main:
.LN_main:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 4 words
//  Scratch registers used: {r2,r4,r8,r12,acc}
//  No call preserved registers used.
//  Registers that could be clobbered by function calls: {r0-r2,r4,r8,r12,s0-s15,i4,i12-i13,b4,b12-b13,m4,m12,ustat1-ustat4,acc,mcc,scc,btf,sacc,smcc,sscc,sbtf,stky,stkyy,msf,msb,lcntr,px}
//-------------------------------------------------------------------
.LN0:
// line "..\src\main.c":12
	cjump _InitPLL (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN1:
// line 15
	cjump _Init1835viaSPI_PowerDwn (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN2:
// line 17
	cjump _InitSPORT (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN3:
// line 20
	cjump _DAIsigInit (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN4:
// line 21
	cjump _InitDAI (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN5:
// line 25
	cjump _Init1835viaSPI (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN6:
// line 28
	r12=m5;
	r8=_receive;
	r4=4109;
	modify(i7,m7);
	dm(i7,m7)=m14;
	cjump _adi_int_InstallHandler (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
	modify(i7,2);

.P34L1:
//-------------------------------------------------------------------
//   Loop at "..\src\main.c" line 31 col 5
//-------------------------------------------------------------------

.LN7:
// line 33
	r2=dm(_dataReady);
	r2=pass r2;
	if eq jump (pc,.P34L5);

.LN8:
// line 34
	dm(_dataReady)=m5;
.LN9:
// line 35
	cjump _process (db); dm(i7,m7)=r2; dm(i7,m7)=pc;
.LN10:
	jump (pc,.P34L6);

.P34L5:

.P34L6:
	jump (pc,.P34L1);
//-------------------------------------------------------------------
//   End Loop L1
//-------------------------------------------------------------------
.LN._main.end:
._main.end:
	.global _main;
	.type _main,STT_FUNC;

	.file_attr ProjectName="SHARC_Lab_ALE";
	.file_attr FuncName="_disable_interrupts";
	.file_attr FuncName="_enable_interrupts";
	.file_attr FuncName="_main";
	.file_attr Encoding="NW";
	.file_attr Content="Code";
.epctext.end:

	.extern _InitPLL;
	.type _InitPLL,STT_FUNC;
	.extern _Init1835viaSPI_PowerDwn;
	.type _Init1835viaSPI_PowerDwn,STT_FUNC;
	.extern _InitSPORT;
	.type _InitSPORT,STT_FUNC;
	.extern _DAIsigInit;
	.type _DAIsigInit,STT_FUNC;
	.extern _InitDAI;
	.type _InitDAI,STT_FUNC;
	.extern _Init1835viaSPI;
	.type _Init1835viaSPI,STT_FUNC;
	.extern _receive;
	.type _receive,STT_FUNC;
	.extern _adi_int_InstallHandler;
	.type _adi_int_InstallHandler,STT_FUNC;
	.extern _process;
	.type _process,STT_FUNC;

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\main.sbn", 0, 197;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0xBC,0x09,0x00,0x00,0x02,0x00;
	.var = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x6D,0x61,0x69,
		0x6E,0x2E,0x63,0x00,0x0C;
	.var = .epcline;
	.inc/binary ".\src\main.sbn", 197, 2411;
	.var = .LN_main;
	.var = .LN._main.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.var = .LN0;
	.var = .LN._main.end;
	.byte =
		0x00,0x00,0x0E,0x64,0x61,0x74,0x61,0x52,0x65,0x61,0x64,0x79,
		0x00,0x01,0xEF,0x01,0x00,0x00,0x05,0x03;
	.var = _dataReady;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\main.sbn", 2608, 639;
	.var = .LN_main;
	.byte =
		0x04,0x01,0x05,0x01,0x13,0x00,0x05,0x02;
	.var = .LN0;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.var = .LN1;
	.byte =
		0x05,0x1D,0x0C,0x00,0x05,0x02;
	.var = .LN2;
	.byte =
		0x05,0x0E,0x0B,0x00,0x05,0x02;
	.var = .LN3;
	.byte =
		0x05,0x0F,0x0C,0x00,0x05,0x02;
	.var = .LN4;
	.byte =
		0x05,0x0C,0x0A,0x00,0x05,0x02;
	.var = .LN5;
	.byte =
		0x05,0x13,0x0D,0x00,0x05,0x02;
	.var = .LN6;
	.byte =
		0x05,0x1B,0x0C,0x00,0x05,0x02;
	.var = .LN7;
	.byte =
		0x05,0x06,0x0E,0x00,0x05,0x02;
	.var = .LN8;
	.byte =
		0x05,0x07,0x0A,0x00,0x05,0x02;
	.var = .LN9;
	.byte =
		0x05,0x12,0x0A,0x00,0x05,0x02;
	.var = .LN10;
	.byte =
		0x05,0x15,0x01,0x00,0x05,0x02;
	.var = .LN._main.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x17,0x00,0x00,0x00,0x02,0x00;
	.var = .epcdebug;
	.byte =
		0xC0,0x09,0x00,0x00,0x7F,0x09,0x00,0x00,0x6D,0x61,0x69,0x6E,
		0x00,0x00,0x00,0x00,0x00;
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
	.var = .LN_main;
	.var = .LN._main.end-.LN_main;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DM/DOUBLE32 seg_dmda;


	.extern _dataReady;
	.type _dataReady,STT_OBJECT;
