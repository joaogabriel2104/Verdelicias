using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Avaliacao : Banco
    {
        public Receita Receita { get; set; }
        public Usuario UsuarioDono { get; set; }
        public Usuario UsuarioAvaliador { get; set; }
        public DateTime DataAvaliacao { get; set; }
        public int Valor { get; set; }
        public Avaliacao(Receita receita, Usuario usuarioDono, Usuario usuarioAvaliador, int valor)
        {
            Receita = receita;
            UsuarioDono = usuarioDono;
            UsuarioAvaliador = usuarioAvaliador;
            Valor = valor;
        }

        public Avaliacao()
        {
        }

        public void AvaliarReceita(int pCodReceita, string pLoginDono, string pLoginAvaliador, int pQuantidade)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pCodReceita", pCodReceita.ToString());
            Parametro parametro1 = new Parametro("pLoginDono", pLoginDono);
            Parametro parametro2 = new Parametro("pLoginAvaliador", pLoginAvaliador);
            Parametro parametro3 = new Parametro("pQuantidade", pQuantidade.ToString());

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            parametros.Add(parametro3);
            Executar("AvaliarReceita", parametros);
        }

        public void ExibirAvaliacaoP(int pCodReceita, string pLoginDono, string pLoginAvaliador)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pCodReceita", pCodReceita.ToString());
            Parametro parametro1 = new Parametro("pLoginDono", pLoginDono);
            Parametro parametro2 = new Parametro("pLoginAvaliador", pLoginAvaliador);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            MySqlDataReader dados = Consultar("ExibirAvaliacaoP", parametros);
            if (dados.Read())
            {
                Valor = dados.GetInt32(0);
            }
        }

        public void AtualizarAvaliacao(int pCodReceita, string pLoginDono, string pLoginAvaliador, int pQuantidade)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pCodReceita", pCodReceita.ToString());
            Parametro parametro1 = new Parametro("pLoginDono", pLoginDono);
            Parametro parametro2 = new Parametro("pLoginAvaliador", pLoginAvaliador);
            Parametro parametro3 = new Parametro("pQuantidade", pQuantidade.ToString());

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            parametros.Add(parametro3);
            Executar("AtualizarAvaliacao", parametros);
        }
    }
}