using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data.SqlClient;
using System.Data;

namespace CapaNegocio
{
    public class CN_Productos
    {
        private CD_Productos objCD = new CD_Productos();

        public DataTable MostrarProducto()
        {
            DataTable tabla = new DataTable();
            tabla = objCD.Mostar();
            return tabla;
        }

        public DataTable BuscarProduc(string nombre)
        {
            DataTable tabla = new DataTable();
            tabla= objCD.Buscar(nombre);
            return tabla;
        }
   

        public void InsertProduct(string nombre, string desc, string marca,double precio, int stock)
        {
            objCD.Insertar(nombre, desc, marca, precio, stock);

        }

        public void EditarProduc(string nombre,string desc,string marca,int precio,int stock, int id)
        {
            objCD.Editar(nombre, desc, marca, precio, stock, id);

        }

        public void EliminarProduct(int id)
        {
            objCD.Eliminar(id);
        }   
    }
}
