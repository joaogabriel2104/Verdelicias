<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastrar.aspx.cs" Inherits="TccVerdelicias.cadastrar" %>

<!DOCTYPE html>
<html lang=pt-br>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Cadastrar</title>
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

        <section class="primeiraSection">
            <div id="backCinza">
                <h1>Cadastrar</h1>

                <div id="alinhamentoInputs">
                    <p>Nome:</p>
                    <p id="litNome"></p>
                    <input id="txtNome" class="tamanhoInputs" type="text" />

                    <p>Nome de usuário:</p>
                    <p id="litNomeUser"></p>
                    <input id="txtCodigoUsuario" class="tamanhoInputs" type="text" />

                    <p>Email:</p>
                    <p id="litEmail"></p>
                    <input id="txtEmail" class="tamanhoInputs" type="email" />

                    <p>Confirmar Email:</p>
                    <p id="litErroEmail"></p>
                    <input id="txtEmailConfirmar" class="tamanhoInputs" type="email" />

                    <p>Telefone:</p>
                    <p id="litTelefone"></p>
                    <input id="txtTelefone" class="tamanhoInputs" type="number" />

                    <p>Senha:</p>
                    <p id="litSenha"></p>
                    <input id="txtSenha" class="tamanhoInputs" type="password" />

                    <p>Confirmar Senha:</p>
                    <p id="litErroSenha"></p>
                    <input id="txtSenhaConfirmar" class="tamanhoInputs" type="password" />

                    <p>Data de nascimento:</p>
                    <asp:Literal ID="litData" runat="server"></asp:Literal>
                    <input id="txtDataNasc" class="tamanhoInputs" type="date" />

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
                                <a href="login.aspx" class="divCancelar">
                                    <div id="divIconeSeta"><i class="fa-solid fa-arrow-left" id="iconeSeta"></i></div>
                                    <p id="cancelar">Cancelar</p>
                                </a>
                            </div>
                            <asp:Button CssClass="btnCadastrar" ID="btnCadastrar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" />
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
        <script src="js/scriptsCadastrar.js"></script>
    </form>
</body>
</html>
