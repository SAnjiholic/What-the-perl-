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
    public partial class Form6 : Form
    {
        public Form6()
        {
            InitializeComponent();
            dataGridView1.ColumnCount = 6; // DataGridView에 컬럼을 추가합니다. 
            dataGridView1.Columns[0].Name = "이름";
            dataGridView1.Columns[1].Name = "사번";
            dataGridView1.Columns[2].Name = "날짜";
            dataGridView1.Columns[3].Name = "출근 시간";
            dataGridView1.Columns[4].Name = "퇴근 시간";
            dataGridView1.Columns[5].Name = "근무 시간";
            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;


        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.Rows.Clear();
            string connectionString = "server = 192.168.0.220; uid = 'root'; pwd='asdd'; database = 'IO_CHECK';";
            MySqlConnection scon = new MySqlConnection(connectionString);
            MySqlCommand scom = new MySqlCommand();
            scom.Connection = scon;

            string sDate1 = dateTimePicker1.Value.ToString("yyyy-MM-dd");
            string sDate2 = dateTimePicker2.Value.ToString("yyyy-MM-dd");
            
            if (radioButton1.Checked) {
            
                scom.CommandText = "select * from IOT where DATE>='"+sDate1+"' and DATE<='"+sDate2+"' order by DATE,NUMBER";
            }
            else if (radioButton2.Checked)
            {
                scom.CommandText = "select * from IOT where DATE>='" + sDate1 + "' and DATE<='" + sDate2 + "' order by NUMBER,DATE";
            }
            else { scom.CommandText = "select * from IOT where DATE>='" + sDate1 + "' and DATE<='" + sDate2 + "' order by DATE,NUMBER"; }
            scon.Open();
            MySqlDataReader qur = scom.ExecuteReader();

            while (qur.Read())
            {
                String time = qur[2].ToString();
                DateTime dt = Convert.ToDateTime(time);

                String Date = dt.Year + "-" + dt.Month.ToString("D2") + "-" + dt.Day.ToString("D2"); ;
                String[] row0 = { qur[0].ToString(), qur[1].ToString(), Date, qur[3].ToString(), qur[4].ToString(), qur[5].ToString() };
                dataGridView1.Rows.Add(row0);

            }

            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;


          
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.OpenForms["Form6"].Close();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
