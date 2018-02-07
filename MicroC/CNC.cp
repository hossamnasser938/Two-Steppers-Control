#line 1 "E:/3rd Year/First Term/PC Peripheral Interfacing/Projects/CNC Project/MicroC/CNC.c"

void stepper1StartClockWise();
void stepper1StartCounterClockWise();
void stepper2StartClockWise();
void stepper2StartCounterClockWise();
void writeLine();
void stepper1Step12();
void stepper1Step23();
void stepper1Step34();
void stepper1Step41();
void stepper2Step12();
void stepper2Step23();
void stepper2Step34();
void stepper2Step41();
void writeToStepper1(char);
void writeToStepper2(char);
void interrupt();
int getProperLastStepForCCW(int);
void getStepper1Settings();
void getStepper2Settings();

unsigned char recievedAction[10];
unsigned char stopAction;

unsigned char stepper1Direction[10];
unsigned char stepper1SpeedString[10];
unsigned char stepper1StepsString[10];
int stepper1Steps = 0;
int stepper1Speed = 0;

unsigned char stepper2Direction[10];
unsigned char stepper2SpeedString[10];
unsigned char stepper2StepsString[10];
int stepper2Steps = 0;
int stepper2Speed = 0;

int stepper1LastStepDone = 0;
int stepper2LastStepDone = 0;

void main() {

 TRISD = 0;
 PORTD = 0;
 TRISB = 0;
 PORTB = 0b00100100;

 T0CON = 0b10000011;
 TMR0L = 0x2C;
 TMR0H = 0xCF;

 INTCON.GIE = 1;
 INTCON.PEIE = 0;

 UART1_Init(9600);
 delay_ms(50);

 while(1)
 {

 while(UART1_Data_Ready() != 1);

 UART1_Read_Text(recievedAction , "!ok" , 10);

 if(strcmp(recievedAction , "Start1") == 0)
 {

 PORTb.f2 = 0;

 getStepper1Settings();

 if(strcmp(stepper1Direction , "CW") == 0)
 {
 portb.f0 = 1;
 stepper1StartClockWise();
 PORTb.f0 = 0;
 }
 else if(strcmp(stepper1Direction , "CCW") == 0)
 {
 portb.f1 = 1;
 stepper1StartCounterClockWise();
 PORTb.f1 = 0;
 }

 INTCON.TMR0IE = 0;

 }
 else if(strcmp(recievedAction , "Start2") == 0)
 {
 PORTb.f5 = 0;

 getStepper2Settings();

 if(strcmp(stepper2Direction , "CW") == 0)
 {
 portb.f3 = 1;
 stepper2StartClockWise();
 PORTb.f3 = 0;
 }
 else if(strcmp(stepper1Direction , "CCW") == 0)
 {
 portb.f4 = 1;
 stepper2StartCounterClockWise();
 PORTb.f4 = 0;
 }

 INTCON.TMR0IE = 0;
 }
 else if(strcmp(recievedAction , "Start12") == 0)
 {
 }

 }

 }

void stepper1Step12()
{
 writeToStepper1(0b00000011);
 Uart1_Write_Text("Increment1");
 writeLine();
 stepper1LastStepDone = 1;
 VDelay_ms(stepper1Speed);
}

void stepper1Step23()
{
 writeToStepper1(0b00000110);
 Uart1_Write_Text("Increment1");
 writeLine();
 stepper1LastStepDone = 1;
 VDelay_ms(stepper1Speed);
}

void stepper1Step34()
{
 writeToStepper1(0b00001100);
 Uart1_Write_Text("Increment1");
 writeLine();
 stepper1LastStepDone = 1;
 VDelay_ms(stepper1Speed);
}

void stepper1Step41()
{
 writeToStepper1(0b00001001);
 Uart1_Write_Text("Increment1");
 writeLine();
 stepper1LastStepDone = 1;
 VDelay_ms(stepper1Speed);
}


void stepper2Step12()
{
 writeToStepper2(0b00110000);
 Uart1_Write_Text("Increment2");
 writeLine();
 stepper2LastStepDone = 1;
 VDelay_ms(stepper2Speed);
}

void stepper2Step23()
{
 writeToStepper2(0b01100000);
 Uart1_Write_Text("Increment2");
 writeLine();
 stepper2LastStepDone = 1;
 VDelay_ms(stepper2Speed);
}

void stepper2Step34()
{
 writeToStepper2(0b11000000);
 Uart1_Write_Text("Increment2");
 writeLine();
 stepper2LastStepDone = 1;
 VDelay_ms(stepper2Speed);
}

void stepper2Step41()
{
 writeToStepper2(0b10010000);
 Uart1_Write_Text("Increment2");
 writeLine();
 stepper2LastStepDone = 1;
 VDelay_ms(stepper2Speed);
}


void stepper1StartClockWise()
{
 int i;
 int stepsNeeded;
 INTCON.TMR0IE = 1;

 for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded ; i++)
 {
 if(i % 4 == 0 && INTCON.TMR0IE != 0)
 {
 stepper1Step12();
 }
 else if(i % 4 == 1 && INTCON.TMR0IE != 0)
 {
 stepper1Step23();
 }
 else if(i % 4 == 2 && INTCON.TMR0IE != 0)
 {
 stepper1Step34();
 }
 else if(i % 4 == 3 && INTCON.TMR0IE != 0)
 {
 stepper1Step41();
 }
 else
 {
 return;
 }

 }

 Uart1_Write_Text("Finished1");
 writeLine();

}

void stepper1StartCounterClockWise()
{
 int i;
 int stepsNeeded;
 stepper1LastStepDone = getProperLastStepForCCW(stepper1LastStepDone);
 INTCON.TMR0IE = 1;

 for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded ; i++)
 {
 if(i % 4 == 0 && INTCON.TMR0IE != 0)
 {
 stepper1Step41();
 }
 else if(i % 4 == 1 && INTCON.TMR0IE != 0)
 {
 stepper1Step34();
 }
 else if(i % 4 == 2 && INTCON.TMR0IE != 0)
 {
 stepper1Step23();
 }
 else if(i % 4 == 3 && INTCON.TMR0IE != 0)
 {
 stepper1Step12();
 }
 else
 {
 return;
 }

 }

 Uart1_Write_Text("Finished1");
 writeLine();

}


void stepper2StartClockWise()
{
 int i;
 int stepsNeeded;
 INTCON.TMR0IE = 1;

 for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded ; i++)
 {
 if(i % 4 == 0 && INTCON.TMR0IE != 0)
 {
 stepper2Step12();
 }
 else if(i % 4 == 1 && INTCON.TMR0IE != 0)
 {
 stepper2Step23();
 }
 else if(i % 4 == 2 && INTCON.TMR0IE != 0)
 {
 stepper2Step34();
 }
 else if(i % 4 == 3 && INTCON.TMR0IE != 0)
 {
 stepper2Step41();
 }
 else
 {
 return;
 }

 }

 Uart1_Write_Text("Finished2");
 writeLine();

}

void stepper2StartCounterClockWise()
{
 int i;
 int stepsNeeded;
 stepper2LastStepDone = getProperLastStepForCCW(stepper2LastStepDone);
 INTCON.TMR0IE = 1;

 for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded ; i++)
 {
 if(i % 4 == 0 && INTCON.TMR0IE != 0)
 {
 stepper2Step41();
 }
 else if(i % 4 == 1 && INTCON.TMR0IE != 0)
 {
 stepper2Step34();
 }
 else if(i % 4 == 2 && INTCON.TMR0IE != 0)
 {
 stepper2Step23();
 }
 else if(i % 4 == 3 && INTCON.TMR0IE != 0)
 {
 stepper2Step12();
 }
 else
 {
 return;
 }

 }

 Uart1_Write_Text("Finished2");
 writeLine();

}


void writeLine()
{
 UART1_Write('\r');
 UART1_Write('\n');
}


void interrupt()
{
 if(Uart1_Data_Ready() == 1)
 {
 stopAction = Uart1_Read();
 if(stopAction == 'S')
 {
 PORTB = 0b00100100;
 INTCON.TMR0IE = 0;
 }
 }
 INTCON.TMR0IF = 0;
}

int getProperLastStepForCCW(int lastStep)
{
 switch(lastStep)
 {
 case 1:
 return 0;
 break;
 case 2:
 return 3;
 break;
 case 3:
 return 2;
 break;
 case 4:
 return 1;
 break;
 }
}

void getStepper1Settings()
{
 UART1_Write_Text("Direction1");
 writeLine();

 while(UART1_Data_Ready() != 1);
 UART1_Read_Text(stepper1Direction , "!ok" , 10);

 UART1_Write_Text("Speed1");
 writeLine();

 while(UART1_Data_Ready() != 1);
 UART1_Read_Text(stepper1SpeedString , "!ok" , 10);
 stepper1Speed = atoi(stepper1SpeedString);
 stepper1Speed = 1050 - stepper1Speed * 10;

 UART1_Write_Text("Steps1");
 writeLine();

 while(UART1_Data_Ready() != 1);
 UART1_Read_Text(stepper1StepsString , "!ok" , 10);
 stepper1Steps = atoi(stepper1StepsString);
}

void getStepper2Settings()
{
 UART1_Write_Text("Direction2");
 writeLine();

 while(UART1_Data_Ready() != 1);
 UART1_Read_Text(stepper2Direction , "!ok" , 10);

 UART1_Write_Text("Speed2");
 writeLine();

 while(UART1_Data_Ready() != 1);
 UART1_Read_Text(stepper2SpeedString , "!ok" , 10);
 stepper2Speed = atoi(stepper2SpeedString);
 stepper2Speed = 1050 - stepper2Speed * 10;

 UART1_Write_Text("Steps2");
 writeLine();

 while(UART1_Data_Ready() != 1);
 UART1_Read_Text(stepper2StepsString , "!ok" , 10);
 stepper2Steps = atoi(stepper2StepsString);
}


void writeToStepper1(char newstep)
{
 PORTD &= 0b11110000;
 PORTD |= newStep;
}


void writeToStepper2(char newstep)
{
 PORTD &= 0b00001111;
 PORTD |= newStep;
}
