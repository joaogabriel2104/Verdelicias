<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receitas.aspx.cs" Inherits="TccVerdelicias.adm.receitas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Receitas</title>
    <link rel="stylesheet" href="../css/estilo.css">
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
    </form>
</body>
</html>
