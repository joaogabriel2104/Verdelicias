<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gerenciamentos.aspx.cs" Inherits="TccVerdelicias.adm.gerenciamentos" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang=pt-br>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Verdelícias | Adiministrador</title>
    <link rel="stylesheet" href="../css/estilo.css">
    <link rel="stylesheet" href="../css/estiloAdm.css">
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
            <h1>Gerenciar Receitas:</h1>
            <div class="conteudosReceitas">
            <asp:Literal ID="litReceitas" runat="server"></asp:Literal>
            </div>
           
        </section>

            <section>
                <h1>Gerenciar comentários:</h1>
                <div class="conteudosComentario">
                    <div class="comentarios">
                        <asp:Literal ID="litComentarios" runat="server"></asp:Literal>
                    </div>
                </div>
            </section>

            <section class="ultimaSection">
                <h1>Gerenciar Perfis</h1>              
                <div class="denunciaPerfis">
                    <asp:Literal ID="litPerfis" runat="server"></asp:Literal>
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
    </form>
</body>
</html>
