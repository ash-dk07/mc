
 ; program for DAC using port 3 of 89c51rd2V3,to generate SQUARE wave o.k.
; using AD_DA card (new)

ORG     0000H
SJMP    0030H

ORG     0030H  


START:	MOV TMOD,#01H		;TIMER 0 , MODE 1
BACK:	MOV P2,#0FFH		;TRANSFER MAX VALUE(HIGH LEVEL) AT PORT
		ACALL DELAY
		MOV P2,#00H			;TRANSFER MIN VALUE(LOW LEVEL) AT PORT		
		ACALL DELAY
		SJMP BACK
DELAY:	MOV TH0,#0b7H
		MOV TL0,#00H
		SETB TR0
HERE:	JNB TF0,HERE
		CLR TR0
		CLR TF0
		RET
		
		END