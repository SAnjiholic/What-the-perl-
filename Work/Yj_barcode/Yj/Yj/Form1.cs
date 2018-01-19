using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Diagnostics;

namespace Yj
{

    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            string connectionString = "server =211.110.139.11; uid = 'springwd1718_fun2'; pwd= 'funsys@11'; database = 'springwd1718_fun2';";
            SqlConnection scon = new SqlConnection(connectionString);
            SqlCommand scom = new SqlCommand();
            scom.Connection = scon;
            scom.CommandText = "Select PROD_NUM from T_PROD_SALE where MCOMP_CODE = 'C0004'";
            scon.Open();

            SqlDataReader sdr = scom.ExecuteReader();
       
            string st = "";

            while (sdr.Read())
            {   st = sdr[0].ToString();
                comboBox1.Items.Add(st);
                comboBox2.Items.Add(st);
                comboBox3.Items.Add(st);
            }
            

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string test = comboBox1.Text;
            decimal a = NUM1.Value;
            string ret =test + " A " + a;
           // System.Diagnostics.Process.Start("cmd.exe","test1.exe");

            string strappname = Application.StartupPath + "\\bar.exe";
            Process.Start(@strappname,ret);

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string test = comboBox2.Text;
            decimal a = NUM2.Value;
            string ret = test + " B " + a;

            string strappname = Application.StartupPath + "\\bar.exe";
            Process.Start(@strappname, ret);

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string test = comboBox3.Text;
            decimal a = NUM3.Value;
            string ret = test + " C " + a;

            string strappname = Application.StartupPath + "\\bar.exe";
            Process.Start(@strappname, ret);
        }
    }
}
        