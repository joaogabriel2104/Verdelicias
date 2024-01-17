using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.Lógicas
{
    public class Denuncias : Banco
    {
        public List<Receita> ListaReceitas = new List<Receita>();
        public List<DenunciaComentario> ListaDenunciasComentarios = new List<DenunciaComentario>();
        public List<DenunciaUsuario> ListaDenunciasUsuarios = new List<DenunciaUsuario>();

        public void ExibirReceitasDenunciadas()
        {
            ListaReceitas = new List<Receita>();
            MySqlDataReader dados = Consultar("ExibirReceitasDenunciadas", null);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(0));
                Receita receita = new Receita(usuario, dados.GetInt32(1), dados.GetString(2));
                ListaReceitas.Add(receita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirComentariosDenunciados()
        {
            ListaDenunciasComentarios = new List<DenunciaComentario>();
            MySqlDataReader dados = Consultar("ExibirComentariosDenunciados", null);
            while (dados.Read())
            {
                Usuario usuarioReceita = new Usuario(dados.GetString(0));
                Receita receita = new Receita(dados.GetInt32(1));
                Comentario comentario = new Comentario(receita, usuarioReceita, dados.GetDateTime(4), dados.GetString(5));
                Usuario usuarioDenunciado = new Usuario(dados.GetString(2), dados.GetString(3));
                DenunciaComentario denuncia = new DenunciaComentario(comentario, usuarioDenunciado);
                ListaDenunciasComentarios.Add(denuncia);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirUsuariosDenunciados()
        {
            ListaDenunciasUsuarios = new List<DenunciaUsuario>();
            MySqlDataReader dados = Consultar("ExibirUsuariosDenunciados", null);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(0), dados.GetString(1));
                DenunciaUsuario denuncia = new DenunciaUsuario(usuario);
                ListaDenunciasUsuarios.Add(denuncia);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }


    }
}