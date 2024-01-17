using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class DenunciaUsuario : Banco
    {
        public Usuario UserDenunciador { get; set; }
        public Usuario UserDenunciado { get; set; }
        public DateTime DataDenuncia { get; set; }
        public string Descricao { get; set; }
        public bool Verificado { get; set; }

        public DenunciaUsuario(Usuario userDenunciado)
        {
            UserDenunciado = userDenunciado;
        }
        public DenunciaUsuario()
        {

        }

        public void DenunciarUsuario(string loginDenunciado, string loginDenunciador, string descricao)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro LoginDenunciado = new Parametro("pCodDenunciador", loginDenunciado);
            Parametro CodigoDenunciador = new Parametro("pCodDenunciado", loginDenunciador);
            Parametro DescriçãoDenuncia = new Parametro("pDescDenuncia", descricao);

            Parametros.Add(LoginDenunciado);
            Parametros.Add(CodigoDenunciador);
            Parametros.Add(DescriçãoDenuncia);

            Executar("DenunciarUsuario", Parametros);

            Desconectar();
        }
    }
}