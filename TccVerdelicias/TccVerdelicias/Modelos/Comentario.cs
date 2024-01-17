using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Comentario : Banco
    {
        public Receita Receita { get; set; }
        public Usuario UsuarioReceita { get; set; }
        public Usuario UsuarioComentario { get; set; }
        public DateTime DataComentario { get; set; }
        public string Descricao { get; set; }
        public bool Bloqueado { get; set; }

        public Comentario()
        {
        }

        public Comentario(Receita receita, Usuario usuarioReceita, DateTime dataComentario)
        {
            Receita = receita;
            UsuarioReceita = usuarioReceita;
            DataComentario = dataComentario;
        }

        public Comentario(Usuario usuarioComentario, DateTime dataComentario, string descricao)
        {
            UsuarioComentario = usuarioComentario;
            DataComentario = dataComentario;
            Descricao = descricao;
        }

        public Comentario(Receita receita, Usuario usuarioReceita, DateTime dataComentario, string descricao)
        {
            Receita = receita;
            UsuarioReceita = usuarioReceita;
            DataComentario = dataComentario;
            Descricao = descricao;
        }

        public void ExibirComentario(int pCodigoReceita, string pLoginReceita, string pLoginComentario, DateTime DataComentario)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro codigoReceita = new Parametro("pCodReceita", pCodigoReceita.ToString());
            Parametro loginReceita = new Parametro("pCodLoginReceita", pLoginReceita);
            Parametro loginComentario = new Parametro("pCodLoginComentario", pLoginComentario);
            Parametro dataComentario = new Parametro("pDataComentario", DataComentario.ToString("yyyy/MM/dd HH:mm:ss"));

            Parametros.Add(codigoReceita);
            Parametros.Add(loginReceita);
            Parametros.Add(loginComentario);
            Parametros.Add(dataComentario);

            MySqlDataReader dados = Consultar("ExibirComentario", Parametros);
            if (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(0), dados.GetString(1));
                UsuarioComentario = usuario;
                this.DataComentario = dados.GetDateTime(2);
                Descricao = dados.GetString(3);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void CriarComentario(int codReceita, string loginReceita, string loginComentario, string descricao)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodReceita", codReceita.ToString());
            Parametro LoginReceita = new Parametro("pCodLoginReceita", loginReceita);
            Parametro LoginComentario = new Parametro("pCodLoginComentario", loginComentario);
            Parametro TextoComentario = new Parametro("pDesc", descricao);

            Parametros.Add(CodigoReceita);
            Parametros.Add(LoginReceita);
            Parametros.Add(LoginComentario);
            Parametros.Add(TextoComentario);

            Executar("CriarComentario", Parametros);

            Desconectar();
        }
    }
}