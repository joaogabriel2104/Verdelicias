using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Ingrediente : Banco
    {
        public int Codigo { get; set; }
        public string Nome { get; set; }

        public Ingrediente(int codigo, string nome)
        {
            Codigo = codigo;
            Nome = nome;
        }

        [JsonConstructor]
        public Ingrediente(string nome)
        {
            Nome = nome;
        }

        public Ingrediente()
        {
        }

        public void CriarIngrediente(string pNomeIngrediente)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro parametro = new Parametro("pIngrediente", pNomeIngrediente);
            parametros.Add(parametro);

            Executar("CriarIngrediente", parametros);
        }
    }
}