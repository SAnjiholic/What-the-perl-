using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Inout
{
    public partial class Form7 : Form
    {
        public Form7()
        {
            InitializeComponent();
            int yy = DateTime.Today.Year;
            int mm = DateTime.Today.Month;
            DefaultSet(yy,mm);
        }


        private int retday(int mon) {
            int last=0;
            if (mon == 1 | mon == 3 | mon == 5 | mon == 7 | mon == 8 | mon == 10 | mon == 12) last = 32;
            if (mon == 4 | mon == 6 | mon == 9 | mon == 11) last = 31;
            if (mon == 2) last = 29;
            return last;
        }

        private int GetDay(DateTime dt)
               {
                   int strDay=0;
                    switch (dt.DayOfWeek) {
                       case DayOfWeek.Monday:    strDay = 1; break;
                       case DayOfWeek.Tuesday:   strDay = 2; break;
                       case DayOfWeek.Wednesday: strDay = 3; break;
                       case DayOfWeek.Thursday:  strDay = 4; break;
                       case DayOfWeek.Friday:    strDay = 5; break;
                       case DayOfWeek.Saturday:  strDay = 6; break;
                       case DayOfWeek.Sunday:    strDay = 0; break;
                    }
                    return strDay;
               }

        private void DefaultSet(int year, int mon)
        {
            pictureBox36.Visible = false;
            pictureBox37.Visible = false;
            label1.ForeColor = Color.Red;
            label2.ForeColor = Color.Black;
            label3.ForeColor = Color.Black;
            label4.ForeColor = Color.Black;
            label5.ForeColor = Color.Black;
            label6.ForeColor = Color.Blue;

            int flag = 0;
            int flag2 = 0;
            int last = 0;
            last = retday(mon);
            label40.Text = Convert.ToString(year);
            label40.Text = Convert.ToString(mon);

            DateTime thisDate1 = new DateTime(year, mon, 1);


            PictureBox[] pan = new PictureBox[] {
                pictureBox1,  pictureBox2,  pictureBox3,  pictureBox4, pictureBox5,  pictureBox6,  pictureBox7,  pictureBox8,  pictureBox9,  pictureBox10,                                      
                pictureBox11, pictureBox12, pictureBox13, pictureBox14,pictureBox15, pictureBox16, pictureBox17, pictureBox18, pictureBox19, pictureBox20,                      
                pictureBox21, pictureBox22, pictureBox23, pictureBox24,pictureBox25, pictureBox26, pictureBox27, pictureBox28, pictureBox29, pictureBox30,                                      
                pictureBox31, pictureBox32, pictureBox33, pictureBox34,pictureBox35, pictureBox36, pictureBox37};

            Label[] lbl = new Label[] { label1,  label2,  label3,  label4, label5,  label6,  label7,  label8,  label9,  label10,
                                        label11, label12, label13, label14,label15, label16, label17, label18, label19, label20,
                                        label21, label22, label23, label24,label25, label26, label27, label28, label29, label30,
                                        label31, label32, label33, label34,label35, label36, label37};
            flag = GetDay(thisDate1);
            for (int j = 0; j < 37; j++) { lbl[j].Text = ""; }
            flag2 = retday(mon - 1);
            for (int j = flag - 1; j > -1; j--) { lbl[j].Text = Convert.ToString(flag2 - 1); lbl[j].ForeColor = Color.Pink; flag2--; }
            for (int day = 1; day < last; day++)
            {
                lbl[flag].Text = Convert.ToString(day);
                if (flag == 35) pictureBox36.Visible = true;
                if (flag == 36) pictureBox37.Visible = true;
                flag++;
            }
        }

        private void Bot(string num)
        {
            string number = num.Substring(10, 12);
            MessageBox.Show(number);
        }


        private void yearm(char b)
        {       
                int year = Convert.ToInt32(label38.Text);
                if (b == '-') year--;
                else year++;
                label38.Text = Convert.ToString(year);
                int Mon = Convert.ToInt32(label40.Text);
                DefaultSet(year, Mon);          
        }       

        private void monm(char b)
        {
            int Mon = Convert.ToInt32(label40.Text);
            if (b == '-') Mon--;
            else Mon++;
            if (Mon == 0) { Mon = 12; int year = Convert.ToInt32(label38.Text); year--; label38.Text = Convert.ToString(year); }
            if (Mon == 13) { Mon = 1; int year = Convert.ToInt32(label38.Text); year++; label38.Text = Convert.ToString(year); }
            label40.Text = Convert.ToString(Mon);
            int Year = Convert.ToInt32(label38.Text);
            DefaultSet(Year, Mon);
        }
        
        private void label42_Click(object sender, EventArgs e)
        {
            yearm('-');
        }

        private void pictureBox38_Click(object sender, EventArgs e)
        {
            yearm('-');
        }

        private void label43_Click(object sender, EventArgs e)
        {
            yearm('+');
        }

        private void pictureBox39_Click(object sender, EventArgs e)
        {
            yearm('+');
        }

        private void pictureBox40_Click(object sender, EventArgs e)
        {
            monm('-');
        }

        private void label44_Click(object sender, EventArgs e)
        {
            monm('-');
        }

        private void label45_Click(object sender, EventArgs e)
        {
            monm('+');
        }

        private void pictureBox41_Click(object sender, EventArgs e)
        {
            monm('+');
        }
        
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            string a = pictureBox1.Name;
            Bot(a);

        }
        private void pictureBox2_Click(object sender, EventArgs e)
        {
            string a = pictureBox2.Name;
            Bot(a);
        }

        private void label38_Click(object sender, EventArgs e)
        {

        }

        private void label36_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            string a = pictureBox3.Name;
            Bot(a);
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            string a = pictureBox4.Name;
            Bot(a);
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            string a = pictureBox5.Name;
            Bot(a);
        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {
            string a = pictureBox6.Name;
            Bot(a);
        }

        private void pictureBox7_Click(object sender, EventArgs e)
        {
            string a = pictureBox7.Name;
            Bot(a);
        }

        private void pictureBox8_Click(object sender, EventArgs e)
        {
            string a = pictureBox8.Name;
            Bot(a);
        }

        private void pictureBox9_Click(object sender, EventArgs e)
        {
            string a = pictureBox9.Name;
            Bot(a);
        }

        private void pictureBox10_Click(object sender, EventArgs e)
        {
            string a = pictureBox10.Name;
            Bot(a);
        }

        private void pictureBox11_Click(object sender, EventArgs e)
        {
            string a = pictureBox11.Name;
            Bot(a);
        }

        private void pictureBox12_Click(object sender, EventArgs e)
        {
            string a = pictureBox12.Name;
            Bot(a);
        }

        private void pictureBox13_Click(object sender, EventArgs e)
        {
            string a = pictureBox13.Name;
            Bot(a);
        }

        private void pictureBox14_Click(object sender, EventArgs e)
        {
            string a = pictureBox14.Name;
            Bot(a);
        }

        private void pictureBox15_Click(object sender, EventArgs e)
        {
            string a = pictureBox15.Name;
            Bot(a);
        }

        private void pictureBox16_Click(object sender, EventArgs e)
        {
            string a = pictureBox16.Name;
            Bot(a);
        }

        private void pictureBox17_Click(object sender, EventArgs e)
        {
            string a = pictureBox17.Name;
            Bot(a);
        }

        private void pictureBox18_Click(object sender, EventArgs e)
        {
            string a = pictureBox18.Name;
            Bot(a);
        }

        private void pictureBox19_Click(object sender, EventArgs e)
        {
            string a = pictureBox19.Name;
            Bot(a);
        }

        private void pictureBox20_Click(object sender, EventArgs e)
        {
            string a = pictureBox20.Name;
            Bot(a);
        }

        private void pictureBox21_Click(object sender, EventArgs e)
        {
            string a = pictureBox21.Name;
            Bot(a);
        }

        private void pictureBox22_Click(object sender, EventArgs e)
        {
            string a = pictureBox22.Name;
            Bot(a);
        }

        private void pictureBox23_Click(object sender, EventArgs e)
        {
            string a = pictureBox23.Name;
            Bot(a);
        }

        private void pictureBox24_Click(object sender, EventArgs e)
        {
            string a = pictureBox24.Name;
            Bot(a);
        }

        private void pictureBox25_Click(object sender, EventArgs e)
        {

            string a = pictureBox25.Name;
            Bot(a);
        }

        private void pictureBox26_Click(object sender, EventArgs e)
        {
            string a = pictureBox26.Name;
            Bot(a);
        }

        private void pictureBox27_Click(object sender, EventArgs e)
        {
            string a = pictureBox27.Name;
            Bot(a);
        }

        private void pictureBox28_Click(object sender, EventArgs e)
        {
            string a = pictureBox28.Name;
            Bot(a);
        }

        private void pictureBox29_Click(object sender, EventArgs e)
        {
            string a = pictureBox29.Name;
            Bot(a);
        }

        private void pictureBox30_Click(object sender, EventArgs e)
        {
            string a = pictureBox30.Name;
            Bot(a);
        }

        private void pictureBox31_Click(object sender, EventArgs e)
        {
            string a = pictureBox31.Name;
            Bot(a);
        }

        private void pictureBox32_Click(object sender, EventArgs e)
        {
            string a = pictureBox32.Name;
            Bot(a);
        }

        private void pictureBox33_Click(object sender, EventArgs e)
        {
            string a = pictureBox33.Name;
            Bot(a);
        }

        private void pictureBox34_Click(object sender, EventArgs e)
        {
            string a = pictureBox34.Name;
            Bot(a);
        }

        private void pictureBox35_Click(object sender, EventArgs e)
        {
            string a = pictureBox35.Name;
            Bot(a);
        }

        private void pictureBox36_Click(object sender, EventArgs e)
        {
            string a = pictureBox36.Name;
            Bot(a);
        }

        private void pictureBox37_Click(object sender, EventArgs e)
        {
            string a = pictureBox37.Name;
            Bot(a);
        }
    }
}
