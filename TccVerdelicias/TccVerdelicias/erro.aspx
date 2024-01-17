﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="erro.aspx.cs" Inherits="TccVerdelicias.erro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Home</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloErro.css">
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
            <div class="conteudo">
                <img src="images/imagemPgErro.png" id="imgErro" />
                <h1 class="escritaErro">Ops! Não encontramos essa página</h1>
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
    </form>
</body>
</html>
