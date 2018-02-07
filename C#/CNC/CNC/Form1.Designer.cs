namespace CNC
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.firstStepperSpeedGroupBox = new System.Windows.Forms.GroupBox();
            this.firstStepperSpeedLabel = new System.Windows.Forms.Label();
            this.firstStepperSpeedTrackBar = new System.Windows.Forms.TrackBar();
            this.firstStepperProgressBar = new System.Windows.Forms.ProgressBar();
            this.firstStepperDirectionGroupBox = new System.Windows.Forms.GroupBox();
            this.firstStepperCounterClockwiseRadioBtn = new System.Windows.Forms.RadioButton();
            this.firstStepperClockWiseRadioBtn = new System.Windows.Forms.RadioButton();
            this.firstStepperStepsGroupBox = new System.Windows.Forms.GroupBox();
            this.firstStepperStepsTextBox = new System.Windows.Forms.TextBox();
            this.firstStepperStepsRadioBtn = new System.Windows.Forms.RadioButton();
            this.firstStepperLoopsRadioBtn = new System.Windows.Forms.RadioButton();
            this.comPortNoComboBox = new System.Windows.Forms.ComboBox();
            this.comPortNoLabel = new System.Windows.Forms.Label();
            this.aboutUsBtn = new System.Windows.Forms.Button();
            this.stopTimer = new System.Windows.Forms.Timer(this.components);
            this.firstStepperGroupBox = new System.Windows.Forms.GroupBox();
            this.secondStepperCheckBox = new System.Windows.Forms.CheckBox();
            this.firstStepperCheckBox = new System.Windows.Forms.CheckBox();
            this.stopBtn = new System.Windows.Forms.Button();
            this.startBtn = new System.Windows.Forms.Button();
            this.secondStepperGroupBox = new System.Windows.Forms.GroupBox();
            this.secondStepperProgressBar = new System.Windows.Forms.ProgressBar();
            this.secondStepperStepsGroupBox = new System.Windows.Forms.GroupBox();
            this.secondStepperStepsTextBox = new System.Windows.Forms.TextBox();
            this.secondStepperStepsRadioBtn = new System.Windows.Forms.RadioButton();
            this.secondStepperLoopsRadioBtn = new System.Windows.Forms.RadioButton();
            this.secondStepperDirectionGroupBox = new System.Windows.Forms.GroupBox();
            this.secondStepperCounterClockwiseRadioBtn = new System.Windows.Forms.RadioButton();
            this.secondStepperClockWiseRadioBtn = new System.Windows.Forms.RadioButton();
            this.secondStepperSpeedGroupBox = new System.Windows.Forms.GroupBox();
            this.secondStepperSpeedLabel = new System.Windows.Forms.Label();
            this.secondStepperSpeedTrackBar = new System.Windows.Forms.TrackBar();
            this.firstStepperSpeedGroupBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.firstStepperSpeedTrackBar)).BeginInit();
            this.firstStepperDirectionGroupBox.SuspendLayout();
            this.firstStepperStepsGroupBox.SuspendLayout();
            this.firstStepperGroupBox.SuspendLayout();
            this.secondStepperGroupBox.SuspendLayout();
            this.secondStepperStepsGroupBox.SuspendLayout();
            this.secondStepperDirectionGroupBox.SuspendLayout();
            this.secondStepperSpeedGroupBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.secondStepperSpeedTrackBar)).BeginInit();
            this.SuspendLayout();
            // 
            // firstStepperSpeedGroupBox
            // 
            this.firstStepperSpeedGroupBox.Controls.Add(this.firstStepperSpeedLabel);
            this.firstStepperSpeedGroupBox.Controls.Add(this.firstStepperSpeedTrackBar);
            this.firstStepperSpeedGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstStepperSpeedGroupBox.Location = new System.Drawing.Point(6, 83);
            this.firstStepperSpeedGroupBox.Name = "firstStepperSpeedGroupBox";
            this.firstStepperSpeedGroupBox.Size = new System.Drawing.Size(303, 100);
            this.firstStepperSpeedGroupBox.TabIndex = 0;
            this.firstStepperSpeedGroupBox.TabStop = false;
            this.firstStepperSpeedGroupBox.Text = "% SPEED";
            // 
            // firstStepperSpeedLabel
            // 
            this.firstStepperSpeedLabel.AutoSize = true;
            this.firstStepperSpeedLabel.Location = new System.Drawing.Point(256, 17);
            this.firstStepperSpeedLabel.Name = "firstStepperSpeedLabel";
            this.firstStepperSpeedLabel.Size = new System.Drawing.Size(30, 16);
            this.firstStepperSpeedLabel.TabIndex = 1;
            this.firstStepperSpeedLabel.Text = "1 %";
            // 
            // firstStepperSpeedTrackBar
            // 
            this.firstStepperSpeedTrackBar.Location = new System.Drawing.Point(10, 40);
            this.firstStepperSpeedTrackBar.Maximum = 100;
            this.firstStepperSpeedTrackBar.Minimum = 1;
            this.firstStepperSpeedTrackBar.Name = "firstStepperSpeedTrackBar";
            this.firstStepperSpeedTrackBar.Size = new System.Drawing.Size(285, 45);
            this.firstStepperSpeedTrackBar.TabIndex = 0;
            this.firstStepperSpeedTrackBar.TickFrequency = 10;
            this.firstStepperSpeedTrackBar.Value = 1;
            this.firstStepperSpeedTrackBar.Scroll += new System.EventHandler(this.firstStepperSpeedTrackBar_Scroll);
            // 
            // firstStepperProgressBar
            // 
            this.firstStepperProgressBar.Location = new System.Drawing.Point(16, 34);
            this.firstStepperProgressBar.Name = "firstStepperProgressBar";
            this.firstStepperProgressBar.Size = new System.Drawing.Size(287, 23);
            this.firstStepperProgressBar.TabIndex = 2;
            // 
            // firstStepperDirectionGroupBox
            // 
            this.firstStepperDirectionGroupBox.Controls.Add(this.firstStepperCounterClockwiseRadioBtn);
            this.firstStepperDirectionGroupBox.Controls.Add(this.firstStepperClockWiseRadioBtn);
            this.firstStepperDirectionGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstStepperDirectionGroupBox.Location = new System.Drawing.Point(6, 203);
            this.firstStepperDirectionGroupBox.Name = "firstStepperDirectionGroupBox";
            this.firstStepperDirectionGroupBox.Size = new System.Drawing.Size(303, 68);
            this.firstStepperDirectionGroupBox.TabIndex = 3;
            this.firstStepperDirectionGroupBox.TabStop = false;
            this.firstStepperDirectionGroupBox.Text = "Direction";
            // 
            // firstStepperCounterClockwiseRadioBtn
            // 
            this.firstStepperCounterClockwiseRadioBtn.AutoSize = true;
            this.firstStepperCounterClockwiseRadioBtn.Location = new System.Drawing.Point(126, 30);
            this.firstStepperCounterClockwiseRadioBtn.Name = "firstStepperCounterClockwiseRadioBtn";
            this.firstStepperCounterClockwiseRadioBtn.Size = new System.Drawing.Size(136, 20);
            this.firstStepperCounterClockwiseRadioBtn.TabIndex = 1;
            this.firstStepperCounterClockwiseRadioBtn.TabStop = true;
            this.firstStepperCounterClockwiseRadioBtn.Text = "Counter Clockwise";
            this.firstStepperCounterClockwiseRadioBtn.UseVisualStyleBackColor = true;
            this.firstStepperCounterClockwiseRadioBtn.CheckedChanged += new System.EventHandler(this.firstStepperCounterClockwiseRadioBtn_CheckedChanged);
            // 
            // firstStepperClockWiseRadioBtn
            // 
            this.firstStepperClockWiseRadioBtn.AutoSize = true;
            this.firstStepperClockWiseRadioBtn.Location = new System.Drawing.Point(10, 30);
            this.firstStepperClockWiseRadioBtn.Name = "firstStepperClockWiseRadioBtn";
            this.firstStepperClockWiseRadioBtn.Size = new System.Drawing.Size(87, 20);
            this.firstStepperClockWiseRadioBtn.TabIndex = 0;
            this.firstStepperClockWiseRadioBtn.TabStop = true;
            this.firstStepperClockWiseRadioBtn.Text = "Clockwise";
            this.firstStepperClockWiseRadioBtn.UseVisualStyleBackColor = true;
            this.firstStepperClockWiseRadioBtn.CheckedChanged += new System.EventHandler(this.firststepperClockwiseRadioBtn_CheckedChanged);
            // 
            // firstStepperStepsGroupBox
            // 
            this.firstStepperStepsGroupBox.Controls.Add(this.firstStepperStepsTextBox);
            this.firstStepperStepsGroupBox.Controls.Add(this.firstStepperStepsRadioBtn);
            this.firstStepperStepsGroupBox.Controls.Add(this.firstStepperLoopsRadioBtn);
            this.firstStepperStepsGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstStepperStepsGroupBox.Location = new System.Drawing.Point(6, 290);
            this.firstStepperStepsGroupBox.Name = "firstStepperStepsGroupBox";
            this.firstStepperStepsGroupBox.Size = new System.Drawing.Size(303, 60);
            this.firstStepperStepsGroupBox.TabIndex = 4;
            this.firstStepperStepsGroupBox.TabStop = false;
            this.firstStepperStepsGroupBox.Text = "Steps";
            // 
            // firstStepperStepsTextBox
            // 
            this.firstStepperStepsTextBox.Location = new System.Drawing.Point(187, 25);
            this.firstStepperStepsTextBox.Name = "firstStepperStepsTextBox";
            this.firstStepperStepsTextBox.Size = new System.Drawing.Size(99, 22);
            this.firstStepperStepsTextBox.TabIndex = 5;
            // 
            // firstStepperStepsRadioBtn
            // 
            this.firstStepperStepsRadioBtn.AutoSize = true;
            this.firstStepperStepsRadioBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstStepperStepsRadioBtn.Location = new System.Drawing.Point(102, 25);
            this.firstStepperStepsRadioBtn.Name = "firstStepperStepsRadioBtn";
            this.firstStepperStepsRadioBtn.Size = new System.Drawing.Size(61, 20);
            this.firstStepperStepsRadioBtn.TabIndex = 4;
            this.firstStepperStepsRadioBtn.TabStop = true;
            this.firstStepperStepsRadioBtn.Text = "Steps";
            this.firstStepperStepsRadioBtn.UseVisualStyleBackColor = true;
            // 
            // firstStepperLoopsRadioBtn
            // 
            this.firstStepperLoopsRadioBtn.AutoSize = true;
            this.firstStepperLoopsRadioBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstStepperLoopsRadioBtn.Location = new System.Drawing.Point(10, 25);
            this.firstStepperLoopsRadioBtn.Name = "firstStepperLoopsRadioBtn";
            this.firstStepperLoopsRadioBtn.Size = new System.Drawing.Size(64, 20);
            this.firstStepperLoopsRadioBtn.TabIndex = 2;
            this.firstStepperLoopsRadioBtn.TabStop = true;
            this.firstStepperLoopsRadioBtn.Text = "Loops";
            this.firstStepperLoopsRadioBtn.UseVisualStyleBackColor = true;
            // 
            // comPortNoComboBox
            // 
            this.comPortNoComboBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.999999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comPortNoComboBox.FormattingEnabled = true;
            this.comPortNoComboBox.Location = new System.Drawing.Point(87, 24);
            this.comPortNoComboBox.Name = "comPortNoComboBox";
            this.comPortNoComboBox.Size = new System.Drawing.Size(137, 23);
            this.comPortNoComboBox.TabIndex = 1;
            this.comPortNoComboBox.SelectedIndexChanged += new System.EventHandler(this.comPortNoComboBox_SelectedIndexChanged);
            // 
            // comPortNoLabel
            // 
            this.comPortNoLabel.AutoSize = true;
            this.comPortNoLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comPortNoLabel.Location = new System.Drawing.Point(4, 27);
            this.comPortNoLabel.Name = "comPortNoLabel";
            this.comPortNoLabel.Size = new System.Drawing.Size(87, 16);
            this.comPortNoLabel.TabIndex = 0;
            this.comPortNoLabel.Text = "Com Port No.";
            // 
            // aboutUsBtn
            // 
            this.aboutUsBtn.BackColor = System.Drawing.Color.Ivory;
            this.aboutUsBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.aboutUsBtn.Location = new System.Drawing.Point(537, 49);
            this.aboutUsBtn.Name = "aboutUsBtn";
            this.aboutUsBtn.Size = new System.Drawing.Size(137, 50);
            this.aboutUsBtn.TabIndex = 0;
            this.aboutUsBtn.Text = "About Us   .";
            this.aboutUsBtn.UseVisualStyleBackColor = false;
            this.aboutUsBtn.Click += new System.EventHandler(this.aboutUsBtn_Click);
            // 
            // stopTimer
            // 
            this.stopTimer.Tick += new System.EventHandler(this.stopTimer_Tick);
            // 
            // firstStepperGroupBox
            // 
            this.firstStepperGroupBox.Controls.Add(this.firstStepperProgressBar);
            this.firstStepperGroupBox.Controls.Add(this.firstStepperStepsGroupBox);
            this.firstStepperGroupBox.Controls.Add(this.firstStepperDirectionGroupBox);
            this.firstStepperGroupBox.Controls.Add(this.firstStepperSpeedGroupBox);
            this.firstStepperGroupBox.Enabled = false;
            this.firstStepperGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstStepperGroupBox.Location = new System.Drawing.Point(12, 134);
            this.firstStepperGroupBox.Name = "firstStepperGroupBox";
            this.firstStepperGroupBox.Size = new System.Drawing.Size(326, 370);
            this.firstStepperGroupBox.TabIndex = 7;
            this.firstStepperGroupBox.TabStop = false;
            this.firstStepperGroupBox.Text = "1st Stepper";
            // 
            // secondStepperCheckBox
            // 
            this.secondStepperCheckBox.AutoSize = true;
            this.secondStepperCheckBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.secondStepperCheckBox.Location = new System.Drawing.Point(7, 86);
            this.secondStepperCheckBox.Name = "secondStepperCheckBox";
            this.secondStepperCheckBox.Size = new System.Drawing.Size(127, 24);
            this.secondStepperCheckBox.TabIndex = 5;
            this.secondStepperCheckBox.Text = "2nd Stepper";
            this.secondStepperCheckBox.UseVisualStyleBackColor = true;
            this.secondStepperCheckBox.CheckedChanged += new System.EventHandler(this.secondStepperCheckBox_CheckedChanged);
            // 
            // firstStepperCheckBox
            // 
            this.firstStepperCheckBox.AutoSize = true;
            this.firstStepperCheckBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.firstStepperCheckBox.Location = new System.Drawing.Point(7, 56);
            this.firstStepperCheckBox.Name = "firstStepperCheckBox";
            this.firstStepperCheckBox.Size = new System.Drawing.Size(122, 24);
            this.firstStepperCheckBox.TabIndex = 4;
            this.firstStepperCheckBox.Text = "1st Stepper";
            this.firstStepperCheckBox.UseVisualStyleBackColor = true;
            this.firstStepperCheckBox.CheckedChanged += new System.EventHandler(this.firstStepperCheckBox_CheckedChanged);
            // 
            // stopBtn
            // 
            this.stopBtn.BackColor = System.Drawing.Color.Red;
            this.stopBtn.Enabled = false;
            this.stopBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.stopBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.stopBtn.Location = new System.Drawing.Point(416, 49);
            this.stopBtn.Name = "stopBtn";
            this.stopBtn.Size = new System.Drawing.Size(97, 50);
            this.stopBtn.TabIndex = 3;
            this.stopBtn.Text = "     Stop ";
            this.stopBtn.UseVisualStyleBackColor = false;
            this.stopBtn.Click += new System.EventHandler(this.stopBtn_Click);
            // 
            // startBtn
            // 
            this.startBtn.BackColor = System.Drawing.Color.LimeGreen;
            this.startBtn.Enabled = false;
            this.startBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.startBtn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.startBtn.Location = new System.Drawing.Point(277, 49);
            this.startBtn.Name = "startBtn";
            this.startBtn.Size = new System.Drawing.Size(97, 50);
            this.startBtn.TabIndex = 2;
            this.startBtn.Text = "   Start";
            this.startBtn.UseVisualStyleBackColor = false;
            this.startBtn.Click += new System.EventHandler(this.startBtn_Click);
            // 
            // secondStepperGroupBox
            // 
            this.secondStepperGroupBox.Controls.Add(this.secondStepperProgressBar);
            this.secondStepperGroupBox.Controls.Add(this.secondStepperStepsGroupBox);
            this.secondStepperGroupBox.Controls.Add(this.secondStepperDirectionGroupBox);
            this.secondStepperGroupBox.Controls.Add(this.secondStepperSpeedGroupBox);
            this.secondStepperGroupBox.Enabled = false;
            this.secondStepperGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.secondStepperGroupBox.Location = new System.Drawing.Point(344, 134);
            this.secondStepperGroupBox.Name = "secondStepperGroupBox";
            this.secondStepperGroupBox.Size = new System.Drawing.Size(326, 370);
            this.secondStepperGroupBox.TabIndex = 9;
            this.secondStepperGroupBox.TabStop = false;
            this.secondStepperGroupBox.Text = "2nd Stepper";
            // 
            // secondStepperProgressBar
            // 
            this.secondStepperProgressBar.Location = new System.Drawing.Point(16, 34);
            this.secondStepperProgressBar.Name = "secondStepperProgressBar";
            this.secondStepperProgressBar.Size = new System.Drawing.Size(287, 23);
            this.secondStepperProgressBar.TabIndex = 2;
            // 
            // secondStepperStepsGroupBox
            // 
            this.secondStepperStepsGroupBox.Controls.Add(this.secondStepperStepsTextBox);
            this.secondStepperStepsGroupBox.Controls.Add(this.secondStepperStepsRadioBtn);
            this.secondStepperStepsGroupBox.Controls.Add(this.secondStepperLoopsRadioBtn);
            this.secondStepperStepsGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.secondStepperStepsGroupBox.Location = new System.Drawing.Point(6, 290);
            this.secondStepperStepsGroupBox.Name = "secondStepperStepsGroupBox";
            this.secondStepperStepsGroupBox.Size = new System.Drawing.Size(303, 60);
            this.secondStepperStepsGroupBox.TabIndex = 4;
            this.secondStepperStepsGroupBox.TabStop = false;
            this.secondStepperStepsGroupBox.Text = "Steps";
            // 
            // secondStepperStepsTextBox
            // 
            this.secondStepperStepsTextBox.Location = new System.Drawing.Point(187, 25);
            this.secondStepperStepsTextBox.Name = "secondStepperStepsTextBox";
            this.secondStepperStepsTextBox.Size = new System.Drawing.Size(99, 22);
            this.secondStepperStepsTextBox.TabIndex = 5;
            // 
            // secondStepperStepsRadioBtn
            // 
            this.secondStepperStepsRadioBtn.AutoSize = true;
            this.secondStepperStepsRadioBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.secondStepperStepsRadioBtn.Location = new System.Drawing.Point(102, 25);
            this.secondStepperStepsRadioBtn.Name = "secondStepperStepsRadioBtn";
            this.secondStepperStepsRadioBtn.Size = new System.Drawing.Size(61, 20);
            this.secondStepperStepsRadioBtn.TabIndex = 4;
            this.secondStepperStepsRadioBtn.TabStop = true;
            this.secondStepperStepsRadioBtn.Text = "Steps";
            this.secondStepperStepsRadioBtn.UseVisualStyleBackColor = true;
            // 
            // secondStepperLoopsRadioBtn
            // 
            this.secondStepperLoopsRadioBtn.AutoSize = true;
            this.secondStepperLoopsRadioBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.secondStepperLoopsRadioBtn.Location = new System.Drawing.Point(10, 25);
            this.secondStepperLoopsRadioBtn.Name = "secondStepperLoopsRadioBtn";
            this.secondStepperLoopsRadioBtn.Size = new System.Drawing.Size(64, 20);
            this.secondStepperLoopsRadioBtn.TabIndex = 2;
            this.secondStepperLoopsRadioBtn.TabStop = true;
            this.secondStepperLoopsRadioBtn.Text = "Loops";
            this.secondStepperLoopsRadioBtn.UseVisualStyleBackColor = true;
            // 
            // secondStepperDirectionGroupBox
            // 
            this.secondStepperDirectionGroupBox.Controls.Add(this.secondStepperCounterClockwiseRadioBtn);
            this.secondStepperDirectionGroupBox.Controls.Add(this.secondStepperClockWiseRadioBtn);
            this.secondStepperDirectionGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.secondStepperDirectionGroupBox.Location = new System.Drawing.Point(6, 203);
            this.secondStepperDirectionGroupBox.Name = "secondStepperDirectionGroupBox";
            this.secondStepperDirectionGroupBox.Size = new System.Drawing.Size(303, 68);
            this.secondStepperDirectionGroupBox.TabIndex = 3;
            this.secondStepperDirectionGroupBox.TabStop = false;
            this.secondStepperDirectionGroupBox.Text = "Direction";
            // 
            // secondStepperCounterClockwiseRadioBtn
            // 
            this.secondStepperCounterClockwiseRadioBtn.AutoSize = true;
            this.secondStepperCounterClockwiseRadioBtn.Location = new System.Drawing.Point(126, 30);
            this.secondStepperCounterClockwiseRadioBtn.Name = "secondStepperCounterClockwiseRadioBtn";
            this.secondStepperCounterClockwiseRadioBtn.Size = new System.Drawing.Size(136, 20);
            this.secondStepperCounterClockwiseRadioBtn.TabIndex = 1;
            this.secondStepperCounterClockwiseRadioBtn.TabStop = true;
            this.secondStepperCounterClockwiseRadioBtn.Text = "Counter Clockwise";
            this.secondStepperCounterClockwiseRadioBtn.UseVisualStyleBackColor = true;
            this.secondStepperCounterClockwiseRadioBtn.CheckedChanged += new System.EventHandler(this.secondStepperCounterClockwiseRadioBtn_CheckedChanged);
            // 
            // secondStepperClockWiseRadioBtn
            // 
            this.secondStepperClockWiseRadioBtn.AutoSize = true;
            this.secondStepperClockWiseRadioBtn.Location = new System.Drawing.Point(10, 30);
            this.secondStepperClockWiseRadioBtn.Name = "secondStepperClockWiseRadioBtn";
            this.secondStepperClockWiseRadioBtn.Size = new System.Drawing.Size(87, 20);
            this.secondStepperClockWiseRadioBtn.TabIndex = 0;
            this.secondStepperClockWiseRadioBtn.TabStop = true;
            this.secondStepperClockWiseRadioBtn.Text = "Clockwise";
            this.secondStepperClockWiseRadioBtn.UseVisualStyleBackColor = true;
            this.secondStepperClockWiseRadioBtn.CheckedChanged += new System.EventHandler(this.secondStepperClockWiseRadioBtn_CheckedChanged);
            // 
            // secondStepperSpeedGroupBox
            // 
            this.secondStepperSpeedGroupBox.Controls.Add(this.secondStepperSpeedLabel);
            this.secondStepperSpeedGroupBox.Controls.Add(this.secondStepperSpeedTrackBar);
            this.secondStepperSpeedGroupBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.secondStepperSpeedGroupBox.Location = new System.Drawing.Point(6, 83);
            this.secondStepperSpeedGroupBox.Name = "secondStepperSpeedGroupBox";
            this.secondStepperSpeedGroupBox.Size = new System.Drawing.Size(303, 100);
            this.secondStepperSpeedGroupBox.TabIndex = 0;
            this.secondStepperSpeedGroupBox.TabStop = false;
            this.secondStepperSpeedGroupBox.Text = "% SPEED";
            // 
            // secondStepperSpeedLabel
            // 
            this.secondStepperSpeedLabel.AutoSize = true;
            this.secondStepperSpeedLabel.Location = new System.Drawing.Point(256, 17);
            this.secondStepperSpeedLabel.Name = "secondStepperSpeedLabel";
            this.secondStepperSpeedLabel.Size = new System.Drawing.Size(30, 16);
            this.secondStepperSpeedLabel.TabIndex = 1;
            this.secondStepperSpeedLabel.Text = "1 %";
            // 
            // secondStepperSpeedTrackBar
            // 
            this.secondStepperSpeedTrackBar.Location = new System.Drawing.Point(10, 40);
            this.secondStepperSpeedTrackBar.Maximum = 100;
            this.secondStepperSpeedTrackBar.Minimum = 1;
            this.secondStepperSpeedTrackBar.Name = "secondStepperSpeedTrackBar";
            this.secondStepperSpeedTrackBar.Size = new System.Drawing.Size(285, 45);
            this.secondStepperSpeedTrackBar.TabIndex = 0;
            this.secondStepperSpeedTrackBar.TickFrequency = 10;
            this.secondStepperSpeedTrackBar.Value = 1;
            this.secondStepperSpeedTrackBar.Scroll += new System.EventHandler(this.secondStepperSpeedTrackBar_Scroll);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(686, 519);
            this.Controls.Add(this.secondStepperCheckBox);
            this.Controls.Add(this.secondStepperGroupBox);
            this.Controls.Add(this.firstStepperCheckBox);
            this.Controls.Add(this.stopBtn);
            this.Controls.Add(this.firstStepperGroupBox);
            this.Controls.Add(this.startBtn);
            this.Controls.Add(this.comPortNoComboBox);
            this.Controls.Add(this.aboutUsBtn);
            this.Controls.Add(this.comPortNoLabel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "Form1";
            this.Text = "Stepper Controller";
            this.firstStepperSpeedGroupBox.ResumeLayout(false);
            this.firstStepperSpeedGroupBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.firstStepperSpeedTrackBar)).EndInit();
            this.firstStepperDirectionGroupBox.ResumeLayout(false);
            this.firstStepperDirectionGroupBox.PerformLayout();
            this.firstStepperStepsGroupBox.ResumeLayout(false);
            this.firstStepperStepsGroupBox.PerformLayout();
            this.firstStepperGroupBox.ResumeLayout(false);
            this.secondStepperGroupBox.ResumeLayout(false);
            this.secondStepperStepsGroupBox.ResumeLayout(false);
            this.secondStepperStepsGroupBox.PerformLayout();
            this.secondStepperDirectionGroupBox.ResumeLayout(false);
            this.secondStepperDirectionGroupBox.PerformLayout();
            this.secondStepperSpeedGroupBox.ResumeLayout(false);
            this.secondStepperSpeedGroupBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.secondStepperSpeedTrackBar)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox firstStepperSpeedGroupBox;
        private System.Windows.Forms.TrackBar firstStepperSpeedTrackBar;
        private System.Windows.Forms.GroupBox firstStepperDirectionGroupBox;
        private System.Windows.Forms.GroupBox firstStepperStepsGroupBox;
        private System.Windows.Forms.Label comPortNoLabel;
        private System.Windows.Forms.ComboBox comPortNoComboBox;
        private System.Windows.Forms.RadioButton firstStepperCounterClockwiseRadioBtn;
        private System.Windows.Forms.RadioButton firstStepperClockWiseRadioBtn;
        private System.Windows.Forms.Label firstStepperSpeedLabel;
        private System.Windows.Forms.Button aboutUsBtn;
        private System.Windows.Forms.RadioButton firstStepperLoopsRadioBtn;
        private System.Windows.Forms.RadioButton firstStepperStepsRadioBtn;
        private System.Windows.Forms.TextBox firstStepperStepsTextBox;
        private System.Windows.Forms.ProgressBar firstStepperProgressBar;
        private System.Windows.Forms.Timer stopTimer;
        private System.Windows.Forms.GroupBox firstStepperGroupBox;
        private System.Windows.Forms.Button stopBtn;
        private System.Windows.Forms.Button startBtn;
        private System.Windows.Forms.GroupBox secondStepperGroupBox;
        private System.Windows.Forms.GroupBox secondStepperStepsGroupBox;
        private System.Windows.Forms.TextBox secondStepperStepsTextBox;
        private System.Windows.Forms.RadioButton secondStepperStepsRadioBtn;
        private System.Windows.Forms.RadioButton secondStepperLoopsRadioBtn;
        private System.Windows.Forms.GroupBox secondStepperDirectionGroupBox;
        private System.Windows.Forms.RadioButton secondStepperCounterClockwiseRadioBtn;
        private System.Windows.Forms.RadioButton secondStepperClockWiseRadioBtn;
        private System.Windows.Forms.ProgressBar secondStepperProgressBar;
        private System.Windows.Forms.GroupBox secondStepperSpeedGroupBox;
        private System.Windows.Forms.Label secondStepperSpeedLabel;
        private System.Windows.Forms.TrackBar secondStepperSpeedTrackBar;
        private System.Windows.Forms.CheckBox secondStepperCheckBox;
        private System.Windows.Forms.CheckBox firstStepperCheckBox;
    }
}

