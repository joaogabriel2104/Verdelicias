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
    public partial class perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSalvos.CssClass = "coloracao";

            string CD = "";
            string U = "";

            #region info perfil
            if (!String.IsNullOrEmpty(Request["u"]))
            {
                Usuario usuario = new Usuario();
                U = Request["u"].ToString();
                usuario.ExibirDadosPerfil(U);
                litNome.Text = usuario.NomeUsuario;
                litUser.Text = usuario.User;
                litdtCriacao.Text = usuario.Criacao.ToString("dd/MM/yyyy");

                string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosPerfis\";
                string imagem = caminhoBase + $"{U}.jpg";

                if (File.Exists(imagem))
                {
                    litImgPerfil.Text = $"<img src='images/FotosPerfis/{U}.jpg'>";
                }
                else
                {
                    litImgPerfil.Text = $"<img src='images/FotosPerfis/erro.jpg'>";
                }

                if (String.IsNullOrEmpty(litUser.Text))
                {
                    Response.Redirect("erro.aspx");
                }
            }
            else
            {
                if (Session["email"] != null)
                {
                    U = Session["User"].ToString();
                    litNome.Text = Session["nome"].ToString();
                    litUser.Text = Session["user"].ToString();
                    litdtCriacao.Text = Session["dtCriacao"].ToString();

                    string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosPerfis\";
                    string imagem = caminhoBase + $"{Session["User"]}.jpg";

                    if (File.Exists(imagem))
                    {
                        litImgPerfil.Text = $"<img src='images/FotosPerfis/{Session["user"]}.jpg'>";
                    }
                    else
                    {
                        litImgPerfil.Text = $"<img src='images/FotosPerfis/erro.jpg'>";
                    }
                }
                else
                {
                    Response.Redirect("erro.aspx");
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

            #region Visibilidade Botao Seguir
            if (Session["user"] != null)
            {
                if (Request["u"] == null)
                {
                    btnSeguir.Visible = false;
                    btnDenunciar.Visible = false;
                    btnEditar.Visible = true;
                }
                else 
                {
                    if (Session["user"].ToString() == Request["u"])
                    {
                        btnSeguir.Visible = false;
                        btnDenunciar.Visible = false;
                        btnEditar.Visible = true;
                    }
                    else
                    {
                        btnSeguir.Visible = true;
                        btnDenunciar.Visible = true;
                    }
                }
            }
            #endregion

            #region Seguir
            Seguidor seguidor = new Seguidor();
            if (Session["email"] != null)
            {
                seguidor.VerificarSeguir(U, Session["user"].ToString());
                if (seguidor.UserSeguindo != null)
                {
                    btnSeguir.Text = "Seguindo";
                    btnSeguir.ID = "corSeguindo";
                }
                else
                {
                    btnSeguir.Text = "Seguir";
                    btnSeguir.ID = "btnSeguir";
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

            #region Exibir Info Receitas e Seguidores
            seguidor = new Seguidor();
            seguidor.ContarSeguidoresUsuario(U.ToString());
            if (seguidor.Quantidade > 1)
                litSeguidores.Text = seguidor.Quantidade.ToString() + " seguidores";
            else
            litSeguidores.Text = seguidor.Quantidade.ToString() + " seguidor";
            seguidor.ContarSeguindoUsuario(U.ToString());
            litSeguindo.Text = seguidor.Quantidade.ToString();

            Receitas receitas = new Receitas();
            receitas.ExibirReceitasUsuario(U.ToString());
            litReceitas.Text = "";
            for (int i = 0; i < receitas.ListaReceitas.Count; i++)
            {
                CD = receitas.ListaReceitas[i].Codigo.ToString();

                string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                string imagem = caminhoBase + $"{U + '-' + receitas.ListaReceitas[i].Codigo}.jpg";

                if (File.Exists(imagem))
                {
                    litReceitas.Text += $@"<div class='imagensClasse'>
                        <a href ='receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/{U + '-' + receitas.ListaReceitas[i].Codigo}.jpg' ></a><div class='estrelas'>
                            <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                            <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                        </div>
                        <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                    </div>";
                }
                else
                {
                    litReceitas.Text += $@"<div class='imagensClasse'>
                        <a href ='receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/erro.jpg' ></a><div class='estrelas'>
                            <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                            <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                        </div>
                        <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                    </div>";
                }
            }

            if (receitas.ListaReceitas.Count == 0)
            {
                litReceitas.Text = "<div id='centralizarNaoEncontrado'><p>Você não postou nenhuma receita.</p></div>";
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

        protected void btnDenunciar_Click(object sender, ImageClickEventArgs e)
        {
            string U = "";

            if (!String.IsNullOrEmpty(Request["u"]))
            {
                U = Request["u"].ToString();
                Response.Redirect($"denunciaUsuario.aspx?u={U}");
            }
        }

        protected void btnReceitas_Click(object sender, EventArgs e)
        {
            string CD = "";
            string U = "";

            if (!String.IsNullOrEmpty(Request["u"]))
            {
                U = Request["u"].ToString();
            }
            else
            {
                U = Session["user"].ToString();
            }

            btnReceitas.CssClass = "coloracaoVerde";
            btnSalvos.CssClass = "coloracao";

            Receitas receitas = new Receitas();
            receitas.ExibirReceitasUsuario(U.ToString());
            litReceitas.Text = "";
            for (int i = 0; i < receitas.ListaReceitas.Count; i++)
            {
                CD = receitas.ListaReceitas[i].Codigo.ToString();

                string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                string imagem = caminhoBase + $"{U + '-' + receitas.ListaReceitas[i].Codigo}.jpg";

                if (File.Exists(imagem))
                {
                    litReceitas.Text += $@"<div class='imagensClasse'>
                        <a href ='receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/{U + '-' + receitas.ListaReceitas[i].Codigo}.jpg' ></a><div class='estrelas'>
                            <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                            <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                        </div>
                        <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                    </div>";
                }
                else
                {
                    litReceitas.Text += $@"<div class='imagensClasse'>
                        <a href ='receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/erro.jpg' ></a><div class='estrelas'>
                            <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                            <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                        </div>
                        <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                    </div>";
                }
            }

            if (receitas.ListaReceitas.Count == 0)
            {
                litReceitas.Text = "<div id='centralizarNaoEncontrado'><p>Você não postou nenhuma receita.</p></div>";
            }
        }

        protected void btnSalvos_Click(object sender, EventArgs e)
        {
            string CD = "";
            string U = "";

            if (!String.IsNullOrEmpty(Request["u"]))
            {
                U = Request["u"].ToString();
            }
            else
            {
                U = Session["user"].ToString();
            }

            btnSalvos.CssClass = "coloracaoVerde";
            btnReceitas.CssClass = "coloracao";

            Receitas receitas = new Receitas();
            receitas.ExibirFavoritosUsuario(U.ToString());
            litReceitas.Text = "";
            for (int i = 0; i < receitas.ListaReceitas.Count; i++)
            {
                CD = receitas.ListaReceitas[i].Codigo.ToString();
                U = receitas.ListaReceitas[i].Usuario.User.ToString();

                string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                string imagem = caminhoBase + $"{U + '-' + receitas.ListaReceitas[i].Codigo}.jpg";

                if (File.Exists(imagem))
                {
                    litReceitas.Text += $@"<div class='imagensClasse'>
                        <a href ='receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/{U + '-' + receitas.ListaReceitas[i].Codigo}.jpg' ></a><div class='estrelas'>
                            <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                            <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                        </div>
                        <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                    </div>";
                }
                else
                {
                    litReceitas.Text += $@"<div class='imagensClasse'>
                        <a href ='receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/erro.jpg' ></a><div class='estrelas'>
                            <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                            <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                        </div>
                        <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                    </div>";
                }
            }

            if(receitas.ListaReceitas.Count == 0)
            {
                litReceitas.Text = "<div id='centralizarNaoEncontrado'><p>Não há nenhuma receita favoritada.</p></div>";
            }
        }

        protected void imgSair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("editarPerfil.aspx");
        }

        protected void btnSeguir_Click(object sender, EventArgs e)
        {
            #region Seguir
            string U = "";
            Seguidor seguidor = new Seguidor();

            if (!String.IsNullOrEmpty(Request["u"]))
            {
                U = Request["u"].ToString();
                if (Session["email"] != null)
                {
                    seguidor.VerificarSeguir(U, Session["user"].ToString());
                    if (seguidor.UserSeguindo != null)
                    {
                        seguidor.PararSeguir(U, Session["user"].ToString());
                        btnSeguir.Text = "Seguir";
                        btnSeguir.ID = "btnSeguir";
                        Response.Redirect($"perfil.aspx?u={U}");
                    }
                    else
                    {
                        seguidor.BtnSeguir(U, Session["user"].ToString());
                        btnSeguir.Text = "Seguindo";
                        btnSeguir.ID = "corSeguindo";
                        Response.Redirect($"perfil.aspx?u={U}");
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
            #endregion
        }
    }
}