using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Lógicas;
using static System.Collections.Specialized.BitVector32;

namespace TccVerdelicias
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CD = "";
            string U = "";

            if (!IsPostBack)
            {
                #region Receitas Melhores Avaliadas
                Receitas receitas = new Receitas();
                receitas.ExibirReceitasMelhoresAvaliadas();
                litReceitasMelhoresAvaliadas.Text = "";
                for (int i = 0; i < receitas.ListaReceitas.Count && i < 10; i++)
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

                #region Ranking
                Ranking ranking = new Ranking();
                ranking.ExibirDadosRanking();


                if (ranking.ListaUsuariosRanking.Count > 0)
                {
                    litFotoPrimeiroLugarRanking.Text = $@"<a href='perfil.aspx?u={ranking.ListaUsuariosRanking[0].User}'><img src='images/FotosPerfis/{ranking.ListaUsuariosRanking[0].User}.jpg'></a>";
                    litAvaliacaoPrimeiroLugarRanking.Text = ranking.ListaUsuariosRanking[0].NotaUsuario.ToString();
                    litNomePrimeiroLugarRanking.Text = $@"<a href='perfil.aspx?u={ranking.ListaUsuariosRanking[0].User}'>{ranking.ListaUsuariosRanking[0].NomeUsuario}</a>";
                    litNumeroAvaliacoesPrimeiroLugarRanking.Text = ranking.ListaUsuariosRanking[0].NumeroDeReceitas.ToString() + " avaliações";
                }

                if (ranking.ListaUsuariosRanking.Count > 1)
                {
                    litFotoSegundoLugarRanking.Text = $@" <a href='perfil.aspx?u={ranking.ListaUsuariosRanking[1].User}'><img src='images/FotosPerfis/{ranking.ListaUsuariosRanking[1].User}.jpg'></a>";
                    litAvaliacaoSegundoLugarRanking.Text = ranking.ListaUsuariosRanking[1].NotaUsuario.ToString();
                    litNomeSegundoLugarRanking.Text = $"<a href='perfil.aspx?u={ranking.ListaUsuariosRanking[1].User}'>{ranking.ListaUsuariosRanking[1].NomeUsuario}</a>";
                    litNumeroAvaliacoesSegundoLugarRanking.Text = ranking.ListaUsuariosRanking[1].NumeroDeReceitas.ToString() + " avaliações";
                }

                if (ranking.ListaUsuariosRanking.Count > 2)
                {
                    litFotoTerceiroLugarRanking.Text = $@"<a href='perfil.aspx?u={ranking.ListaUsuariosRanking[2].User}'><img src='images/FotosPerfis/{ranking.ListaUsuariosRanking[2].User}.jpg'></a>";
                    litAvaliacaoTerceiroLugarRanking.Text = ranking.ListaUsuariosRanking[2].NotaUsuario.ToString();
                    litNomeTerceiroLugarRanking.Text = $@"<a href='perfil.aspx?u={ranking.ListaUsuariosRanking[2].User}'>{ranking.ListaUsuariosRanking[2].NomeUsuario}</a>";
                    litNumeroAvaliacoesTerceiroLugarRanking.Text = ranking.ListaUsuariosRanking[2].NumeroDeReceitas.ToString() + " avaliações";
                }
                else
                {
                    litFotoTerceiroLugarRanking.Text = $@"<a><img src='images/FotosPerfis/erro.jpg'></a>";
                    litAvaliacaoTerceiroLugarRanking.Text = "0";
                    litNomeTerceiroLugarRanking.Text = "<a>Não Avaliado</a>";
                    litNumeroAvaliacoesTerceiroLugarRanking.Text = "Não avaliado";
                }

                #endregion

                #region Receitas Mais Recentes
                receitas.ExibirReceitasMaisRecentes();
                litReceitasMaisRecentes.Text = "";
                for (int i = 0; i < receitas.ListaReceitas.Count; i++)
                {
                    CD = receitas.ListaReceitas[i].Codigo.ToString();
                    U = receitas.ListaReceitas[i].Usuario.User.ToString();

                    string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                    string imagem = caminhoBase + $"{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg";
                    if (File.Exists(imagem))
                    {
                        litReceitasMaisRecentes.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src='images/FotosReceitas/{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg''></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                        </div>";
                    }
                    else
                    {
                        litReceitasMaisRecentes.Text += $@"<div class='conteudoReceita'>
                            <a href = 'receita.aspx?cd={CD}&u={U}'><img src='images/FotosReceitas/erro.jpg'></a><div class='estrelas'>
                                <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                            </div>
                            <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                        </div>";
                    }
                }
                #endregion

                #region Receitas Seguindo
                if (Session["email"] != null)
                {
                    litReceitasSeguindo.Text = $@"<section>
                        <div class='areaSegura'>
                            <h1>Receitas de quem você segue:</h1>
                            <div class='conteudosReceitas'>";

                    receitas.ExibirReceitasSeguindo(Session["user"].ToString());
                    for (int i = 0; i < receitas.ListaReceitas.Count; i++)
                    {
                        CD = receitas.ListaReceitas[i].Codigo.ToString();
                        U = receitas.ListaReceitas[i].Usuario.User.ToString();

                        string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                        string imagem = caminhoBase + $"{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg";
                        if (File.Exists(imagem))
                        {
                            litReceitasSeguindo.Text += $@"<div class='conteudoReceita'>
                                        <a href='receita.aspx?cd={CD}&u={U}'><img src='images/FotosReceitas/{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg'></a><div class='estrelas'>
                                            <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                            <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                                        </div>
                                        <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                                    </div>";
                        }
                        else
                        {
                            litReceitasSeguindo.Text += $@"<div class='conteudoReceita'>
                                <a href = 'receita.aspx?cd={CD}&u={U}'><img src='images/FotosReceitas/erro.jpg'></a><div class='estrelas'>
                                    <i class='fas fa-star star' style='color: #ffcb0c;'></i>
                                    <p id ='avaliacao'>{receitas.ListaReceitas[i].NotaAvaliacao.ToString("F")}</p>
                                </div>
                                <p>{receitas.ListaReceitas[i].NomeReceita}</p>
                            </div>";
                        }
                    }
                    litReceitasSeguindo.Text += @"</div>
                                </div>
                            </section>";
                }
                else
                {
                    litReceitasSeguindo.Text = "";
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

                if (Session["user"] == null)
                {
                    ImgSair.Visible = false;
                    ImgSairMobile.Visible = false;
                }
            }
        }

        protected void btnPesquisar_Click(object sender, ImageClickEventArgs e)
        {
            if(!String.IsNullOrEmpty(txtProcurar.Text))
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