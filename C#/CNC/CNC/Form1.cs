using System;                                     
using System.Collections.Generic;                 
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;


namespace CNC
{

    public partial class Form1 : Form
    {
        string firstStepperDirection;
        int firstStepperSpeed;
        int firstStepperSteps;

        string secondStepperDirection;
        int secondStepperSpeed;
        int secondStepperSteps;

        string portNameChosen;
        SerialPort stepperPort;


        public Form1()
        {
            InitializeComponent();
            getAvailablePorts();
            stepperPort = new SerialPort();
            stepperPort.Parity = Parity.None;
            stepperPort.DataBits = 8;
            stepperPort.StopBits = StopBits.One;
            stepperPort.BaudRate = 9600;
            stepperPort.DataReceived += new SerialDataReceivedEventHandler(dataRecievedHandler);
            FormClosing += new FormClosingEventHandler(formClosingHandler);
        }


        void getAvailablePorts()
        {

            string[] ports = SerialPort.GetPortNames();
            comPortNoComboBox.Items.AddRange(ports);

        }


        private void firststepperClockwiseRadioBtn_CheckedChanged(object sender, EventArgs e)
        {
            firstStepperDirection = "CW!ok";
        }


        private void secondStepperClockWiseRadioBtn_CheckedChanged(object sender, EventArgs e)
        {
            secondStepperDirection = "CW!ok";
        }


        private void firstStepperCounterClockwiseRadioBtn_CheckedChanged(object sender, EventArgs e)
        {
            firstStepperDirection = "CCW!ok";
        }


        private void secondStepperCounterClockwiseRadioBtn_CheckedChanged(object sender, EventArgs e)
        {
            secondStepperDirection = "CCW!ok";
        }


        private void firstStepperSpeedTrackBar_Scroll(object sender, EventArgs e)
        {
            firstStepperSpeedLabel.Text = firstStepperSpeedTrackBar.Value.ToString() + " %";
            firstStepperSpeed = firstStepperSpeedTrackBar.Value;
        }

        private void secondStepperSpeedTrackBar_Scroll(object sender, EventArgs e)
        {
            secondStepperSpeedLabel.Text = firstStepperSpeedTrackBar.Value.ToString() + " %";
            firstStepperSpeed = firstStepperSpeedTrackBar.Value;
        }


        private void aboutUsBtn_Click(object sender, EventArgs e)
        {
            MessageBox.Show(" this simple project is done under supervision of Dr. Moukhtar Ahmed by students : Sameh, karam, Mohamed ,Hossam and Sahar ");
        }


        private void comPortNoComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            portNameChosen = comPortNoComboBox.SelectedItem.ToString();
            stepperPort.PortName = portNameChosen;
        }


        private void dataRecievedHandler(object sender, SerialDataReceivedEventArgs e)
        {

            stepperPort = (SerialPort)sender;
            String state = stepperPort.ReadLine();
            if (state.Equals("Direction1\r"))              //Any strng comming from microcontroller has a carriage return at the end of it
            {
                Invoke(new Action(() => stepperPort.Write(firstStepperDirection)));
            }
            else if (state.Equals("Direction2\r"))
            {
                Invoke(new Action(() => stepperPort.Write(secondStepperDirection)));
            }
            else if (state.Equals("Speed1\r"))
            {
                Invoke(new Action(() => stepperPort.Write(firstStepperSpeed.ToString() + "!ok")));
            }
            else if (state.Equals("Speed2\r"))
            {
                Invoke(new Action(() => stepperPort.Write(secondStepperSpeed.ToString() + "!ok")));
            }
            else if (state.Equals("Steps1\r"))
            {
                Invoke(new Action(() => stepperPort.Write(firstStepperSteps.ToString() + "!ok")));
            }
            else if (state.Equals("Steps2\r"))
            {
                Invoke(new Action(() => stepperPort.Write(secondStepperSteps.ToString() + "!ok")));
            }
            else if (state.Equals("Increment1\r"))
            {
                Invoke(new Action(() => firstStepperProgressBar.Increment(1)));
            }
            else if (state.Equals("Increment2\r"))
            {
                Invoke(new Action(() => secondStepperProgressBar.Increment(1)));
            }
            else if (state.Equals("Finished1\r"))
            {
                Invoke(new Action(() => enableFirstStepperComponents()));
            }
            else if (state.Equals("Finished2\r"))
            {
                Invoke(new Action(() => enableSecondStepperComponents()));
            }


        }

        private void stopTimer_Tick(object sender, EventArgs e)        //wait for 100 ms before closing the port
        {
            if (stepperPort.IsOpen)
                stepperPort.Close();
            stopTimer.Stop();
        }


        private void setFirstStepperSteps()
        {
            if (firstStepperStepsRadioBtn.Checked)
            {
                firstStepperSteps = int.Parse(firstStepperStepsTextBox.Text.ToString());
            }
            else if (firstStepperLoopsRadioBtn.Checked)
            {
                firstStepperSteps = int.Parse(firstStepperStepsTextBox.Text.ToString()) * 200;
            }

            firstStepperProgressBar.Value = 0;           //Clear progress bar
            firstStepperProgressBar.Maximum = firstStepperSteps;    //Set its maximum value to the number of steps chosen by the user
        }

        private void setSecondStepperSteps()
        {
            if (secondStepperStepsRadioBtn.Checked)
            {
                secondStepperSteps = int.Parse(secondStepperStepsTextBox.Text.ToString());
            }
            else if (secondStepperLoopsRadioBtn.Checked)
            {
                secondStepperSteps = int.Parse(secondStepperStepsTextBox.Text.ToString()) * 200;
            }

            secondStepperProgressBar.Value = 0;           
            secondStepperProgressBar.Maximum = firstStepperSteps;    
        }

        private void formClosingHandler(Object sender, FormClosingEventArgs e)          //what if the user closed the form while transmitting and recieving
        {
            if (stepperPort.IsOpen)
            {
                stepperPort.Write("S");
                stopTimer.Start();
            }
        }


        private void firstStepperCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (firstStepperCheckBox.Checked)
            {
                firstStepperGroupBox.Enabled = true;
                startBtn.Enabled = true;
            }
            else
            {
                firstStepperGroupBox.Enabled = false;
            }
            if (!firstStepperCheckBox.Checked && !secondStepperCheckBox.Checked)
            {
                startBtn.Enabled = false;
            }
        }

        private void secondStepperCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (secondStepperCheckBox.Checked)
            {
                secondStepperGroupBox.Enabled = true;
                startBtn.Enabled = true;
            }
            else
            {
                secondStepperGroupBox.Enabled = false;
            }
            if (!firstStepperCheckBox.Checked && !secondStepperCheckBox.Checked)
            {
                startBtn.Enabled = false;
            }
        }


        private bool checkFirstStepperStartAbility(bool readyToStart)
        {
            if (firstStepperClockWiseRadioBtn.Checked == false && firstStepperCounterClockwiseRadioBtn.Checked == false)
            {
                MessageBox.Show("Please check clockwise or counter clockwise of first stepper");
                readyToStart = false;
            }
            if (firstStepperClockWiseRadioBtn.Checked == true && firstStepperCounterClockwiseRadioBtn.Checked == true)
            {
                MessageBox.Show("Please check either clockwise or counter clockwise, not both of first stepper");
                readyToStart = false;
            }
            if (firstStepperStepsRadioBtn.Checked == false && firstStepperLoopsRadioBtn.Checked == false)
            {
                MessageBox.Show("Please check steps or loops of first stepper");
                readyToStart = false;
            }
            if (firstStepperStepsRadioBtn.Checked == true && firstStepperLoopsRadioBtn.Checked == true)
            {
                MessageBox.Show("Please check either steps or loops, not both of first stepper");
                readyToStart = false;
            }
            if (firstStepperStepsTextBox.Text == "")
            {
                MessageBox.Show("Please enter the number of steps or loops of first stepper");
                readyToStart = false;
            }
            return readyToStart;
        }


        private bool checkSecondStepperStartAbility(bool readyToStart)
        {
            if (secondStepperClockWiseRadioBtn.Checked == false && secondStepperCounterClockwiseRadioBtn.Checked == false)
            {
                MessageBox.Show("Please check clockwise or counter clockwise of second stepper");
                readyToStart = false;
            }
            if (secondStepperClockWiseRadioBtn.Checked == true && secondStepperCounterClockwiseRadioBtn.Checked == true)
            {
                MessageBox.Show("Please check either clockwise or counter clockwise, not both of second stepper");
                readyToStart = false;
            }
            if (secondStepperStepsRadioBtn.Checked == false && secondStepperLoopsRadioBtn.Checked == false)
            {
                MessageBox.Show("Please check steps or loops of second stepper");
                readyToStart = false;
            }
            if (secondStepperStepsRadioBtn.Checked == true && secondStepperLoopsRadioBtn.Checked == true)
            {
                MessageBox.Show("Please check either steps or loops, not both of second stepper");
                readyToStart = false;
            }
            if (secondStepperStepsTextBox.Text == "")
            {
                MessageBox.Show("Please enter the number of steps or loops of second stepper");
                readyToStart = false;
            }
            return readyToStart;
        }


        private void enableFirstStepperComponents()
        {
            startBtn.Enabled = true;
            stopBtn.Enabled = false;
            comPortNoComboBox.Enabled = true;
            firstStepperSpeedTrackBar.Enabled = true;
            firstStepperStepsTextBox.Enabled = true;
            firstStepperClockWiseRadioBtn.Enabled = true;
            firstStepperCounterClockwiseRadioBtn.Enabled = true;
            firstStepperLoopsRadioBtn.Enabled = true;
            firstStepperStepsRadioBtn.Enabled = true;
        }


        private void enableSecondStepperComponents()
        {
            startBtn.Enabled = true;
            stopBtn.Enabled = false;
            comPortNoComboBox.Enabled = true;
            secondStepperSpeedTrackBar.Enabled = true;
            secondStepperStepsTextBox.Enabled = true;
            secondStepperClockWiseRadioBtn.Enabled = true;
            secondStepperCounterClockwiseRadioBtn.Enabled = true;
            secondStepperLoopsRadioBtn.Enabled = true;
            secondStepperStepsRadioBtn.Enabled = true;
        }


        private void disableFirstStepperComponents()
        {
            stopBtn.Enabled = true;
            startBtn.Enabled = false;
            comPortNoComboBox.Enabled = false;
            firstStepperSpeedTrackBar.Enabled = false;
            firstStepperStepsTextBox.Enabled = false;
            firstStepperClockWiseRadioBtn.Enabled = false;
            firstStepperCounterClockwiseRadioBtn.Enabled = false;
            firstStepperLoopsRadioBtn.Enabled = false;
            firstStepperStepsRadioBtn.Enabled = false;
        }


        private void disableSecondStepperComponents()
        {
            stopBtn.Enabled = true;
            startBtn.Enabled = false;
            comPortNoComboBox.Enabled = false;
            secondStepperSpeedTrackBar.Enabled = false;
            secondStepperStepsTextBox.Enabled = false;
            secondStepperClockWiseRadioBtn.Enabled = false;
            secondStepperCounterClockwiseRadioBtn.Enabled = false;
            secondStepperLoopsRadioBtn.Enabled = false;
            secondStepperStepsRadioBtn.Enabled = false;
        }

        private void startBtn_Click(object sender, EventArgs e)
        {
            bool readyToStart = true;
            try
            {
                if (comPortNoComboBox.Text.Equals(""))
                {
                    MessageBox.Show("Please Select Port Number");
                    readyToStart = false;
                }

                if (firstStepperCheckBox.Checked && secondStepperCheckBox.Checked)
                {
                    readyToStart = checkFirstStepperStartAbility(readyToStart);
                    readyToStart = checkSecondStepperStartAbility(readyToStart);

                    if (readyToStart)
                    {
                        if (!stepperPort.IsOpen)
                            stepperPort.Open();

                        disableFirstStepperComponents();
                        disableSecondStepperComponents();

                        setFirstStepperSteps();
                        setSecondStepperSteps();

                        stepperPort.Write("Start12!ok");
                    }
                }
                else if (firstStepperCheckBox.Checked && !secondStepperCheckBox.Checked)
                {
                    readyToStart = checkFirstStepperStartAbility(readyToStart);

                    if (readyToStart)
                    {
                        if (!stepperPort.IsOpen)
                            stepperPort.Open();

                        disableFirstStepperComponents();

                        setFirstStepperSteps();

                        stepperPort.Write("Start1!ok");
                    }
                }
                else if (!firstStepperCheckBox.Checked && secondStepperCheckBox.Checked)
                {
                    readyToStart = checkSecondStepperStartAbility(readyToStart);

                    if (readyToStart)
                    {
                        if (!stepperPort.IsOpen)
                            stepperPort.Open();

                        disableSecondStepperComponents();

                        setSecondStepperSteps();


                        stepperPort.Write("Start2!ok");
                    }
                }

            }
            catch
            {
                MessageBox.Show("The port you have just chosen is already being used.Please, Choose another one");
                return;
            }
        }

        private void stopBtn_Click(object sender, EventArgs e)
        {
            if (firstStepperCheckBox.Checked && secondStepperCheckBox.Checked)
            {
                enableFirstStepperComponents();
                enableSecondStepperComponents();
            }
            else if (firstStepperCheckBox.Checked && !secondStepperCheckBox.Checked)
            {
                enableFirstStepperComponents();
            }
            else if (!firstStepperCheckBox.Checked && secondStepperCheckBox.Checked)
            {
                enableSecondStepperComponents();
            }

            stepperPort.Write("S");
            stopTimer.Start();
        }
    }
}
