using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.Lógicas
{
    public class Receitas : Banco
    {
        public List<Receita> ListaReceitas = new List<Receita>();
        public void ExibirReceitasMelhoresAvaliadas()
        {
            ListaReceitas = new List<Receita>();
            MySqlDataReader dados = Consultar("ExibirDadosMinimosReceitasMelhoresAvaliadas", null);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(1));
                Receita receita = new Receita(dados.GetInt32(0), usuario, dados.GetString(2), dados.GetDouble(3));
                ListaReceitas.Add(receita);
            }
            if(!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirReceitasMaisRecentes()
        {
            ListaReceitas = new List<Receita>();
            MySqlDataReader dados = Consultar("ExibirDadosMinimosReceitasMaisRecentes", null);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(1));
                Receita receita = new Receita(dados.GetInt32(0), usuario, dados.GetString(2), dados.GetDouble(3));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirReceitas()
        {
            ListaReceitas = new List<Receita>();
            MySqlDataReader dados = Consultar("ExibirDadosMinimosReceitas", null);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(1));
                Receita receita = new Receita(dados.GetInt32(0), usuario, dados.GetString(2), dados.GetDouble(3));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void PostarReceita(string codUsuario, string nomeReceita, int tempoPreparo, int rendimento)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pLogin", codUsuario);
            Parametro parametro1 = new Parametro("pNomeReceita", nomeReceita);
            Parametro parametro2 = new Parametro("pTempoPreparo", tempoPreparo.ToString());
            Parametro parametro3 = new Parametro("pRendimento", rendimento.ToString());

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            parametros.Add(parametro3);
            Executar("CriarReceita", parametros);
        }

        public void AtualizarReceita(int pCodigo, string pLogin, string pNomeReceita, int pTempoPreparo, int pRendimento)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pCodigo", pCodigo.ToString());
            Parametro parametro1 = new Parametro("pLogin", pLogin);
            Parametro parametro2 = new Parametro("pNomeReceita", pNomeReceita);
            Parametro parametro3 = new Parametro("pTempoPreparo", pTempoPreparo.ToString());
            Parametro parametro4 = new Parametro("pRendimento", pRendimento.ToString());

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            parametros.Add(parametro3);
            parametros.Add(parametro4);
            Executar("AtualizarReceita", parametros);
        }

        public void ProcurarReceita(string busca)
        {
            ListaReceitas = new List<Receita>();

            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pFiltro", busca);
            parametros.Add(parametro);

            MySqlDataReader dados = Consultar("ProcurarReceita", parametros);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(0));
                Receita receita = new Receita(dados.GetInt32(1), usuario, dados.GetString(2), dados.GetDouble(3));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ProcurarReceitasDieta(string dieta)
        {
            ListaReceitas = new List<Receita>();

            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pNomeDieta", dieta);
            parametros.Add(parametro);

            MySqlDataReader dados = Consultar("ProcurarReceitaDieta", parametros);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(1));
                Receita receita = new Receita(dados.GetInt32(0), usuario, dados.GetString(2), dados.GetDouble(3));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirReceitasUsuario(string pCodUsuario)
        {
            ListaReceitas = new List<Receita>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoUsuario = new Parametro("pCodUsuario", pCodUsuario);
            Parametros.Add(CodigoUsuario);
            MySqlDataReader dados = Consultar("ExibirReceitasUsuario", Parametros);
            while (dados.Read())
            {
                Receita receita = new Receita(dados.GetInt32(0), dados.GetString(1), dados.GetDouble(2));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirFavoritosUsuario(string pCodUsuario)
        {
            ListaReceitas = new List<Receita>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoUsuario = new Parametro("pCodUsuario", pCodUsuario);
            Parametros.Add(CodigoUsuario);
            MySqlDataReader dados = Consultar("ExibirFavoritosUsuario", Parametros);
            while (dados.Read())
            {
                Usuario usuarioReceita = new Usuario(dados.GetString(1));
                Receita receita = new Receita(dados.GetInt32(0), usuarioReceita, dados.GetDouble(2), dados.GetString(4));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirReceitasSeguindo(string pLogin)
        {
            ListaReceitas = new List<Receita>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pLogin", pLogin);
            Parametros.Add(parametro);
            MySqlDataReader dados = Consultar("ExibirReceitasSeguindo", Parametros);
            while (dados.Read())
            {
                Usuario usuarioReceita = new Usuario(dados.GetString(1));
                Receita receita = new Receita(dados.GetInt32(0), usuarioReceita, dados.GetString(2), dados.GetDouble(3));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirReceitasDieta(string pLogin)
        {
            ListaReceitas = new List<Receita>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pLogin", pLogin);
            Parametros.Add(parametro);
            MySqlDataReader dados = Consultar("ExibirReceitasDieta", Parametros);
            while (dados.Read())
            {
                Usuario usuarioReceita = new Usuario(dados.GetString(1));
                Receita receita = new Receita(dados.GetInt32(0), usuarioReceita, dados.GetString(2), dados.GetDouble(3));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }
    }
}