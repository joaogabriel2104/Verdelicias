using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Medida
    {
        public int Codigo { get; set; }
        public string Nome { get; set; }
        public Medida(int codigo, string nome)
        {
            Codigo = codigo;
            Nome = nome;
        }
        public Medida(string nome)
        {
            Nome = nome;
        }

        public Medida()
        {
        }
    }
}