<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="saude.aspx.cs" Inherits="TccVerdelicias.saude" %>

<!DOCTYPE html>
<html lang=pt-br>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Receitas</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloSaude.css">
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

        <section class="primeiraSection">
            <div class="backCinza">
                <div class="conteudo">
                    <h1>Cuidados, Dicas e Alertas:</h1>
                    <p id="conteudoEscrito"> 
                    Se você está pensando em adotar uma dieta vegetariana ou já está nessa jornada, é importante ter alguns cuidados para garantir que sua saúde esteja sempre em dia. Aqui estão algumas dicas de forma mais descontraída:
                    </p>
                    <p>A diversidade na alimentação é fundamental. Inclua uma variedade de alimentos como vegetais, frutas, grãos integrais, leguminosas, nozes e sementes. Quanto mais colorido o prato, melhor!</p>
                    <p>Às vezes, pode ser necessário complementar a dieta com vitaminas, especialmente a B12. Consultar um profissional pode ajudar a determinar as melhores opções de suplementos.</p>
                    <p>Proteínas são importantes, e não faltam opções vegetarianas. Lentilhas, tofu, quinoa - há muitas escolhas gostosas por aí.</p>
                    <p>Mantenha o equilíbrio nas calorias, considerando suas necessidades específicas e o nível de atividade física.</p>
                    <p>Produtos vegetarianos industrializados são práticos, mas vale a pena dar uma olhada nos rótulos para garantir que atendem às suas necessidades nutricionais.</p>
                    <p>Quando em dúvida, consulte um profissional. Nutricionistas ou médicos podem oferecer orientações personalizadas para garantir que você esteja no caminho certo.</p>
                    <p>Em resumo, ser vegetariano é bacana, mas a chave está em manter o equilíbrio e se informar. Comer bem não precisa ser complicado, é só uma questão de cuidar de você!</p>
                </div>
            </div>
        </section>

        <section class="ultimaSection">
            <div class="areaSegura">
                <div class="conteudo2">
                    <div>
                        <a href="https://nutricionistareakimoto.com.br/" id="imagem"><img src="images/fotosSaude/RenataNutricionista.jpg"></a>
                        <h2>Renata Akimoto</h2>
                        <p>Desde 2016, acompanho a jornada de pessoas e famílias vegetarianas/veganas com diferentes necessidades. Atualmente sigo me dedicando ao atendimento clínico para pessoas e famílias, que buscam alcançar seus objetivos através de uma relação saudável e prazerosa com a comida e com seus corpos.
                        </p>
                        <p id="alinharNutri"> <i class="fa-solid fa-suitcase-medical"></i>Nutricionista</p>
                    </div>
                    <div>
                        <a href="https://nutriamadeu.com.br/" id="imagem"><img src="images/fotosSaude/ClaudiaNutricionista.jpg" ></a>
                        <h2>Claudia Amadeu</h2>
                        <p>Atendo todas as pessoas que desejam aprender a se alimentar de forma saudável, desde onívoros à veganos. Acredito em uma alimentação individualizada, prazerosa, consciente, sem terrorismo e sem necessidade de dietas restritivas. Trabalho sempre buscando a qualidade alimentar, respeitando a individualidade e as preferências de cada paciente.
                        </p>
                        <p id="alinharNutri"> <i class="fa-solid fa-suitcase-medical"></i>Nutricionista</p>
                    </div>
                    <div>
                        <a href="https://nutriamadeu.com.br/" id="imagem"><img src="images/FotosSaude/AleatorioNutricionista.jpg" ></a>
                        <h2>Florence</h2>
                        <p>
                            Nutricionista falsa, apenas para ilustração.
                        </p>
                        <p id="alinharNutri"> <i class="fa-solid fa-suitcase-medical"></i>Nutricionista</p>
                    </div>
                    <div>
                        <a href="https://dietbox.me/pt-BR/jessicaschusternutri" id="imagem"><img src="images/FotosSaude/JessicaNutricionista.jpg" ></a>
                        <h2>Jéssica Schuster</h2>
                        <p>
                            Eu sou especialista em nutrição vegetariana e estou fazendo uma pós graduação em nutrição clínica e estética. Minha ênfase é alimentação natural e funcional. Possuo formação complementar em emagrecimento, estética, nutrição esportiva e nutrição materno infantil. Sigo em constante atualização nessas áreas.
                        </p>
                        <p id="alinharNutri"> <i class="fa-solid fa-suitcase-medical"></i>Nutricionista</p>
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
