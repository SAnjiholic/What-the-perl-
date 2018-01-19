namespace Yj
{
    partial class Form1
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다. 
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마세요.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.panel1 = new System.Windows.Forms.Panel();
            this.NUM3 = new System.Windows.Forms.NumericUpDown();
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.NUM2 = new System.Windows.Forms.NumericUpDown();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.NUM1 = new System.Windows.Forms.NumericUpDown();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.NUM3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackgroundImage = global::Yj.Properties.Resources._333;
            this.panel1.Controls.Add(this.NUM3);
            this.panel1.Controls.Add(this.comboBox3);
            this.panel1.Controls.Add(this.NUM2);
            this.panel1.Controls.Add(this.comboBox2);
            this.panel1.Controls.Add(this.NUM1);
            this.panel1.Controls.Add(this.button3);
            this.panel1.Controls.Add(this.button2);
            this.panel1.Controls.Add(this.button1);
            this.panel1.Controls.Add(this.comboBox1);
            this.panel1.Location = new System.Drawing.Point(3, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1421, 680);
            this.panel1.TabIndex = 0;
            // 
            // NUM3
            // 
            this.NUM3.Font = new System.Drawing.Font("휴먼편지체", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.NUM3.Location = new System.Drawing.Point(1288, 303);
            this.NUM3.Name = "NUM3";
            this.NUM3.Size = new System.Drawing.Size(60, 39);
            this.NUM3.TabIndex = 10;
            // 
            // comboBox3
            // 
            this.comboBox3.Font = new System.Drawing.Font("굴림", 20F);
            this.comboBox3.FormattingEnabled = true;
            this.comboBox3.Location = new System.Drawing.Point(1010, 303);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(262, 35);
            this.comboBox3.TabIndex = 9;
            // 
            // NUM2
            // 
            this.NUM2.Font = new System.Drawing.Font("휴먼편지체", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.NUM2.Location = new System.Drawing.Point(829, 298);
            this.NUM2.Name = "NUM2";
            this.NUM2.Size = new System.Drawing.Size(60, 39);
            this.NUM2.TabIndex = 8;
            // 
            // comboBox2
            // 
            this.comboBox2.Font = new System.Drawing.Font("굴림", 20F);
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Location = new System.Drawing.Point(551, 298);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(262, 35);
            this.comboBox2.TabIndex = 7;
            // 
            // NUM1
            // 
            this.NUM1.Font = new System.Drawing.Font("휴먼편지체", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.NUM1.Location = new System.Drawing.Point(369, 298);
            this.NUM1.Name = "NUM1";
            this.NUM1.Size = new System.Drawing.Size(60, 39);
            this.NUM1.TabIndex = 6;
            // 
            // button3
            // 
            this.button3.BackColor = System.Drawing.SystemColors.Window;
            this.button3.Font = new System.Drawing.Font("휴먼매직체", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.button3.Location = new System.Drawing.Point(1025, 445);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(314, 65);
            this.button3.TabIndex = 3;
            this.button3.Text = "발행";
            this.button3.UseVisualStyleBackColor = false;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.SystemColors.Window;
            this.button2.Font = new System.Drawing.Font("휴먼매직체", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.button2.Location = new System.Drawing.Point(563, 445);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(314, 65);
            this.button2.TabIndex = 2;
            this.button2.Text = "발행";
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.Window;
            this.button1.Font = new System.Drawing.Font("휴먼매직체", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.button1.Location = new System.Drawing.Point(103, 445);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(314, 65);
            this.button1.TabIndex = 1;
            this.button1.Text = "발행";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // comboBox1
            // 
            this.comboBox1.Font = new System.Drawing.Font("굴림", 20F);
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(91, 298);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(262, 35);
            this.comboBox1.TabIndex = 0;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1424, 681);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.Text = "Yj";
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.NUM3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.NUM1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.NumericUpDown NUM1;
        private System.Windows.Forms.NumericUpDown NUM3;
        private System.Windows.Forms.ComboBox comboBox3;
        private System.Windows.Forms.NumericUpDown NUM2;
        private System.Windows.Forms.ComboBox comboBox2;
    }
}

