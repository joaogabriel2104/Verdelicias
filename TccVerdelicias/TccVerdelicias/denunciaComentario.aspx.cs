using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Lógicas;
using TccVerdelicias.Modelos;

namespace TccVerdelicias
{
    public partial class denunciaComentario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CD = "";
            string U = "";
            string Denunciado = "";
            string Data = "";

            if (Session["user"] == null)
                Response.Redirect("login.aspx");

            try
            {
                CD = Request["cd"].ToString();
                U = Request["u"].ToString();
                Denunciado = Request["denunciado"];
                Data = Request["dt"];
                #region Voltar
                litVoltar.Text = $"<div class=\"alinharSeta\"><a href=\"receita.aspx?cd={CD}&u={U}\"><i class=\"fa-solid fa-arrow-left\" id=\"iconeSetaVoltar\"></a></i><h1>Relatar um problema</h1></div>";
                #endregion

                #region Dados Comentario
                Comentario comentario = new Comentario();
                comentario.ExibirComentario(int.Parse(CD.ToString()), U, Denunciado, DateTime.Parse(Data.ToString()));
                string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosPerfis\";
                string imagem = caminhoBase + $"{U}.jpg";
                if (File.Exists(imagem))
                {
                    litImagemPerfil.Text = $"<img src='images/FotosPerfis/{Denunciado}.jpg' class='imgPerfil'>";
                }
                else
                {
                    litImagemPerfil.Text = $"<img src='images/FotosPerfis/erro.jpg' class='imgPerfil'>"; ;
                }
                litDescricaoComentario.Text = comentario.Descricao;
                litNomePerfil.Text = comentario.UsuarioComentario.NomeUsuario;
                litUserPerfil.Text = comentario.UsuarioComentario.User;
                litDataComentario.Text = comentario.DataComentario.ToString("dd/MM/yyyy");
                #endregion
            }
            catch
            {
                Response.Redirect("erro.aspx");
            }

            #region Foto Perfil
            if (Session["email"] == null)
            {
                imgUser.Text = "<a href='login.aspx'><img src='images/user.png' id='imgUser'></a>";
                imgUserMobile.Text = "<a href='login.aspx'><img src='images/user.png' id='imgUser'></a>";
            }
            else
            {
                string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosPerfis\";
                string imagem = caminhoBase + $"{Session["User"]}.jpg";

                if (File.Exists(imagem))
                {
                    imgUser.Text = $"<a href='perfil.aspx'><img src='images/FotosPerfis/{Session["user"]}.jpg' id= 'imgUser'></a>";
                    imgUserMobile.Text = $"<a href='perfil.aspx'><img src='images/FotosPerfis/{Session["user"]}.jpg' id= 'imgUser'></a>";
                }
                else
                {
                    imgUser.Text = $"<a href='perfil.aspx'><img src='images/FotosPerfis/erro.jpg' id= 'imgUser'></a>";
                    imgUserMobile.Text = $"<a href='perfil.aspx'><img src='images/FotosPerfis/erro.jpg' id= 'imgUser'></a>";
                }
            }
            #endregion

            #region Dietas Nav
            litDietas.Text = "";
            Dietas dietas = new Dietas();
            dietas.ListarDietas();
            for (int i = 0; i < dietas.ListaDietas.Count; i++)
            {
                litDietas.Text += $"<li><a href='pesquisa.aspx?dieta={dietas.ListaDietas[i].Nome}'>{dietas.ListaDietas[i].Nome}</a></li>";
            }
            #endregion

            if (Session["user"] == null)
            {
                ImgSair.Visible = false;
                ImgSairMobile.Visible = false;
            }
        }

        protected void btnPesquisar_Click(object sender, ImageClickEventArgs e)
        {
            if (!String.IsNullOrEmpty(txtProcurar.Text))
            {
                string Busca = txtProcurar.Text;
                Receitas receitas = new Receitas();
                receitas.ProcurarReceita(Busca);

                Response.Redirect($"pesquisa.aspx?busca={Busca}");
            }
        }

        protected void btnDenunciar_Click(object sender, EventArgs e)
        {
            litValidacao.Text = "";
            string CD = "";
            string U = "";
            string Denunciado = "";
            string Data = "";

            try
            {
                CD = Request["cd"].ToString();
                U = Request["u"].ToString();
                Denunciado = Request["denunciado"];
                Data = Request["dt"];

                DenunciaComentario denunciaComentario = new DenunciaComentario();

                if (!String.IsNullOrEmpty(txtDenuncia.Text))
                {
                    denunciaComentario.DenunciarComentario(int.Parse(CD.ToString()), U, Denunciado, Session["user"].ToString(), DateTime.Parse(Data.ToString()), txtDenuncia.Text);
                }
                else
                {
                    litValidacao.Text = "<p style='color: red'>A denúncia não pode estar vazio!</p>";
                }

            }
            catch
            {
                Response.Redirect("erro.aspx");
            }
            Response.Redirect($"receita.aspx?cd={CD}&u={U}");
        }

        protected void imgSair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}