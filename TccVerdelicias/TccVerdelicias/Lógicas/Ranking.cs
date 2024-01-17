using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.Lógicas
{
    public class Ranking : Banco
    {
        public List<Usuario> ListaUsuariosRanking = new List<Usuario>();
        public void ExibirDadosRanking()
        {
            ListaUsuariosRanking = new List<Usuario>();
            MySqlDataReader dados = Consultar("ExibirRanking", null);
            while (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(1), dados.GetString(2), dados.GetDouble(0), dados.GetInt16(3));
                Receita receita = new Receita();
                ListaUsuariosRanking.Add(usuario);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }
    }
}