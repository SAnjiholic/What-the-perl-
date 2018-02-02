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
            Form6 dlg = new Form6();
            dlg.ShowDialog();
        }
    }
}
