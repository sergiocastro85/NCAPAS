using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using CapaDatos.DTO;


namespace CapaDatos
{
    public class CD_Transacciones
    {

        CD_Conexion conexion = new CD_Conexion();
        SqlCommand comando = new SqlCommand();
        SqlDataReader leer;
        SqlDataReader leerTransaccion;
        DataTable tabla = new DataTable();
        DataTable tablatransa = new DataTable();
        


        public void Guardar(int banco, int tipoTransaccion, int cantidad, string fecha)
        {
                comando.Connection = conexion.AbrirConexion();
                comando.CommandText = "INSERT INTO tblMovimientos (IdBanco,IdTransaccion,Cantidad,Fecha) VALUES (" + banco + "," + tipoTransaccion + "," + cantidad + ",Convert(nvarchar,'" + fecha + "',20))";
                comando.ExecuteNonQuery();
                comando.Connection = conexion.CerrarConexion();
          
        }

        

        public List<Corresponsal> LLenarcmbBanco()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "Select IdProveedor,Nombre From tblCorresponsales";
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            return tabla.AsEnumerable().Select(x => new Corresponsal { 
            
                Id=Convert.ToInt32(x["IdProveedor"].ToString()),
                Nombre=x["Nombre"].ToString(),
            }).ToList();
            
         
            
      
        }

        public List<Transaccion> LlenarTransaccion()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "Select Id_transaccion,IdProveedor,TipoTransacion From tblTransaccion";
            leerTransaccion = comando.ExecuteReader();
            tablatransa.Load(leerTransaccion);
            return tablatransa.AsEnumerable().Select(x => new Transaccion
            {
                Id = Convert.ToInt32(x["Id_transaccion"].ToString()),
                TipoTransaccion = x["TipoTransacion"].ToString(),
            }).ToList();
        }

    }
}
