using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using MySql.Data.MySqlClient;
using System.Net.NetworkInformation;
namespace Inout
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
            string yy = DateTime.Now.ToString("HH");
            string mm = DateTime.Now.ToString("mm");
            label1.Text = "지금은 " + yy + "시 " + mm + "분 입니다";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.OpenForms["Form4"].Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String Num = "";
            String mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            string connectionString = "server = 192.168.0.220; uid = 'root'; pwd='asdd'; database = 'IO_CHECK';";
            MySqlConnection scon = new MySqlConnection(connectionString);
            MySqlCommand scom = new MySqlCommand();
            scom.Connection = scon;
            scom.CommandText = "Select NUMBER from MEMBER where MAC='"+mac+"'";
            scon.Open();
            MySqlDataReader sdr = scom.ExecuteReader();

            while (sdr.Read())
            {
                Num = sdr[0].ToString();
            }
            scon.Close();
            scon.Open();
                string dd = DateTime.Now.ToString("yyyy/MM/dd");
                string tt = DateTime.Now.ToString("HH:mm:ss");
                scom.CommandText = "update IO_CHECK set `OUTTIME`='" + tt + "' where NUMBER=" + Num + " and DATE='" + dd + "'";
                scom.ExecuteNonQuery();
                MessageBox.Show("퇴근이 처리되었습니다.");

            }
        }
    }
