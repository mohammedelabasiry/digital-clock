;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"PB.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__muluchar
	extern	_GPIO_GetPortPinState
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
	global	_PB_Init
	global	_PB_Update
	global	_PB_GetState

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_PB_0	udata
_pb_info	res	12

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_PB_0	udata
r0x101B	res	1
r0x101C	res	1
r0x101D	res	1
r0x101E	res	1
r0x101F	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
r0x100C	res	1
r0x100D	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
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
code_PB	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __muluchar
;   __muluchar
;4 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;   r0x100E
;; Starting pCode block
S_PB__PB_GetState	code
_PB_GetState:
; 2 exit points
;	.line	129; "PB.c"	tPB_State PB_GetState(tPB pb)
	BANKSEL	r0x100C
	MOVWF	r0x100C
;	.line	133; "PB.c"	ret = pb_info[pb].state;
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x100C,W
	PAGESEL	__muluchar
	CALL	__muluchar
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100C
	ADDLW	(_pb_info + 0)
	MOVWF	r0x100C
	MOVF	r0x100D,W
	BTFSC	STATUS,0
	INCFSZ	r0x100D,W
	ADDLW	high (_pb_info + 0)
	MOVWF	r0x100D
	MOVLW	0x02
	ADDWF	r0x100C,F
	BTFSC	STATUS,0
	INCF	r0x100D,F
	MOVF	r0x100C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x100D
	BTFSC	r0x100D,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
;;1	MOVWF	r0x100E
;	.line	136; "PB.c"	}
	RETURN	
; exit point of _PB_GetState

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
;13 compiler assigned registers:
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   STK00
;   r0x1019
;   r0x101A
;; Starting pCode block
S_PB__PB_Update	code
_PB_Update:
; 2 exit points
;	.line	66; "PB.c"	for (current_button = PB_PLUS; current_button < PB_UNUSED_2 ; current_button++)
	BANKSEL	r0x100F
	CLRF	r0x100F
	CLRF	r0x1010
	CLRF	r0x1011
	CLRF	r0x1012
	CLRF	r0x1013
_00157_DS_:
;	.line	69; "PB.c"	pb_info[current_button].samples[0] = pb_info[current_button].samples[1];
	BANKSEL	r0x1012
	MOVF	r0x1012,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x1014
	MOVLW	high (_pb_info + 0)
	MOVWF	r0x1015
	MOVF	r0x1013,W
	BTFSC	STATUS,0
	INCFSZ	r0x1013,W
	ADDWF	r0x1015,F
	MOVF	r0x1012,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x1016
	MOVLW	high (_pb_info + 0)
	MOVWF	r0x1017
	MOVF	r0x1013,W
	BTFSC	STATUS,0
	INCFSZ	r0x1013,W
	ADDWF	r0x1017,F
	INCF	r0x1016,F
	BTFSC	STATUS,2
	INCF	r0x1017,F
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	r0x1014,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1015
	BTFSC	r0x1015,0
	BSF	STATUS,7
	MOVF	r0x1018,W
	BANKSEL	INDF
	MOVWF	INDF
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	71; "PB.c"	switch(current_button)
	MOVLW	0x04
	BANKSEL	r0x100F
	SUBWF	r0x100F,W
	BTFSC	STATUS,0
	GOTO	_00139_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00199_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00199_DS_
	BANKSEL	r0x100F
	ADDWF	r0x100F,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00199_DS_:
	GOTO	_00134_DS_
	GOTO	_00135_DS_
	GOTO	_00136_DS_
	GOTO	_00137_DS_
_00134_DS_:
;	.line	74; "PB.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PB_PLUS_PORT, PB_PLUS_PIN);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVF	r0x1014,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	75; "PB.c"	break;
	GOTO	_00139_DS_
_00135_DS_:
;	.line	77; "PB.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PB_MINUS_PORT, PB_MINUS_PIN);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVF	r0x1014,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	78; "PB.c"	break;
	GOTO	_00139_DS_
_00136_DS_:
;	.line	80; "PB.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PB_SET_PORT, PB_SET_PIN);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVF	r0x1014,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	81; "PB.c"	break;
	GOTO	_00139_DS_
_00137_DS_:
;	.line	83; "PB.c"	pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 3);
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVF	r0x1014,W
	BANKSEL	INDF
	MOVWF	INDF
_00139_DS_:
;	.line	91; "PB.c"	switch(pb_info[current_button].state)
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	ADDLW	(_pb_info + 0)
	MOVWF	r0x1014
	MOVLW	high (_pb_info + 0)
	MOVWF	r0x1015
	MOVF	r0x1011,W
	BTFSC	STATUS,0
	INCFSZ	r0x1011,W
	ADDWF	r0x1015,F
	MOVLW	0x02
	ADDWF	r0x1014,W
	MOVWF	r0x1016
	CLRF	r0x1017
	RLF	r0x1017,F
	MOVF	r0x1015,W
	ADDWF	r0x1017,F
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
	MOVLW	0x04
	SUBWF	r0x1018,W
	BTFSC	STATUS,0
	GOTO	_00158_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00201_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00201_DS_
	BANKSEL	r0x1018
	ADDWF	r0x1018,W
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00002_DS_:
	MOVWF	PCL
_00201_DS_:
	GOTO	_00140_DS_
	GOTO	_00144_DS_
	GOTO	_00147_DS_
	GOTO	_00151_DS_
_00140_DS_:
;	.line	94; "PB.c"	if((pb_info[current_button].samples[0] == PB_PRESSED_VOLTAGE) &&
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1015
	BTFSC	r0x1015,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	r0x1018,W
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	95; "PB.c"	(pb_info[current_button].samples[1] == PB_PRESSED_VOLTAGE))
	MOVLW	0x01
	ADDWF	r0x1014,W
	MOVWF	r0x1018
	CLRF	r0x1019
	RLF	r0x1019,F
	MOVF	r0x1015,W
	ADDWF	r0x1019,F
	MOVF	r0x1018,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1019
	BTFSC	r0x1019,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVF	r0x101A,W
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	97; "PB.c"	pb_info[current_button].state = PB_PRE_PRESSED;
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	99; "PB.c"	break;
	GOTO	_00158_DS_
_00144_DS_:
;	.line	101; "PB.c"	if(pb_info[current_button].samples[1] == PB_PRESSED_VOLTAGE)
	MOVLW	0x01
	BANKSEL	r0x1014
	ADDWF	r0x1014,W
	MOVWF	r0x1018
	CLRF	r0x1019
	RLF	r0x1019,F
	MOVF	r0x1015,W
	ADDWF	r0x1019,F
	MOVF	r0x1018,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1019
	BTFSC	r0x1019,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVF	r0x101A,W
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	103; "PB.c"	pb_info[current_button].state = PB_PRESSED;
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVLW	0x02
	BANKSEL	INDF
	MOVWF	INDF
;	.line	105; "PB.c"	break;
	GOTO	_00158_DS_
_00147_DS_:
;	.line	107; "PB.c"	if((pb_info[current_button].samples[0] == PB_RELEASED_VOLTAGE) &&
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1015
	BTFSC	r0x1015,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	108; "PB.c"	(pb_info[current_button].samples[1] == PB_RELEASED_VOLTAGE))
	MOVLW	0x01
	ADDWF	r0x1014,W
	MOVWF	r0x1018
	CLRF	r0x1019
	RLF	r0x1019,F
	MOVF	r0x1015,W
	ADDWF	r0x1019,F
	MOVF	r0x1018,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1019
	BTFSC	r0x1019,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x101A
	MOVWF	r0x101A
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	110; "PB.c"	pb_info[current_button].state = PB_PRE_RELEASED;
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVLW	0x03
	BANKSEL	INDF
	MOVWF	INDF
;	.line	112; "PB.c"	break;
	GOTO	_00158_DS_
_00151_DS_:
;	.line	114; "PB.c"	if(pb_info[current_button].samples[1] == PB_RELEASED_VOLTAGE)
	BANKSEL	r0x1014
	INCF	r0x1014,F
	BTFSC	STATUS,2
	INCF	r0x1015,F
	MOVF	r0x1014,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1015
	BTFSC	r0x1015,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00158_DS_
;	.line	116; "PB.c"	pb_info[current_button].state = PB_RELEASED;
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
_00158_DS_:
;	.line	66; "PB.c"	for (current_button = PB_PLUS; current_button < PB_UNUSED_2 ; current_button++)
	MOVLW	0x03
	BANKSEL	r0x1010
	ADDWF	r0x1010,F
	BTFSC	STATUS,0
	INCF	r0x1011,F
	MOVLW	0x03
	ADDWF	r0x1012,F
	BTFSC	STATUS,0
	INCF	r0x1013,F
	INCF	r0x100F,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVLW	0x03
	SUBWF	r0x100F,W
	BTFSS	STATUS,0
	GOTO	_00157_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
;	.line	127; "PB.c"	}
	RETURN	
; exit point of _PB_Update

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   __muluchar
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   __muluchar
;7 compiler assigned registers:
;   r0x101B
;   STK00
;   r0x101C
;   STK01
;   r0x101D
;   r0x101E
;   r0x101F
;; Starting pCode block
S_PB__PB_Init	code
_PB_Init:
; 2 exit points
;	.line	22; "PB.c"	void PB_Init(tPB pb, tPB_State initial_state)
	BANKSEL	r0x101B
	MOVWF	r0x101B
	MOVF	STK00,W
	MOVWF	r0x101C
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	25; "PB.c"	switch(pb)
	MOVLW	0x04
	SUBWF	r0x101B,W
	BTFSC	STATUS,0
	GOTO	_00110_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00127_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00127_DS_
	BANKSEL	r0x101B
	ADDWF	r0x101B,W
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00003_DS_:
	MOVWF	PCL
_00127_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
_00105_DS_:
;	.line	28; "PB.c"	GPIO_InitPortPin(PB_PLUS_PORT, PB_PLUS_PIN, GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	29; "PB.c"	break;
	GOTO	_00110_DS_
_00106_DS_:
;	.line	31; "PB.c"	GPIO_InitPortPin(PB_MINUS_PORT, PB_MINUS_PIN, GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	32; "PB.c"	break;
	GOTO	_00110_DS_
_00107_DS_:
;	.line	34; "PB.c"	GPIO_InitPortPin(PB_SET_PORT, PB_SET_PIN, GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	35; "PB.c"	break;
	GOTO	_00110_DS_
_00108_DS_:
;	.line	37; "PB.c"	GPIO_InitPortPin(PORT_B, 3, GPIO_IN);
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
_00110_DS_:
;	.line	45; "PB.c"	pb_info[pb].state = initial_state;
	MOVLW	0x03
	MOVWF	STK00
	BANKSEL	r0x101B
	MOVF	r0x101B,W
	PAGESEL	__muluchar
	CALL	__muluchar
	PAGESEL	$
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
	MOVWF	r0x101B
	ADDLW	(_pb_info + 0)
	MOVWF	r0x101B
	MOVF	r0x101D,W
	BTFSC	STATUS,0
	INCFSZ	r0x101D,W
	ADDLW	high (_pb_info + 0)
	MOVWF	r0x101D
	MOVLW	0x02
	ADDWF	r0x101B,W
	MOVWF	r0x101E
	CLRF	r0x101F
	RLF	r0x101F,F
	MOVF	r0x101D,W
	ADDWF	r0x101F,F
	MOVF	r0x101E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101F
	BTFSC	r0x101F,0
	BSF	STATUS,7
	MOVF	r0x101C,W
	BANKSEL	INDF
	MOVWF	INDF
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	48; "PB.c"	switch (initial_state)
	MOVLW	0x04
	BANKSEL	r0x101C
	SUBWF	r0x101C,W
	BTFSC	STATUS,0
	GOTO	_00116_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00129_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00129_DS_
	BANKSEL	r0x101C
	ADDWF	r0x101C,W
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00004_DS_:
	MOVWF	PCL
_00129_DS_:
	GOTO	_00112_DS_
	GOTO	_00114_DS_
	GOTO	_00114_DS_
	GOTO	_00112_DS_
_00112_DS_:
;	.line	52; "PB.c"	pb_info[pb].samples[0] = PB_RELEASED_VOLTAGE;
	BANKSEL	r0x101B
	MOVF	r0x101B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101D
	BTFSC	r0x101D,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	53; "PB.c"	pb_info[pb].samples[1] = PB_RELEASED_VOLTAGE;
	MOVLW	0x01
	BANKSEL	r0x101B
	ADDWF	r0x101B,W
	MOVWF	r0x101C
	CLRF	r0x101E
	RLF	r0x101E,F
	MOVF	r0x101D,W
	ADDWF	r0x101E,F
	MOVF	r0x101C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101E
	BTFSC	r0x101E,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	54; "PB.c"	break;
	GOTO	_00116_DS_
_00114_DS_:
;	.line	57; "PB.c"	pb_info[pb].samples[0] = PB_PRESSED_VOLTAGE;
	BANKSEL	r0x101B
	MOVF	r0x101B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101D
	BTFSC	r0x101D,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	58; "PB.c"	pb_info[pb].samples[1] = PB_PRESSED_VOLTAGE;
	BANKSEL	r0x101B
	INCF	r0x101B,F
	BTFSC	STATUS,2
	INCF	r0x101D,F
	MOVF	r0x101B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101D
	BTFSC	r0x101D,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
_00116_DS_:
;	.line	61; "PB.c"	}
	RETURN	
; exit point of _PB_Init


;	code size estimation:
;	  431+  132 =   563 instructions ( 1390 byte)

	end
