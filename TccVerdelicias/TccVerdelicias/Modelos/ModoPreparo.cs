using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class ModoPreparo : Banco
    {
        public Receita Receita { get; set; }
        public int Codigo { get; set; }
        public string Descricao { get; set; }

        [JsonConstructor]
        public ModoPreparo(int receita, int codigo, string descricao)
        {
            if(codigo != 0 && codigo > 0)
            {
                Receita = new Receita();

                Receita.Codigo = receita;
                Codigo = codigo;
                Descricao = descricao;
            }
            else
            {
                Descricao = descricao;
            }
        }

        public ModoPreparo(string descricao)
        {
            Descricao = descricao;
        }

        public ModoPreparo(int codigo, string descricao)
        {
            Codigo = codigo;
            Descricao = descricao;
        }

        public void CriarModoPreparo(string pLogin, string pDescModoPreparo)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro1 = new Parametro("pLogin", pLogin);
            Parametro parametro2 = new Parametro("pDescModoPreparo", pDescModoPreparo);

            parametros.Add(parametro1);
            parametros.Add(parametro2);

            Executar("CriarModoDePreparo", parametros);
        }

        public void AtualizarModoPreparo(int pCodigo, string pLogin, int pCodigoPreparo, string pDescModoPreparo)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pCodigo", pCodigo.ToString());
            Parametro parametro1 = new Parametro("pLogin", pLogin);
            Parametro parametro2 = new Parametro("pCodigoPreparo", pCodigoPreparo.ToString());
            Parametro parametro3 = new Parametro("pDescModoPreparo", pDescModoPreparo);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            parametros.Add(parametro3);

            Executar("AtualizarModoDePreparo", parametros);
        }
    }
}