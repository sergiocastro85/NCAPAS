using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos.DTO;
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
                objCNTransaccion.GuardarTransation(Convert.ToInt32(cmbBanco.SelectedValue),Convert.ToInt32(cmbTransation.SelectedValue), Convert.ToInt32(txtCantidad.Text), Convert.ToString(dateTimePicker1.Value.Date.ToString("yyyy-MM-dd")));
                MessageBox.Show("se almaceno correctamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("no fue posible almacenar los datos"+ ex);
            }
        }

  


        private void Transation_Load(object sender, EventArgs e)
        {

            List<Corresponsal> lista = objCNTransaccion.llenar();
            cmbBanco.DataSource = lista;
            cmbBanco.DisplayMember = "Nombre";
            cmbBanco.ValueMember = "Id";

            List<Transaccion> listaTransaccion = objCNTransaccion.LlenarTransaccion();
            cmbTransation.DataSource = listaTransaccion;
            cmbTransation.DisplayMember = "TipoTransaccion";
            cmbTransation.ValueMember = "Id";


        }
    }
}



