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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Foto Perfil
            if (Session["email"] == null)
            {
                imgUser.Text = "<a href='login.aspx'><img src='images/user.png' id='imgUser'></a>";
            }
            else
            {
                string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosPerfis\";
                string imagem = caminhoBase + $"{Session["User"]}.jpg";

                if (File.Exists(imagem))
                {
                    imgUser.Text = $"<a href='perfil.aspx'><img src='images/FotosPerfis/{Session["user"]}.jpg' id= 'imgUser'></a>";
                }
                else
                {
                    imgUser.Text = $"<a href='perfil.aspx'><img src='images/FotosPerfis/erro.jpg' id= 'imgUser'></a>";
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
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            litMensagemEmail.Text = "";
            litMensagemSenha.Text = "";

            if (String.IsNullOrEmpty(txtEmail.Text))
            {
                litMensagemEmail.Text = "O e-mail não pode ficar em branco";
                txtEmail.Focus();
            }
            else
            {
                if (String.IsNullOrEmpty(txtSenha.Text))
                {
                    litMensagemSenha.Text = "A senha deve ser preenchida";
                    txtSenha.Focus();
                }
                else
                {

                    Usuario usuario = new Usuario();
                    try
                    {
                        usuario.InfoLoginUsuario(txtEmail.Text, txtSenha.Text);
                        if(usuario.User == null)
                        {
                            litMensagemSenha.Text = "E-mail e/ou Senha inválidos";
                            txtEmail.Focus();
                        }
                    }
                    catch
                    {
                        litMensagemSenha.Text = "E-mail e/ou Senha inválidos";
                        txtEmail.Focus();
                    }

                    if (usuario.User != null)
                    {
                        Session["email"] = txtEmail.Text;
                        Session["user"] = usuario.User;
                        Session["nome"] = usuario.NomeUsuario;
                        Session["dtCriacao"] = usuario.Criacao.ToString("dd/MM/yyyy");
                        Response.Redirect("index.aspx");
                    }
                }
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
    }
}