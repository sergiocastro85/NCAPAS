using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class Transation : Form
    {

        public CN_Transacciones objCNTransaccion = new CN_Transacciones();
        
        public Transation()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                objCNTransaccion.GuardarTransation(cmbBanco.Text, cmbTransation.Text, Convert.ToInt32(txtCantidad.Text), DateTime.Parse(txtFecha.Text));
                MessageBox.Show("se almaceno correctamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("no fue posible almacenar los datos"+ ex);
            }
        }
    }
}



