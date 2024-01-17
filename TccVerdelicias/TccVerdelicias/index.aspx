<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TccVerdelicias.index" %>

<!DOCTYPE html>
<html lang=pt-br>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Home</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloIndex.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Basic&family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a987110fe2.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="areaSegura">
                <div id="logoHead">
                    <a href="index.aspx"><img src="images/logoBranco.png" id="logoHeader"></a>
                    <div class="mobile perfilESair">
                        <asp:Literal ID="imgUserMobile" runat="server"></asp:Literal>
                        <asp:ImageButton ID="ImgSairMobile" CssClass="ImgSair" runat="server" ImageUrl="images/imgSair.png" OnClick="imgSair_Click" />
                    </div>
                </div>

                <nav id="navPrincipal">
                    <ul>
                        <li style="padding-left: 0;"><a class="linkar" href="receitas.aspx">RECEITAS</a></li>
                        <li><a class="linkar" href="restaurantes.aspx">RESTAURANTES</a></li>
                        <li style="padding-right: 0"><a class="linkar" href="saude.aspx">SAÚDE</a></li>
                    </ul>
                </nav>

                <div id="procurarPerfil">
                    <div class="Procurar">
                        <asp:TextBox ID="txtProcurar" CssClass="inputProcurar" name="Procurar" placeholder="Procurar" runat="server" ></asp:TextBox>
                    </div>
                    <asp:ImageButton ID="btnPesquisar" CssClass="imgLupa" runat="server" ImageUrl="images/lupa.png" OnClick="btnPesquisar_Click" />   
                    <div class="normal perfilESair">
                        <asp:Literal ID="imgUser" runat="server"></asp:Literal>
                        <asp:ImageButton ID="ImgSair" CssClass="ImgSair" runat="server" ImageUrl="images/imgSair.png" OnClick="imgSair_Click" />
                    </div>  
                </div>
            </div>
        </header>

        <div class="areaSegura">
            <div id="botaoAdicionar"><a href="postar.aspx"><img src="images/botaoAdicionar.png" class="fa-solid fa-circle-plus adicionar"></img></a></div>
        </div>

        <nav id="navDietas">
            <div class="areaSeguraNav">
                <ul>
                    <asp:Literal ID="litDietas" runat="server"></asp:Literal>
                </ul>
            </div>
        </nav>

        <section class="primeiraSection">
            <div class="areaSegura">
                <h1>Receitas melhores avaliadas:</h1>
                <div class="conteudosReceitas">
                    <asp:Literal ID="litReceitasMelhoresAvaliadas" runat="server"></asp:Literal>
                </div>
            </div>
        </section>

        <section id="secaoConteudos2">
            <div class="areaSegura divRanking">
                <div class="conteudos2">
                    <div id="ranking">
                        <h1>Ranking do mês</h1>
                        <div id="rankingPodio">
                            <div id="segundoLugar">
                                <div class="quadradoImagem">
                                    <asp:Literal ID="litFotoSegundoLugarRanking" runat="server"></asp:Literal>
                                </div>
                                
                                <div class="nomeUsuarioVencedor">
                                    <p><asp:Literal ID="litNomeSegundoLugarRanking" runat="server"></asp:Literal></p>
                                </div>

                                <div class="avaliacaoRanking">
                                    <div class="estrelas"><i class="fas fa-star star" style="color: #ffcb0c;"></i>
                                        <p id="avaliacao">
                                            <asp:Literal ID="litAvaliacaoSegundoLugarRanking" runat="server"></asp:Literal></p>
                                    </div>
                                </div>
                                <div class="NumeroAvaliacaoRanking">
                                    <p>
                                        <asp:Literal ID="litNumeroAvaliacoesSegundoLugarRanking" runat="server"></asp:Literal>
                                    </p>
                                </div>
                            </div>

                            <div id="primeiroLugar">
                                <div class="quadradoImagem">
                                    <asp:Literal ID="litFotoPrimeiroLugarRanking" runat="server"></asp:Literal>
                                    
                                </div>

                                <div class="nomeUsuarioVencedor">
                                    <p>
                                        <asp:Literal ID="litNomePrimeiroLugarRanking" runat="server"></asp:Literal></p>
                                </div>

                                <div class="avaliacaoRanking">
                                    <div class="estrelas"><i class="fas fa-star star" style="color: #ffcb0c;"></i>
                                        <p id="avaliacao">
                                            <asp:Literal ID="litAvaliacaoPrimeiroLugarRanking" runat="server"></asp:Literal></p>
                                    </div>
                                </div>
                                <div class="NumeroAvaliacaoRanking">
                                    <p>
                                        <asp:Literal ID="litNumeroAvaliacoesPrimeiroLugarRanking" runat="server"></asp:Literal>
                                    </p>
                                </div>
                            </div>

                            <div id="terceiroLugar">
                                <div class="quadradoImagem">
                                    <asp:Literal ID="litFotoTerceiroLugarRanking" runat="server"></asp:Literal>
                                </div>

                                <div class="nomeUsuarioVencedor">
                                    <p>
                                        <asp:Literal ID="litNomeTerceiroLugarRanking" runat="server"></asp:Literal>
                                    </p>
                                </div>

                                <div class="avaliacaoRanking">
                                    <div class="estrelas"><i class="fas fa-star star" style="color: #ffcb0c;"></i>
                                        <p id="avaliacao">
                                            <asp:Literal ID="litAvaliacaoTerceiroLugarRanking" runat="server"></asp:Literal>
                                        </p>
                                    </div>
                                </div>

                                <div class="NumeroAvaliacaoRanking">
                                    <p>
                                        <asp:Literal ID="litNumeroAvaliacoesTerceiroLugarRanking" runat="server"></asp:Literal>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="TextoRanking">
                        <div><p>Você adora cozinhar deliciosas refeições veganas?
                            Quer ver suas criações em destaque?
                            Então, junte-se a nós no nosso <p id="textoColorido">Ranking Mensal do Verdelícias!</p>
                            </p>
                            </br>
                            <p>Compartilhe suas receitas incríveis e participe da competição amigável por reconhecimento.
                            Vamos celebrar a culinária e inspirar uns aos outros com pratos inovadores.
                            É hora de mostrar seu talento na cozinha e fazer parte da nossa comunidade.
                            Poste sua receita hoje e entre na disputa pelo primeiro lugar!</p></div>
                    </div>
                </div>
            </div>
        </section>

        <asp:Literal ID="litReceitasSeguindo" runat="server"></asp:Literal>

        <asp:Literal ID="litReceitasDieta" runat="server"></asp:Literal>

        <section class="ultimaSection">
            <div class="areaSegura">
                <h1>Receitas mais recentes:</h1>
                <div class="conteudosReceitas">
                    <asp:Literal ID="litReceitasMaisRecentes" runat="server"></asp:Literal>
                </div>
            </div>
        </section>

        <footer>
            <div class="areaSegura">
                <div class="conteudoFooter">
                    <div class="logoESobre">
                        <div id="logoFooter">
                            <a href="index.aspx"><img src="images/logoBranco.png" id="logoFooter2"></a>
                        </div>
                        <div class="Sobre">
                            <p><a href="sobre.aspx">Sobre nós</a></p>
                            <p><a href="sobre.aspx">Privacidade</a></p>
                            <p><a href="sobre.aspx">Termos de uso</a></p>
                        </div>
                    </div>
                    <div class="iconsFooter">
                        <i class="fa-brands fa-facebook" style="color: #ffffff;" id="imgFacebook"></i>
                        <i class="fa-brands fa-instagram" style="color: #ffffff;" id="imgInstagram"></i>
                        <i class="fa-solid fa-envelope" style="color: #ffffff;" id="imgGmail"></i>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                function exibirAviso() {
                    var aviso = "Crie uma nova receita!";
                    $('<div class="aviso">' + aviso + '</div>').insertAfter('#botaoAdicionar');
                }

                var avisoExibido = sessionStorage.getItem("avisoExibido");
                if (!avisoExibido) {
                exibirAviso();
                    sessionStorage.setItem("avisoExibido", "true");
                }
            });
        </script>

    </form>
</body>
</html>
