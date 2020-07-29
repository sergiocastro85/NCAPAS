using CapaNegocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace CapaPresentacion
{
    public partial class frmForm1 : Form
    {
        CN_Productos ObjCN = new CN_Productos();
        private string idProducto = null;
        private bool Editar = false;
        
        public void LimpiarForm()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtMarca.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";

        }

        public frmForm1()
        {
            InitializeComponent();

        }


        private void frmForm1_Load(object sender, EventArgs e)
        {
            MostrarProducto();
        }

        private void MostrarProducto()
        {
            CN_Productos obj = new CN_Productos();
            dataGridView1.DataSource = obj.MostrarProducto();
        }

        private void BuscarProducto(string nombre)
        {
            CN_Productos objetoProducto = new CN_Productos();
            dataGridView1.DataSource = objetoProducto.BuscarProduc(txtBuscar.Text);
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            //Insertar
            if (Editar == false)
            {
                try
                {
                    ObjCN.InsertProduct(txtNombre.Text, txtDescripcion.Text, txtMarca.Text, Convert.ToInt32(txtPrecio.Text), Convert.ToInt32(txtStock.Text));
                    MessageBox.Show("Se Guardo Correctamente");
                    MostrarProducto();
                    LimpiarForm();
                    
                }
                catch (Exception ex)
                {
                    MessageBox.Show("no se pudo insertar el registro" + ex); 
                }

                //Editar
            }
            if (Editar == true)
            {
                try
                {
                    ObjCN.EditarProduc(txtNombre.Text, txtDescripcion.Text, txtMarca.Text, Convert.ToInt32(txtPrecio.Text), Convert.ToInt32(txtStock.Text), Convert.ToInt32(idProducto));
                    MessageBox.Show("Se Edito correctamente");
                    MostrarProducto();
                    LimpiarForm();
                    Editar = false;

                }
                catch (Exception ex)
                {
                    MessageBox.Show("no se pudo editar el producto" + ex);

                }

            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                Editar = true;
                txtNombre.Text = dataGridView1.CurrentRow.Cells["Nombre"].Value.ToString();
                txtDescripcion.Text = dataGridView1.CurrentRow.Cells["Descripcion"].Value.ToString();
                txtMarca.Text = dataGridView1.CurrentRow.Cells["Marca"].Value.ToString();
                txtPrecio.Text = dataGridView1.CurrentRow.Cells["Precio"].Value.ToString();
                txtStock.Text = dataGridView1.CurrentRow.Cells["Stock"].Value.ToString();
                idProducto = dataGridView1.CurrentRow.Cells["Id"].Value.ToString();

            }
            else
            {
                MessageBox.Show("Seleccione una fila por favor");
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                idProducto = dataGridView1.CurrentRow.Cells["Id"].Value.ToString();
                ObjCN.EliminarProduct(Convert.ToInt32(idProducto));
                MessageBox.Show("Eliminado Correctamente");
                MostrarProducto();

            }
            else
            {
                MessageBox.Show("Seleccione una fila por favor");
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {

            BuscarProducto(txtBuscar.Text);

                 
        }
    }
}
