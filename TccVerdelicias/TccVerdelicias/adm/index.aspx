<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TccVerdelicias.adm.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang=pt-br>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Login</title>
    <link rel="stylesheet" href="../css/estilo.css">
    <link rel="stylesheet" href="../css/estiloLogin.css">
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
                    <a href="index.aspx"><img src="../images/logoBranco.png" id="logoHeader"></a>
                </div>

                <nav id="navPrincipal">
                    <ul>
                        <li><a class="linkar" href="receitas.aspx">RECEITAS</a></li>
                        <li><a class="linkar" href="comentarios.aspx">COMENTÁRIOS</a></li>
                        <li><a class="linkar" href="perfis.aspx">PERFIS</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="areaSegura">
            <div id="botaoAdicionar"><a href="postar.aspx"><i class="fa-solid fa-circle-plus adicionar" style="color: #ffffff;"></i></a></div>
        </div>

        <section>
            <div id="backCinza">
                <h1>Entrar</h1>

                <div>
                    <div Class="input">
                        <p>Email:</p>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:Literal ID="litMensagemEmail" runat="server"></asp:Literal>
                    </div>
                    <div Class="input">
                        <p>Senha:</p>
                        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:Literal ID="litMensagemSenha" runat="server"></asp:Literal>
                    </div>
                </div>

                <div id="divTextoCriarCadastro">
                    <p class="alinhamentoTexto">Ainda não tem uma conta?</p>
                    <p><a href="cadastrar.aspx" class="cadastrar">Cadastre-se</a></p>
                </div>

                <div class="btnEdiv">
                    <div class="entrarECancelar">
                        <div>
                            <a href="index.aspx" class="divCancelar">
                                <div id="divIconeSeta"><i class="fa-solid fa-arrow-left" id="iconeSeta"></i></div>
                                <p id="cancelar">Cancelar</p>
                            </a>
                        </div>
                        <asp:Button CssClass="btnEntrar" ID="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" />
                    </div>
                </div>
            </div>
        </section>

        <footer>
            <div class="areaSegura">
                <div class="conteudoFooter">
                    <div class="logoESobre">
                        <div id="logoFooter">
                            <a href="index.aspx"><img src="../images/logoBranco.png" id="logoFooter2"></a>
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
