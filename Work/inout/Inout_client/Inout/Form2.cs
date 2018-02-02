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
            String USER_MAC = "";
            String mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            string connectionString = "server = 192.168.0.220; uid = 'root'; pwd='asdd'; database = 'IO_CHECK';";
            MySqlConnection scon = new MySqlConnection(connectionString);
            MySqlCommand scom = new MySqlCommand();
            scom.Connection = scon;
            scom.CommandText = "Select MAC from MEMBER ";
            scon.Open();
            MySqlDataReader sdr = scom.ExecuteReader();
            string Fmac = "";

            while (sdr.Read())
            {
                Fmac = sdr[0].ToString();
         
                if (mac.Equals(Fmac))
                {
                    flag = 1;
                    scon.Close();
                    break;
                }
            }
            if (flag == 1)
            {
                flag = 0;
                String MD5 = textBox1.Text;
                String Num = "";
                scom.CommandText = "select NUMBER from IO_CHECK where MD5 = '" + MD5+"'";
                scon.Open();
                MySqlDataReader NUMBER = scom.ExecuteReader();
                while (NUMBER.Read())
                {
                    Num = NUMBER[0].ToString();
                }

                if (Num == "")
                {
                    scon.Close();
                    MessageBox.Show("잘못된 코드입니다.");

                }

                else
                {
                    scon.Close();
                    flag = 1;
                }

                if (flag == 1)
                {
                    int NUM = int.Parse(Num);
                    scom.CommandText = "select MAC from MEMBER where NUMBER='" + Num + "'";
                    scon.Open();
                    MySqlDataReader CHKM = scom.ExecuteReader();
                    while (CHKM.Read())
                    {
                        USER_MAC = CHKM[0].ToString();
                    }
                    scon.Close();
                    if (USER_MAC == mac)
                    {
                        scon.Open();


                        string dd = DateTime.Now.ToString("yyyy/MM/dd");
                        string tt = DateTime.Now.ToString("HH:mm:ss");
                        scom.CommandText = "update IO_CHECK set `INTIME`='" + tt + "' where NUMBER='" + Num +"' and DATE='"+dd+"'";
                        scom.ExecuteNonQuery();
                        MessageBox.Show("출근이 처리되었습니다.");
                    }
                    else
                    {
                        MessageBox.Show("본인의 컴퓨터에서만 출근이 가능합니다.");
                    }
                }
            }
            else { MessageBox.Show("등록되지 않은 PC입니다"); }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.OpenForms["Form2"].Close();

        }
    }
}


    