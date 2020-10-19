;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"SSD.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_GPIO_GetPortPinState
	extern	_GPIO_SetPortState
	extern	_GPIO_SetPortPinState
	extern	_GPIO_InitPort
	extern	_GPIO_InitPortPin

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_ssd_symbols
	global	_SSD_Init
	global	_SSD_Update
	global	_SSD_Update_2
	global	_SSD_SetSymbol
	global	_SSD_SetState
	global	_SSD_GetSymbol
	global	_SSD_GetState

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_SSD_0	udata
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x1028	res	1
r0x1021	res	1
r0x1022	res	1
r0x1023	res	1
r0x101D	res	1
r0x101E	res	1
r0x101F	res	1
r0x1020	res	1
r0x101A	res	1
r0x101B	res	1
r0x101C	res	1
r0x1018	res	1
r0x1019	res	1
r0x1015	res	1
r0x1016	res	1
r0x1013	res	1
r0x1014	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_SSD_0	idata
_toggle_dot_time
	db	0x00	; 0


IDD_SSD_1	idata
_dot_state
	db	0x00	; 0


IDD_SSD_2	idata
_ssd_symbols
	db	0x0a	; 10
	db	0x00, 0x00, 0x00


IDD_SSD_3	idata
_ssd_data
	db	0x3f	; 63
	db	0x06	; 6
	db	0x5b	; 91
	db	0x4f	; 79	'O'
	db	0x66	; 102	'f'
	db	0x6d	; 109	'm'
	db	0x7d	; 125
	db	0x07	; 7
	db	0x7f	; 127
	db	0x6f	; 111	'o'
	db	0x00	; 0


IDD_SSD_4	idata
_SSD_Update_current_ssd_65536_22
	db	0x00	; 0


IDD_SSD_5	idata
_SSD_Update_2_current_ssd_65536_26
	db	0x00	; 0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_SSD	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;3 compiler assigned registers:
;   r0x1013
;   r0x1014
;   STK00
;; Starting pCode block
S_SSD__SSD_GetState	code
_SSD_GetState:
; 2 exit points
;	.line	201; "SSD.c"	tSSD_State SSD_GetState(tSSD ssd)
	BANKSEL	r0x1013
	MOVWF	r0x1013
;	.line	203; "SSD.c"	tSSD_State ret = SSD_OFF;
	CLRF	r0x1014
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	205; "SSD.c"	switch(ssd)
	MOVLW	0x04
	SUBWF	r0x1013,W
	BTFSC	STATUS,0
	GOTO	_00186_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00194_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00194_DS_
	BANKSEL	r0x1013
	ADDWF	r0x1013,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00194_DS_:
	GOTO	_00181_DS_
	GOTO	_00182_DS_
	GOTO	_00183_DS_
	GOTO	_00184_DS_
_00181_DS_:
;	.line	208; "SSD.c"	ret = GPIO_GetPortPinState(SSD_L_PORT , SSD_L_PIN);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
;	.line	209; "SSD.c"	break;
	GOTO	_00186_DS_
_00182_DS_:
;	.line	211; "SSD.c"	ret = GPIO_GetPortPinState(SSD_ML_PORT , SSD_ML_PIN);
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
;	.line	212; "SSD.c"	break;
	GOTO	_00186_DS_
_00183_DS_:
;	.line	214; "SSD.c"	ret = GPIO_GetPortPinState(SSD_MR_PORT , SSD_MR_PIN);
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
;	.line	215; "SSD.c"	break;
	GOTO	_00186_DS_
_00184_DS_:
;	.line	217; "SSD.c"	ret = GPIO_GetPortPinState(SSD_R_PORT , SSD_R_PIN);
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
_00186_DS_:
;	.line	224; "SSD.c"	return ret;
	BANKSEL	r0x1014
	MOVF	r0x1014,W
;	.line	225; "SSD.c"	}
	RETURN	
; exit point of _SSD_GetState

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1015
;   r0x1016
;   r0x1017
;; Starting pCode block
S_SSD__SSD_GetSymbol	code
_SSD_GetSymbol:
; 2 exit points
;	.line	192; "SSD.c"	tSSD_Symbol SSD_GetSymbol(tSSD ssd)
	BANKSEL	r0x1015
	MOVWF	r0x1015
;	.line	196; "SSD.c"	ret = ssd_symbols[ssd];
	ADDLW	(_ssd_symbols + 0)
	MOVWF	r0x1015
	MOVLW	high (_ssd_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1016
	MOVF	r0x1015,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1016
	BTFSC	r0x1016,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
;;1	MOVWF	r0x1017
;	.line	199; "SSD.c"	}
	RETURN	
; exit point of _SSD_GetSymbol

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;4 compiler assigned registers:
;   r0x1018
;   STK00
;   r0x1019
;   STK01
;; Starting pCode block
S_SSD__SSD_SetState	code
_SSD_SetState:
; 2 exit points
;	.line	169; "SSD.c"	void SSD_SetState(tSSD ssd, tSSD_State state)
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1019
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	171; "SSD.c"	switch(ssd)
	MOVLW	0x04
	SUBWF	r0x1018,W
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00172_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00172_DS_
	BANKSEL	r0x1018
	ADDWF	r0x1018,W
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00002_DS_:
	MOVWF	PCL
_00172_DS_:
	GOTO	_00159_DS_
	GOTO	_00160_DS_
	GOTO	_00161_DS_
	GOTO	_00162_DS_
_00159_DS_:
;	.line	174; "SSD.c"	GPIO_SetPortPinState(SSD_L_PORT ,SSD_L_PIN , state);
	BANKSEL	r0x1019
	MOVF	r0x1019,W
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	175; "SSD.c"	break;
	GOTO	_00165_DS_
_00160_DS_:
;	.line	177; "SSD.c"	GPIO_SetPortPinState(SSD_ML_PORT ,SSD_ML_PIN , state);
	BANKSEL	r0x1019
	MOVF	r0x1019,W
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	179; "SSD.c"	break;
	GOTO	_00165_DS_
_00161_DS_:
;	.line	181; "SSD.c"	GPIO_SetPortPinState(SSD_MR_PORT , SSD_MR_PIN, state);
	BANKSEL	r0x1019
	MOVF	r0x1019,W
	MOVWF	STK01
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	182; "SSD.c"	break;
	GOTO	_00165_DS_
_00162_DS_:
;	.line	184; "SSD.c"	GPIO_SetPortPinState(PORT_A, SSD_R_PIN, state);
	BANKSEL	r0x1019
	MOVF	r0x1019,W
	MOVWF	STK01
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
_00165_DS_:
;	.line	190; "SSD.c"	}
	RETURN	
; exit point of _SSD_SetState

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;4 compiler assigned registers:
;   r0x101A
;   STK00
;   r0x101B
;   r0x101C
;; Starting pCode block
S_SSD__SSD_SetSymbol	code
_SSD_SetSymbol:
; 2 exit points
;	.line	164; "SSD.c"	void SSD_SetSymbol(tSSD ssd, tSSD_Symbol symbol)
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVF	STK00,W
	MOVWF	r0x101B
;	.line	166; "SSD.c"	ssd_symbols[ssd] = symbol;
	MOVF	r0x101A,W
	ADDLW	(_ssd_symbols + 0)
	MOVWF	r0x101A
	MOVLW	high (_ssd_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101C
	MOVF	r0x101A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101C
	BTFSC	r0x101C,0
	BSF	STATUS,7
	MOVF	r0x101B,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	167; "SSD.c"	}
	RETURN	
; exit point of _SSD_SetSymbol

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _toggle_dot_state
;   _GPIO_SetPortState
;   _SSD_SetState
;   _GPIO_SetPortState
;   _SSD_SetState
;   _GPIO_SetPortState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _toggle_dot_state
;   _GPIO_SetPortState
;   _SSD_SetState
;   _GPIO_SetPortState
;   _SSD_SetState
;   _GPIO_SetPortState
;   _SSD_SetState
;5 compiler assigned registers:
;   STK00
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;; Starting pCode block
S_SSD__SSD_Update_2	code
_SSD_Update_2:
; 2 exit points
;	.line	108; "SSD.c"	toggle_dot_time++;
	BANKSEL	_toggle_dot_time
	INCF	_toggle_dot_time,F
;	.line	110; "SSD.c"	SSD_SetState(SSD_N, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	111; "SSD.c"	SSD_SetState(SSD_R, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	113; "SSD.c"	SSD_SetState(SSD_L, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	114; "SSD.c"	SSD_SetState(SSD_M, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	115; "SSD.c"	if( toggle_dot_time ==  NUM_OF_TICKS_PER_ONE_SECOND)
	BANKSEL	_toggle_dot_time
	MOVF	_toggle_dot_time,W
	XORLW	0x32
	BTFSS	STATUS,2
	GOTO	_00140_DS_
;	.line	117; "SSD.c"	toggle_dot_time=0;
	CLRF	_toggle_dot_time
;	.line	118; "SSD.c"	toggle_dot_state();
	PAGESEL	_toggle_dot_state
	CALL	_toggle_dot_state
	PAGESEL	$
_00140_DS_:
;	.line	121; "SSD.c"	if(current_ssd ==SSD_M )
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00145_DS_
;	.line	123; "SSD.c"	if( dot_state == 1)
	BANKSEL	_dot_state
	MOVF	_dot_state,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00142_DS_
;	.line	127; "SSD.c"	GPIO_SetPortState(SSD_data_PORT , ssd_data[ssd_symbols[current_ssd]] | 0x80);
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	ADDLW	(_ssd_symbols + 0)
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVLW	high (_ssd_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101E
	MOVF	r0x101D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101E
	BTFSC	r0x101E,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x101F
	MOVWF	r0x101F
	ADDLW	(_ssd_data + 0)
	MOVWF	r0x101D
	MOVLW	high (_ssd_data + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101E
	MOVF	r0x101D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101E
	BTFSC	r0x101E,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVLW	0x80
	IORWF	r0x101F,W
	MOVWF	r0x101D
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;	.line	129; "SSD.c"	SSD_SetState(current_ssd, SSD_ON);
	MOVLW	0x01
	MOVWF	STK00
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
	GOTO	_00146_DS_
_00142_DS_:
;	.line	135; "SSD.c"	GPIO_SetPortState(SSD_data_PORT , ssd_data[ssd_symbols[current_ssd]] );
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	ADDLW	(_ssd_symbols + 0)
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVLW	high (_ssd_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101F
	MOVF	r0x101D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101F
	BTFSC	r0x101F,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	ADDLW	(_ssd_data + 0)
	MOVWF	r0x101D
	MOVLW	high (_ssd_data + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101F
	MOVF	r0x101D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101F
	BTFSC	r0x101F,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;	.line	137; "SSD.c"	SSD_SetState(current_ssd, SSD_ON);
	MOVLW	0x01
	MOVWF	STK00
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
	GOTO	_00146_DS_
_00145_DS_:
;	.line	146; "SSD.c"	GPIO_SetPortState(SSD_data_PORT , ssd_data[ssd_symbols[current_ssd]] );
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	ADDLW	(_ssd_symbols + 0)
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVLW	high (_ssd_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101F
	MOVF	r0x101D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101F
	BTFSC	r0x101F,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	ADDLW	(_ssd_data + 0)
	MOVWF	r0x101D
	MOVLW	high (_ssd_data + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101F
	MOVF	r0x101D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101F
	BTFSC	r0x101F,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;	.line	148; "SSD.c"	SSD_SetState(current_ssd, SSD_ON);
	MOVLW	0x01
	MOVWF	STK00
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
_00146_DS_:
;	.line	151; "SSD.c"	if(current_ssd == SSD_R)
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	MOVF	_SSD_Update_2_current_ssd_65536_26,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00148_DS_
;	.line	153; "SSD.c"	current_ssd  = SSD_L;
	CLRF	_SSD_Update_2_current_ssd_65536_26
	GOTO	_00150_DS_
_00148_DS_:
;	.line	157; "SSD.c"	current_ssd++;
	BANKSEL	_SSD_Update_2_current_ssd_65536_26
	INCF	_SSD_Update_2_current_ssd_65536_26,F
_00150_DS_:
;	.line	162; "SSD.c"	}
	RETURN	
; exit point of _SSD_Update_2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _GPIO_SetPortState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _SSD_SetState
;   _GPIO_SetPortState
;   _SSD_SetState
;4 compiler assigned registers:
;   STK00
;   r0x1021
;   r0x1022
;   r0x1023
;; Starting pCode block
S_SSD__SSD_Update	code
_SSD_Update:
; 2 exit points
;	.line	80; "SSD.c"	SSD_SetState(SSD_N, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	81; "SSD.c"	SSD_SetState(SSD_R, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	83; "SSD.c"	SSD_SetState(SSD_L, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	84; "SSD.c"	SSD_SetState(SSD_M, SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	87; "SSD.c"	GPIO_SetPortState(SSD_data_PORT , ssd_data[ssd_symbols[current_ssd]] );
	BANKSEL	_SSD_Update_current_ssd_65536_22
	MOVF	_SSD_Update_current_ssd_65536_22,W
	ADDLW	(_ssd_symbols + 0)
	BANKSEL	r0x1021
	MOVWF	r0x1021
	MOVLW	high (_ssd_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1022
	MOVF	r0x1021,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1022
	BTFSC	r0x1022,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1023
	MOVWF	r0x1023
	ADDLW	(_ssd_data + 0)
	MOVWF	r0x1021
	MOVLW	high (_ssd_data + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1022
	MOVF	r0x1021,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1022
	BTFSC	r0x1022,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;	.line	89; "SSD.c"	SSD_SetState(current_ssd, SSD_ON);
	MOVLW	0x01
	MOVWF	STK00
	BANKSEL	_SSD_Update_current_ssd_65536_22
	MOVF	_SSD_Update_current_ssd_65536_22,W
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	91; "SSD.c"	if(current_ssd == SSD_R)
	BANKSEL	_SSD_Update_current_ssd_65536_22
	MOVF	_SSD_Update_current_ssd_65536_22,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00132_DS_
;	.line	93; "SSD.c"	current_ssd  = SSD_L;
	CLRF	_SSD_Update_current_ssd_65536_22
	GOTO	_00134_DS_
_00132_DS_:
;	.line	97; "SSD.c"	current_ssd++;
	BANKSEL	_SSD_Update_current_ssd_65536_22
	INCF	_SSD_Update_current_ssd_65536_22,F
_00134_DS_:
;	.line	102; "SSD.c"	}
	RETURN	
; exit point of _SSD_Update

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GPIO_InitPort
;   _GPIO_SetPortState
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _SSD_SetState
;   _SSD_SetSymbol
;   _GPIO_InitPort
;   _GPIO_SetPortState
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _SSD_SetState
;   _SSD_SetSymbol
;8 compiler assigned registers:
;   r0x1024
;   STK00
;   r0x1025
;   STK01
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
S_SSD__SSD_Init	code
_SSD_Init:
; 2 exit points
;	.line	40; "SSD.c"	void SSD_Init(tSSD ssd, tSSD_State initial_state, tSSD_Symbol initial_symbol)
	BANKSEL	r0x1024
	MOVWF	r0x1024
	MOVF	STK00,W
	MOVWF	r0x1025
	MOVF	STK01,W
	MOVWF	r0x1026
;	.line	43; "SSD.c"	GPIO_InitPort(SSD_data_PORT, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_InitPort
	CALL	_GPIO_InitPort
	PAGESEL	$
;	.line	44; "SSD.c"	GPIO_SetPortState(SSD_data_PORT, ssd_data[initial_symbol]);
	BANKSEL	r0x1026
	MOVF	r0x1026,W
	ADDLW	(_ssd_data + 0)
	MOVWF	r0x1027
	MOVLW	high (_ssd_data + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1028
	MOVF	r0x1027,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1028
	BTFSC	r0x1028,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
;;1	MOVWF	r0x1029
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	47; "SSD.c"	switch(ssd)
	MOVLW	0x04
	BANKSEL	r0x1024
	SUBWF	r0x1024,W
	BTFSC	STATUS,0
	GOTO	_00118_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00126_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00126_DS_
	BANKSEL	r0x1024
	ADDWF	r0x1024,W
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00003_DS_:
	MOVWF	PCL
_00126_DS_:
	GOTO	_00113_DS_
	GOTO	_00114_DS_
	GOTO	_00115_DS_
	GOTO	_00116_DS_
_00113_DS_:
;	.line	50; "SSD.c"	GPIO_InitPortPin(PORT_A, SSD_L_PIN, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	51; "SSD.c"	break;
	GOTO	_00118_DS_
_00114_DS_:
;	.line	53; "SSD.c"	GPIO_InitPortPin(PORT_A, SSD_ML_PIN, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	54; "SSD.c"	break;
	GOTO	_00118_DS_
_00115_DS_:
;	.line	56; "SSD.c"	GPIO_InitPortPin(PORT_A, SSD_MR_PIN, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	57; "SSD.c"	break;
	GOTO	_00118_DS_
_00116_DS_:
;	.line	59; "SSD.c"	GPIO_InitPortPin(PORT_A, SSD_R_PIN, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
_00118_DS_:
;	.line	67; "SSD.c"	SSD_SetState(ssd, initial_state);
	BANKSEL	r0x1025
	MOVF	r0x1025,W
	MOVWF	STK00
	MOVF	r0x1024,W
	PAGESEL	_SSD_SetState
	CALL	_SSD_SetState
	PAGESEL	$
;	.line	70; "SSD.c"	SSD_SetSymbol(ssd, initial_symbol);
	BANKSEL	r0x1026
	MOVF	r0x1026,W
	MOVWF	STK00
	MOVF	r0x1024,W
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
;	.line	72; "SSD.c"	}
	RETURN	
; exit point of _SSD_Init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_SSD__toggle_dot_state	code
_toggle_dot_state:
; 2 exit points
;	.line	12; "SSD.c"	if(dot_state ==0)
	BANKSEL	_dot_state
	MOVF	_dot_state,W
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	14; "SSD.c"	dot_state = 1;
	MOVLW	0x01
	MOVWF	_dot_state
	GOTO	_00108_DS_
_00106_DS_:
;	.line	17; "SSD.c"	dot_state = 0;
	BANKSEL	_dot_state
	CLRF	_dot_state
_00108_DS_:
;	.line	20; "SSD.c"	}
	RETURN	
; exit point of _toggle_dot_state


;	code size estimation:
;	  411+  156 =   567 instructions ( 1446 byte)

	end
