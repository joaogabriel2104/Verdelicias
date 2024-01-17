using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Lógicas
{
    public class ImagemReceitaAdicionar : Banco
    {
        public string User { get; set; }
        public int Codigo { get; set; }

        public ImagemReceitaAdicionar()
        {

        }

        public int AdicionarImagemReceita(string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pLogin", pLogin);
            parametros.Add(parametro);

            int valores = 0;

            MySqlDataReader dados = Consultar("ExibirUltimaReceita", parametros);
            while (dados.Read())
            {
                valores = dados.GetInt32(0);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
            return valores;
        }
    }
}