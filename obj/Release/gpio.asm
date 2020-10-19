;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"gpio.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TRISE
	extern	_TRISD
	extern	_TRISC
	extern	_TRISB
	extern	_TRISA
	extern	_PORTE
	extern	_PORTD
	extern	_PORTC
	extern	_PORTB
	extern	_PORTA

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
	global	_GPIO_InitPortPin
	global	_GPIO_InitPort
	global	_GPIO_Update
	global	_GPIO_SetPortPinState
	global	_GPIO_SetPortState
	global	_GPIO_GetPortPinState

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_gpio_0	udata
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x100D	res	1
r0x100F	res	1
r0x100E	res	1
r0x1010	res	1
r0x1011	res	1
r0x1000	res	1
r0x1001	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
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
code_gpio	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;; Starting pCode block
S_gpio__GPIO_GetPortPinState	code
_GPIO_GetPortPinState:
; 2 exit points
;	.line	87; "gpio.c"	unsigned char GPIO_GetPortPinState(tPort port, unsigned char pin)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	89; "gpio.c"	unsigned char ret = 0;
	CLRF	r0x1002
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x5=5), size=1
;	.line	91; "gpio.c"	switch(port)
	MOVLW	0x05
	SUBWF	r0x1000,W
	BTFSC	STATUS,0
	GOTO	_00234_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00242_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00242_DS_
	BANKSEL	r0x1000
	ADDWF	r0x1000,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00242_DS_:
	GOTO	_00229_DS_
	GOTO	_00230_DS_
	GOTO	_00231_DS_
	GOTO	_00232_DS_
	GOTO	_00233_DS_
_00229_DS_:
;	.line	94; "gpio.c"	ret =  READ_REGISTER_PIN(PORTA, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00244_DS_
_00243_DS_:
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00243_DS_
_00244_DS_:
	BANKSEL	_PORTA
	MOVF	_PORTA,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00246_DS_
_00245_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00245_DS_
_00246_DS_:
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	95; "gpio.c"	break;
	GOTO	_00234_DS_
_00230_DS_:
;	.line	98; "gpio.c"	ret =  READ_REGISTER_PIN(PORTB, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00248_DS_
_00247_DS_:
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00247_DS_
_00248_DS_:
	BANKSEL	_PORTB
	MOVF	_PORTB,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00250_DS_
_00249_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00249_DS_
_00250_DS_:
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	99; "gpio.c"	break;
	GOTO	_00234_DS_
_00231_DS_:
;	.line	102; "gpio.c"	ret =  READ_REGISTER_PIN(PORTC, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00252_DS_
_00251_DS_:
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00251_DS_
_00252_DS_:
	BANKSEL	_PORTC
	MOVF	_PORTC,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00254_DS_
_00253_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00253_DS_
_00254_DS_:
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	103; "gpio.c"	break;
	GOTO	_00234_DS_
_00232_DS_:
;	.line	107; "gpio.c"	ret =  READ_REGISTER_PIN(PORTD, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00256_DS_
_00255_DS_:
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00255_DS_
_00256_DS_:
	BANKSEL	_PORTD
	MOVF	_PORTD,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00258_DS_
_00257_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00257_DS_
_00258_DS_:
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	108; "gpio.c"	break;
	GOTO	_00234_DS_
_00233_DS_:
;	.line	111; "gpio.c"	ret =  READ_REGISTER_PIN(PORTE, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00260_DS_
_00259_DS_:
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00259_DS_
_00260_DS_:
	BANKSEL	_PORTE
	MOVF	_PORTE,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00262_DS_
_00261_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00261_DS_
_00262_DS_:
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
_00234_DS_:
;	.line	116; "gpio.c"	return ret;
	BANKSEL	r0x1002
	MOVF	r0x1002,W
;	.line	117; "gpio.c"	}
	RETURN	
; exit point of _GPIO_GetPortPinState

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;9 compiler assigned registers:
;   r0x100B
;   STK00
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   STK01
;; Starting pCode block
S_gpio__GPIO_SetPortState	code
_GPIO_SetPortState:
; 2 exit points
;	.line	77; "gpio.c"	void GPIO_SetPortState(tPort port, unsigned char state)
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	STK00,W
	MOVWF	r0x100C
;	.line	81; "gpio.c"	for (i = 0; i < 8; i++)
	CLRF	r0x100D
_00212_DS_:
;	.line	83; "gpio.c"	GPIO_SetPortPinState(port, i, READ_REGISTER_PIN(state, i));
	MOVLW	0x00
	BANKSEL	r0x100E
	MOVWF	r0x100E
	MOVLW	0x01
	MOVWF	r0x100F
	MOVF	r0x100D,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00222_DS_
_00221_DS_:
	BANKSEL	r0x100F
	RLF	r0x100F,F
	RLF	r0x100E,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00221_DS_
;;104	MOVF	r0x100C,W
_00222_DS_:
	BANKSEL	r0x1011
	CLRF	r0x1011
;;103	MOVF	r0x1010,W
	MOVF	r0x100C,W
	MOVWF	r0x1010
	ANDWF	r0x100F,F
	MOVLW	0x00
	ANDWF	r0x100E,F
	MOVF	r0x100E,W
	MOVWF	r0x1011
	MOVF	r0x100F,W
	MOVWF	r0x1010
	MOVF	r0x100D,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00224_DS_
_00223_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1011
	BTFSC	r0x1011,7
	BSF	STATUS,0
	RRF	r0x1011,F
	RRF	r0x1010,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00223_DS_
_00224_DS_:
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	MOVWF	r0x100F
	MOVWF	STK01
	MOVF	r0x100D,W
	MOVWF	STK00
	MOVF	r0x100B,W
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	81; "gpio.c"	for (i = 0; i < 8; i++)
	BANKSEL	r0x100D
	INCF	r0x100D,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVLW	0x08
	SUBWF	r0x100D,W
	BTFSS	STATUS,0
	GOTO	_00212_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
;	.line	85; "gpio.c"	}
	RETURN	
; exit point of _GPIO_SetPortState

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;   STK01
;   r0x1008
;   r0x1009
;   r0x100A
;; Starting pCode block
S_gpio__GPIO_SetPortPinState	code
_GPIO_SetPortPinState:
; 2 exit points
;	.line	51; "gpio.c"	void GPIO_SetPortPinState(tPort port, unsigned char pin, unsigned char state)
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1007
	MOVF	STK01,W
	MOVWF	r0x1008
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x5=5), size=1
;	.line	53; "gpio.c"	switch(port)
	MOVLW	0x05
	SUBWF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00176_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00176_DS_
	BANKSEL	r0x1006
	ADDWF	r0x1006,W
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00002_DS_:
	MOVWF	PCL
_00176_DS_:
	GOTO	_00163_DS_
	GOTO	_00164_DS_
	GOTO	_00165_DS_
	GOTO	_00166_DS_
	GOTO	_00167_DS_
_00163_DS_:
;	.line	56; "gpio.c"	SET_REGISTER_PIN(PORTA, pin, state);
	BANKSEL	r0x1007
;;120	MOVF	r0x1007,W
	MOVLW	0x01
	MOVWF	r0x1009
;;119	MOVF	r0x1006,W
	MOVF	r0x1007,W
	MOVWF	r0x1006
	BTFSC	r0x1006,7
	GOTO	_00180_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00178_DS_
_00177_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00177_DS_
	GOTO	_00178_DS_
_00180_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1009
	BTFSC	r0x1009,7
	BSF	STATUS,0
	RRF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00180_DS_
_00178_DS_:
	BANKSEL	r0x1009
	COMF	r0x1009,W
	MOVWF	r0x1006
	BANKSEL	_PORTA
	MOVF	_PORTA,W
	BANKSEL	r0x1009
	MOVWF	r0x1009
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00182_DS_
_00181_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00181_DS_
_00182_DS_:
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	MOVWF	r0x100A
	IORWF	r0x1006,W
	BANKSEL	_PORTA
	MOVWF	_PORTA
;	.line	57; "gpio.c"	break;
	GOTO	_00169_DS_
;;116	MOVF	r0x1007,W
_00164_DS_:
;	.line	60; "gpio.c"	SET_REGISTER_PIN(PORTB, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1009
	MOVWF	r0x1009
;;115	MOVF	r0x1006,W
	MOVF	r0x1007,W
	MOVWF	r0x1006
	BTFSC	r0x1006,7
	GOTO	_00186_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00184_DS_
_00183_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00183_DS_
	GOTO	_00184_DS_
_00186_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1009
	BTFSC	r0x1009,7
	BSF	STATUS,0
	RRF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00186_DS_
_00184_DS_:
	BANKSEL	r0x1009
	COMF	r0x1009,W
	MOVWF	r0x1006
	BANKSEL	_PORTB
	MOVF	_PORTB,W
	BANKSEL	r0x1009
	MOVWF	r0x1009
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00188_DS_
_00187_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00187_DS_
_00188_DS_:
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	MOVWF	r0x100A
	IORWF	r0x1006,W
	BANKSEL	_PORTB
	MOVWF	_PORTB
;	.line	61; "gpio.c"	break;
	GOTO	_00169_DS_
;;112	MOVF	r0x1007,W
_00165_DS_:
;	.line	64; "gpio.c"	SET_REGISTER_PIN(PORTC, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1009
	MOVWF	r0x1009
;;111	MOVF	r0x1006,W
	MOVF	r0x1007,W
	MOVWF	r0x1006
	BTFSC	r0x1006,7
	GOTO	_00192_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00190_DS_
_00189_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00189_DS_
	GOTO	_00190_DS_
_00192_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1009
	BTFSC	r0x1009,7
	BSF	STATUS,0
	RRF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00192_DS_
_00190_DS_:
	BANKSEL	r0x1009
	COMF	r0x1009,W
	MOVWF	r0x1006
	BANKSEL	_PORTC
	MOVF	_PORTC,W
	BANKSEL	r0x1009
	MOVWF	r0x1009
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00194_DS_
_00193_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00193_DS_
_00194_DS_:
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	MOVWF	r0x100A
	IORWF	r0x1006,W
	BANKSEL	_PORTC
	MOVWF	_PORTC
;	.line	65; "gpio.c"	break;
	GOTO	_00169_DS_
;;108	MOVF	r0x1007,W
_00166_DS_:
;	.line	68; "gpio.c"	SET_REGISTER_PIN(PORTD, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1009
	MOVWF	r0x1009
;;107	MOVF	r0x1006,W
	MOVF	r0x1007,W
	MOVWF	r0x1006
	BTFSC	r0x1006,7
	GOTO	_00198_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00196_DS_
_00195_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00195_DS_
	GOTO	_00196_DS_
_00198_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1009
	BTFSC	r0x1009,7
	BSF	STATUS,0
	RRF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00198_DS_
_00196_DS_:
	BANKSEL	r0x1009
	COMF	r0x1009,W
	MOVWF	r0x1006
	BANKSEL	_PORTD
	MOVF	_PORTD,W
	BANKSEL	r0x1009
	MOVWF	r0x1009
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00200_DS_
_00199_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00199_DS_
_00200_DS_:
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	MOVWF	r0x100A
	IORWF	r0x1006,W
	BANKSEL	_PORTD
	MOVWF	_PORTD
;	.line	69; "gpio.c"	break;
	GOTO	_00169_DS_
;;102	MOVF	r0x1007,W
_00167_DS_:
;	.line	72; "gpio.c"	SET_REGISTER_PIN(PORTE, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1009
	MOVWF	r0x1009
;;101	MOVF	r0x1006,W
	MOVF	r0x1007,W
	MOVWF	r0x1006
	BTFSC	r0x1006,7
	GOTO	_00204_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00202_DS_
_00201_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00201_DS_
	GOTO	_00202_DS_
_00204_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1009
	BTFSC	r0x1009,7
	BSF	STATUS,0
	RRF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00204_DS_
_00202_DS_:
	BANKSEL	r0x1009
	COMF	r0x1009,W
	MOVWF	r0x1006
	BANKSEL	_PORTE
	MOVF	_PORTE,W
	BANKSEL	r0x1009
	MOVWF	r0x1009
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00206_DS_
_00205_DS_:
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00205_DS_
_00206_DS_:
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	MOVWF	r0x1007
	IORWF	r0x1006,W
	BANKSEL	_PORTE
	MOVWF	_PORTE
_00169_DS_:
;	.line	75; "gpio.c"	}
	RETURN	
; exit point of _GPIO_SetPortPinState

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_gpio__GPIO_Update	code
_GPIO_Update:
; 2 exit points
;	.line	48; "gpio.c"	{ /* Should do nothing */ }
	RETURN	
; exit point of _GPIO_Update

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;5 compiler assigned registers:
;   r0x1017
;   STK00
;   r0x1018
;   r0x1019
;   STK01
;; Starting pCode block
S_gpio__GPIO_InitPort	code
_GPIO_InitPort:
; 2 exit points
;	.line	37; "gpio.c"	void GPIO_InitPort(tPort port, tPortDirection direction)
	BANKSEL	r0x1017
	MOVWF	r0x1017
	MOVF	STK00,W
	MOVWF	r0x1018
;	.line	41; "gpio.c"	for (i = 0; i < 8; i++)
	CLRF	r0x1019
_00154_DS_:
;	.line	43; "gpio.c"	GPIO_InitPortPin(port, i, direction);
	BANKSEL	r0x1018
	MOVF	r0x1018,W
	MOVWF	STK01
	MOVF	r0x1019,W
	MOVWF	STK00
	MOVF	r0x1017,W
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	41; "gpio.c"	for (i = 0; i < 8; i++)
	BANKSEL	r0x1019
	INCF	r0x1019,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVLW	0x08
	SUBWF	r0x1019,W
	BTFSS	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
;	.line	45; "gpio.c"	}
	RETURN	
; exit point of _GPIO_InitPort

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;   STK01
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting pCode block
S_gpio__GPIO_InitPortPin	code
_GPIO_InitPortPin:
; 2 exit points
;	.line	9; "gpio.c"	void GPIO_InitPortPin(tPort port, unsigned char pin, tPortDirection direction)
	BANKSEL	r0x1012
	MOVWF	r0x1012
	MOVF	STK00,W
	MOVWF	r0x1013
	MOVF	STK01,W
	MOVWF	r0x1014
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x5=5), size=1
;	.line	11; "gpio.c"	switch(port)
	MOVLW	0x05
	SUBWF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00118_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00118_DS_
	BANKSEL	r0x1012
	ADDWF	r0x1012,W
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00003_DS_:
	MOVWF	PCL
_00118_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
_00105_DS_:
;	.line	14; "gpio.c"	SET_REGISTER_PIN(TRISA, pin, direction);
	BANKSEL	r0x1013
;;118	MOVF	r0x1013,W
	MOVLW	0x01
	MOVWF	r0x1015
;;117	MOVF	r0x1012,W
	MOVF	r0x1013,W
	MOVWF	r0x1012
	BTFSC	r0x1012,7
	GOTO	_00122_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00120_DS_
_00119_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00119_DS_
	GOTO	_00120_DS_
_00122_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1015
	BTFSC	r0x1015,7
	BSF	STATUS,0
	RRF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00122_DS_
_00120_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1012
	BANKSEL	_TRISA
	MOVF	_TRISA,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDWF	r0x1012,F
	MOVF	r0x1014,W
	MOVWF	r0x1015
	MOVF	r0x1013,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00124_DS_
_00123_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00123_DS_
_00124_DS_:
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	MOVWF	r0x1016
	IORWF	r0x1012,W
	BANKSEL	_TRISA
	MOVWF	_TRISA
;	.line	15; "gpio.c"	break;
	GOTO	_00111_DS_
;;114	MOVF	r0x1013,W
_00106_DS_:
;	.line	18; "gpio.c"	SET_REGISTER_PIN(TRISB, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1015
	MOVWF	r0x1015
;;113	MOVF	r0x1012,W
	MOVF	r0x1013,W
	MOVWF	r0x1012
	BTFSC	r0x1012,7
	GOTO	_00128_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00126_DS_
_00125_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00125_DS_
	GOTO	_00126_DS_
_00128_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1015
	BTFSC	r0x1015,7
	BSF	STATUS,0
	RRF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00128_DS_
_00126_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1012
	BANKSEL	_TRISB
	MOVF	_TRISB,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDWF	r0x1012,F
	MOVF	r0x1014,W
	MOVWF	r0x1015
	MOVF	r0x1013,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00130_DS_
_00129_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00129_DS_
_00130_DS_:
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	MOVWF	r0x1016
	IORWF	r0x1012,W
	BANKSEL	_TRISB
	MOVWF	_TRISB
;	.line	19; "gpio.c"	break;
	GOTO	_00111_DS_
;;110	MOVF	r0x1013,W
_00107_DS_:
;	.line	22; "gpio.c"	SET_REGISTER_PIN(TRISC, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1015
	MOVWF	r0x1015
;;109	MOVF	r0x1012,W
	MOVF	r0x1013,W
	MOVWF	r0x1012
	BTFSC	r0x1012,7
	GOTO	_00134_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00132_DS_
_00131_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00131_DS_
	GOTO	_00132_DS_
_00134_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1015
	BTFSC	r0x1015,7
	BSF	STATUS,0
	RRF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00134_DS_
_00132_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1012
	BANKSEL	_TRISC
	MOVF	_TRISC,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDWF	r0x1012,F
	MOVF	r0x1014,W
	MOVWF	r0x1015
	MOVF	r0x1013,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00136_DS_
_00135_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00135_DS_
_00136_DS_:
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	MOVWF	r0x1016
	IORWF	r0x1012,W
	BANKSEL	_TRISC
	MOVWF	_TRISC
;	.line	23; "gpio.c"	break;
	GOTO	_00111_DS_
;;106	MOVF	r0x1013,W
_00108_DS_:
;	.line	26; "gpio.c"	SET_REGISTER_PIN(TRISD, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1015
	MOVWF	r0x1015
;;105	MOVF	r0x1012,W
	MOVF	r0x1013,W
	MOVWF	r0x1012
	BTFSC	r0x1012,7
	GOTO	_00140_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00138_DS_
_00137_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00137_DS_
	GOTO	_00138_DS_
_00140_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1015
	BTFSC	r0x1015,7
	BSF	STATUS,0
	RRF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00140_DS_
_00138_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1012
	BANKSEL	_TRISD
	MOVF	_TRISD,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDWF	r0x1012,F
	MOVF	r0x1014,W
	MOVWF	r0x1015
	MOVF	r0x1013,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00142_DS_
_00141_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00141_DS_
_00142_DS_:
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	MOVWF	r0x1016
	IORWF	r0x1012,W
	BANKSEL	_TRISD
	MOVWF	_TRISD
;	.line	27; "gpio.c"	break;
	GOTO	_00111_DS_
;;100	MOVF	r0x1013,W
_00109_DS_:
;	.line	30; "gpio.c"	SET_REGISTER_PIN(TRISE, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1015
	MOVWF	r0x1015
;;99	MOVF	r0x1012,W
	MOVF	r0x1013,W
	MOVWF	r0x1012
	BTFSC	r0x1012,7
	GOTO	_00146_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00144_DS_
_00143_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00143_DS_
	GOTO	_00144_DS_
_00146_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1015
	BTFSC	r0x1015,7
	BSF	STATUS,0
	RRF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00146_DS_
_00144_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1012
	BANKSEL	_TRISE
	MOVF	_TRISE,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDWF	r0x1012,F
	MOVF	r0x1014,W
	MOVWF	r0x1015
	MOVF	r0x1013,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00148_DS_
_00147_DS_:
	BANKSEL	r0x1015
	RLF	r0x1015,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00147_DS_
_00148_DS_:
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	MOVWF	r0x1013
	IORWF	r0x1012,W
	BANKSEL	_TRISE
	MOVWF	_TRISE
_00111_DS_:
;	.line	35; "gpio.c"	}
	RETURN	
; exit point of _GPIO_InitPortPin


;	code size estimation:
;	  740+  147 =   887 instructions ( 2068 byte)

	end