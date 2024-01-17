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
    public partial class editarPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CD = "";
            string U = "";

            if (!String.IsNullOrEmpty(Request["u"]))
            {
                Response.Redirect($@"perfil.aspx?u={Request["u"]}");
            }
            else
            {
                Usuario usuario = new Usuario();
                U = Session["user"].ToString();
                usuario.ExibirInformacoesPerfil(U);
                txtNome.Text = usuario.NomeUsuario;
                txtCodigoUsuario.Text = usuario.User;
                txtCodigoUsuario.Enabled = false;
                txtSenha.Visible = false;
                txtSenhaConfirmar.Visible = false;
                txtEmail.Text = usuario.Email;
                txtEmailConfirmar.Text = usuario.Email;
                txtTelefone.Text = usuario.Telefone.ToString();
                txtDataNasc.Text = usuario.Nascimento.ToString("yyyy-MM-dd");
            }

            #region ComboBox Dietas
            Dietas dietas = new Dietas();
            Dietas dietasUser = new Dietas();
            dietasUser.ExibirDietasUsuario(Session["user"].ToString());
            dietas.ListarDietas();

            litDietasChk.Text = "";
            for (int i = 0; i < dietas.ListaDietas.Count; i++)
            {
                bool dietaEstaNaLista = dietasUser.ListaDietas.Any(d => d.Nome == dietas.ListaDietas[i].Nome);
                int valor = i + 1;
                if (dietaEstaNaLista)
                {
                    litDietasChk.Text += $@"<div class='divListaDietas'><input type='checkbox' class='txtListaDietas' value='{dietas.ListaDietas[i].Codigo}' checked></input>
                        {dietas.ListaDietas[i].Nome}</div>";
                }
                else
                {
                    litDietasChk.Text += $@"<div class='divListaDietas'><input type='checkbox' class='txtListaDietas' value='{dietas.ListaDietas[i].Codigo}'></input>
                        {dietas.ListaDietas[i].Nome}</div>";
                }
            }
            #endregion

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

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {

        }

        protected void ImgSair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}