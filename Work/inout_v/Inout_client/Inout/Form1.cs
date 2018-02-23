using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.NetworkInformation;
using MySql.Data.MySqlClient;
namespace Inout
{
    public partial class Form1 : Form
    {
        public Form1()
        {

            InitializeComponent();

        }


        private void panel1_Paint(object sender, PaintEventArgs e)
        {
         
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form5 dlg = new Form5();
            dlg.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form3 dlg = new Form3();
            dlg.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form4 dlg = new Form4();
            dlg.ShowDialog();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            string flag = "";
            string flag2 = "";
            String mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            string connectionString = "server = 192.168.0.220; uid = 'root'; pwd='asdd'; database = 'IO_CHECK';";
            MySqlConnection scon = new MySqlConnection(connectionString);
            MySqlCommand scom = new MySqlCommand();
            scom.Connection = scon;
            scom.CommandText = "Select MAC,sett from Qualification where MAC='"+mac+"' and sett=6";
            scon.Open();
            MySqlDataReader sdr = scom.ExecuteReader();
            string Fmac = "";

            while (sdr.Read())
            {
                flag = sdr[0].ToString();
                flag2 = sdr[1].ToString();
            }
            bool check =flag != "";
            if (check)
            {
                Form6 dlg = new Form6();
                dlg.ShowDialog();
            }
            else { MessageBox.Show("권한이 없습니다"); }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form7 dlg = new Form7();
            dlg.ShowDialog();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("아직 준비중입니다.");
        }
    }
}
