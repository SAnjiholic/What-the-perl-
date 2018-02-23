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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String name = textBox1.Text;
            string email = textBox2.Text;
            String mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            string Num = "";
            int NUM;
            string connectionString = "server = 192.168.0.220; uid = 'root'; pwd='asdd'; database = 'IO_CHECK';";
            MySqlConnection scon = new MySqlConnection(connectionString);
            MySqlCommand scom = new MySqlCommand();
            scom.Connection = scon;
            scom.CommandText = "select NUMBER from MEMBER order by NUMBER desc";
            scon.Open();
            MySqlDataReader NUMBER = scom.ExecuteReader();
            
                while (NUMBER.Read())
            {
                Num = NUMBER[0].ToString();
                break;
            }
            if (Num == "") { Num = "10000"; }
            NUM = int.Parse(Num);
            NUM++;
            scon.Close();
            scon.Open();




            scom.CommandText = "insert into MEMBER(NAME,NUMBER,EMAIL,MAC) values(@NAME,@NUMBER,@EMAIL,@MAC)";
            scom.Parameters.Add("@NAME",MySqlDbType.VarChar, 20);
            scom.Parameters.Add("@NUMBER", MySqlDbType.Int32, 11);
            scom.Parameters.Add("@EMAIL",MySqlDbType.VarChar, 40);
            scom.Parameters.Add("@MAC", MySqlDbType.VarChar, 20);
            scom.Parameters[0].Value = name;
            scom.Parameters[1].Value = NUM;
            scom.Parameters[2].Value = email;
            scom.Parameters[3].Value = mac;
            scom.ExecuteNonQuery();

            scon.Close();
            MessageBox.Show("등록이 완료되었습니다");
             Application.OpenForms["Form3"].Close();
            //Application.OpenForms["Form3"].Close();


        }

        private void button2_Click(object sender, EventArgs e)
        {

            Application.OpenForms["Form3"].Close();
        }
    }
}
