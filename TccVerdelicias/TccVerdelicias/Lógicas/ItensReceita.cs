using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TccVerdelicias.Modelos;
using TccVerdelicias.Lógicas;
using MySql.Data.MySqlClient;

namespace TccVerdelicias.Lógicas
{
    public class ItensReceita : Banco
    {
        public List<ItemReceita> ListaItens = new List<ItemReceita>();

        public void ExibirIngredientesReceita(int pCodigoReceita, string pLogin)
        {
            ListaItens = new List<ItemReceita>();
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodigoReceita", pCodigoReceita.ToString());
            Parametro login = new Parametro("pLogin", pLogin);
            Parametros.Add(CodigoReceita);
            Parametros.Add(login);
            MySqlDataReader dados = Consultar("ExibirIngredientesReceita", Parametros);
            while (dados.Read())
            {
                Ingrediente ingrediente = new Ingrediente(dados.GetString(0));
                Medida medida = new Medida(dados.GetString(2));
                ItemReceita itemreceita = new ItemReceita(dados.GetInt32(3), ingrediente, medida, dados.GetString(1));
                ListaItens.Add(itemreceita);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

    }
}