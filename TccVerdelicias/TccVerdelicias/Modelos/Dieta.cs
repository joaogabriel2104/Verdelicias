using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Dieta
    {
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public Dieta(int codigo, string nome)
        {
            Codigo = codigo;
            Nome = nome;
        }
        public Dieta(string nome)
        {
            Nome = nome;
        }

        public Dieta(int codigo)
        {
            Codigo = codigo;
        }

        public Dieta()
        {
        }
    }
}