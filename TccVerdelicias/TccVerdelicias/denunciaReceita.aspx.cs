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
    public partial class denuncia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CD = "";
            string U = "";

            if (Session["user"] == null)
                Response.Redirect("login.aspx");

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = Request["cd"].ToString();
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();

                    #region Voltar
                    litVoltar.Text = $"<div class=\"alinharSeta\"><a href=\"receita.aspx?cd={CD}&u={U}\"><i class=\"fa-solid fa-arrow-left\" id=\"iconeSetaVoltar\"></a></i><h1>Relatar um problema</h1></div>";
                    #endregion

                    #region Dados Receita
                    Receita receita = new Receita();
                    receita.ExibirDadosReceita(int.Parse(CD.ToString()), U); 
                    string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                    string imagem = caminhoBase + $"{U}-{CD}.jpg";
                    if (File.Exists(imagem))
                    {
                        litImagemReceita.Text = $"<img src='images/FotosReceitas/{receita.Usuario.User}-{receita.Codigo}.jpg' class='imgReceita'>";
                    }
                    else
                    {
                        litImagemReceita.Text = $"<img src='images/FotosReceitas/erro.jpg' class='imgReceita'>"; ;
                    }
                    litNomeReceita.Text = receita.NomeReceita;
                    litDataReceita.Text = receita.DataReceita.ToString("dd/MM/yyyy");
                    litCriadorReceita.Text = receita.Usuario.User;
                    #endregion
                }
            }
            else
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

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = Request["cd"].ToString();
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();

                    DenunciaReceita denunciaReceita = new DenunciaReceita();

                    if(!String.IsNullOrEmpty(txtDenuncia.Text))
                    {
                        denunciaReceita.DenunciarReceita(int.Parse(CD.ToString()), U, Session["user"].ToString(), txtDenuncia.Text);
                        Response.Redirect($"receita.aspx?cd={CD}&u={U}");
                    }
                    else
                    {
                        litValidacao.Text = "<p style='color: red'>A denúncia não pode estar vazio!</p>";
                    }
                }
            }
        }

        protected void imgSair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}