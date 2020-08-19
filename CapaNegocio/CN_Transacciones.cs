using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using CapaDatos;
using CapaDatos.DTO;

namespace CapaNegocio
{
    public class CN_Transacciones
    {
        private CD_Transacciones objetoCD = new CD_Transacciones();

        public void GuardarTransation(int banco,int tipoTransaccion,int cantidad, string fecha)
        {
             objetoCD.Guardar(banco, tipoTransaccion, cantidad, fecha);

        }
        
        public List<Corresponsal> llenar() 
        {

            List<Corresponsal> lista = objetoCD.LLenarcmbBanco();
            return lista;
            
        }
        public List<Transaccion> LlenarTransaccion()
        {
            List<Transaccion> lista = objetoCD.LlenarTransaccion();
            return lista;
        }

    }
}
