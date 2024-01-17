using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Receita : Banco
    {
        public int Codigo { get; set; }
        public Usuario Usuario { get; set; }
        public string NomeReceita { get; set; }
        public int TempoPreparo { get; set; }
        public int Rendimento { get; set; }
        public DateTime DataReceita { get; set; }
        public bool Bloqueado { get; set; }
        public double NotaAvaliacao { get; set; }

        public Receita(int codigo, Usuario user)
        {
            Codigo = codigo;
            Usuario = user;
        }

        public Receita(Usuario user, string nomeReceita, int tempoPreparo, int rendimento)
        {
            Usuario = user;
            NomeReceita = nomeReceita;
            TempoPreparo = tempoPreparo;
            Rendimento = rendimento;
        }

        public Receita()
        {

        }

        public Receita(int codigo, string nomeReceita, Usuario usuario, int tempoPreparo, int rendimento, DateTime dataReceita, double notaAvaliacao)
        {
            this.Codigo = codigo;
            this.NomeReceita = nomeReceita;
            this.Usuario = usuario;
            this.TempoPreparo = tempoPreparo;
            this.Rendimento = rendimento;
            this.DataReceita = dataReceita;
            this.NotaAvaliacao = notaAvaliacao;
        }

        public Receita(int codigo, string nomeReceita, double notaAvaliacao)
        {
            Codigo = codigo;
            NomeReceita = nomeReceita;
            NotaAvaliacao = notaAvaliacao;
        }

        public Receita(int codigo, Usuario user, string nomeReceita, double notaAvaliacao)
        {
            Codigo = codigo;
            Usuario = user;
            NomeReceita = nomeReceita;
            NotaAvaliacao = notaAvaliacao;
        }

        public Receita(int codigo, Usuario usuario, double notaAvaliacao, string nomeReceita)
        {
            Codigo = codigo;
            Usuario = usuario;
            NotaAvaliacao = notaAvaliacao;
            NomeReceita = nomeReceita;
        }

        public Receita(Usuario usuario, int codigo, string nomeReceita)
        {
            this.Usuario = usuario;
            this.Codigo = codigo;
            this.NomeReceita = nomeReceita;
        }

        public Receita(int codigo)
        {
            Codigo = codigo;
        }

        public void ExibirDadosReceita(int pCodigoReceita, string pLogin)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodigoReceita", pCodigoReceita.ToString());
            Parametro login = new Parametro("pLogin", pLogin);
            Parametros.Add(CodigoReceita);
            Parametros.Add(login);
            MySqlDataReader dados = Consultar("ExibirDadosReceita", Parametros);
            if (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(3), dados.GetString(2));
                Codigo = dados.GetInt32(0);
                NomeReceita = dados.GetString(1);
                TempoPreparo = dados.GetInt32(4);
                Rendimento = dados.GetInt32(5);
                DataReceita = dados.GetDateTime(6);
                NotaAvaliacao = dados.GetDouble(7);
                Usuario = usuario;
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void DeletarReceita(string pCodigoReceita, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodReceita", pCodigoReceita);
            Parametro login = new Parametro("pLogin", pLogin);
            parametros.Add(CodigoReceita);
            parametros.Add(login);
            Executar("DeletarReceita", parametros);
        }
    }
}