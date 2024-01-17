using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.Lógicas
{
    public class Medidas : Banco
    {
        public List<Medida> ListaMedidas = new List<Medida>();
        public void ListarMedidas()
        {
            ListaMedidas = new List<Medida>();
            MySqlDataReader dados = Consultar("ListarMedidas", null);
            while (dados.Read())
            {
                Medida medida = new Medida(dados.GetInt32(0), dados.GetString(1));
                ListaMedidas.Add(medida);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

    }
}