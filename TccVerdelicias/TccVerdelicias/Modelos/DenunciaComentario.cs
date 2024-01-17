using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class DenunciaComentario : Banco
    {
        public Comentario Comentario { get; set; }
        public Usuario UsuarioDenunciado { get; set; }
        public Usuario UsuarioDenunciador { get; set; }
        public DateTime DataDenuncia { get; set; }
        public string Descricao { get; set; }
        public bool Verificado { get; set; }

        public DenunciaComentario()
        {
        }

        public DenunciaComentario(Comentario comentario, Usuario usuarioDenunciado)
        {
            Comentario = comentario;
            UsuarioDenunciado = usuarioDenunciado;
        }

        public void DenunciarComentario(int codReceita, string loginReceita, string loginDenunciado, string loginDenunciador, DateTime dataComentario, string descricao)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoReceita = new Parametro("pCodReceita", codReceita.ToString());
            Parametro LoginReceita = new Parametro("pCodLoginReceita", loginReceita);
            Parametro CodigoDenunciado = new Parametro("pCodDenunciado", loginDenunciado);
            Parametro CodigoDenunciador = new Parametro("pCodDenunciador", loginDenunciador);
            Parametro DataComentario = new Parametro("pDataComentario", dataComentario.ToString("yyyy-MM-dd HH:mm:ss"));
            Parametro DescriçãoDenuncia = new Parametro("pDescDenuncia", descricao);

            Parametros.Add(CodigoReceita);
            Parametros.Add(LoginReceita);
            Parametros.Add(CodigoDenunciado);
            Parametros.Add(CodigoDenunciador);
            Parametros.Add(DataComentario);
            Parametros.Add(DescriçãoDenuncia);

            Executar("DenunciarComentario", Parametros);

            Desconectar();
        }
    }
}