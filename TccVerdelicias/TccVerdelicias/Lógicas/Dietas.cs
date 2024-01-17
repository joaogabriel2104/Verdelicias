using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.Lógicas
{
    public class Dietas : Banco
    {
        public List<Dieta> ListaDietas = new List<Dieta>();

        public void ListarDietas()
        {
            ListaDietas = new List<Dieta>();
            MySqlDataReader dados = Consultar("ListarDietas", null);
            while (dados.Read())
            {
                Dieta dieta = new Dieta(dados.GetInt32(0), dados.GetString(1));
                ListaDietas.Add(dieta);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirDietasReceita(int pCodigoReceita, string pLogin)
        {
            ListaDietas = new List<Dieta>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodigoReceita", pCodigoReceita.ToString());
            Parametro login = new Parametro("pLogin", pLogin);
            Parametros.Add(CodigoReceita);
            Parametros.Add(login);
            MySqlDataReader dados = Consultar("ExibirDietasReceita", Parametros);
            while (dados.Read())
            {
                Dieta dieta = new Dieta(dados.GetString(0));
                ListaDietas.Add(dieta);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirDietasUsuario(string pLogin)
        {
            ListaDietas = new List<Dieta>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro login = new Parametro("pLogin", pLogin);
            Parametros.Add(login);

            MySqlDataReader dados = Consultar("ExibirDietasUsuario", Parametros);
            while (dados.Read())
            {
                Dieta dieta = new Dieta(dados.GetString(0));
                ListaDietas.Add(dieta);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }
    }
}