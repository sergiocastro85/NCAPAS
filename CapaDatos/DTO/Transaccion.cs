﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.DTO
{
    public class Transaccion
    {
        public int Id { get; set; }
        public int IdProveedor { get; set; }
        public string TipoTransaccion{ get; set; }
    }
}
