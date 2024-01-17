using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class PreferenciaDieta : Banco
    {
        public Dieta Dieta { get; set; }
        public Usuario Usuario { get; set; }

        public PreferenciaDieta(int dieta, string usuario)
        {
            Dieta.Codigo = dieta;
            Usuario.NomeUsuario = usuario;
        }

        [JsonConstructor]
        public PreferenciaDieta(int dieta)
        {
            Dieta = new Dieta(dieta);
            Dieta.Codigo = dieta;
        }

        public PreferenciaDieta()
        {
        }

        public bool VerificarPreferenciaDieta(int pCodDieta, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro1 = new Parametro("pCodDieta", pCodDieta.ToString());
            Parametro parametro2 = new Parametro("pLogin", pLogin);

            parametros.Add(parametro1);
            parametros.Add(parametro2);

            MySqlDataReader dados = Consultar("VerificarPreferenciaDieta", parametros);
            if (dados.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void CriarPreferenciaDieta(int pCodDieta, string pLogin)
        {
            if(VerificarPreferenciaDieta(pCodDieta, pLogin) == false) 
            { 
                List<Parametro> Parametros = new List<Parametro>();
                Parametro dieta = new Parametro("pCodDieta", pCodDieta.ToString());
                Parametro login = new Parametro("pLogin", pLogin);

                Parametros.Add(dieta);
                Parametros.Add(login);

                Executar("CriarPreferenciaDieta", Parametros);
            }
        }
    }
}