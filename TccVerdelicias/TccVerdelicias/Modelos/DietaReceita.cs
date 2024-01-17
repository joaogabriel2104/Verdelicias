using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class DietaReceita : Banco
    {
        public Receita Receita { get; set; }
        public Dieta Dieta { get; set; }
        public Usuario Usuario { get; set; }

        [JsonConstructor]
        public DietaReceita(int receita, int dieta)
        {
            Receita = new Receita();
            Dieta = new Dieta();

            if(receita > 0) 
            {
                Receita.Codigo = receita;
                Dieta.Codigo = dieta;
            }
            else
            {
                Dieta.Codigo = dieta;
            }
        }

        public DietaReceita()
        {
        }

        public void CriarDietaReceita(int pCodDieta, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro1 = new Parametro("pCodDieta", pCodDieta.ToString());
            Parametro parametro2 = new Parametro("pLogin", pLogin);

            parametros.Add(parametro1);
            parametros.Add(parametro2);

            Executar("CriarDietaReceita", parametros);
        }

        public bool VerificarDietaReceita(int pCodigo, int pCodDieta, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pCodigo", pCodigo.ToString());
            Parametro parametro1 = new Parametro("pCodDieta", pCodDieta.ToString());
            Parametro parametro2 = new Parametro("pLogin", pLogin);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);

            MySqlDataReader dados = Consultar("VerificarDietaReceita", parametros);
            if (dados.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void SelecionarDietaReceita(string pCodigo, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pCodigo", pCodigo);
            Parametro parametro1 = new Parametro("pLogin", pLogin);

            parametros.Add(parametro);
            parametros.Add(parametro1);

            MySqlDataReader dados = Consultar("SelecionarDietaReceita", parametros);
            if (dados.Read())
            {
                Dieta.Codigo = dados.GetInt32(0);
            }
        }

        public void AdicionarDietaReceita(int pCodigo, int pCodDieta, string pLogin)
        {
            if (VerificarDietaReceita(pCodigo, pCodDieta, pLogin) == false)
            {
                List<Parametro> parametros = new List<Parametro>();

                Parametro parametro = new Parametro("pCodigo", pCodigo.ToString());
                Parametro parametro1 = new Parametro("pCodDieta", pCodDieta.ToString());
                Parametro parametro2 = new Parametro("pLogin", pLogin);

                parametros.Add(parametro);
                parametros.Add(parametro1);
                parametros.Add(parametro2);

                Executar("AdicionarDietaReceita", parametros);
            }
        }
    }
}