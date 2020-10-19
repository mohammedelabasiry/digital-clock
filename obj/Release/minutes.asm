;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"minutes.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__modsint
	extern	__divsint
	extern	_SSD_SetSymbol
	extern	_get_mode
	extern	_PB_GetState

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
	global	_minutes_init
	global	_minutes_update
	global	_get_minutes

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_minutes_0	udata
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_minutes_0	idata
_one_second_time
	db	0x00	; 0


IDD_minutes_1	idata
_minutes
	db	0x00	; 0


IDD_minutes_2	idata
_minutes_time
	db	0x00, 0x00	; 0


IDD_minutes_3	idata
_SSD_data
	db	0x0a	; 10

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
code_minutes	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_minutes__get_minutes	code
_get_minutes:
; 2 exit points
;	.line	108; "minutes.c"	return minutes ;
	BANKSEL	_minutes
	MOVF	_minutes,W
;	.line	109; "minutes.c"	}
	RETURN	
; exit point of _get_minutes

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _get_mode
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _get_mode
;   _PB_GetState
;   _PB_GetState
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _TOGGLE_passed_value_to_SSD
;   _get_mode
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _get_mode
;   _PB_GetState
;   _PB_GetState
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _TOGGLE_passed_value_to_SSD
;6 compiler assigned registers:
;   r0x1005
;   r0x1006
;   STK02
;   STK01
;   STK00
;   r0x1007
;; Starting pCode block
S_minutes__minutes_update	code
_minutes_update:
; 2 exit points
;	.line	46; "minutes.c"	if(get_mode()== normal)
	PAGESEL	_get_mode
	CALL	_get_mode
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	r0x1005,W
	BTFSS	STATUS,2
	GOTO	_00140_DS_
;	.line	48; "minutes.c"	minutes_time++;    one_second_time =0;
	BANKSEL	_minutes_time
	INCF	_minutes_time,F
	BTFSC	STATUS,2
	INCF	(_minutes_time + 1),F
	BANKSEL	_one_second_time
	CLRF	_one_second_time
;	.line	51; "minutes.c"	if(minutes_time ==  NUM_OFF_TICK_PER_minutes ){  if(minutes < 60 ) {minutes++; }
	BANKSEL	_minutes_time
	MOVF	_minutes_time,W
	XORLW	0x32
	BTFSS	STATUS,2
	GOTO	_00121_DS_
	MOVF	(_minutes_time + 1),W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00121_DS_
;;unsigned compare: left < lit(0x3C=60), size=1
	MOVLW	0x3c
	BANKSEL	_minutes
	SUBWF	_minutes,W
	BTFSC	STATUS,0
	GOTO	_00118_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	INCF	_minutes,F
	GOTO	_00119_DS_
_00118_DS_:
;	.line	52; "minutes.c"	else              {minutes =0;}
	BANKSEL	_minutes
	CLRF	_minutes
_00119_DS_:
;	.line	53; "minutes.c"	minutes_time=0;
	BANKSEL	_minutes_time
	CLRF	_minutes_time
	CLRF	(_minutes_time + 1)
;;106	MOVF	_minutes,W
_00121_DS_:
;	.line	57; "minutes.c"	SSD_SetSymbol(SSD_N , minutes/10 );
	BANKSEL	r0x1006
	CLRF	r0x1006
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;105	MOVF	r0x1005,W
	BANKSEL	_minutes
	MOVF	_minutes,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1005
	MOVWF	r0x1007
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
;;104	MOVF	_minutes,W
;	.line	58; "minutes.c"	SSD_SetSymbol( SSD_R, minutes%10);
	BANKSEL	r0x1006
	CLRF	r0x1006
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;103	MOVF	r0x1005,W
	BANKSEL	_minutes
	MOVF	_minutes,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1005
	MOVWF	r0x1007
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
	GOTO	_00142_DS_
_00140_DS_:
;	.line	62; "minutes.c"	else if(get_mode()== settting_minutes)
	PAGESEL	_get_mode
	CALL	_get_mode
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00142_DS_
;	.line	64; "minutes.c"	one_second_time++;
	BANKSEL	_one_second_time
	INCF	_one_second_time,F
;	.line	65; "minutes.c"	if(PB_GetState(PB_MINUS) ==PB_PRE_PRESSED )
	MOVLW	0x01
	PAGESEL	_PB_GetState
	CALL	_PB_GetState
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00126_DS_
;	.line	67; "minutes.c"	if(minutes == 0){ minutes =60 ; }
	BANKSEL	_minutes
	MOVF	_minutes,W
	BTFSS	STATUS,2
	GOTO	_00123_DS_
	MOVLW	0x3c
	MOVWF	_minutes
	GOTO	_00126_DS_
_00123_DS_:
;	.line	68; "minutes.c"	else             { minutes--;    }
	BANKSEL	_minutes
	DECF	_minutes,F
_00126_DS_:
;	.line	71; "minutes.c"	if(PB_GetState(PB_PLUS) ==PB_PRE_PRESSED )
	MOVLW	0x00
	PAGESEL	_PB_GetState
	CALL	_PB_GetState
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00131_DS_
;	.line	73; "minutes.c"	if(  minutes == 60){    minutes =0;}
	BANKSEL	_minutes
	MOVF	_minutes,W
	XORLW	0x3c
	BTFSS	STATUS,2
	GOTO	_00128_DS_
	CLRF	_minutes
	GOTO	_00131_DS_
_00128_DS_:
;	.line	74; "minutes.c"	else{                   minutes++; }
	BANKSEL	_minutes
	INCF	_minutes,F
_00131_DS_:
;	.line	77; "minutes.c"	minutes_time=0;
	BANKSEL	_minutes_time
	CLRF	_minutes_time
	CLRF	(_minutes_time + 1)
;	.line	79; "minutes.c"	if(SSD_data !=SSD_NULL)
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
;	.line	82; "minutes.c"	SSD_SetSymbol(SSD_N ,   SSD_data/10 );
	XORLW	0x0a
	BTFSC	STATUS,2
	GOTO	_00133_DS_
;;102	MOVF	_SSD_data,W
	BANKSEL	r0x1006
	CLRF	r0x1006
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;101	MOVF	r0x1005,W
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1005
	MOVWF	r0x1007
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
;;100	MOVF	_SSD_data,W
;	.line	83; "minutes.c"	SSD_SetSymbol(SSD_R,   SSD_data%10);
	BANKSEL	r0x1006
	CLRF	r0x1006
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;99	MOVF	r0x1005,W
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1005
	MOVWF	r0x1007
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
	GOTO	_00134_DS_
_00133_DS_:
;	.line	89; "minutes.c"	SSD_SetSymbol(SSD_N ,   SSD_data );
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
;	.line	90; "minutes.c"	SSD_SetSymbol(SSD_R,   SSD_data);
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
_00134_DS_:
;	.line	93; "minutes.c"	if( one_second_time == NUM_OF_TICKS_PER_ONE_SECOND)
	BANKSEL	_one_second_time
	MOVF	_one_second_time,W
	XORLW	0x0a
	BTFSS	STATUS,2
	GOTO	_00142_DS_
;	.line	95; "minutes.c"	TOGGLE_passed_value_to_SSD();
	PAGESEL	_TOGGLE_passed_value_to_SSD
	CALL	_TOGGLE_passed_value_to_SSD
	PAGESEL	$
;	.line	97; "minutes.c"	one_second_time =0;
	BANKSEL	_one_second_time
	CLRF	_one_second_time
_00142_DS_:
;	.line	104; "minutes.c"	}
	RETURN	
; exit point of _minutes_update

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_minutes__minutes_init	code
_minutes_init:
; 2 exit points
;	.line	36; "minutes.c"	void minutes_init(unsigned char init_minutes)
	BANKSEL	_minutes
	MOVWF	_minutes
;	.line	39; "minutes.c"	}
	RETURN	
; exit point of _minutes_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_minutes__TOGGLE_passed_value_to_SSD	code
_TOGGLE_passed_value_to_SSD:
; 2 exit points
;	.line	22; "minutes.c"	if(SSD_data ==  SSD_NULL)
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	XORLW	0x0a
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	24; "minutes.c"	SSD_data = minutes ;
	BANKSEL	_minutes
	MOVF	_minutes,W
	BANKSEL	_SSD_data
	MOVWF	_SSD_data
	GOTO	_00108_DS_
_00106_DS_:
;	.line	28; "minutes.c"	SSD_data = SSD_NULL;
	MOVLW	0x0a
	BANKSEL	_SSD_data
	MOVWF	_SSD_data
_00108_DS_:
;	.line	34; "minutes.c"	}
	RETURN	
; exit point of _TOGGLE_passed_value_to_SSD


;	code size estimation:
;	  163+   73 =   236 instructions (  618 byte)

	end
