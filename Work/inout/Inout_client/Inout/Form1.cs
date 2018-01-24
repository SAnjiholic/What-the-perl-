using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.NetworkInformation; 
namespace Inout
{
    public partial class Form1 : Form
    {
        public Form1()
        {   string mac;
            InitializeComponent();
            

       

        }


        private void panel1_Paint(object sender, PaintEventArgs e)
        {
         
        }

        private void button1_Click(object sender, EventArgs e)
        {
           String mac= NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            Form2 dlg = new Form2();
            dlg.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            String mac = NetworkInterface.GetAllNetworkInterfaces()[0].GetPhysicalAddress().ToString();
            Form3 dlg = new Form3();
            dlg.ShowDialog();
        }
    }
}
