using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Modelos;
using TccVerdelicias.Lógicas;
using System.IO;

namespace TccVerdelicias
{
    public partial class receita : System.Web.UI.Page
    {
        string CD = "";
        string U = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Dietas dietas = new Dietas();

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = Request["cd"].ToString();
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();

                    btnEditar.Visible = false;

                    if (!IsPostBack)
                    {
                        #region infos receita
                        Receita receita = new Receita();

                        receita.ExibirDadosReceita(int.Parse(CD), U);
                        litNomeReceita.Text = receita.NomeReceita.ToString();
                        litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
                        litTempoPreparo.Text = receita.TempoPreparo.ToString() + " min";
                        if (receita.Rendimento > 1)
                            litRendimento.Text = receita.Rendimento.ToString() + " porções";
                        else
                            litRendimento.Text = receita.Rendimento.ToString() + " porção";
                        litDataReceita.Text = receita.DataReceita.ToString("dd/MM/yyyy"); /*ver como formatar pelo C#*/

                        string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                        string imagem = caminhoBase + $"{receita.Usuario.User + '-' + receita.Codigo}.jpg";
                        if (File.Exists(imagem))
                        {
                            litImagemReceita.Text = $"<img class ='ftReceita' src='images/FotosReceitas/{receita.Usuario.User}-{receita.Codigo}.jpg'>";
                        }
                        else
                        {
                            litImagemReceita.Text = $"<img class ='ftReceita' src='images/FotosReceitas/erro.jpg'>";
                        }

                        #endregion

                        #region infos perfil
                        litNomeUsuario.Text = $"<a href='perfil.aspx?u={receita.Usuario.User}' class='informacoesUsuario' id='nomeUsuario'><p>{receita.Usuario.NomeUsuario}</p></a>";
                        litUser.Text = $"<a href='perfil.aspx?u={receita.Usuario.User}' class='informacoesUsuario'><p>@{receita.Usuario.User}</p></a>";

                        caminhoBase = Request.PhysicalApplicationPath + @"images\FotosPerfis\";
                        imagem = caminhoBase + $"{receita.Usuario.User}.jpg";
                        if (File.Exists(imagem))
                        {
                            litFotoPerfil.Text = $"<a href='perfil.aspx?u={receita.Usuario.User}' id='linkarPelaFoto'><img src='images/FotosPerfis/{receita.Usuario.User}.jpg'></a>";
                        }
                        else
                        {
                            litFotoPerfil.Text = $"<a href='perfil.aspx?u={receita.Usuario.User}'><img class ='ftReceita' src='images/FotosPerfis/erro.jpg'></a>";
                        }

                        #endregion

                        #region infos dietas
                        dietas.ExibirDietasReceita(int.Parse(CD), U);

                        string stringDietas = "";
                        for (int i = 0; i < dietas.ListaDietas.Count; i++)
                        {
                            stringDietas += dietas.ListaDietas[i].Nome.ToString() + ", ";
                        }
                        if (stringDietas != "")
                            stringDietas = stringDietas.Substring(0, stringDietas.Length - 2);

                        litNomeDieta.Text = stringDietas;

                        #endregion

                        #region Ingredientes
                        ItensReceita itensreceita = new ItensReceita();
                        itensreceita.ExibirIngredientesReceita(int.Parse(CD), U);
                        litNomeIngredientes.Text = "";
                        for (int i = 0; i < itensreceita.ListaItens.Count; i++)
                        {
                            string nome = "";
                            int contagem = 0;

                            if (itensreceita.ListaItens[i].Quantidade != "1")
                            {
                                if (itensreceita.ListaItens[i].Quantidade.Contains("/"))
                                {
                                    nome = itensreceita.ListaItens[i].Medida.Nome;
                                    if (itensreceita.ListaItens[i].Quantidade != "1/2")
                                    {
                                        litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade} de {nome} de 
                                        {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                    }
                                    else
                                    {
                                        litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade} {nome} de 
                                        {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                    }
                                }
                                else
                                {
                                    nome = itensreceita.ListaItens[i].Medida.Nome.ToString();
                                    if (itensreceita.ListaItens[i].Medida.Nome == "Colher de Sopa" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Chá" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Café" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Sobremesa")
                                    {
                                        contagem = 0;
                                        nome = itensreceita.ListaItens[i].Medida.Nome.ToString() + "s";
                                        for (int itChar = 0; itChar < itensreceita.ListaItens[i].Medida.Nome.Length; itChar++)
                                        {
                                            contagem++;
                                            if (contagem == 6)
                                                nome = itensreceita.ListaItens[i].Medida.Nome.Insert(6, "es ");
                                            else
                                                if (contagem > 6)
                                                break;
                                        }
                                        litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade}  {nome} de 
                                        {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                    }
                                    else
                                    {
                                        nome = itensreceita.ListaItens[i].Medida.Nome.ToLower();
                                        if (nome != "a gosto")
                                        {
                                            nome = itensreceita.ListaItens[i].Medida.Nome.ToString() + "s";
                                            litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade}  {nome} de 
                                            {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                        }
                                        else
                                        {
                                            litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Ingrediente.Nome} {nome}</p>";
                                        }
                                    }
                                }

                            }
                            else
                            {
                                nome = itensreceita.ListaItens[i].Medida.Nome.ToLower();
                                if (nome != "a gosto")
                                {
                                    litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade}  {nome} de 
                                            {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                }
                                else
                                {
                                    litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Ingrediente.Nome} {nome}</p>";
                                }
                            }
                        }
                        #endregion

                        #region modo de preparo
                        ModosDePreparo modosdepreparo = new ModosDePreparo();
                        modosdepreparo.ExibirModoPreparo(int.Parse(CD), U);
                        litModoPreparo.Text = "";
                        for (int i = 0; i < modosdepreparo.ListaModosDePreparo.Count; i++)
                        {
                            litModoPreparo.Text += $"<div class='EtapasModoDePreparo'><div><img src='images/IconModoDePreparo.png' id='etapa'><p class='numeroIcon'/>{modosdepreparo.ListaModosDePreparo[i].Codigo}</p></div><p>{modosdepreparo.ListaModosDePreparo[i].Descricao}</p></div>";
                        }
                        #endregion

                        #region Comentarios
                        Comentarios comentarios = new Comentarios();
                        comentarios.ListarComentarios(int.Parse(CD.ToString()), U);
                        litComentarios.Text = "";
                        for (int i = 0; i < comentarios.ListaComentarios.Count; i++)
                        {
                            litComentarios.Text += $@"<div class='imagemENomeComentario'>
                                    <img class='imagemComentario' src='images/FotosPerfis/{comentarios.ListaComentarios[i].UsuarioComentario.User}.jpg'/>
                                    <div class='textosComentario'>
                                        <div class='NomeEDenuncia'>
                                            <div class='NomeEData'>
                                                <h2>{comentarios.ListaComentarios[i].UsuarioComentario.NomeUsuario}</h2>
                                                <p class='dataComentario'>{comentarios.ListaComentarios[i].DataComentario}</p>
                                            </div>
                                            <a href='denunciaComentario.aspx?cd={CD}&u={U}&denunciado={comentarios.ListaComentarios[i].UsuarioComentario.User}&dt={comentarios.ListaComentarios[i].DataComentario.ToString("dd-MM-yyyy HH:mm:ss")}' class='botaoDenunciar'><img class='imagemDenunciar' src='images/denunciar.png'/></a>
                                        </div>
                                        <p>{comentarios.ListaComentarios[i].Descricao}</p>
                                    </div>
                                </div>";
                        }
                        #endregion

                        #region Exibir Outras Receitas
                        Receitas receitas = new Receitas();
                        receitas.ExibirReceitas();
                        litOutrasReceitas.Text = "";
                        for (int i = 0; i < 5; i++)
                        {
                            CD = receitas.ListaReceitas[i].Codigo.ToString();
                            U = receitas.ListaReceitas[i].Usuario.User.ToString();
                            caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                            imagem = caminhoBase + $"{receitas.ListaReceitas[i].Usuario.User + '-' + receitas.ListaReceitas[i].Codigo}.jpg";
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

                        #region Avaliar
                        Avaliacao avaliacao = new Avaliacao();
                        if (Session["email"] != null)
                        {
                            CD = Request["cd"].ToString();
                            U = Request["u"].ToString();
                            avaliacao.ExibirAvaliacaoP(int.Parse(CD), U, Session["user"].ToString());
                            if (avaliacao.Valor != 0)
                                for (int i = 0; i < avaliacao.Valor; i++)
                                {
                                    if (avaliacao.Valor == 1)
                                    {
                                        btnStar1.ImageUrl = "images/estrela.png";
                                        break;
                                    }
                                    else
                                    {
                                        if (avaliacao.Valor == 2)
                                        {
                                            btnStar1.ImageUrl = "images/estrela.png";
                                            btnStar2.ImageUrl = "images/estrela.png";
                                            break;
                                        }
                                        else
                                        {
                                            if (avaliacao.Valor == 3)
                                            {
                                                btnStar1.ImageUrl = "images/estrela.png";
                                                btnStar2.ImageUrl = "images/estrela.png";
                                                btnStar3.ImageUrl = "images/estrela.png";
                                                break;
                                            }
                                            else
                                            {
                                                if (avaliacao.Valor == 4)
                                                {
                                                    btnStar1.ImageUrl = "images/estrela.png";
                                                    btnStar2.ImageUrl = "images/estrela.png";
                                                    btnStar3.ImageUrl = "images/estrela.png";
                                                    btnStar4.ImageUrl = "images/estrela.png";
                                                    break;
                                                }
                                                else
                                                {
                                                    if (avaliacao.Valor == 5)
                                                    {
                                                        btnStar1.ImageUrl = "images/estrela.png";
                                                        btnStar2.ImageUrl = "images/estrela.png";
                                                        btnStar3.ImageUrl = "images/estrela.png";
                                                        btnStar4.ImageUrl = "images/estrela.png";
                                                        btnStar5.ImageUrl = "images/estrela.png";
                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                        #endregion

                        #region Favorito
                        Favorito favorito = new Favorito();
                        if (Session["email"] != null)
                        {
                            favorito.VerificarFavorito(int.Parse(CD), U, Session["user"].ToString());
                            if (favorito.Usuario != null)
                            {
                                imgFavorito.ImageUrl = "images/imgFavoritado.png";
                            }
                            else
                            {
                                imgFavorito.ImageUrl = "images/imgFavorito.png";
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
                            string caminhoBaseFotoPerfil = Request.PhysicalApplicationPath + @"images\FotosPerfis\";
                            string imagemFotoPerfil = caminhoBaseFotoPerfil + $"{Session["User"]}.jpg";

                            if (File.Exists(imagemFotoPerfil))
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

                        #region btnSair
                        if (!String.IsNullOrEmpty(Request["cd"]))
                        {
                            CD = Request["cd"].ToString();
                            if (!String.IsNullOrEmpty(Request["u"]))
                            {
                                U = Request["u"].ToString();

                                if (Session["user"] == null)
                                {
                                    ImgSair.Visible = false;
                                    ImgSairMobile.Visible = false;
                                }
                            }
                        }
                        #endregion
                    }
                }
            }
            #region Visibilidade Botao Seguir
            if (Session["user"] != null)
            {
                if (Request["u"] == null)
                {
                    btnSeguir.Visible = false;
                    btnEditar.Visible = false;
                }
                else
                {
                    if (Session["user"].ToString() == Request["u"])
                    {
                        btnEditar.Visible = true;
                        btnSeguir.Visible = false;
                    }
                    else
                    {
                        btnSeguir.Visible = true;
                        btnEditar.Visible = false;
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
            string CD = "";
            string U = "";

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = Request["cd"].ToString();
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();
                    Response.Redirect($"denunciaReceita.aspx?cd={CD}&u={U}");
                }
            }
        }

        public bool VerificarLogin()
        {
            if (Session["email"] != null)
                return true;
            else
                return false;
        }


        public void Avaliar(int quantidade)
        {
            #region Avaliar
            int CD = 0;
            string U = "";

            Avaliacao avaliacao = new Avaliacao();

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = int.Parse(Request["cd"]);
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();
                }
            }

            if (VerificarLogin() == false)
                Response.Redirect("login.aspx");
            else
                avaliacao.AvaliarReceita(CD, U, Session["user"].ToString(), quantidade);
            #endregion
        }
        public void Atualizar(int quantidade)
        {
            #region Avaliar
            int CD = 0;
            string U = "";

            Avaliacao avaliacao = new Avaliacao();

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = int.Parse(Request["cd"]);
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();
                    avaliacao.AtualizarAvaliacao(CD, U, Session["user"].ToString(), quantidade);
                }
            }
            #endregion
        }

        public bool VerificarAvaliacao()
        {
            #region Verificar avaliação
            int CD = 0;
            string U = "";

            Avaliacao avaliacao = new Avaliacao();

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = int.Parse(Request["cd"]);
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();
                    if (Session["email"] != null)
                    {
                        avaliacao.ExibirAvaliacaoP(CD, U, Session["user"].ToString());
                        if (avaliacao.Valor != 0)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
            #endregion
        }

        #region Estrelas
        protected void btnStar1_Click(object sender, ImageClickEventArgs e)
        {
            if (VerificarAvaliacao() == false)
            {
                Avaliar(1);
            }
            else
            {
                Atualizar(1);
                btnStar2.ImageUrl = "images/estrelaCinza.png";
                btnStar3.ImageUrl = "images/estrelaCinza.png";
                btnStar4.ImageUrl = "images/estrelaCinza.png";
                btnStar5.ImageUrl = "images/estrelaCinza.png";
            }
            btnStar1.ImageUrl = "images/estrela.png";
            CD = Request["cd"].ToString();
            U = Request["u"].ToString();
            Receita receita = new Receita();
            receita.ExibirDadosReceita(int.Parse(CD), U);
            litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
            return;
        }

        protected void btnStar2_Click(object sender, ImageClickEventArgs e)
        {
            if (VerificarAvaliacao() == false)
            {
                Avaliar(2);
            }
            else
            {
                Atualizar(2);
                btnStar3.ImageUrl = "images/estrelaCinza.png";
                btnStar4.ImageUrl = "images/estrelaCinza.png";
                btnStar5.ImageUrl = "images/estrelaCinza.png";
            }
            btnStar1.ImageUrl = "images/estrela.png";
            btnStar2.ImageUrl = "images/estrela.png";
            CD = Request["cd"].ToString();
            U = Request["u"].ToString();
            Receita receita = new Receita();
            receita.ExibirDadosReceita(int.Parse(CD), U);
            litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
            return;
        }

        protected void btnStar3_Click(object sender, ImageClickEventArgs e)
        {

            if (VerificarAvaliacao() == false)
            {
                Avaliar(3);
            }
            else
            {
                Atualizar(3);
                btnStar4.ImageUrl = "images/estrelaCinza.png";
                btnStar5.ImageUrl = "images/estrelaCinza.png";
            }
            btnStar1.ImageUrl = "images/estrela.png";
            btnStar2.ImageUrl = "images/estrela.png";
            btnStar3.ImageUrl = "images/estrela.png";
            CD = Request["cd"].ToString();
            U = Request["u"].ToString();
            Receita receita = new Receita();
            receita.ExibirDadosReceita(int.Parse(CD), U);
            litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
            return;
        }

        protected void btnStar4_Click(object sender, ImageClickEventArgs e)
        {
            if (VerificarAvaliacao() == false)
            {
                Avaliar(4);
            }
            else
            {
                Atualizar(4);
                btnStar5.ImageUrl = "images/estrelaCinza.png";
            }
            btnStar1.ImageUrl = "images/estrela.png";
            btnStar2.ImageUrl = "images/estrela.png";
            btnStar3.ImageUrl = "images/estrela.png";
            btnStar4.ImageUrl = "images/estrela.png";
            CD = Request["cd"].ToString();
            U = Request["u"].ToString();
            Receita receita = new Receita();
            receita.ExibirDadosReceita(int.Parse(CD), U);
            litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
            return;
        }

        protected void btnStar5_Click(object sender, ImageClickEventArgs e)
        {
            if (VerificarAvaliacao() == false)
            {
                Avaliar(5);
            }
            else
            {
                Atualizar(5);
            }
            btnStar1.ImageUrl = "images/estrela.png";
            btnStar2.ImageUrl = "images/estrela.png";
            btnStar3.ImageUrl = "images/estrela.png";
            btnStar4.ImageUrl = "images/estrela.png";
            btnStar5.ImageUrl = "images/estrela.png";
            CD = Request["cd"].ToString();
            U = Request["u"].ToString();
            Receita receita = new Receita();
            receita.ExibirDadosReceita(int.Parse(CD), U);
            litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
            return;
        }
        #endregion

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
                    }
                    else
                    {
                        seguidor.BtnSeguir(U, Session["user"].ToString());
                        btnSeguir.Text = "Seguindo";
                        btnSeguir.ID = "corSeguindo";
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
            #endregion
        }

        protected void imgFavorito_Click(object sender, ImageClickEventArgs e)
        {
            #region Botão Favorito
            int CD = 0;
            string U = "";

            Favorito favorito = new Favorito();

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = int.Parse(Request["cd"]);
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();
                    if (Session["email"] != null)
                    {
                        favorito.VerificarFavorito(CD, U, Session["user"].ToString());
                        if (favorito.Usuario != null)
                        {
                            favorito.Desfavoritar(CD, U, Session["user"].ToString());
                            imgFavorito.ImageUrl = "images/imgFavorito.png";
                        }
                        else
                        {
                            favorito.BtnFavorito(CD, U, Session["user"].ToString());
                            imgFavorito.ImageUrl = "images/imgFavoritado.png";
                        }
                    }
                    else
                    {
                        Response.Redirect("login.aspx");
                    }
                }
            }
            #endregion
        }

        protected void imgSair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            btnCancelar.Visible = true;
            btnEditar.Visible = false;
            pnlImagem.Visible = true;
            pnlCaixa.Visible = true;
            btnSalvar.Visible = true;
            btnDeletar.Visible = true;

            #region Editar info receitas
            if (Session["user"] != null)
            {
                if (Request["u"] == null)
                {
                    Response.Redirect("index.aspx");
                }
                else
                {
                    if (Session["user"].ToString() == Request["u"])
                    {
                        Receita receita = new Receita();

                        receita.ExibirDadosReceita(int.Parse(CD), U);
                        litNomeReceita.Text = "<input id='txtNomeReceita' type='text' value='" + receita.NomeReceita + "'></input>";
                        litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
                        litTempoPreparo.Text = "<input id='txtTempoPreparo' type='text' value='" + receita.TempoPreparo.ToString() + "'></input> min";
                        if (receita.Rendimento > 1)
                            litRendimento.Text = "<input id='txtRendimento' type='text' value='" + receita.Rendimento.ToString() + "'></input> porções";
                        else
                            litRendimento.Text = "<input id='txtRendimento' type='text' value='" + receita.Rendimento.ToString() + "'></input> porção";
                        litDataReceita.Text = receita.DataReceita.ToString("dd/MM/yyyy"); /*ver como formatar pelo C#*/

                        string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                        string imagem = caminhoBase + $"{receita.Usuario.User + '-' + receita.Codigo}.jpg";
                        if (File.Exists(imagem))
                        {
                            litImagemReceita.Text = $"<img class ='ftReceita' src='images/FotosReceitas/{receita.Usuario.User}-{receita.Codigo}.jpg'>";
                        }
                        else
                        {
                            litImagemReceita.Text = $"<img class ='ftReceita' src='images/FotosReceitas/erro.jpg'>";
                        }
                    }
                    else
                    {
                        Response.Redirect("index.aspx");
                    }
                }
            }
            #endregion

            #region infos dietas
            CD = Request["cd"].ToString();
            U = Request["u"].ToString();

            Dietas dietaReceita = new Dietas();
            dietaReceita.ExibirDietasReceita(int.Parse(CD), U);
            Dietas dietasLista = new Dietas();
            dietasLista.ListarDietas();

            litNomeDieta.Text = "";
            litNomeDieta.Text = $@"<select class='cmbDietas'>";
            for (int i = 0; i < dietasLista.ListaDietas.Count; i++)
            {
                if (dietasLista.ListaDietas[i].Nome == dietaReceita.ListaDietas[0].Nome)
                {
                    litNomeDieta.Text += $@"<option value='{dietasLista.ListaDietas[i].Codigo}' selected='selected'>{dietasLista.ListaDietas[i].Nome}</option>";
                }
                else
                {
                    litNomeDieta.Text += $@"<option value='{dietasLista.ListaDietas[i].Codigo}'>{dietasLista.ListaDietas[i].Nome}</option>";
                }
            }
            litNomeDieta.Text += "</select>";
            #endregion

            #region Ingredientes
            ItensReceita itensreceita = new ItensReceita();
            itensreceita.ExibirIngredientesReceita(int.Parse(CD), U);
            Medidas medidas = new Medidas();
            medidas.ListarMedidas();
            litNomeIngredientes.Text = "";
            for (int i = 0; i < itensreceita.ListaItens.Count; i++)
            {
                string nome = "";

                if (itensreceita.ListaItens[i].Quantidade != "1")
                {
                    if (itensreceita.ListaItens[i].Quantidade.Contains("/"))
                    {
                        nome = itensreceita.ListaItens[i].Medida.Nome;
                        if (itensreceita.ListaItens[i].Quantidade != "1/2")
                        {
                            litNomeIngredientes.Text += $@"<input id='itemReceita' style='display:none;' value='{itensreceita.ListaItens[i].Codigo}'></input><p class='margemParagrafo'><input class='qtdInput' type='text' value='{itensreceita.ListaItens[i].Quantidade}'></input> de 
                                    <select class='cmbMedidas'>";
                            for (int z = 0; z < medidas.ListaMedidas.Count; z++)
                            {
                                if (medidas.ListaMedidas[z].Nome == nome)
                                    litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}' selected='selected'>{medidas.ListaMedidas[z].Nome}</option>";
                                else if (medidas.ListaMedidas[z].Nome != nome)
                                    litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}'>{medidas.ListaMedidas[z].Nome}</option>";
                            }
                            litNomeIngredientes.Text += $@"</select> de
                                    <input class='nomeInput' type='text' value='{itensreceita.ListaItens[i].Ingrediente.Nome}'></input></p>";
                        }
                        else
                        {
                            litNomeIngredientes.Text += $@"<input id='itemReceita' style='display:none;' value='{itensreceita.ListaItens[i].Codigo}'></input><p class='margemParagrafo'><input class='qtdInput' type='text' value='{itensreceita.ListaItens[i].Quantidade}'></input> 
                                    <select class='cmbMedidas'>";
                                    for (int z = 0; z < medidas.ListaMedidas.Count; z++)
                                    {
                                        if (medidas.ListaMedidas[z].Nome == nome)
                                            litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}' selected='selected'>{medidas.ListaMedidas[z].Nome}</option>";
                                        else if (medidas.ListaMedidas[z].Nome != nome)
                                            litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}'>{medidas.ListaMedidas[z].Nome}</option>";
                                    }
                                    litNomeIngredientes.Text += $@"</select> de
                                    <input class='nomeInput' type='text' value='{itensreceita.ListaItens[i].Ingrediente.Nome}'></input></p>";
                        }
                    }
                    else
                    {
                        nome = itensreceita.ListaItens[i].Medida.Nome.ToString();
                        if (itensreceita.ListaItens[i].Medida.Nome == "Colher de Sopa" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Chá" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Café" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Sobremesa")
                        {
                            litNomeIngredientes.Text += $@"<input id='itemReceita' style='display:none;' value='{itensreceita.ListaItens[i].Codigo}'></input><p class='margemParagrafo'><input class='qtdInput' type='text' value='{itensreceita.ListaItens[i].Quantidade}'></input> 
                                    <select class='cmbMedidas'>";
                                    for (int z = 0; z < medidas.ListaMedidas.Count; z++)
                                    {
                                        if (medidas.ListaMedidas[z].Nome == nome)
                                            litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}' selected='selected'>{medidas.ListaMedidas[z].Nome}</option>";
                                        else if (medidas.ListaMedidas[z].Nome != nome)
                                            litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}'>{medidas.ListaMedidas[z].Nome}</option>";
                                    }
                                    litNomeIngredientes.Text += $@"</select> de
                                            <input class='nomeInput' type='text' value='{itensreceita.ListaItens[i].Ingrediente.Nome}'></input></p>";
                        }
                        else
                        {
                            nome = itensreceita.ListaItens[i].Medida.Nome.ToString();
                            if (nome != "A gosto")
                            {
                                litNomeIngredientes.Text += $@"<input id='itemReceita' style='display:none;' value='{itensreceita.ListaItens[i].Codigo}'></input><p class='margemParagrafo'><input class='qtdInput' type='text' value='{itensreceita.ListaItens[i].Quantidade}'></input>
                                        <select class='cmbMedidas'>";
                                for (int z = 0; z < medidas.ListaMedidas.Count; z++)
                                {
                                    if (medidas.ListaMedidas[z].Nome == nome)
                                        litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}' selected='selected'>{medidas.ListaMedidas[z].Nome}</option>";
                                    else if (medidas.ListaMedidas[z].Nome != nome)
                                        litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}'>{medidas.ListaMedidas[z].Nome}</option>";
                                }
                                litNomeIngredientes.Text += $@"</select> de
                                            <input class='nomeInput' type='text' value='{itensreceita.ListaItens[i].Ingrediente.Nome}'></input></p>";
                            }
                            else
                            {
                                litNomeIngredientes.Text += $@"<input id='itemReceita' style='display:none;' value='{itensreceita.ListaItens[i].Codigo}'></input><input class='qtdInput' style='display:none;' value='{itensreceita.ListaItens[i].Quantidade}'></input>
                                        <p class='margemParagrafo'>
                                        <input class='nomeInput' type='text' value='{itensreceita.ListaItens[i].Ingrediente.Nome}'></input> 
                                        <select class='cmbMedidas'>";
                                for (int z = 0; z < medidas.ListaMedidas.Count; z++)
                                {
                                    if (medidas.ListaMedidas[z].Nome.ToLower() == nome.ToLower())
                                        litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}' selected='selected'>{medidas.ListaMedidas[z].Nome}</option>";
                                    else if (medidas.ListaMedidas[z].Nome != nome.ToLower())
                                        litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}'>{medidas.ListaMedidas[z].Nome}</option>";
                                }
                                litNomeIngredientes.Text += $@"</select></p>";
                            }
                        }
                    }

                }
                else
                {
                    nome = itensreceita.ListaItens[i].Medida.Nome.ToString();
                    if (nome != "a gosto")
                    {
                        litNomeIngredientes.Text += $@"<input id='itemReceita' style='display:none;' value='{itensreceita.ListaItens[i].Codigo}'></input><p class='margemParagrafo'><input class='qtdInput' type='text' value='{itensreceita.ListaItens[i].Quantidade}'>
                                        <select class='cmbMedidas'>";
                        for (int z = 0; z < medidas.ListaMedidas.Count; z++)
                        {
                            if (medidas.ListaMedidas[z].Nome == nome)
                                litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}' selected='selected'>{medidas.ListaMedidas[z].Nome}</option>";
                            else if (medidas.ListaMedidas[z].Nome != nome)
                                litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}'>{medidas.ListaMedidas[z].Nome}</option>";
                        }
                        litNomeIngredientes.Text += $@"</select> de
                                            <input class='nomeInput' type='text' value='{itensreceita.ListaItens[i].Ingrediente.Nome}'></input></p>";
                    }
                    else
                    {
                        nome = itensreceita.ListaItens[i].Medida.Nome.ToString();
                        litNomeIngredientes.Text += $@"<input id='itemReceita' style='display:none;' value='{itensreceita.ListaItens[i].Codigo}'></input><input class='qtdInput' style='display:none;' value='{itensreceita.ListaItens[i].Quantidade}'></input>
                                        <p class='margemParagrafo'>
                                        <input class='nomeInput' type='text' value='{itensreceita.ListaItens[i].Ingrediente.Nome}'></input> 
                                        <select class='cmbMedidas'>";
                        for (int z = 0; z < medidas.ListaMedidas.Count; z++)
                        {
                            if (medidas.ListaMedidas[z].Nome.ToLower() == nome.ToLower())
                                litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}' selected='selected'>{medidas.ListaMedidas[z].Nome}</option>";
                            else if (medidas.ListaMedidas[z].Nome != nome.ToLower())
                                litNomeIngredientes.Text += $@"<option value='{medidas.ListaMedidas[z].Nome}'>{medidas.ListaMedidas[z].Nome}</option>";
                        }
                        litNomeIngredientes.Text += $@"</select></p>";
                    }
                }
            }
            #endregion

            #region modo de preparo
            ModosDePreparo modosdepreparo = new ModosDePreparo();
            modosdepreparo.ExibirModoPreparo(int.Parse(CD), U);
            litModoPreparo.Text = "";
            for (int i = 0; i < modosdepreparo.ListaModosDePreparo.Count; i++)
            {
                litModoPreparo.Text += $"<div class='EtapasModoDePreparo'><div><img src='images/IconModoDePreparo.png' id='etapa'><p class='numeroIcon'/>{modosdepreparo.ListaModosDePreparo[i].Codigo}</p></div><textarea class='etapaPreparo'>{modosdepreparo.ListaModosDePreparo[i].Descricao}</textarea></div>";
            }
            #endregion

            litComentarios.Text = "";
            pnlComentarios.Visible = false;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Dietas dietas = new Dietas();

            if (!String.IsNullOrEmpty(Request["cd"]))
            {
                CD = Request["cd"].ToString();
                if (!String.IsNullOrEmpty(Request["u"]))
                {
                    U = Request["u"].ToString();

                    btnCancelar.Visible = false;
                    btnEditar.Visible = true;
                    pnlImagem.Visible = false;
                    pnlCaixa.Visible = false;
                    btnSalvar.Visible = false;
                    btnDeletar.Visible = false;

                    #region infos receita
                    Receita receita = new Receita();

                    receita.ExibirDadosReceita(int.Parse(CD), U);
                    litNomeReceita.Text = receita.NomeReceita.ToString();
                    litAvaliacao.Text = receita.NotaAvaliacao.ToString("F");
                    litTempoPreparo.Text = receita.TempoPreparo.ToString() + " min";
                    if (receita.Rendimento > 1)
                        litRendimento.Text = receita.Rendimento.ToString() + " porções";
                    else
                        litRendimento.Text = receita.Rendimento.ToString() + " porção";
                    litDataReceita.Text = receita.DataReceita.ToString("dd/MM/yyyy"); /*ver como formatar pelo C#*/

                    string caminhoBase = Request.PhysicalApplicationPath + @"images\FotosReceitas\";
                    string imagem = caminhoBase + $"{receita.Usuario.User + '-' + receita.Codigo}.jpg";
                    if (File.Exists(imagem))
                    {
                        litImagemReceita.Text = $"<img class ='ftReceita' src='images/FotosReceitas/{receita.Usuario.User}-{receita.Codigo}.jpg'>";
                    }
                    else
                    {
                        litImagemReceita.Text = $"<img class ='ftReceita' src='images/FotosReceitas/erro.jpg'>";
                    }

                    #endregion

                    #region infos dietas
                    dietas.ExibirDietasReceita(int.Parse(CD), U);

                    string stringDietas = "";
                    for (int i = 0; i < dietas.ListaDietas.Count; i++)
                    {
                        stringDietas += dietas.ListaDietas[i].Nome.ToString() + ", ";
                    }
                    if (stringDietas != "")
                        stringDietas = stringDietas.Substring(0, stringDietas.Length - 2);

                    litNomeDieta.Text = stringDietas;

                    #endregion

                    #region Ingredientes
                    ItensReceita itensreceita = new ItensReceita();
                    itensreceita.ExibirIngredientesReceita(int.Parse(CD), U);
                    litNomeIngredientes.Text = "";
                    for (int i = 0; i < itensreceita.ListaItens.Count; i++)
                    {
                        string nome = "";
                        int contagem = 0;

                        if (itensreceita.ListaItens[i].Quantidade != "1")
                        {
                            if (itensreceita.ListaItens[i].Quantidade.Contains("/"))
                            {
                                nome = itensreceita.ListaItens[i].Medida.Nome;
                                if (itensreceita.ListaItens[i].Quantidade != "1/2")
                                {
                                    litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade} de {nome} de 
                                    {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                }
                                else
                                {
                                    litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade} {nome} de 
                                    {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                }
                            }
                            else
                            {
                                nome = itensreceita.ListaItens[i].Medida.Nome.ToString();
                                if (itensreceita.ListaItens[i].Medida.Nome == "Colher de Sopa" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Chá" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Café" || itensreceita.ListaItens[i].Medida.Nome == "Colher de Sobremesa")
                                {
                                    contagem = 0;
                                    nome = itensreceita.ListaItens[i].Medida.Nome.ToString() + "s";
                                    for (int itChar = 0; itChar < itensreceita.ListaItens[i].Medida.Nome.Length; itChar++)
                                    {
                                        contagem++;
                                        if (contagem == 6)
                                            nome = itensreceita.ListaItens[i].Medida.Nome.Insert(6, "es ");
                                        else
                                            if (contagem > 6)
                                            break;
                                    }
                                    litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade}  {nome} de 
                                    {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                }
                                else
                                {
                                    nome = itensreceita.ListaItens[i].Medida.Nome.ToLower();
                                    if (nome != "a gosto")
                                    {
                                        nome = itensreceita.ListaItens[i].Medida.Nome.ToString() + "s";
                                        litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade}  {nome} de 
                                        {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                                    }
                                    else
                                    {
                                        litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Ingrediente.Nome} {nome}</p>";
                                    }
                                }
                            }

                        }
                        else
                        {
                            nome = itensreceita.ListaItens[i].Medida.Nome.ToLower();
                            if (nome != "a gosto")
                            {
                                litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Quantidade}  {nome} de 
                                        {itensreceita.ListaItens[i].Ingrediente.Nome}</p>";
                            }
                            else
                            {
                                litNomeIngredientes.Text += $@"<p><input type='checkbox' class='checkList'/> {itensreceita.ListaItens[i].Ingrediente.Nome} {nome}</p>";
                            }
                        }
                    }
                    #endregion

                    #region modo de preparo
                    ModosDePreparo modosdepreparo = new ModosDePreparo();
                    modosdepreparo.ExibirModoPreparo(int.Parse(CD), U);
                    litModoPreparo.Text = "";
                    for (int i = 0; i < modosdepreparo.ListaModosDePreparo.Count; i++)
                    {
                        litModoPreparo.Text += $"<div class='EtapasModoDePreparo'><div><img src='images/IconModoDePreparo.png' id='etapa'><p class='numeroIcon'/>{modosdepreparo.ListaModosDePreparo[i].Codigo}</p></div><p>{modosdepreparo.ListaModosDePreparo[i].Descricao}</p></div>";
                    }
                    #endregion

                    pnlComentarios.Visible = true;

                    #region Comentarios
                    Comentarios comentarios = new Comentarios();
                    comentarios.ListarComentarios(int.Parse(CD.ToString()), U);
                    litComentarios.Text = "";
                    for (int i = 0; i < comentarios.ListaComentarios.Count; i++)
                    {
                        litComentarios.Text += $@"<div class='imagemENomeComentario'>
                                <img class='imagemComentario' src='images/FotosPerfis/{comentarios.ListaComentarios[i].UsuarioComentario.User}.jpg'/>
                                <div class='textosComentario'>
                                    <div class='NomeEDenuncia'>
                                        <div class='NomeEData'>
                                            <h2>{comentarios.ListaComentarios[i].UsuarioComentario.NomeUsuario}</h2>
                                            <p class='dataComentario'>{comentarios.ListaComentarios[i].DataComentario}</p>
                                        </div>
                                        <a href='denunciaComentario.aspx?cd={CD}&u={U}&denunciado={comentarios.ListaComentarios[i].UsuarioComentario.User}&dt={comentarios.ListaComentarios[i].DataComentario.ToString("dd-MM-yyyy HH:mm:ss")}' class='botaoDenunciar'><img class='imagemDenunciar' src='images/denunciar.png'/></a>
                                    </div>
                                    <p>{comentarios.ListaComentarios[i].Descricao}</p>
                                </div>
                            </div>";
                    }
                    #endregion

                }
            }
        }

        protected void btnEnviarComentarios_Click(object sender, EventArgs e)
        {
            litValidacaoComentario.Text = "<p class='validacaoComentario'><p>";
            Comentario comentario = new Comentario();

            if (Session["email"] == null)
                Response.Redirect("login.aspx");

            string CD = "";
            string U = "";

            try
            {
                CD = Request["cd"].ToString();
                U = Request["u"].ToString();

                if (!String.IsNullOrEmpty(txtComentário.Text))
                {
                    comentario.CriarComentario(int.Parse(CD), U, Session["user"].ToString(), txtComentário.Text);
                }
                else
                    litValidacaoComentario.Text = "<p class='validacaoComentario'>Digite um texto!<p>";
            }
            catch
            {
                Response.Redirect("erro.aspx");
            }

            if (!String.IsNullOrEmpty(txtComentário.Text))
            {
                Response.Redirect($"receita.aspx?cd={CD}&u={U}");
            }
        }

        protected void btnDeletar_Click(object sender, EventArgs e)
        {
            Receita receita = new Receita();

            CD = Request["cd"].ToString();
            U = Request["u"].ToString();

            receita.DeletarReceita(CD, U);

            Response.Redirect($"perfil.aspx?cd={U}");
        }
    }
}