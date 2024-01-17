using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.Lógicas
{
    public class Comentarios : Banco
    {
        public List<Comentario> ListaComentarios = new List<Comentario>();

        public void ListarComentarios(int codReceita, string codLoginReceita)
        {
            ListaComentarios = new List<Comentario>();

            List<Parametro> listaParametro = new List<Parametro>();
            Parametro CodReceita = new Parametro("pCodReceita", codReceita.ToString());
            Parametro CodLoginReceita = new Parametro("pCodLoginReceita", codLoginReceita);
            listaParametro.Add(CodReceita);
            listaParametro.Add(CodLoginReceita);
            MySqlDataReader dados = Consultar("ExibirComentariosReceita", listaParametro);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(0), dados.GetString(1));
                Comentario comentario = new Comentario(usuario, dados.GetDateTime(2), dados.GetString(3));
                ListaComentarios.Add(comentario);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }
    }
}