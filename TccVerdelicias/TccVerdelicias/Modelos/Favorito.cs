using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Favorito : Banco
    {
        public Receita Receita { get; set; }
        public Usuario UsuarioDono { get; set; }
        public Usuario Usuario { get; set; }
        public DateTime Data { get; set; }
        public Favorito(Usuario usuario)
        {
            Usuario = usuario;
        }
        public Favorito()
        {
        }

        public void VerificarFavorito(int pCodReceita, string pLoginDono, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pCodReceita", pCodReceita.ToString());
            Parametro parametro1 = new Parametro("pLoginDono", pLoginDono);
            Parametro parametro2 = new Parametro("pLogin", pLogin);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            MySqlDataReader dados = Consultar("VerificarFavorito", parametros);
            if (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(0));
                Usuario = usuario;
            }
            if (!dados.IsClosed)
                dados.Close();

            Desconectar();
        }

        public void BtnFavorito(int pCodReceita, string pLoginDono, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pCodReceita", pCodReceita.ToString());
            Parametro parametro1 = new Parametro("pLoginDono", pLoginDono);
            Parametro parametro2 = new Parametro("pLogin", pLogin);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            Executar("FavoritarReceita", parametros);
        }

        public void Desfavoritar(int pCodReceita, string pLoginDono, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pCodReceita", pCodReceita.ToString());
            Parametro parametro1 = new Parametro("pLoginDono", pLoginDono);
            Parametro parametro2 = new Parametro("pLogin", pLogin);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            Executar("Desfavoritar", parametros);
        }
    }
}