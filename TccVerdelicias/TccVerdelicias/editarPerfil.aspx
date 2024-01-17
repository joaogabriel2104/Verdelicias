<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editarPerfil.aspx.cs" Inherits="TccVerdelicias.editarPerfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Editar Perfil</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloCadastrar.css">
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
                        <asp:ImageButton ID="ImgSairMobile" CssClass="ImgSair" runat="server" ImageUrl="images/imgSair.png" OnClick="ImgSair_Click" />
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
                        <asp:ImageButton ID="ImgSair" CssClass="ImgSair" runat="server" ImageUrl="images/imgSair.png" OnClick="ImgSair_Click" />
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

        <section class="primeiraSection primeiraSection">
            <div id="backCinza">
                <h1>Editar Perfil</h1>

                <div id="alinhamentoInputs">
                    <p>Nome:</p>
                    <p id="litNome"></p>
                    <asp:TextBox ID="txtNome" CssClass="tamanhoInputs" runat="server"></asp:TextBox>

                    <p>Nome de usuário:</p>
                    <p id="litNomeUser"></p>
                    <asp:TextBox ID="txtCodigoUsuario" CssClass="tamanhoInputs" runat="server"></asp:TextBox>

                    <p>Email:</p>
                    <p id="litEmail"></p>
                    <asp:TextBox ID="txtEmail" CssClass="tamanhoInputs" type="email" runat="server"></asp:TextBox>

                    <p>Confirmar Email:</p>
                    <asp:Literal ID="litErroEmail" runat="server"></asp:Literal>
                    <asp:TextBox ID="txtEmailConfirmar" CssClass="tamanhoInputs" type="email" runat="server"></asp:TextBox>

                    <p>Telefone:</p>
                    <p id="litTelefone"></p>
                    <asp:TextBox ID="txtTelefone" CssClass="tamanhoInputs" type="number" runat="server"></asp:TextBox>

                    <%--<p>Senha:</p>
                    <p id="litSenha"></p>--%>
                    <asp:TextBox ID="txtSenha" CssClass="tamanhoInputs" type="password" runat="server"></asp:TextBox>

                    <%--<p>Confirmar Senha:</p>
                    <asp:Literal ID="litErroSenha" runat="server"></asp:Literal>--%>
                    <asp:TextBox ID="txtSenhaConfirmar" CssClass="tamanhoInputs" type="password" runat="server"></asp:TextBox>

                    <p>Data de nascimento:</p>
                    <asp:Literal ID="litData" runat="server"></asp:Literal>
                    <asp:TextBox ID="txtDataNasc" CssClass="tamanhoInputs" type="date" runat="server"></asp:TextBox>

                    <p>Foto de perfil (opcional):</p>
                    <input id="InserirImagem" class="inputImg" type="file" />

                    <div id="caixa-foto-selecionada">
			            <span id="local-referencia"></span>
		            </div>

                    <p id="tipoDieta">Tipo da dieta:</p>
                    <asp:Literal ID="litDietasChk" runat="server"></asp:Literal>

                    <div class="btnEdiv">
                        <div class="entrarECancelar">
                            <div>
                                <a href="perfil.aspx" class="divCancelar">
                                    <div id="divIconeSeta"><i class="fa-solid fa-arrow-left" id="iconeSeta"></i></div>
                                    <p id="cancelar">Cancelar</p>
                                </a>
                            </div>
                            <asp:Button CssClass="btnAtualizar" ID="btnAtualizar" runat="server" Text="Salvar" OnClick="btnAtualizar_Click" />
                        </div>
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
                            <p><a href="erro.aspx">Sobre nós</a></p>
                            <p><a href="erro.aspx">Privacidade</a></p>
                            <p><a href="erro.aspx">Termos de uso</a></p>
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
        <script src="js/scriptsEditarPerfil.js"></script>
    </form>
</body>
</html>
