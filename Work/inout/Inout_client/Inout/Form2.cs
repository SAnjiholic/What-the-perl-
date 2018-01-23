using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.NetworkInformation;
using System.Diagnostics;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace Inout
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int flag = 0;
            String mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            string connectionString = "server = 127.0.0.1; uid = 'root'; pwd='asdd'; database = 'test';";
            MySqlConnection scon = new MySqlConnection(connectionString);
            MySqlCommand scom = new MySqlCommand();
            scom.Connection = scon;
            scom.CommandText = "select MAC from member";
            scon.Open();
            MySqlDataReader sdr = scom.ExecuteReader();
            string st = "";
            
            while (sdr.Read())
            {
                st = sdr[0].ToString();
                if (mac == st)
                {
                    String MD5 = textBox1.Text;
                    String Num = "";
                    scom.CommandText = "select NUMBER from IO_CHECK where MD5 = "+MD5;
                    scon.Open();
                    MySqlDataReader NUMBER = scom.ExecuteReader();
                    while (NUMBER.Read()) {
                        Num = NUMBER[0].ToString();         
                    }
                    scom.CommandText = "select MAC from MEMBER where NUMBER = " + Num;
                    scon.Open();
                     while (NUMBER.Read()) {
                        Num = NUMBER[0].ToString();         
                    }
                     MySqlDataReader Mac = scom.ExecuteReader();
                     while (Mac.Read())
                     {   
                     }
                        
                    
                    break;

                }
                else { textBox1.Text = "Nothing"; }
            }




            
        }
    }
}
