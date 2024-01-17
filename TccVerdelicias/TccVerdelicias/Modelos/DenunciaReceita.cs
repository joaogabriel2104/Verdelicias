using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class DenunciaReceita : Banco
    {
        public Receita Receita { get; set; }
        public Usuario Usuario { get; set; }
        public DateTime DataDenuncia { get; set; }
        public string Descricao { get; set; }
        public bool Verificado { get; set; }
        public int Quantidade { get; set; }

        public void DenunciarReceita(int codReceita, string loginDenunciado, string loginDenunciador, string descricao)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodReceitaDenunciada", codReceita.ToString());
            Parametro LoginDenunciado = new Parametro("pCodLoginDenunciado", loginDenunciado);
            Parametro CodigoDenunciador = new Parametro("pCodDenunciador", loginDenunciador);
            Parametro DescriçãoDenuncia = new Parametro("pDescDenuncia", descricao);

            Parametros.Add(CodigoReceita);
            Parametros.Add(LoginDenunciado);
            Parametros.Add(CodigoDenunciador);
            Parametros.Add(DescriçãoDenuncia);

            Executar("DenunciarReceita", Parametros);

            Desconectar();
        }

        public void ContagemReceitasDenunciadas(int pCodReceita, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pCodReceita", pCodReceita.ToString());
            Parametro parametro1 = new Parametro("pLogin", pLogin);
            parametros.Add(parametro);
            parametros.Add(parametro1);
            MySqlDataReader dados = Consultar("ContagemReceitasDenunciadas", parametros);
            while (dados.Read())
            {
                Quantidade = dados.GetInt32(0);

            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }
    }
}