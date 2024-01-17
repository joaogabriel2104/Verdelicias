using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Lógicas;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.adm
{
    public partial class gerenciamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int CD = 0;
            string U = "";

            Denuncias denunciaReceita = new Denuncias();
            denunciaReceita.ExibirReceitasDenunciadas();
            for (int i = 0; i < denunciaReceita.ListaReceitas.Count; i++)
            {
                CD = denunciaReceita.ListaReceitas[i].Codigo; 
                U = denunciaReceita.ListaReceitas[i].Usuario.User;
                DenunciaReceita contagem = new DenunciaReceita();
                contagem.ContagemReceitasDenunciadas(CD, U);
                litReceitas.Text += $@"<div class='conteudoReceita'>
                    <a href='receitas.aspx'><img src='../images/FotosReceitas/{denunciaReceita.ListaReceitas[i].Usuario.User}-{denunciaReceita.ListaReceitas[i].Codigo}.jpg'></a><div class='estrelas'>
                        <img id= 'imagemDenunciar' src='../images/denunciar.png'/>
                        <p id='avaliacao'>{contagem.Quantidade.ToString()}</p>
                    </div>
                    <p>{denunciaReceita.ListaReceitas[i].NomeReceita}</p>
                </div>";
            }

            string formatarData = "dd/MM/yyyy";
            Denuncias denunciaComentarios = new Denuncias();
            denunciaComentarios.ExibirComentariosDenunciados();
            for (int i = 0; i < denunciaComentarios.ListaDenunciasComentarios.Count; i++)
            {
                litComentarios.Text += $@"<div class='comentario'>
                            <img class='imagemComentario' src='../images/FotosPerfis/{denunciaComentarios.ListaDenunciasComentarios[i].UsuarioDenunciado.User}.jpg'/>
                            <div class='textosComentario'>
                                <div class='NomeEDenuncia'>
                                    <div class='NomeEData'>
                                        <h2>{denunciaComentarios.ListaDenunciasComentarios[i].UsuarioDenunciado.NomeUsuario}</h2>
                                        <p class='dataComentario'>{denunciaComentarios.ListaDenunciasComentarios[i].Comentario.DataComentario.ToString(formatarData)}</p>
                                    </div>
                                </div>
                                <p>{denunciaComentarios.ListaDenunciasComentarios[i].Comentario.Descricao}</p>
                            </div>
                        </div>";
            }

            Denuncias denunciaUsuarios = new Denuncias();
            denunciaUsuarios.ExibirUsuariosDenunciados();
            for (int i = 0; i < denunciaUsuarios.ListaDenunciasUsuarios.Count; i++)
            {
                litPerfis.Text += $@"<div class='denunciaPerfil'>
                        <div class='fotoDenunciaPerfil'>
                            <img class='imagemDenunciaPerfil' src='../images/FotosPerfis/{denunciaUsuarios.ListaDenunciasUsuarios[i].UserDenunciado.User}.jpg'/>
                        </div>
                        <div class='descPerfil''>
                            <p><strong>Nome:</strong>{denunciaUsuarios.ListaDenunciasUsuarios[i].UserDenunciado.NomeUsuario}</p>  
                            <p><strong>User:</strong>{denunciaUsuarios.ListaDenunciasUsuarios[i].UserDenunciado.User}</p>
                        </div>      
                    </div>";
            }
        }
    }
}