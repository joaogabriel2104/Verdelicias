using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class ItemReceita : Banco
    {
        public int Codigo { get; set; }
        public Receita Receita { get; set; }
        public Ingrediente Ingrediente { get; set; }
        public Medida Medida { get; set; }
        public string Quantidade { get; set; }

        public ItemReceita(string ingrediente, string medida, string quantidade)
        {
            Receita = new Receita();
            Ingrediente = new Ingrediente();
            Medida = new Medida();

            Ingrediente.Nome = ingrediente;
            Medida.Nome = medida;
            Quantidade = quantidade;
        }

        [JsonConstructor]
        public ItemReceita(int codigo, int receita, string ingrediente, string medida, string quantidade)
        {
            Receita = new Receita();
            Ingrediente = new Ingrediente();
            Medida = new Medida();

            if (codigo != 0 && codigo > 0)
            {
                Codigo = codigo;
                Receita.Codigo = receita;
                Ingrediente.Nome = ingrediente;
                Medida.Nome = medida;
                Quantidade = quantidade;
            }
            else
            {
                Ingrediente.Nome = ingrediente;
                Medida.Nome = medida;
                Quantidade = quantidade;
            }
        }

        public ItemReceita()
        {
        }

        public ItemReceita(int codigo, Ingrediente ingrediente, Medida medida, string quantidade)
        {
            Codigo = codigo;
            Ingrediente = ingrediente;
            Medida = medida;
            Quantidade = quantidade;
        }

        public ItemReceita(Ingrediente ingrediente, Medida medida, string quantidade)
        {
            Ingrediente = ingrediente;
            Medida = medida;
            Quantidade = quantidade;
        }

        public void CriarItemReceita(string pLogin, string pIngrediente, string pQuantidade, string pNomeMedida)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pLogin", pLogin);
            Parametro parametro1 = new Parametro("pIngrediente", pIngrediente);
            Parametro parametro2 = new Parametro("pQuantidade", pQuantidade);
            Parametro parametro3 = new Parametro("pNomeMedida", pNomeMedida);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            parametros.Add(parametro3);
            Executar("CriarItemReceita", parametros);
        }

        public void AtualizarItemReceita(int pCodigoItem, int pCodigoReceita, string pLogin, string pIngrediente, string pQuantidade, string pNomeMedida)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pCodigoItem", pCodigoItem.ToString());
            Parametro parametro1 = new Parametro("pCodigoReceita", pCodigoReceita.ToString());
            Parametro parametro2 = new Parametro("pLogin", pLogin);
            Parametro parametro3 = new Parametro("pIngrediente", pIngrediente);
            Parametro parametro4 = new Parametro("pQuantidade", pQuantidade);
            Parametro parametro5 = new Parametro("pNomeMedida", pNomeMedida);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            parametros.Add(parametro2);
            parametros.Add(parametro3);
            parametros.Add(parametro4);
            parametros.Add(parametro5);
            Executar("AtualizarItemReceita", parametros);
        }
    }
}