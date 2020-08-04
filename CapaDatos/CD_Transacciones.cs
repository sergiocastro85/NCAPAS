using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace CapaDatos
{
    public class CD_Transacciones
    {

        CD_Conexion conexion = new CD_Conexion();
        SqlCommand comando = new SqlCommand();

        public void Guardar(string banco, string tipo, int cantidad, DateTime fecha)
        {

          
                comando.Connection = conexion.AbrirConexion();
                comando.CommandText = "INSERT INTO tblMovimientos (Banco,Tipo,Cantidad,Fecha) VALUES ('" + banco + "','" + tipo + "'," + cantidad + ",Convert(varchar(10),'" + fecha + "',103))";
                comando.ExecuteNonQuery();
                comando.Connection = conexion.CerrarConexion();
            


            
       

        }

    }
}
