
void stepper1StartClockWise();      //start stepper1 with clockwise direction
void stepper1StartCounterClockWise();        //start stepper1 with counter clockwise direction
void stepper2StartClockWise();      //start stepper2 with clockwise direction
void stepper2StartCounterClockWise();        //start stepper2 with counter clockwise direction
void writeLine();       //send new line to pc
void stepper1Step12();         //stepper1 movement functions
void stepper1Step23();
void stepper1Step34();
void stepper1Step41();
void stepper2Step12();         //stepper2 movement functions
void stepper2Step23();
void stepper2Step34();
void stepper2Step41();
void writeToStepper1(char);
void writeToStepper2(char);
void interrupt();
int getProperLastStepForCCW(int);       //helps stastClockWise function to start from the end step the motor has done
void getStepper1Settings();        //asks the pc to send stepper1 settings, receive and store them
void getStepper2Settings();        //asks the pc to send stepper2 settings, receive and store them

unsigned char recievedAction[10];       //store start action
unsigned char stopAction;               //store stop action

unsigned char stepper1Direction[10];        //store direction of stepper1(clockwise or counter clockwise)
unsigned char stepper1SpeedString[10];       //store speed of stepper1
unsigned char stepper1StepsString[10];       //store steps of stepper1
int stepper1Steps = 0;          //store steps of stepper1 after conversion
int stepper1Speed = 0;     //store speed of stepper1 after conversion

unsigned char stepper2Direction[10];        //store direction of stepper2(clockwise or counter clockwise) for stepper1
unsigned char stepper2SpeedString[10];       //store speed of stepper2
unsigned char stepper2StepsString[10];       //store steps of stepper2
int stepper2Steps = 0;          //store steps of stepper2 after conversion
int stepper2Speed = 0;     //store speed of stepper2 after conversion

int stepper1LastStepDone = 0;        //deermine the last step done by stepper1
int stepper2LastStepDone = 0;        //deermine the last step done by stepper2

void main() {

    TRISD  = 0;        //motors are connected on PortD
    PORTD  = 0;
    TRISB  = 0;       //Leds are connected on PortD
    PORTB  = 0b00100100;       //Red Led is on until motor starts
    
    T0CON = 0b10000011;      //Timer0 configurations(used to check for stop)
    TMR0L = 0x2C;
    TMR0H = 0xCF;
    
    INTCON.GIE = 1;         //Interrupt enabling
    INTCON.PEIE = 0;

    UART1_Init(9600);      //Initialize Uart with 9600 baud rate
    delay_ms(50);
    
    while(1)
    {
    
        while(UART1_Data_Ready() != 1);        //wait for start or Stop action

        UART1_Read_Text(recievedAction , "!ok" , 10);       //get action

        if(strcmp(recievedAction , "Start1") == 0)      //if the action is start
        {

             PORTb.f2 = 0;       //Turn Red led off
             
             getStepper1Settings();

            if(strcmp(stepper1Direction , "CW") == 0)        //if direction is clockwise
            {
                  portb.f0 = 1;      //Turn on green led
                  stepper1StartClockWise();
                  PORTb.f0 = 0;      //Turn off green led after finishing
            }
            else if(strcmp(stepper1Direction , "CCW") == 0)        //if direction is counter clockwise
            {
                  portb.f1 = 1;        //Turn on yellow led
                  stepper1StartCounterClockWise();
                  PORTb.f1 = 0;       //Turn off yellow led after finishing
            }
            
            INTCON.TMR0IE = 0;    //Disable interrupt until a new start comes from PC

       }
       else if(strcmp(recievedAction , "Start2") == 0)      //if the action is start
       {
            PORTb.f5 = 0;       //Turn Red led off

            getStepper2Settings();

            if(strcmp(stepper2Direction , "CW") == 0)        //if direction is clockwise
            {
                  portb.f3 = 1;      //Turn on green led
                  stepper2StartClockWise();
                  PORTb.f3 = 0;      //Turn off green led after finishing
            }
            else if(strcmp(stepper1Direction , "CCW") == 0)        //if direction is counter clockwise
            {
                  portb.f4 = 1;        //Turn on yellow led
                  stepper2StartCounterClockWise();
                  PORTb.f4 = 0;       //Turn off yellow led after finishing
            }

            INTCON.TMR0IE = 0;    //Disable interrupt until a new start comes from PC
       }
       else if(strcmp(recievedAction , "Start12") == 0)      //if the action is start
       {
       }

    }       //end while
    
 }//end main

void stepper1Step12()
{
     writeToStepper1(0b00000011);      //activating the first and second coils ... south and east so that the rolling part moves clock wisely
     Uart1_Write_Text("Increment1");    //increment progress bar
     writeLine();
     stepper1LastStepDone = 1;
}

void stepper1Step23()
{
     writeToStepper1(0b00000110);     //activating the second and third coils for the similar reason
     Uart1_Write_Text("Increment1");    //increment progress bar
     writeLine();
     stepper1LastStepDone = 2;
}

void stepper1Step34()
{
     writeToStepper1(0b00001100);      //third and forth coils
     Uart1_Write_Text("Increment1");    //increment progress bar
     writeLine();
     stepper1LastStepDone = 3;
}

void stepper1Step41()
{
     writeToStepper1(0b00001001);       //forth and first
     Uart1_Write_Text("Increment1");    //increment progress bar
     writeLine();
     stepper1LastStepDone = 4;
}


void stepper2Step12()
{
     writeToStepper2(0b00110000);      //activating the first and second coils ... south and east so that the rolling part moves clock wisely
     Uart1_Write_Text("Increment2");    //increment progress bar
     writeLine();
     stepper2LastStepDone = 1;
}

void stepper2Step23()
{
     writeToStepper2(0b01100000);     //activating the second and third coils for the similar reason
     Uart1_Write_Text("Increment2");    //increment progress bar
     writeLine();
     stepper2LastStepDone = 2;
}

void stepper2Step34()
{
     writeToStepper2(0b11000000);      //third and forth coils
     Uart1_Write_Text("Increment2");    //increment progress bar
     writeLine();
     stepper2LastStepDone = 3;
}

void stepper2Step41()
{
     writeToStepper2(0b10010000);       //forth and first
     Uart1_Write_Text("Increment2");    //increment progress bar
     writeLine();
     stepper2LastStepDone = 4;
}


void stepper1StartClockWise()
{
     int i;
     int stepsNeeded;
     INTCON.TMR0IE = 1;     //Enable interrup checking for stop

     for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded  ; i++)
     {
          if(i % 4 == 0 && INTCON.TMR0IE != 0)
          {
               stepper1Step12();
               VDelay_ms(stepper1Speed);
          }
          else if(i % 4 == 1 && INTCON.TMR0IE != 0)
          {
               stepper1Step23();
               VDelay_ms(stepper1Speed);
          }
          else if(i % 4 == 2 && INTCON.TMR0IE != 0)
          {
               stepper1Step34();
               VDelay_ms(stepper1Speed);
          }
          else if(i % 4 == 3 && INTCON.TMR0IE != 0)
          {
               stepper1Step41();
               VDelay_ms(stepper1Speed);
          }
          else        //if TMR0IE == 1 that means that a stop command has been recieved so stop and return
          {
                return;
          }

     }
     
     Uart1_Write_Text("Finished1");       //Inform the pc that the motor has finished
     writeLine();
     
}

void stepper1StartCounterClockWise()
{
     int i;
     int stepsNeeded;
     stepper1LastStepDone = getProperLastStepForCCW(stepper1LastStepDone);
     INTCON.TMR0IE = 1;          //Enable interrup checking for stop
     
     for(i = stepper1LastStepDone , stepsNeeded = stepper1Steps + stepper1LastStepDone; i < stepsNeeded  ; i++)
     {
          if(i % 4 == 0 && INTCON.TMR0IE != 0)
          {
               stepper1Step41();
               VDelay_ms(stepper1Speed);
          }
          else if(i % 4 == 1 && INTCON.TMR0IE != 0)
          {
               stepper1Step34();
               VDelay_ms(stepper1Speed);
          }
          else if(i % 4 == 2 && INTCON.TMR0IE != 0)
          {
               stepper1Step23();
               VDelay_ms(stepper1Speed);
          }
          else if(i % 4 == 3 && INTCON.TMR0IE != 0)
          {
               stepper1Step12();
               VDelay_ms(stepper1Speed);
          }
          else        //if TMR0IE == 1 that means that a stop command has been recieved so stop and return
          {
                return;
          }

     }
     
     Uart1_Write_Text("Finished1");     //Inform the pc that the motor has finished
     writeLine();
     
}


void stepper2StartClockWise()
{
     int i;
     int stepsNeeded;
     INTCON.TMR0IE = 1;     //Enable interrup checking for stop

     for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded  ; i++)
     {
          if(i % 4 == 0 && INTCON.TMR0IE != 0)
          {
               stepper2Step12();
               VDelay_ms(stepper2Speed);
          }
          else if(i % 4 == 1 && INTCON.TMR0IE != 0)
          {
               stepper2Step23();
               VDelay_ms(stepper2Speed);
          }
          else if(i % 4 == 2 && INTCON.TMR0IE != 0)
          {
               stepper2Step34();
               VDelay_ms(stepper2Speed);
          }
          else if(i % 4 == 3 && INTCON.TMR0IE != 0)
          {
               stepper2Step41();
               VDelay_ms(stepper2Speed);
          }
          else        //if TMR0IE == 1 that means that a stop command has been recieved so stop and return
          {
                return;
          }

     }

     Uart1_Write_Text("Finished2");       //Inform the pc that the motor has finished
     writeLine();

}

void stepper2StartCounterClockWise()
{
     int i;
     int stepsNeeded;
     stepper2LastStepDone = getProperLastStepForCCW(stepper2LastStepDone);
     INTCON.TMR0IE = 1;          //Enable interrup checking for stop

     for(i = stepper2LastStepDone , stepsNeeded = stepper2Steps + stepper2LastStepDone; i < stepsNeeded  ; i++)
     {
          if(i % 4 == 0 && INTCON.TMR0IE != 0)
          {
               stepper2Step41();
               VDelay_ms(stepper2Speed);
          }
          else if(i % 4 == 1 && INTCON.TMR0IE != 0)
          {
               stepper2Step34();
               VDelay_ms(stepper2Speed);
          }
          else if(i % 4 == 2 && INTCON.TMR0IE != 0)
          {
               stepper2Step23();
               VDelay_ms(stepper2Speed);
          }
          else if(i % 4 == 3 && INTCON.TMR0IE != 0)
          {
               stepper2Step12();
               VDelay_ms(stepper2Speed);
          }
          else        //if TMR0IE == 1 that means that a stop command has been recieved so stop and return
          {
                return;
          }

     }

     Uart1_Write_Text("Finished2");     //Inform the pc that the motor has finished
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
                 PORTB  = 0b00100100;        //Turn on red leds only
                 INTCON.TMR0IE = 0;     //Disable interrupt until a new start
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
     UART1_Write_Text("Direction1");    //Order direction from pc
     writeLine();

     while(UART1_Data_Ready() != 1);     //wait until pc sends direction
     UART1_Read_Text(stepper1Direction , "!ok" , 10);   //get direction

     UART1_Write_Text("Speed1");     //order speed from pc
     writeLine();

     while(UART1_Data_Ready() != 1);     //wait until pc sends speed
     UART1_Read_Text(stepper1SpeedString , "!ok" , 10);   //get speed
     stepper1Speed = atoi(stepper1SpeedString);       //convert speedString to integer
     stepper1Speed = 1050 - stepper1Speed * 10;      //Map the speed to a proper delay time

     UART1_Write_Text("Steps1");      //order steps from pc
     writeLine();

     while(UART1_Data_Ready() != 1);     //wait until pc sends number of steps
     UART1_Read_Text(stepper1StepsString , "!ok" , 10);   //get steps
     stepper1Steps = atoi(stepper1StepsString);
}

void getStepper2Settings()
{
     UART1_Write_Text("Direction2");    //Order direction from pc
     writeLine();

     while(UART1_Data_Ready() != 1);     //wait until pc sends direction
     UART1_Read_Text(stepper2Direction , "!ok" , 10);   //get direction

     UART1_Write_Text("Speed2");     //order speed from pc
     writeLine();

     while(UART1_Data_Ready() != 1);     //wait until pc sends speed
     UART1_Read_Text(stepper2SpeedString , "!ok" , 10);   //get speed
     stepper2Speed = atoi(stepper2SpeedString);       //convert speedString to integer
     stepper2Speed = 1050 - stepper2Speed * 10;      //Map the speed to a proper delay time

     UART1_Write_Text("Steps2");      //order steps from pc
     writeLine();

     while(UART1_Data_Ready() != 1);     //wait until pc sends number of steps
     UART1_Read_Text(stepper2StepsString , "!ok" , 10);   //get steps
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