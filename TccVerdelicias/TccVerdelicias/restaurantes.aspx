<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="restaurantes.aspx.cs" Inherits="TccVerdelicias.restaurantes" %>

<!DOCTYPE html>
<html lang=pt-br>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Restaurantes</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloRestaurantes.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Basic&family=Poppins&display=swap" rel="stylesheet">
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

        <section class="secaoRestaurantes ultimaSection primeiraSection">
            <div class="areaSegura">
                <div class="conteudo">
                    <div id="alinha">
                        <div><img src="images/FotosRestaurantes/superVegetariano.jpg"></div>
                        <div>
                            <h2>Super Vegetariano! </h2>
                            <p>Aberto de segunda a sábado das 11:00 as 15:00.
                            </p>
                            <p id="alinhaEndereco"><i class="fa-solid fa-map-location-dot icon"></i>R. Primeiro de Maio, 57 - Aparecida, Santos - SP</p>
                        </div>
                    </div>

                    <div id="alinha">
                        <div><img src="images/FotosRestaurantes/capimLimao.jpg"></div>
                        <div>
                            <h2>Restaurante Capim Limão!</h2>
                            <p>Aberto de segunda a sábado das 11:30 as 15:00.
                            </p>
                            <p id="alinhaEndereco"><i class="fa-solid fa-map-location-dot icon"></i>Av. Conselheiro Nébias, 654 - Boqueirão, Santos - SP</p>
                        </div>
                    </div>

                    <div id="alinha">
                        <div><img src="images/FotosRestaurantes/masterVeggie.jpg"></div>
                        <div>
                            <h2>Master Veggier!</h2>
                            <p>Aberto as terças, quartas e quintas das 11:00 as 22:30, sexta e sábado das 11:00 as 23:00 e domingo das 11:00 as 22:00.</p>
                            <p id="alinhaEndereco"><i class="fa-solid fa-map-location-dot icon"></i>R. Machado de Assis, 48 - Boqueirão, Santos - SP</p>
                        </div>
                    </div>
                    <div id="alinha">
                        <div><img src="images/FotosRestaurantes/superVegetarianoCentro.jpg"></div>
                        <div>
                            <h2>Super Vegetariano!</h2>
                            <p>Aberto de segunda a sexta das 11:00 as 15:00.</p>
                            <p id="alinhaEndereco"><i class="fa-solid fa-map-location-dot icon"></i>R. Quinze de Novembro, 100 - Centro, Santos - SP</p>
                        </div>
                    </div>

                    <div id="alinha">
                        <div><img src="images/FotosRestaurantes/vegananda.jpg"></div>
                            <div>
                                <h2>Vegananda!</h2>
                                <p>Aberto de segunda a sexta das 10:00 as 19:00 e sábado das 10:00 as 20:00.</p>
                                <p id="alinhaEndereco"><i class="fa-solid fa-map-location-dot icon"></i>R. Quintino Bocaiúva, 09 - Gonzaga, Santos - SP</p>
                            </div>
                    </div>
                    <div id="alinha">

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
    </form>
</body>
</html>
