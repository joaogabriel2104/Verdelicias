using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Lógicas;

namespace TccVerdelicias
{
    public partial class receitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string CD = "";
                string U = "";

                #region Receitas Melhores Avaliadas
                Receitas receitas = new Receitas();
                receitas.ExibirReceitasMelhoresAvaliadas();
                litReceitasMelhoresAvaliadas.Text = "";
                for (int i = 0; i < receitas.ListaReceitas.Count && i < 40; i++)
                {
                    CD = receitas.ListaReceitas[i].Codigo.ToString();
                    U = receitas.ListaReceitas[i].Usuario.User.ToString();

                    string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                    string imagem = caminhoBase + $"{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg";

                    if (File.Exists(imagem))
                    {
                        litReceitasMelhoresAvaliadas.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg' ></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                        </div>";
                    }
                    else
                    {
                        litReceitasMelhoresAvaliadas.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/erro.jpg' ></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                        </div>";
                    }
                }
                #endregion

                #region Receitas Mais Recentes
                receitas.ExibirReceitasMaisRecentes();
                litReceitasMaisRecentes.Text = "";
                for (int i = 0; i < receitas.ListaReceitas.Count && i < 40; i++)
                {
                    CD = receitas.ListaReceitas[i].Codigo.ToString();
                    U = receitas.ListaReceitas[i].Usuario.User.ToString();
                    string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                    string imagem = caminhoBase + $"{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg";

                    if (File.Exists(imagem))
                    {
                        litReceitasMaisRecentes.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg' ></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                        </div>";
                    }
                    else
                    {
                        litReceitasMaisRecentes.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/erro.jpg' ></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                        </div>";
                    }
                }
                #endregion

                #region Exibir Outras Receitas
                receitas.ExibirReceitas();
                litOutrasReceitas.Text = "";
                for (int i = 0; i < receitas.ListaReceitas.Count && i < 40; i++)
                {
                    CD = receitas.ListaReceitas[i].Codigo.ToString();
                    U = receitas.ListaReceitas[i].Usuario.User.ToString();
                    string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                    string imagem = caminhoBase + $"{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg";
                    if (File.Exists(imagem))
                    {
                        litOutrasReceitas.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src = 'images\FotosReceitas\{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg'></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                            </div>";
                    }
                    else
                    {
                        litOutrasReceitas.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src = 'images/FotosReceitas/erro.jpg'></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                        </div>";
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

        protected void imgSair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}