using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class IngredienteSubstituto
    {
        public ItemReceita Original { get; set; }
        public Ingrediente Substituto { get; set; }
        public Medida Medida { get; set; }
        public int Quantidade { get; set; }
    }
}