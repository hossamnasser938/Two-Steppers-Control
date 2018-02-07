
_main:

;CNC.c,40 :: 		void main() {
;CNC.c,42 :: 		TRISD  = 0;        //motors are connected on PortD
	CLRF        TRISD+0 
;CNC.c,43 :: 		PORTD  = 0;
	CLRF        PORTD+0 
;CNC.c,44 :: 		TRISB  = 0;       //Leds are connected on PortD
	CLRF        TRISB+0 
;CNC.c,45 :: 		PORTB  = 0b00100100;       //Red Led is on until motor starts
	MOVLW       36
	MOVWF       PORTB+0 
;CNC.c,47 :: 		T0CON = 0b10000011;      //Timer0 configurations(used to check for stop)
	MOVLW       131
	MOVWF       T0CON+0 
;CNC.c,48 :: 		TMR0L = 0x2C;
	MOVLW       44
	MOVWF       TMR0L+0 
;CNC.c,49 :: 		TMR0H = 0xCF;
	MOVLW       207
	MOVWF       TMR0H+0 
;CNC.c,51 :: 		INTCON.GIE = 1;         //Interrupt enabling
	BSF         INTCON+0, 7 
;CNC.c,52 :: 		INTCON.PEIE = 0;
	BCF         INTCON+0, 6 
;CNC.c,54 :: 		UART1_Init(9600);      //Initialize Uart with 9600 baud rate
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;CNC.c,55 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;CNC.c,57 :: 		while(1)
L_main1:
;CNC.c,60 :: 		while(UART1_Data_Ready() != 1);        //wait for start or Stop action
L_main3:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;CNC.c,62 :: 		UART1_Read_Text(recievedAction , "!ok" , 10);       //get action
	MOVLW       _recievedAction+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_recievedAction+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr1_CNC+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr1_CNC+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       10
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;CNC.c,64 :: 		if(strcmp(recievedAction , "Start1") == 0)      //if the action is start
	MOVLW       _recievedAction+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_recievedAction+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr2_CNC+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr2_CNC+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVLW       0
	XORWF       R0, 0 
L__main129:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;CNC.c,67 :: 		PORTb.f2 = 0;       //Turn Red led off
	BCF         PORTB+0, 2 
;CNC.c,69 :: 		getStepper1Settings();
	CALL        _getStepper1Settings+0, 0
;CNC.c,71 :: 		if(strcmp(stepper1Direction , "CW") == 0)        //if direction is clockwise
	MOVLW       _stepper1Direction+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_stepper1Direction+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr3_CNC+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr3_CNC+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main130
	MOVLW       0
	XORWF       R0, 0 
L__main130:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;CNC.c,73 :: 		portb.f0 = 1;      //Turn on green led
	BSF         PORTB+0, 0 
;CNC.c,74 :: 		stepper1StartClockWise();
	CALL        _stepper1StartClockWise+0, 0
;CNC.c,75 :: 		PORTb.f0 = 0;      //Turn off green led after finishing
	BCF         PORTB+0, 0 
;CNC.c,76 :: 		}
	GOTO        L_main7
L_main6:
;CNC.c,77 :: 		else if(strcmp(stepper1Direction , "CCW") == 0)        //if direction is counter clockwise
	MOVLW       _stepper1Direction+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_stepper1Direction+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr4_CNC+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr4_CNC+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVLW       0
	XORWF       R0, 0 
L__main131:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;CNC.c,79 :: 		portb.f1 = 1;        //Turn on yellow led
	BSF         PORTB+0, 1 
;CNC.c,80 :: 		stepper1StartCounterClockWise();
	CALL        _stepper1StartCounterClockWise+0, 0
;CNC.c,81 :: 		PORTb.f1 = 0;       //Turn off yellow led after finishing
	BCF         PORTB+0, 1 
;CNC.c,82 :: 		}
L_main8:
L_main7:
;CNC.c,84 :: 		INTCON.TMR0IE = 0;    //Disable interrupt until a new start comes from PC
	BCF         INTCON+0, 5 
;CNC.c,86 :: 		}
	GOTO        L_main9
L_main5:
;CNC.c,87 :: 		else if(strcmp(recievedAction , "Start2") == 0)      //if the action is start
	MOVLW       _recievedAction+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_recievedAction+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr5_CNC+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr5_CNC+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVLW       0
	XORWF       R0, 0 
L__main132:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;CNC.c,89 :: 		PORTb.f5 = 0;       //Turn Red led off
	BCF         PORTB+0, 5 
;CNC.c,91 :: 		getStepper2Settings();
	CALL        _getStepper2Settings+0, 0
;CNC.c,93 :: 		if(strcmp(stepper2Direction , "CW") == 0)        //if direction is clockwise
	MOVLW       _stepper2Direction+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_stepper2Direction+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr6_CNC+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr6_CNC+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVLW       0
	XORWF       R0, 0 
L__main133:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;CNC.c,95 :: 		portb.f3 = 1;      //Turn on green led
	BSF         PORTB+0, 3 
;CNC.c,96 :: 		stepper2StartClockWise();
	CALL        _stepper2StartClockWise+0, 0
;CNC.c,97 :: 		PORTb.f3 = 0;      //Turn off green led after finishing
	BCF         PORTB+0, 3 
;CNC.c,98 :: 		}
	GOTO        L_main12
L_main11:
;CNC.c,99 :: 		else if(strcmp(stepper1Direction , "CCW") == 0)        //if direction is counter clockwise
	MOVLW       _stepper1Direction+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_stepper1Direction+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr7_CNC+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr7_CNC+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVLW       0
	XORWF       R0, 0 
L__main134:
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;CNC.c,101 :: 		portb.f4 = 1;        //Turn on yellow led
	BSF         PORTB+0, 4 
;CNC.c,102 :: 		stepper2StartCounterClockWise();
	CALL        _stepper2StartCounterClockWise+0, 0
;CNC.c,103 :: 		PORTb.f4 = 0;       //Turn off yellow led after finishing
	BCF         PORTB+0, 4 
;CNC.c,104 :: 		}
L_main13:
L_main12:
;CNC.c,106 :: 		INTCON.TMR0IE = 0;    //Disable interrupt until a new start comes from PC
	BCF         INTCON+0, 5 
;CNC.c,107 :: 		}
	GOTO        L_main14
L_main10:
;CNC.c,108 :: 		else if(strcmp(recievedAction , "Start12") == 0)      //if the action is start
	MOVLW       _recievedAction+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_recievedAction+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr8_CNC+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr8_CNC+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main135
	MOVLW       0
	XORWF       R0, 0 
L__main135:
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;CNC.c,110 :: 		}
L_main15:
L_main14:
L_main9:
;CNC.c,112 :: 		}       //end while
	GOTO        L_main1
;CNC.c,114 :: 		}//end main
L_end_main:
	GOTO        $+0
; end of _main

_stepper1Step12:

;CNC.c,116 :: 		void stepper1Step12()
;CNC.c,118 :: 		writeToStepper1(0b00000011);      //activating the first and second coils ... south and east so that the rolling part moves clock wisely
	MOVLW       3
	MOVWF       FARG_writeToStepper1+0 
	CALL        _writeToStepper1+0, 0
;CNC.c,119 :: 		Uart1_Write_Text("Increment1");    //increment progress bar
	MOVLW       ?lstr9_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,120 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,121 :: 		stepper1LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper1LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper1LastStepDone+1 
;CNC.c,122 :: 		VDelay_ms(stepper1Speed);
	MOVF        _stepper1Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper1Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,123 :: 		}
L_end_stepper1Step12:
	RETURN      0
; end of _stepper1Step12

_stepper1Step23:

;CNC.c,125 :: 		void stepper1Step23()
;CNC.c,127 :: 		writeToStepper1(0b00000110);     //activating the second and third coils for the similar reason
	MOVLW       6
	MOVWF       FARG_writeToStepper1+0 
	CALL        _writeToStepper1+0, 0
;CNC.c,128 :: 		Uart1_Write_Text("Increment1");    //increment progress bar
	MOVLW       ?lstr10_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,129 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,130 :: 		stepper1LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper1LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper1LastStepDone+1 
;CNC.c,131 :: 		VDelay_ms(stepper1Speed);
	MOVF        _stepper1Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper1Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,132 :: 		}
L_end_stepper1Step23:
	RETURN      0
; end of _stepper1Step23

_stepper1Step34:

;CNC.c,134 :: 		void stepper1Step34()
;CNC.c,136 :: 		writeToStepper1(0b00001100);      //third and forth coils
	MOVLW       12
	MOVWF       FARG_writeToStepper1+0 
	CALL        _writeToStepper1+0, 0
;CNC.c,137 :: 		Uart1_Write_Text("Increment1");    //increment progress bar
	MOVLW       ?lstr11_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,138 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,139 :: 		stepper1LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper1LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper1LastStepDone+1 
;CNC.c,140 :: 		VDelay_ms(stepper1Speed);
	MOVF        _stepper1Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper1Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,141 :: 		}
L_end_stepper1Step34:
	RETURN      0
; end of _stepper1Step34

_stepper1Step41:

;CNC.c,143 :: 		void stepper1Step41()
;CNC.c,145 :: 		writeToStepper1(0b00001001);       //forth and first
	MOVLW       9
	MOVWF       FARG_writeToStepper1+0 
	CALL        _writeToStepper1+0, 0
;CNC.c,146 :: 		Uart1_Write_Text("Increment1");    //increment progress bar
	MOVLW       ?lstr12_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,147 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,148 :: 		stepper1LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper1LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper1LastStepDone+1 
;CNC.c,149 :: 		VDelay_ms(stepper1Speed);
	MOVF        _stepper1Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper1Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,150 :: 		}
L_end_stepper1Step41:
	RETURN      0
; end of _stepper1Step41

_stepper2Step12:

;CNC.c,153 :: 		void stepper2Step12()
;CNC.c,155 :: 		writeToStepper2(0b00110000);      //activating the first and second coils ... south and east so that the rolling part moves clock wisely
	MOVLW       48
	MOVWF       FARG_writeToStepper2+0 
	CALL        _writeToStepper2+0, 0
;CNC.c,156 :: 		Uart1_Write_Text("Increment2");    //increment progress bar
	MOVLW       ?lstr13_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,157 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,158 :: 		stepper2LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper2LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper2LastStepDone+1 
;CNC.c,159 :: 		VDelay_ms(stepper2Speed);
	MOVF        _stepper2Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper2Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,160 :: 		}
L_end_stepper2Step12:
	RETURN      0
; end of _stepper2Step12

_stepper2Step23:

;CNC.c,162 :: 		void stepper2Step23()
;CNC.c,164 :: 		writeToStepper2(0b01100000);     //activating the second and third coils for the similar reason
	MOVLW       96
	MOVWF       FARG_writeToStepper2+0 
	CALL        _writeToStepper2+0, 0
;CNC.c,165 :: 		Uart1_Write_Text("Increment2");    //increment progress bar
	MOVLW       ?lstr14_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,166 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,167 :: 		stepper2LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper2LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper2LastStepDone+1 
;CNC.c,168 :: 		VDelay_ms(stepper2Speed);
	MOVF        _stepper2Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper2Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,169 :: 		}
L_end_stepper2Step23:
	RETURN      0
; end of _stepper2Step23

_stepper2Step34:

;CNC.c,171 :: 		void stepper2Step34()
;CNC.c,173 :: 		writeToStepper2(0b11000000);      //third and forth coils
	MOVLW       192
	MOVWF       FARG_writeToStepper2+0 
	CALL        _writeToStepper2+0, 0
;CNC.c,174 :: 		Uart1_Write_Text("Increment2");    //increment progress bar
	MOVLW       ?lstr15_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,175 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,176 :: 		stepper2LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper2LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper2LastStepDone+1 
;CNC.c,177 :: 		VDelay_ms(stepper2Speed);
	MOVF        _stepper2Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper2Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,178 :: 		}
L_end_stepper2Step34:
	RETURN      0
; end of _stepper2Step34

_stepper2Step41:

;CNC.c,180 :: 		void stepper2Step41()
;CNC.c,182 :: 		writeToStepper2(0b10010000);       //forth and first
	MOVLW       144
	MOVWF       FARG_writeToStepper2+0 
	CALL        _writeToStepper2+0, 0
;CNC.c,183 :: 		Uart1_Write_Text("Increment2");    //increment progress bar
	MOVLW       ?lstr16_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,184 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,185 :: 		stepper2LastStepDone = 1;
	MOVLW       1
	MOVWF       _stepper2LastStepDone+0 
	MOVLW       0
	MOVWF       _stepper2LastStepDone+1 
;CNC.c,186 :: 		VDelay_ms(stepper2Speed);
	MOVF        _stepper2Speed+0, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+0 
	MOVF        _stepper2Speed+1, 0 
	MOVWF       FARG_VDelay_ms_Time_ms+1 
	CALL        _VDelay_ms+0, 0
;CNC.c,187 :: 		}
L_end_stepper2Step41:
	RETURN      0
; end of _stepper2Step41

_stepper1StartClockWise:

;CNC.c,190 :: 		void stepper1StartClockWise()
;CNC.c,194 :: 		INTCON.TMR0IE = 1;     //Enable interrup checking for stop
	BSF         INTCON+0, 5 
;CNC.c,196 :: 		for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded  ; i++)
	MOVF        _stepper1LastStepDone+0, 0 
	MOVWF       stepper1StartClockWise_i_L0+0 
	MOVF        _stepper1LastStepDone+1, 0 
	MOVWF       stepper1StartClockWise_i_L0+1 
	MOVF        _stepper1LastStepDone+0, 0 
	ADDWF       _stepper1Steps+0, 0 
	MOVWF       stepper1StartClockWise_stepsNeeded_L0+0 
	MOVF        _stepper1LastStepDone+1, 0 
	ADDWFC      _stepper1Steps+1, 0 
	MOVWF       stepper1StartClockWise_stepsNeeded_L0+1 
L_stepper1StartClockWise16:
	MOVLW       128
	XORWF       stepper1StartClockWise_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       stepper1StartClockWise_stepsNeeded_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartClockWise145
	MOVF        stepper1StartClockWise_stepsNeeded_L0+0, 0 
	SUBWF       stepper1StartClockWise_i_L0+0, 0 
L__stepper1StartClockWise145:
	BTFSC       STATUS+0, 0 
	GOTO        L_stepper1StartClockWise17
;CNC.c,198 :: 		if(i % 4 == 0 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartClockWise146
	MOVLW       0
	XORWF       R0, 0 
L__stepper1StartClockWise146:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartClockWise21
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartClockWise21
L__stepper1StartClockWise115:
;CNC.c,200 :: 		stepper1Step12();
	CALL        _stepper1Step12+0, 0
;CNC.c,201 :: 		}
	GOTO        L_stepper1StartClockWise22
L_stepper1StartClockWise21:
;CNC.c,202 :: 		else if(i % 4 == 1 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartClockWise147
	MOVLW       1
	XORWF       R0, 0 
L__stepper1StartClockWise147:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartClockWise25
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartClockWise25
L__stepper1StartClockWise114:
;CNC.c,204 :: 		stepper1Step23();
	CALL        _stepper1Step23+0, 0
;CNC.c,205 :: 		}
	GOTO        L_stepper1StartClockWise26
L_stepper1StartClockWise25:
;CNC.c,206 :: 		else if(i % 4 == 2 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartClockWise148
	MOVLW       2
	XORWF       R0, 0 
L__stepper1StartClockWise148:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartClockWise29
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartClockWise29
L__stepper1StartClockWise113:
;CNC.c,208 :: 		stepper1Step34();
	CALL        _stepper1Step34+0, 0
;CNC.c,209 :: 		}
	GOTO        L_stepper1StartClockWise30
L_stepper1StartClockWise29:
;CNC.c,210 :: 		else if(i % 4 == 3 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartClockWise149
	MOVLW       3
	XORWF       R0, 0 
L__stepper1StartClockWise149:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartClockWise33
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartClockWise33
L__stepper1StartClockWise112:
;CNC.c,212 :: 		stepper1Step41();
	CALL        _stepper1Step41+0, 0
;CNC.c,213 :: 		}
	GOTO        L_stepper1StartClockWise34
L_stepper1StartClockWise33:
;CNC.c,216 :: 		return;
	GOTO        L_end_stepper1StartClockWise
;CNC.c,217 :: 		}
L_stepper1StartClockWise34:
L_stepper1StartClockWise30:
L_stepper1StartClockWise26:
L_stepper1StartClockWise22:
;CNC.c,196 :: 		for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded  ; i++)
	INFSNZ      stepper1StartClockWise_i_L0+0, 1 
	INCF        stepper1StartClockWise_i_L0+1, 1 
;CNC.c,219 :: 		}
	GOTO        L_stepper1StartClockWise16
L_stepper1StartClockWise17:
;CNC.c,221 :: 		Uart1_Write_Text("Finished1");       //Inform the pc that the motor has finished
	MOVLW       ?lstr17_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,222 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,224 :: 		}
L_end_stepper1StartClockWise:
	RETURN      0
; end of _stepper1StartClockWise

_stepper1StartCounterClockWise:

;CNC.c,226 :: 		void stepper1StartCounterClockWise()
;CNC.c,230 :: 		stepper1LastStepDone = getProperLastStepForCCW(stepper1LastStepDone);
	MOVF        _stepper1LastStepDone+0, 0 
	MOVWF       FARG_getProperLastStepForCCW+0 
	MOVF        _stepper1LastStepDone+1, 0 
	MOVWF       FARG_getProperLastStepForCCW+1 
	CALL        _getProperLastStepForCCW+0, 0
	MOVF        R0, 0 
	MOVWF       _stepper1LastStepDone+0 
	MOVF        R1, 0 
	MOVWF       _stepper1LastStepDone+1 
;CNC.c,231 :: 		INTCON.TMR0IE = 1;          //Enable interrup checking for stop
	BSF         INTCON+0, 5 
;CNC.c,233 :: 		for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded  ; i++)
	MOVF        R0, 0 
	MOVWF       stepper1StartCounterClockWise_i_L0+0 
	MOVF        R1, 0 
	MOVWF       stepper1StartCounterClockWise_i_L0+1 
	MOVF        R0, 0 
	ADDWF       _stepper1Steps+0, 0 
	MOVWF       stepper1StartCounterClockWise_stepsNeeded_L0+0 
	MOVF        R1, 0 
	ADDWFC      _stepper1Steps+1, 0 
	MOVWF       stepper1StartCounterClockWise_stepsNeeded_L0+1 
L_stepper1StartCounterClockWise35:
	MOVLW       128
	XORWF       stepper1StartCounterClockWise_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       stepper1StartCounterClockWise_stepsNeeded_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartCounterClockWise151
	MOVF        stepper1StartCounterClockWise_stepsNeeded_L0+0, 0 
	SUBWF       stepper1StartCounterClockWise_i_L0+0, 0 
L__stepper1StartCounterClockWise151:
	BTFSC       STATUS+0, 0 
	GOTO        L_stepper1StartCounterClockWise36
;CNC.c,235 :: 		if(i % 4 == 0 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartCounterClockWise152
	MOVLW       0
	XORWF       R0, 0 
L__stepper1StartCounterClockWise152:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartCounterClockWise40
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartCounterClockWise40
L__stepper1StartCounterClockWise119:
;CNC.c,237 :: 		stepper1Step41();
	CALL        _stepper1Step41+0, 0
;CNC.c,238 :: 		}
	GOTO        L_stepper1StartCounterClockWise41
L_stepper1StartCounterClockWise40:
;CNC.c,239 :: 		else if(i % 4 == 1 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartCounterClockWise153
	MOVLW       1
	XORWF       R0, 0 
L__stepper1StartCounterClockWise153:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartCounterClockWise44
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartCounterClockWise44
L__stepper1StartCounterClockWise118:
;CNC.c,241 :: 		stepper1Step34();
	CALL        _stepper1Step34+0, 0
;CNC.c,242 :: 		}
	GOTO        L_stepper1StartCounterClockWise45
L_stepper1StartCounterClockWise44:
;CNC.c,243 :: 		else if(i % 4 == 2 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartCounterClockWise154
	MOVLW       2
	XORWF       R0, 0 
L__stepper1StartCounterClockWise154:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartCounterClockWise48
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartCounterClockWise48
L__stepper1StartCounterClockWise117:
;CNC.c,245 :: 		stepper1Step23();
	CALL        _stepper1Step23+0, 0
;CNC.c,246 :: 		}
	GOTO        L_stepper1StartCounterClockWise49
L_stepper1StartCounterClockWise48:
;CNC.c,247 :: 		else if(i % 4 == 3 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper1StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper1StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper1StartCounterClockWise155
	MOVLW       3
	XORWF       R0, 0 
L__stepper1StartCounterClockWise155:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper1StartCounterClockWise52
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper1StartCounterClockWise52
L__stepper1StartCounterClockWise116:
;CNC.c,249 :: 		stepper1Step12();
	CALL        _stepper1Step12+0, 0
;CNC.c,250 :: 		}
	GOTO        L_stepper1StartCounterClockWise53
L_stepper1StartCounterClockWise52:
;CNC.c,253 :: 		return;
	GOTO        L_end_stepper1StartCounterClockWise
;CNC.c,254 :: 		}
L_stepper1StartCounterClockWise53:
L_stepper1StartCounterClockWise49:
L_stepper1StartCounterClockWise45:
L_stepper1StartCounterClockWise41:
;CNC.c,233 :: 		for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded  ; i++)
	INFSNZ      stepper1StartCounterClockWise_i_L0+0, 1 
	INCF        stepper1StartCounterClockWise_i_L0+1, 1 
;CNC.c,256 :: 		}
	GOTO        L_stepper1StartCounterClockWise35
L_stepper1StartCounterClockWise36:
;CNC.c,258 :: 		Uart1_Write_Text("Finished1");     //Inform the pc that the motor has finished
	MOVLW       ?lstr18_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr18_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,259 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,261 :: 		}
L_end_stepper1StartCounterClockWise:
	RETURN      0
; end of _stepper1StartCounterClockWise

_stepper2StartClockWise:

;CNC.c,264 :: 		void stepper2StartClockWise()
;CNC.c,268 :: 		INTCON.TMR0IE = 1;     //Enable interrup checking for stop
	BSF         INTCON+0, 5 
;CNC.c,270 :: 		for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded  ; i++)
	MOVF        _stepper2LastStepDone+0, 0 
	MOVWF       stepper2StartClockWise_i_L0+0 
	MOVF        _stepper2LastStepDone+1, 0 
	MOVWF       stepper2StartClockWise_i_L0+1 
	MOVF        _stepper2LastStepDone+0, 0 
	ADDWF       _stepper2Steps+0, 0 
	MOVWF       stepper2StartClockWise_stepsNeeded_L0+0 
	MOVF        _stepper2LastStepDone+1, 0 
	ADDWFC      _stepper2Steps+1, 0 
	MOVWF       stepper2StartClockWise_stepsNeeded_L0+1 
L_stepper2StartClockWise54:
	MOVLW       128
	XORWF       stepper2StartClockWise_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       stepper2StartClockWise_stepsNeeded_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartClockWise157
	MOVF        stepper2StartClockWise_stepsNeeded_L0+0, 0 
	SUBWF       stepper2StartClockWise_i_L0+0, 0 
L__stepper2StartClockWise157:
	BTFSC       STATUS+0, 0 
	GOTO        L_stepper2StartClockWise55
;CNC.c,272 :: 		if(i % 4 == 0 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartClockWise158
	MOVLW       0
	XORWF       R0, 0 
L__stepper2StartClockWise158:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartClockWise59
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartClockWise59
L__stepper2StartClockWise123:
;CNC.c,274 :: 		stepper2Step12();
	CALL        _stepper2Step12+0, 0
;CNC.c,275 :: 		}
	GOTO        L_stepper2StartClockWise60
L_stepper2StartClockWise59:
;CNC.c,276 :: 		else if(i % 4 == 1 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartClockWise159
	MOVLW       1
	XORWF       R0, 0 
L__stepper2StartClockWise159:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartClockWise63
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartClockWise63
L__stepper2StartClockWise122:
;CNC.c,278 :: 		stepper2Step23();
	CALL        _stepper2Step23+0, 0
;CNC.c,279 :: 		}
	GOTO        L_stepper2StartClockWise64
L_stepper2StartClockWise63:
;CNC.c,280 :: 		else if(i % 4 == 2 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartClockWise160
	MOVLW       2
	XORWF       R0, 0 
L__stepper2StartClockWise160:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartClockWise67
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartClockWise67
L__stepper2StartClockWise121:
;CNC.c,282 :: 		stepper2Step34();
	CALL        _stepper2Step34+0, 0
;CNC.c,283 :: 		}
	GOTO        L_stepper2StartClockWise68
L_stepper2StartClockWise67:
;CNC.c,284 :: 		else if(i % 4 == 3 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartClockWise161
	MOVLW       3
	XORWF       R0, 0 
L__stepper2StartClockWise161:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartClockWise71
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartClockWise71
L__stepper2StartClockWise120:
;CNC.c,286 :: 		stepper2Step41();
	CALL        _stepper2Step41+0, 0
;CNC.c,287 :: 		}
	GOTO        L_stepper2StartClockWise72
L_stepper2StartClockWise71:
;CNC.c,290 :: 		return;
	GOTO        L_end_stepper2StartClockWise
;CNC.c,291 :: 		}
L_stepper2StartClockWise72:
L_stepper2StartClockWise68:
L_stepper2StartClockWise64:
L_stepper2StartClockWise60:
;CNC.c,270 :: 		for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded  ; i++)
	INFSNZ      stepper2StartClockWise_i_L0+0, 1 
	INCF        stepper2StartClockWise_i_L0+1, 1 
;CNC.c,293 :: 		}
	GOTO        L_stepper2StartClockWise54
L_stepper2StartClockWise55:
;CNC.c,295 :: 		Uart1_Write_Text("Finished2");       //Inform the pc that the motor has finished
	MOVLW       ?lstr19_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr19_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,296 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,298 :: 		}
L_end_stepper2StartClockWise:
	RETURN      0
; end of _stepper2StartClockWise

_stepper2StartCounterClockWise:

;CNC.c,300 :: 		void stepper2StartCounterClockWise()
;CNC.c,304 :: 		stepper2LastStepDone = getProperLastStepForCCW(stepper2LastStepDone);
	MOVF        _stepper2LastStepDone+0, 0 
	MOVWF       FARG_getProperLastStepForCCW+0 
	MOVF        _stepper2LastStepDone+1, 0 
	MOVWF       FARG_getProperLastStepForCCW+1 
	CALL        _getProperLastStepForCCW+0, 0
	MOVF        R0, 0 
	MOVWF       _stepper2LastStepDone+0 
	MOVF        R1, 0 
	MOVWF       _stepper2LastStepDone+1 
;CNC.c,305 :: 		INTCON.TMR0IE = 1;          //Enable interrup checking for stop
	BSF         INTCON+0, 5 
;CNC.c,307 :: 		for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded  ; i++)
	MOVF        R0, 0 
	MOVWF       stepper2StartCounterClockWise_i_L0+0 
	MOVF        R1, 0 
	MOVWF       stepper2StartCounterClockWise_i_L0+1 
	MOVF        R0, 0 
	ADDWF       _stepper2Steps+0, 0 
	MOVWF       stepper2StartCounterClockWise_stepsNeeded_L0+0 
	MOVF        R1, 0 
	ADDWFC      _stepper2Steps+1, 0 
	MOVWF       stepper2StartCounterClockWise_stepsNeeded_L0+1 
L_stepper2StartCounterClockWise73:
	MOVLW       128
	XORWF       stepper2StartCounterClockWise_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       stepper2StartCounterClockWise_stepsNeeded_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartCounterClockWise163
	MOVF        stepper2StartCounterClockWise_stepsNeeded_L0+0, 0 
	SUBWF       stepper2StartCounterClockWise_i_L0+0, 0 
L__stepper2StartCounterClockWise163:
	BTFSC       STATUS+0, 0 
	GOTO        L_stepper2StartCounterClockWise74
;CNC.c,309 :: 		if(i % 4 == 0 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartCounterClockWise164
	MOVLW       0
	XORWF       R0, 0 
L__stepper2StartCounterClockWise164:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartCounterClockWise78
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartCounterClockWise78
L__stepper2StartCounterClockWise127:
;CNC.c,311 :: 		stepper2Step41();
	CALL        _stepper2Step41+0, 0
;CNC.c,312 :: 		}
	GOTO        L_stepper2StartCounterClockWise79
L_stepper2StartCounterClockWise78:
;CNC.c,313 :: 		else if(i % 4 == 1 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartCounterClockWise165
	MOVLW       1
	XORWF       R0, 0 
L__stepper2StartCounterClockWise165:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartCounterClockWise82
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartCounterClockWise82
L__stepper2StartCounterClockWise126:
;CNC.c,315 :: 		stepper2Step34();
	CALL        _stepper2Step34+0, 0
;CNC.c,316 :: 		}
	GOTO        L_stepper2StartCounterClockWise83
L_stepper2StartCounterClockWise82:
;CNC.c,317 :: 		else if(i % 4 == 2 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartCounterClockWise166
	MOVLW       2
	XORWF       R0, 0 
L__stepper2StartCounterClockWise166:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartCounterClockWise86
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartCounterClockWise86
L__stepper2StartCounterClockWise125:
;CNC.c,319 :: 		stepper2Step23();
	CALL        _stepper2Step23+0, 0
;CNC.c,320 :: 		}
	GOTO        L_stepper2StartCounterClockWise87
L_stepper2StartCounterClockWise86:
;CNC.c,321 :: 		else if(i % 4 == 3 && INTCON.TMR0IE != 0)
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        stepper2StartCounterClockWise_i_L0+0, 0 
	MOVWF       R0 
	MOVF        stepper2StartCounterClockWise_i_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper2StartCounterClockWise167
	MOVLW       3
	XORWF       R0, 0 
L__stepper2StartCounterClockWise167:
	BTFSS       STATUS+0, 2 
	GOTO        L_stepper2StartCounterClockWise90
	BTFSS       INTCON+0, 5 
	GOTO        L_stepper2StartCounterClockWise90
L__stepper2StartCounterClockWise124:
;CNC.c,323 :: 		stepper2Step12();
	CALL        _stepper2Step12+0, 0
;CNC.c,324 :: 		}
	GOTO        L_stepper2StartCounterClockWise91
L_stepper2StartCounterClockWise90:
;CNC.c,327 :: 		return;
	GOTO        L_end_stepper2StartCounterClockWise
;CNC.c,328 :: 		}
L_stepper2StartCounterClockWise91:
L_stepper2StartCounterClockWise87:
L_stepper2StartCounterClockWise83:
L_stepper2StartCounterClockWise79:
;CNC.c,307 :: 		for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded  ; i++)
	INFSNZ      stepper2StartCounterClockWise_i_L0+0, 1 
	INCF        stepper2StartCounterClockWise_i_L0+1, 1 
;CNC.c,330 :: 		}
	GOTO        L_stepper2StartCounterClockWise73
L_stepper2StartCounterClockWise74:
;CNC.c,332 :: 		Uart1_Write_Text("Finished2");     //Inform the pc that the motor has finished
	MOVLW       ?lstr20_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr20_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,333 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,335 :: 		}
L_end_stepper2StartCounterClockWise:
	RETURN      0
; end of _stepper2StartCounterClockWise

_writeLine:

;CNC.c,338 :: 		void writeLine()
;CNC.c,340 :: 		UART1_Write('\r');
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CNC.c,341 :: 		UART1_Write('\n');
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;CNC.c,342 :: 		}
L_end_writeLine:
	RETURN      0
; end of _writeLine

_interrupt:

;CNC.c,345 :: 		void interrupt()
;CNC.c,347 :: 		if(Uart1_Data_Ready() == 1)
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt92
;CNC.c,349 :: 		stopAction = Uart1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _stopAction+0 
;CNC.c,350 :: 		if(stopAction == 'S')
	MOVF        R0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt93
;CNC.c,352 :: 		PORTB  = 0b00100100;        //Turn on red leds only
	MOVLW       36
	MOVWF       PORTB+0 
;CNC.c,353 :: 		INTCON.TMR0IE = 0;     //Disable interrupt until a new start
	BCF         INTCON+0, 5 
;CNC.c,354 :: 		}
L_interrupt93:
;CNC.c,355 :: 		}
L_interrupt92:
;CNC.c,356 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;CNC.c,357 :: 		}
L_end_interrupt:
L__interrupt170:
	RETFIE      1
; end of _interrupt

_getProperLastStepForCCW:

;CNC.c,359 :: 		int getProperLastStepForCCW(int lastStep)
;CNC.c,361 :: 		switch(lastStep)
	GOTO        L_getProperLastStepForCCW94
;CNC.c,363 :: 		case 1:
L_getProperLastStepForCCW96:
;CNC.c,364 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_getProperLastStepForCCW
;CNC.c,366 :: 		case 2:
L_getProperLastStepForCCW97:
;CNC.c,367 :: 		return 3;
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_getProperLastStepForCCW
;CNC.c,369 :: 		case 3:
L_getProperLastStepForCCW98:
;CNC.c,370 :: 		return 2;
	MOVLW       2
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_getProperLastStepForCCW
;CNC.c,372 :: 		case 4:
L_getProperLastStepForCCW99:
;CNC.c,373 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_getProperLastStepForCCW
;CNC.c,375 :: 		}
L_getProperLastStepForCCW94:
	MOVLW       0
	XORWF       FARG_getProperLastStepForCCW_lastStep+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getProperLastStepForCCW172
	MOVLW       1
	XORWF       FARG_getProperLastStepForCCW_lastStep+0, 0 
L__getProperLastStepForCCW172:
	BTFSC       STATUS+0, 2 
	GOTO        L_getProperLastStepForCCW96
	MOVLW       0
	XORWF       FARG_getProperLastStepForCCW_lastStep+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getProperLastStepForCCW173
	MOVLW       2
	XORWF       FARG_getProperLastStepForCCW_lastStep+0, 0 
L__getProperLastStepForCCW173:
	BTFSC       STATUS+0, 2 
	GOTO        L_getProperLastStepForCCW97
	MOVLW       0
	XORWF       FARG_getProperLastStepForCCW_lastStep+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getProperLastStepForCCW174
	MOVLW       3
	XORWF       FARG_getProperLastStepForCCW_lastStep+0, 0 
L__getProperLastStepForCCW174:
	BTFSC       STATUS+0, 2 
	GOTO        L_getProperLastStepForCCW98
	MOVLW       0
	XORWF       FARG_getProperLastStepForCCW_lastStep+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__getProperLastStepForCCW175
	MOVLW       4
	XORWF       FARG_getProperLastStepForCCW_lastStep+0, 0 
L__getProperLastStepForCCW175:
	BTFSC       STATUS+0, 2 
	GOTO        L_getProperLastStepForCCW99
;CNC.c,376 :: 		}
L_end_getProperLastStepForCCW:
	RETURN      0
; end of _getProperLastStepForCCW

_getStepper1Settings:

;CNC.c,378 :: 		void getStepper1Settings()
;CNC.c,380 :: 		UART1_Write_Text("Direction1");    //Order direction from pc
	MOVLW       ?lstr21_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr21_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,381 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,383 :: 		while(UART1_Data_Ready() != 1);     //wait until pc sends direction
L_getStepper1Settings100:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getStepper1Settings101
	GOTO        L_getStepper1Settings100
L_getStepper1Settings101:
;CNC.c,384 :: 		UART1_Read_Text(stepper1Direction , "!ok" , 10);   //get direction
	MOVLW       _stepper1Direction+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_stepper1Direction+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr22_CNC+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr22_CNC+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       10
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;CNC.c,386 :: 		UART1_Write_Text("Speed1");     //order speed from pc
	MOVLW       ?lstr23_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr23_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,387 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,389 :: 		while(UART1_Data_Ready() != 1);     //wait until pc sends speed
L_getStepper1Settings102:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getStepper1Settings103
	GOTO        L_getStepper1Settings102
L_getStepper1Settings103:
;CNC.c,390 :: 		UART1_Read_Text(stepper1SpeedString , "!ok" , 10);   //get speed
	MOVLW       _stepper1SpeedString+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_stepper1SpeedString+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr24_CNC+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr24_CNC+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       10
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;CNC.c,391 :: 		stepper1Speed = atoi(stepper1SpeedString);       //convert speedString to integer
	MOVLW       _stepper1SpeedString+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_stepper1SpeedString+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _stepper1Speed+0 
	MOVF        R1, 0 
	MOVWF       _stepper1Speed+1 
;CNC.c,392 :: 		stepper1Speed = 1050 - stepper1Speed * 10;      //Map the speed to a proper delay time
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	SUBLW       26
	MOVWF       _stepper1Speed+0 
	MOVF        R1, 0 
	MOVWF       _stepper1Speed+1 
	MOVLW       4
	SUBFWB      _stepper1Speed+1, 1 
;CNC.c,394 :: 		UART1_Write_Text("Steps1");      //order steps from pc
	MOVLW       ?lstr25_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr25_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,395 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,397 :: 		while(UART1_Data_Ready() != 1);     //wait until pc sends number of steps
L_getStepper1Settings104:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getStepper1Settings105
	GOTO        L_getStepper1Settings104
L_getStepper1Settings105:
;CNC.c,398 :: 		UART1_Read_Text(stepper1StepsString , "!ok" , 10);   //get steps
	MOVLW       _stepper1StepsString+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_stepper1StepsString+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr26_CNC+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr26_CNC+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       10
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;CNC.c,399 :: 		stepper1Steps = atoi(stepper1StepsString);
	MOVLW       _stepper1StepsString+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_stepper1StepsString+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _stepper1Steps+0 
	MOVF        R1, 0 
	MOVWF       _stepper1Steps+1 
;CNC.c,400 :: 		}
L_end_getStepper1Settings:
	RETURN      0
; end of _getStepper1Settings

_getStepper2Settings:

;CNC.c,402 :: 		void getStepper2Settings()
;CNC.c,404 :: 		UART1_Write_Text("Direction2");    //Order direction from pc
	MOVLW       ?lstr27_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr27_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,405 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,407 :: 		while(UART1_Data_Ready() != 1);     //wait until pc sends direction
L_getStepper2Settings106:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getStepper2Settings107
	GOTO        L_getStepper2Settings106
L_getStepper2Settings107:
;CNC.c,408 :: 		UART1_Read_Text(stepper2Direction , "!ok" , 10);   //get direction
	MOVLW       _stepper2Direction+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_stepper2Direction+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr28_CNC+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr28_CNC+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       10
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;CNC.c,410 :: 		UART1_Write_Text("Speed2");     //order speed from pc
	MOVLW       ?lstr29_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr29_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,411 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,413 :: 		while(UART1_Data_Ready() != 1);     //wait until pc sends speed
L_getStepper2Settings108:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getStepper2Settings109
	GOTO        L_getStepper2Settings108
L_getStepper2Settings109:
;CNC.c,414 :: 		UART1_Read_Text(stepper2SpeedString , "!ok" , 10);   //get speed
	MOVLW       _stepper2SpeedString+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_stepper2SpeedString+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr30_CNC+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr30_CNC+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       10
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;CNC.c,415 :: 		stepper2Speed = atoi(stepper2SpeedString);       //convert speedString to integer
	MOVLW       _stepper2SpeedString+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_stepper2SpeedString+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _stepper2Speed+0 
	MOVF        R1, 0 
	MOVWF       _stepper2Speed+1 
;CNC.c,416 :: 		stepper2Speed = 1050 - stepper2Speed * 10;      //Map the speed to a proper delay time
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	SUBLW       26
	MOVWF       _stepper2Speed+0 
	MOVF        R1, 0 
	MOVWF       _stepper2Speed+1 
	MOVLW       4
	SUBFWB      _stepper2Speed+1, 1 
;CNC.c,418 :: 		UART1_Write_Text("Steps2");      //order steps from pc
	MOVLW       ?lstr31_CNC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr31_CNC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;CNC.c,419 :: 		writeLine();
	CALL        _writeLine+0, 0
;CNC.c,421 :: 		while(UART1_Data_Ready() != 1);     //wait until pc sends number of steps
L_getStepper2Settings110:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getStepper2Settings111
	GOTO        L_getStepper2Settings110
L_getStepper2Settings111:
;CNC.c,422 :: 		UART1_Read_Text(stepper2StepsString , "!ok" , 10);   //get steps
	MOVLW       _stepper2StepsString+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_stepper2StepsString+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr32_CNC+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr32_CNC+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       10
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;CNC.c,423 :: 		stepper2Steps = atoi(stepper2StepsString);
	MOVLW       _stepper2StepsString+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(_stepper2StepsString+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	MOVF        R0, 0 
	MOVWF       _stepper2Steps+0 
	MOVF        R1, 0 
	MOVWF       _stepper2Steps+1 
;CNC.c,424 :: 		}
L_end_getStepper2Settings:
	RETURN      0
; end of _getStepper2Settings

_writeToStepper1:

;CNC.c,427 :: 		void writeToStepper1(char newstep)
;CNC.c,429 :: 		PORTD &= 0b11110000;
	MOVLW       240
	ANDWF       PORTD+0, 1 
;CNC.c,430 :: 		PORTD |= newStep;
	MOVF        FARG_writeToStepper1_newstep+0, 0 
	IORWF       PORTD+0, 1 
;CNC.c,431 :: 		}
L_end_writeToStepper1:
	RETURN      0
; end of _writeToStepper1

_writeToStepper2:

;CNC.c,434 :: 		void writeToStepper2(char newstep)
;CNC.c,436 :: 		PORTD &= 0b00001111;
	MOVLW       15
	ANDWF       PORTD+0, 1 
;CNC.c,437 :: 		PORTD |= newStep;
	MOVF        FARG_writeToStepper2_newstep+0, 0 
	IORWF       PORTD+0, 1 
;CNC.c,438 :: 		}
L_end_writeToStepper2:
	RETURN      0
; end of _writeToStepper2
