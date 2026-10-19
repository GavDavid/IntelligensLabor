	.file "..\src\process_data.c";
//  Compilation time: Tue Sep 22 15:03:18 2026
//  Compiler options: -c -file-attr ProjectName=BlackFin_Frame -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output .\src -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo src\process_data.d -o src\process_data.doj
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
_Process_Data:
.LN_Process_Data:
//-------------------------------------------------------------------
//  Procedure statistics:
//  Frame size            = 20 
//  Scratch registers used: {R0,P0-P1,ASTAT0-ASTAT1,CC}
//  Call preserved registers used: {RETS}
//  Registers that could be clobbered by function calls: {R0-R3,P0-P2,I0-I3,B0-B3,M0-M3,A0-A1,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\src\process_data.c":13
	LINK 12;
	.align 2
	P1.L = _uart_rx_flag;
	P1.H = _uart_rx_flag;
.LN0:
// line 15
	R0 = B[P1] (Z);
	CC = R0 == 0;
	if !CC jump .P38L1 ;

.P38L3:
	P1.L = _iChannel0LeftIn;
	P1.H = _iChannel0LeftIn;
.LN1:
// line 21
	R0 = [P1];
	P1.L = _iChannel0LeftOut;
	P1.H = _iChannel0LeftOut;
	[P1] = R0;
	P1.L = _iChannel0RightIn;
	P1.H = _iChannel0RightIn;
.LN2:
// line 22
	R0 = [P1];
	P1.L = _iChannel0RightOut;
	P1.H = _iChannel0RightOut;
	[P1] = R0;
.LN3:
// line 23
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

.P38L1:
.LN4:
// line 17
	R0 = 0;
	B[P1] = R0;
.LN5:
// line 18
	CALL.X _uart_getch;
	R0 = R0.b (X);
.LN6:
	CALL.X _uart_putch;
	jump.s .P38L3;
.LN._Process_Data.end:
._Process_Data.end:
	.global _Process_Data;
	.type _Process_Data,STT_FUNC;

	.file_attr ProjectName="BlackFin_Frame";
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
	.file_attr FuncName="_Process_Data";
	.file_attr Content="Code";
.epctext.end:

	.extern _uart_getch;
	.type _uart_getch,STT_FUNC;
	.extern _uart_putch;
	.type _uart_putch,STT_FUNC;

	.section .debug_abbrev;

	.align 1;
	.type .epcabbrev,STT_OBJECT;
.epcabbrev:
	.inc/binary ".\src\process_data.sbn", 0, 227;
.epcabbrev.end:

	.section .debug_info;

	.align 1;
	.type .epcdebug,STT_OBJECT;
.epcdebug:
	.byte =
		0x5F,0x11,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,0x70,0x72,0x6F,
		0x63,0x65,0x73,0x73,0x5F,0x64,0x61,0x74,0x61,0x2E,0x63,0x00,
		0x0C;
	.byte4 = .epcline;
	.inc/binary ".\src\process_data.sbn", 227, 4209;
	.byte4 = .LN_Process_Data;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x01,0x01,0x00,0x11,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x00,0x00,0x12,0x75,0x61,0x72,0x74,0x5F,0x72,0x78,0x5F,0x66,
		0x6C,0x61,0x67,0x00,0x01,0x5D,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _uart_rx_flag;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x49,0x6E,0x00,0x01,0x58,
		0x11,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x49,0x6E,0x00,0x01,
		0x58,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightIn;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x4C,0x65,0x66,0x74,0x4F,0x75,0x74,0x00,0x01,
		0x58,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0LeftOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x43,0x68,0x61,0x6E,0x6E,
		0x65,0x6C,0x30,0x52,0x69,0x67,0x68,0x74,0x4F,0x75,0x74,0x00,
		0x01,0x58,0x11,0x00,0x00,0x05,0x03;
	.byte4 = _iChannel0RightOut;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0E,0xD8,0x01,0x00,0x00,0x0E,0x72,
		0x01,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line;

	.align 1;
	.type .epcline,STT_OBJECT;
.epcline:
	.inc/binary ".\src\process_data.sbn", 4436, 812;
	.byte4 = .LN_Process_Data;
	.byte =
		0x04,0x01,0x05,0x01,0x15,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x03,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x18,0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN._Process_Data.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .debug_pubnames;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x1F,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x63,0x11,0x00,0x00,0x85,0x10,0x00,0x00,0x50,0x72,0x6F,0x63,
		0x65,0x73,0x73,0x5F,0x44,0x61,0x74,0x61,0x00,0x00,0x00,0x00,
		0x00;
.epcpubnames.end:

	.section .debug_aranges;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x1C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_Process_Data;
	.byte4 = .LN._Process_Data.end-.LN_Process_Data;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;


	.extern _uart_rx_flag;
	.type _uart_rx_flag,STT_OBJECT;
	.extern _iChannel0LeftIn;
	.type _iChannel0LeftIn,STT_OBJECT;
	.extern _iChannel0RightIn;
	.type _iChannel0RightIn,STT_OBJECT;
	.extern _iChannel0LeftOut;
	.type _iChannel0LeftOut,STT_OBJECT;
	.extern _iChannel0RightOut;
	.type _iChannel0RightOut,STT_OBJECT;
