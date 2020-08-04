using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class CN_Transacciones
    {
        private CD_Transacciones objetoCD = new CD_Transacciones();

        public void GuardarTransation(string banco,string tipo,int cantidad, DateTime fecha)
        {
             objetoCD.Guardar(banco, tipo, cantidad, fecha);

        }
    }
}
