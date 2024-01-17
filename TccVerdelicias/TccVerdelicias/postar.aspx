<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="postar.aspx.cs" Inherits="TccVerdelicias.postar" %>

<!DOCTYPE html>
<html lang=pt-br>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <meta charset="utf-8">
    <title>Verdelícias | Postar Receita</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloPostar.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.css" integrity="sha512-C4k/QrN4udgZnXStNFS5osxdhVECWyhMsK1pnlk+LkC7yJGCqoYxW4mH3/ZXLweODyzolwdWSqmmadudSHMRLA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

        <nav id="navDietas">
            <div class="areaSeguraNav">
                <ul>
                    <asp:Literal ID="litDietas" runat="server"></asp:Literal>
                </ul>
            </div>
        </nav>

        <section class="ultimaSection primeiraSection">
            <div class="conteudos">
                <h1>Descreva a receita que deseja publicar</h1>
                <p id="vermelho"></p>
                <div>
                   <h2>Dieta da receita:</h2>
                   <select class="txtListaDietas"><asp:Literal ID="litDietasChk" runat="server"></asp:Literal></select>
                </div>
                <div class="ajuste PorcoesETempo">
                    <div class="NomeReceita">
                        <h2>Nome da Receita:</h2>
                        <asp:TextBox ID="txtNomeReceita" CssClass="inputNomeReceita" runat="server"></asp:TextBox>
                    </div>
                    <div class="porcoes">
                        <h2>Porções:</h2>
                        <p>
                            <asp:TextBox ID="TextBox1" class="porcoesInput" min="1" type="number" runat="server"></asp:TextBox>
                        </p>
                    </div> 
               
                    <div class="tempoPreparo">
                        <h2>Tempo de preparo:</h2>
                        <p>
                            <asp:TextBox ID="TextBox2" type="number" min="1" class="preparadoInput" runat="server"></asp:TextBox> min
                        </p>
                    </div>
                </div>

                <div class="ajuste">
                    <h2>Ingredientes:</h2>
                    <div class="backCinza">
                        <div class="inputsIngredientes">
                            <div class="divIngredientes">
                                <div class="inputQtdIngredientes">
                                    <p>Quantidade</p>
                                    <div class="divQtdJS"></div>
                                    <input type="text" class="qtdInput">
                                </div>
                                <div class='inputMedidasIngredientes'>
                                    <p>Unidade</p>
                                    <div class="divUnidadeJS"></div>
                                    <asp:DropDownList ID='cmbMedidas' CssClass="cmbMedidas" runat='server'></asp:DropDownList>
                                </div>
                                <div class="inputNomeIngredientes">
                                    <p>Nome</p>
                                    <div class="divNomeJS"></div>
                                    <input type="text" class="nomeInput">
                                </div>
                                <div class="iconeAdicionar">
                                    <img src="images/iconAdicionar.png" class="iconeAdicionar" id="btnAdicionar">
                                </div>
                            </div>
                            </div>
                    </div>
                </div>

                <div class="ajuste">
                    <h2>Modo de Preparo:</h2>
                    <div class="backCinza">
                        <div class="conteudoModoPreparo">
                            <div class="divModoPreparoJS"></div>
                            <div class="divModoPreparo">
                                <p class="textoQuantidade" id="textoQtd">1.</p>
                                <textarea class="etapaPreparo" ID="txtModoDePreparo"></textarea>
                                <img src="images/iconAdicionar.png" class="iconeAdicionar" id="btnAdicionarModoPreparo">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ajuste">
                    <p>Fotos da Receita:</p>
                    <div class="conteudoImagem">
                        <img src="images/iconImagem.png" class="iconeImagem">

                        <input type="file" class="InputFile" id="arquivoInput" />
                    </div>

                    <div id="caixa-foto-selecionada">
			            <span id="local-referencia"></span>
		            </div>
                </div>

                <div class="dietasEEnviar ajuste">
                    <asp:Button ID="btnPostarReceita" runat="server" Text="Enviar" onClick="btnPostarReceita_Click"/>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.js" integrity="sha512-6lplKUSl86rUVprDIjiW8DuOniNX8UDoRATqZSds/7t6zCQZfaCe3e5zcGaQwxa8Kpn5RTM9Fvl3X2lLV4grPQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/scripts.js"></script>
    </form>
</body>
</html>
