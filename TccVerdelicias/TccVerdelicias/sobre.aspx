<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sobre.aspx.cs" Inherits="TccVerdelicias.sobrenos" %>

<!DOCTYPE html>
<html lang=pt-br>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Home</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloSobre.css">
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
            <div class="areaSegura">
                <div class="conteudo">
                    <div id="infoDetalhesFoto">
                        <div class="fotoSobreNos">
                            <img src="images/logoVerde.png" />
                        </div>
                    </div>

                    <div id="infoDadosSobreNosFoto">
                        <p><h1>Bem-vindo ao nosso universo verde,</h1>onde a inovação se entrelaça com a compaixão! Somos um grupo dedicado de estudantes apaixonados que decidiram abraçar o desafio de criar um portal online para todos aqueles que desejam explorar o delicioso e nutritivo universo da culinária vegana e vegetariana.</p>
                    </div>
                </div>

                <div>
                    <div id="infoDadosSobreNos">
                        <p>Nosso trabalho de conclusão de curso concentra-se na criação de um site abrangente e amigável, projetado especialmente para quem está dando os primeiros passos no estilo de vida vegano ou vegetariano. Com uma abordagem educacional e inspiradora, nosso site visa desmitificar o mundo da alimentação baseada em plantas, oferecendo informações valiosas e receitas irresistíveis.</p>
                    </div>
                    <div id="infoDadosSobreNos">
                        <p><h1>Receitas Deliciosas e Acessíveis:</h1>Nossa coleção de receitas é pensada para atender a todos os níveis de habilidade na cozinha. Desde pratos simples e rápidos para iniciantes até criações mais complexas para os entusiastas culinários, queremos mostrar que a comida vegana/vegetariana pode ser deliciosa, variada e fácil de preparar.</p>
                    </div>
                    <div id="infoDadosSobreNos">
                        <p><h1>Dicas para Iniciantes:</h1>Compreender a transição para uma dieta baseada em plantas pode ser desafiador. Por isso, oferecemos guias práticos que abordam desde como fazer escolhas sustentáveis no supermercado até o planejamento de refeições equilibradas. Queremos tornar a jornada para um estilo de vida vegano/vegetariano mais fácil e acessível.</p>
                    </div>
                </div>
                    
                <div>
                    <div id="infoDadosSobreNos">
                        <h1>Junte-se a Nós!</h1><p>Explore, descubra e celebre a diversidade de sabores que o mundo vegano/vegetariano tem a oferecer. Esteja conosco nessa jornada de descobertas e transformações, pois acreditamos que cada escolha conta na construção de um futuro mais saudável e sustentável para todos.
                            <br/>Além desses recursos, incentivamos a interação e participação da comunidade. Aceitamos contribuições de receitas, experiências pessoais e dicas úteis. Acreditamos que a partilha de conhecimento fortalece a comunidade e torna a jornada vegana/vegetariana mais inclusiva e agradável para todos.
                        <br/>Estamos animados para oferecer um espaço online que vai além das receitas básicas, criando uma experiência completa que apoia, educa e inspira aqueles que estão curiosos sobre o estilo de vida vegano/vegetariano.</p>
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
