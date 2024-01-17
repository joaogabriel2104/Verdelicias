using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;
using TccVerdelicias.Lógicas;
using MySql.Data.MySqlClient;

namespace TccVerdelicias.Lógicas
{
    public class ModosDePreparo : Banco
    {
        public List<ModoPreparo> ListaModosDePreparo = new List<ModoPreparo>();

        public void ExibirModoPreparo(int pCodigoReceita, string pLogin)
        {
            ListaModosDePreparo = new List<ModoPreparo>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodigoReceita", pCodigoReceita.ToString());
            Parametro login = new Parametro("pLogin", pLogin);
            Parametros.Add(CodigoReceita);
            Parametros.Add(login);
            MySqlDataReader dados = Consultar("ExibirModoPreparo", Parametros);
            while (dados.Read())
            {
                ModoPreparo modopreparo = new ModoPreparo(dados.GetInt32(0), dados.GetString(1));
                ListaModosDePreparo.Add(modopreparo);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }
    }
}