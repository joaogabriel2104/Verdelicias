<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="TccVerdelicias.perfil" %>

<!DOCTYPE html>
<html lang=pt-br>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Perfil</title>
    <link rel="stylesheet" href="css/estiloPerfil.css">
    <link rel="stylesheet" href="css/estilo.css">
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

        <section class="ultimaSection primeiraSection">
            <div id="backCinza">
                <div class="conteudo">

                    <div class="FotoEInfos">
                        <div class="fotoPerfil">
                            <asp:Literal ID="litImgPerfil" runat="server"></asp:Literal>
                        </div>

                        <div id="infoDadosPerfil">
                            <h1><asp:Literal ID="litNome" runat="server"></asp:Literal></h1>
                            <p>@<asp:Literal ID="litUser" runat="server"></asp:Literal></p>
                            <p>ingressou em <asp:Literal ID="litdtCriacao" runat="server"></asp:Literal></p>
                             <h1><asp:Literal ID="litSeguindo" runat="server"></asp:Literal> seguindo - <asp:Literal ID="litSeguidores" runat="server"></asp:Literal></h1>
                        </div>
                    </div>

                    <div class="botoes">
                        <asp:Button ID="btnEditar" CssClass="btnSeguindo" runat="server" Visible="false" Text="Editar Perfil" OnClick="btnEditar_Click" />
                        <asp:Button ID="btnSeguir" CssClass="btnSeguindo" runat="server" Text="Seguir" OnClick="btnSeguir_Click"/>
                        <asp:ImageButton ID="btnDenunciar" CssClass="btnDenunciar" ImageUrl="images/Denunciar.png" runat="server" OnClick="btnDenunciar_Click" />
                    </div>
                </div>

                <h1 class="tituloReceitasPerfil"><asp:Button ID="btnReceitas" runat="server" Text="Receitas" OnClick="btnReceitas_Click" /> | <asp:Button ID="btnSalvos" runat="server" Text="Salvos" OnClick="btnSalvos_Click"/></h1>
                <div class="conteudosAlinhamento">
                    <div class="conteudos">
                        <asp:Literal ID="litReceitas" runat="server"></asp:Literal>
                    </div>
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
