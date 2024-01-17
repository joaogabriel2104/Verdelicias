<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receita.aspx.cs" Inherits="TccVerdelicias.receita" %>

<!DOCTYPE html>
<html lang=pt-br>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width">
    <title>Verdelícias | Home</title>
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/estiloInfoReceita.css">
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
            
        <div class="areaSegura separarSections">
            <section class="sectionInfo1 primeiraSection ultimaSection">
                <h1 class="NomeReceita"><asp:Literal ID="litNomeReceita" runat="server"></asp:Literal><asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Visible="false" OnClick="btnCancelar_Click"/><asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" /></h1>
                
                <asp:Panel ID="pnlImagem" CssClass="conteudoImagem" Visible="false" runat="server">
                    <p id="vermelho"></p>
                    <p>Altere a foto da receita: </p>
                    <img src="images/iconImagem.png" class="iconeImagem">
                    <input type="file" class="InputFile" id="arquivoInput" />
                </asp:Panel>

                <div id="info1">
                    <div class="receitaEPerfil">
                        <div class="imagemReceita">
                            <asp:Panel ID="pnlCaixa" Visible="false" runat="server">
                                <div id="caixa-foto-selecionada">
			                        <span id="local-referencia"></span>
		                        </div>
                            </asp:Panel>
                            <div id="dadosEstrelasFav">
                                <div class="denuncia">
                                    <asp:ImageButton ID="btnDenunciar" ImageUrl="images/Denunciar.png" runat="server" OnClick="btnDenunciar_Click" />
                                </div>
                            </div>
                            <asp:Literal ID="litImagemReceita" runat="server"></asp:Literal>
                            <div id="dadosEstrelasFav">
                                <div class="favorito">
                                    <asp:ImageButton ID="imgFavorito" ImageUrl="images/imgFavorito.png" runat="server" OnClick="imgFavorito_Click"/>
                                </div>
                                <div class="estrelas">
                                    <i class="fas fa-star star" style="color: #ffcb0c;"></i>
                                    <p id="avaliacao"><asp:Literal ID="litAvaliacao" runat="server"></asp:Literal></p>
                                </div>
                            </div>

                            <div class="avaliacoes">
                                <div class="btnEstrela">
                                    <asp:ImageButton ID="btnStar1" class="avaliacao" ImageUrl="images/estrelaCinza.png" runat="server" OnClick="btnStar1_Click"/>
                                    <asp:ImageButton ID="btnStar2" class="avaliacao" ImageUrl="images/estrelaCinza.png" runat="server" OnClick="btnStar2_Click"/>
                                    <asp:ImageButton ID="btnStar3" class="avaliacao" ImageUrl="images/estrelaCinza.png" runat="server" OnClick="btnStar3_Click"/>
                                    <asp:ImageButton ID="btnStar4" class="avaliacao" ImageUrl="images/estrelaCinza.png" runat="server" OnClick="btnStar4_Click"/>
                                    <asp:ImageButton ID="btnStar5" class="avaliacao" ImageUrl="images/estrelaCinza.png" runat="server" OnClick="btnStar5_Click"/>
                                </div>
                            </div> 
                        </div>
            
                        <div class="dadosLateral">
                            <div class="Perfil">
                                <asp:Literal ID="litFotoPerfil" runat="server"></asp:Literal>
                                <div id="infoDadosPerfil">
                                    <h1 class="h1Perfil"><asp:Literal ID="litNomeUsuario" runat="server"></asp:Literal></h1>
                                    <asp:Literal ID="litUser" runat="server"></asp:Literal>
                                    <asp:Button ID="btnSeguir" runat="server" Text="Seguir" OnClick="btnSeguir_Click"/>
                                </div>
                            </div>     
                            <div id="infoDadosReceita">
                                <p><strong>Rendimento: </strong><asp:Literal ID="litRendimento" runat="server"></asp:Literal></p>
                                <p><strong>Tempo de preparo: </strong><asp:Literal ID="litTempoPreparo" runat="server"></asp:Literal></p>
                                <p><strong>Dietas: </strong><asp:Literal ID="litNomeDieta" runat="server"></asp:Literal></p>
                                <p><strong>Publicado: </strong><asp:Literal ID="litDataReceita" runat="server"></asp:Literal></p>
                            </div>
                       </div>
                    </div>

                    <section id="sectionIngredientes">
                        <h1 class="tituloIngredientes">Ingredientes</h1>
                        <div>
                            <asp:Literal ID="litNomeIngredientes" runat="server"></asp:Literal>
                        </div>
                    </section>

                    <section id="sectionModoPreparo">
                        <h1>Modo de preparo</h1>
                        <div class="conteudoModoPreparo"> 
                            <asp:Literal ID="litModoPreparo" runat="server"></asp:Literal>

                            <div class="botaoSalvar">
                                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Visible="false"/>
                                <asp:Button ID="btnDeletar" runat="server" Text="Deletar" Visible="false" OnClick="btnDeletar_Click"/>
                            </div>
                        </div>
                    </section>
                </div>

                <asp:Panel ID="pnlComentarios" class="comentarios" runat="server">
                    <div class="tituloELinha">
                        <h1>Comentários</h1>
                        <div class="linhaComentario"></div>
                    </div>  
                    <asp:TextBox ID="txtComentário" Placeholder="Escreva seu comentário..." TextMode="MultiLine" runat="server" CssClass="txtComentario"></asp:TextBox>
                    <div class="botaoEValidacao">
                        <asp:Literal ID="litValidacaoComentario" runat="server"></asp:Literal>
                        <asp:Button ID="btnEnviarComentarios" CssClass="botaoEnviarComentario" runat="server" Text="Enviar" OnClick="btnEnviarComentarios_Click" />
                    </div>
                    <div>
                        <asp:Literal ID="litComentarios" runat="server"></asp:Literal>
                    </div>
                </asp:Panel>
            </section>


            <section class="sectionOutrasReceitas ultimaSection primeiraSection">
                <h1>Receitas Similares:</h1>
                <div class="conteudosReceitas">
                    <asp:Literal ID="litOutrasReceitas" runat="server"></asp:Literal>
                </div>
            </section>
        </div>

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
        <script src="js/scriptsReceita.js"></script>
    </form>
</body>
</html>