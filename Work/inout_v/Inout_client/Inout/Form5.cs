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
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
            string yy = DateTime.Now.ToString("HH");
            string mm = DateTime.Now.ToString("mm");
            label1.Text = "지금은 " + yy + "시 " + mm + "분 입니다";
        }


        private void button1_Click_1(object sender, EventArgs e)
        {
            String mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            
            String Num = "";
            String Na = "";
            string it = "";

            string dd = DateTime.Now.ToString("yyyy/MM/dd");
            string tt = DateTime.Now.ToString("HH:mm:ss");
            string flag="";
            string connectionString = "server = 192.168.0.220; uid = 'root'; pwd='asdd'; database = 'IO_CHECK';";
            
            
            MySqlConnection scon = new MySqlConnection(connectionString);
            MySqlCommand scom = new MySqlCommand();
            scom.Connection = scon;
            scom.CommandText = "Select NUMBER from MEMBER where MAC='" + mac + "'";
            scon.Open();
            MySqlDataReader sdr = scom.ExecuteReader();

            while (sdr.Read())
            {
                Num = sdr[0].ToString();
            }
            scon.Close();

            scom.CommandText = "Select NAME,NUMBER from MEMBER where MAC='" + mac + "'";
            scon.Open();
            MySqlDataReader sdr2 = scom.ExecuteReader();

            while (sdr2.Read())
            {
                Na = sdr2[0].ToString();
                Num = sdr2[1].ToString();
            }
            scon.Close();


            scom.CommandText = "Select INTIME from IO_CHECK where DATE='" + dd + "'and NUMBER='"+Num+"'";
            scon.Open();

            MySqlDataReader TCHECK = scom.ExecuteReader();

            while (TCHECK.Read())
            {
                flag = TCHECK[0].ToString();
            }
            scon.Close();
            bool fl = flag == "";
            if (fl)
            {
                scom.CommandText = "update IO_CHECK set `INTIME`='" + tt + "' where NUMBER='" + Num + "' and DATE='" + dd + "'";
                scon.Open();
                scom.ExecuteNonQuery();



                scon.Close();
                scom.CommandText = " delete from IOT WHERE NUMBER=" + Num + " and DATE='" + dd + "'";
                scon.Open();
                scom.ExecuteNonQuery();
                scon.Close();
                scon.Open();
                scom.CommandText = "INSERT INTO IOT(NAME,NUMBER,DATE,INTIME) VALUES(@name,@num,@DT,@IT)";

                scom.Parameters.Add("@name", MySqlDbType.VarChar, 20);
                scom.Parameters.Add("@num", MySqlDbType.Int32);
                scom.Parameters.Add("@DT", MySqlDbType.Date);
                scom.Parameters.Add("@IT", MySqlDbType.VarChar, 20);


                scom.Parameters[0].Value = Na;
                scom.Parameters[1].Value = Num;
                scom.Parameters[2].Value = dd;
                scom.Parameters[3].Value = tt;

                scom.ExecuteNonQuery();
                scon.Close();

                MessageBox.Show("출근이 처리되었습니다.");
            }
            else
            {
                MessageBox.Show("이미 출근이 처리되었습니다.");
            }
            Application.OpenForms["Form5"].Close();
        }

      

        private void button2_Click_1(object sender, EventArgs e)
        {
            Application.OpenForms["Form5"].Close();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}