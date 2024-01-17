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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                        Response.Redirect("gerenciamentos.aspx");
                    }
                }
            }
        }
    }
}