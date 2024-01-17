/* Tipo Usuario*/
Insert Into tipo_usuario values (1, 'Usuário');
Insert Into tipo_usuario values (2, 'Administrador');
 

/*Usuario*/
Insert Into usuario values ('sabiabia29', 'biazinha@yahoo.com', 13981271650, 'Biazinha^^', '2005-08-29', md5('123'), 1, '2023-07-31', true);
Insert Into usuario values ('vivibiba15', 'vivi@outlook.com', 13991512866, 't0ri25', '2006-01-15', md5('123'), 2, '2023-07-31', false);
Insert Into usuario values ('jojofafa21', 'jojo@gmail.com', 13991869264, 'joao.', '2005-04-21', md5('123'), 2, '2023-07-31', false);
Insert Into usuario values ('pandinha15', 'pandinha@hotmail.com', 13988010524, 'filipipandinha', '2005-12-15', md5('123'), 1, '2023-07-31', true);
Insert Into usuario values ('fabinhopiccoli11', 'piccoli@gmail.com', 13997426811, 'manopico', '2005-05-11', md5('123'), 1, '2023-07-31', true);
Insert Into usuario values ('beaevangelica04', 'evangelista@yahoo.com', 13988445206, 'cantinhoverde', '2005-09-04', md5('123'), 2, '2023-07-31', false);

 
/*Receita*/
-- João 
Insert Into receita values (1, 'jojofafa21', 'Hambúrguer com carne de soja', 40, 16, Current_Date(), false);
Insert Into receita values (2, 'jojofafa21', 'Sorvete Caseiro Vegano', 10, 1, '2023-09-09 15:28:21', false);
Insert Into receita values (3, 'jojofafa21', 'Pão Vegano com Aveia', 45, 2, '2023-11-08 15:28:20', false);
Insert Into receita values (4, 'jojofafa21', 'Queijo vegano', 20, 1, '2023-11-11 11:28:21', false);
Insert Into receita values (5, 'jojofafa21', 'Bolo de laranja com alecrim vegano', 45, 10, '2023-11-20 10:28:21', false);
Insert Into receita values (6, 'jojofafa21', 'Risotos do frutos do mar', 30, 1, '2023-03-01', false);

-- Vitória 
Insert Into receita values (1, 'vivibiba15', 'Bolo de cenoura vegano', 50, 30, '2023-11-05 12:56:21', false);
Insert Into receita values (2, 'vivibiba15', 'Guisado de grão-de-bico e tomate', 25, 1, '2023-11-23 17:06:08', true);
Insert Into receita values (3, 'vivibiba15', 'French toast vegana', 30, 1, '2023-11-22 11:06:08', true);
Insert Into receita values (4, 'vivibiba15', 'Pão ciabatta', 60, 4, '2023-11-20 17:06:08', true);
Insert Into receita values (5, 'vivibiba15', 'Panqueca de cacau vegana', 10, 1, '2023-11-21 17:06:08', true);
Insert Into receita values (6, 'vivibiba15', 'Salmão assado com alecrim e alcaparras', 40, 3, '2023-11-08', false);

-- Bea
Insert Into receita values (1, 'beaevangelica04', 'Maionese Vegana', 10, 6, '2023-11-13 13:45:58', false);
Insert Into receita values (2, 'beaevangelica04', 'Rolinho Vietnamita', 15, 4, '2023-1-08 11:12:10', true);
Insert Into receita values (3, 'beaevangelica04', 'Smoothie de banana e frutas vermelhas', 5, 4, '2023-11-12 11:12:10', true);
Insert Into receita values (4, 'beaevangelica04', 'Granola caseira', 60, 1, Current_Date(), true);
Insert Into receita values (5, 'beaevangelica04', 'Leite de coco', 15, 1, '2023-11-08 19:19:10', true);
Insert Into receita values (6, 'beaevangelica04', 'Filé de peixe cozido com legumes', 40, 1, '2023-10-12', false);

-- Fabio
Insert Into receita values (1, 'fabinhopiccoli11', 'Nhoque de mandioquinha recheado com gorgonzola na manteiga de ervas', 60, 20, '2023-08-28 14:41:34', false);
Insert Into receita values (2, 'fabinhopiccoli11', 'Pão de Queijo Vegano', 30, 25, '2023-11-09 23:00:23', false);
Insert Into receita values (3, 'fabinhopiccoli11', 'Torradinha', 20, 15, Current_Date(), false);
Insert Into receita values (4, 'fabinhopiccoli11', 'Chocolate quente vegano', 15, 2, '2023-11-11 13:10:23', false);
Insert Into receita values (5, 'fabinhopiccoli11', 'Muffin de limão vegano', 35, 9, '2023-11-09 23:21:23', false);

-- Filipi
Insert Into receita values (1, 'pandinha15', 'Mini Suflês ou Omeletes de Forno', 20, 2, '2023-08-29 14:47:23', true);
Insert Into receita values (2, 'pandinha15', 'Torrada de Abacate com Ovo Mexido', 15, 2, Current_Date(), false);
Insert Into receita values (3, 'pandinha15', 'Rabanada vegana', 10, 12, '2023-11-11', false);
Insert Into receita values (4, 'pandinha15', 'Mingau de aveia com melado', 25, 1, '2023-11-12', false);
Insert Into receita values (5, 'pandinha15', 'Mingau de aveia e quinoa', 25, 1, '2023-10-28', false);


-- Biazinha
Insert Into receita values (1, 'sabiabia29', 'Lasanha com Brócolis e Mussarela', 60, 1, '2023-11-30 14:50:30', true);
Insert Into receita values (2, 'sabiabia29', 'Pão de Azeitona com Ricota', 120, 1, Current_Date(), true);
Insert Into receita values (3, 'sabiabia29', 'Moqueca de palmito pupunha', 30, 6, Current_Date(), true);
Insert Into receita values (4, 'sabiabia29', 'Risoto vegano', 40, 2, '2020-09-12 15:00:21', true);
Insert Into receita values (5, 'sabiabia29', 'Torta de liquidificador vegana fácil', 60, 5, '2023-04-12 09:18:07', true);



/*Modo de Preparo*/

	-- Joao
-- Hambúrguer Artesanal 
Insert Into modo_de_preparo values (1, 'jojofafa21', 1, 'Deixar a PTS de molho em água morna por 10 minutos. Depois, espremer para retirar a água e reservar.');
Insert Into modo_de_preparo values (1, 'jojofafa21', 2, 'Em uma panela aquecer o óleo ou azeite e refogar o alho e a cebola. Juntar o tomate,cebolinha, salsinha e orégano e refogar.');
Insert Into modo_de_preparo values (1, 'jojofafa21', 3, 'Acrescentar a PTS, molho de soja e 1/2 xícara de água. Após isso, deixar ferver até secar a água e colocar em uma vasilha e deixar esfriar');
Insert Into modo_de_preparo values (1, 'jojofafa21', 4, 'Acrescentar o ovo batido e por último a farinha de trigo até o ponto.');
Insert Into modo_de_preparo values (1, 'jojofafa21', 5, 'Pegar porções, fazer uma bola e achatar e em seguida assar ou fritar.');

-- Sorvete Caseiro Vegano
Insert Into modo_de_preparo values (2, 'jojofafa21', 1, 'Congele as bananas por 8 horas antes de preparar a receita.');
Insert Into modo_de_preparo values (2, 'jojofafa21', 2, 'Deixe as bananas fora do congelador por um a dois minutos e enquanto isso, processe 50 gramas de amendoim no processador. ');
Insert Into modo_de_preparo values (2, 'jojofafa21', 3, 'Adicione as bananas e o resto do amendoim e processe por mais 30 segundos ou mais, até transformar em sorvete.');
Insert Into modo_de_preparo values (2, 'jojofafa21', 4, 'Enquanto processa, adicione uma colher de sopa de canela em pó, mais ou menos de acordo com seu gosto por canela.');
Insert Into modo_de_preparo values (2, 'jojofafa21', 5, 'Decore com pedacinhos de amendoim moído e sirva imediatamente.');

-- Pão vegano com aveia
Insert Into modo_de_preparo values (3, 'jojofafa21', 1, 'Em uma vasilha, coloque a água, fermento, açúcar e chia e misture por 1 minuto.');
Insert Into modo_de_preparo values (3, 'jojofafa21', 2, 'Adicione a farinha de linhaça, sal, óleo, farinha de aveia e farinha de trigo e sove por 10 minutos.');
Insert Into modo_de_preparo values (3, 'jojofafa21', 3, 'Cubra a massa e deixe descansar por cerca de 1 hora dentro do forno desligado.');
Insert Into modo_de_preparo values (3, 'jojofafa21', 4, 'Retire a massa do recipiente e divida em 2 porções.');
Insert Into modo_de_preparo values (3, 'jojofafa21', 5, 'Novamente, retorne ao repouso coberto por mais 1 hora.');
Insert Into modo_de_preparo values (3, 'jojofafa21', 6, 'Asse os pães em forno a temperatura média por cerca de 20 minutos ou até dourar a superfície.');
Insert Into modo_de_preparo values (3, 'jojofafa21', 7, 'Agora é só servir! Bom apetite.');

-- Queijo vegano
Insert Into modo_de_preparo values (4, 'jojofafa21', 1, 'Reúna todos os ingredientes;');
Insert Into modo_de_preparo values (4, 'jojofafa21', 2, 'Coloque as castanhas de molho em água quente por 15 minutos, escorra e reserve;');
Insert Into modo_de_preparo values (4, 'jojofafa21', 3, 'No liquidificador, coloque a água, as castanhas, o sal, os polvilhos, levedura nutricional e o óleo. Bata bem;');
Insert Into modo_de_preparo values (4, 'jojofafa21', 4, 'Despeje a mistura em uma panela e deixe cozinhar, misturando sempre até engrossar;');
Insert Into modo_de_preparo values (4, 'jojofafa21', 5, 'Coloque a mistura em um pote untado e leve para gelar;');
Insert Into modo_de_preparo values (4, 'jojofafa21', 6, 'Sirva e bom apetite!');

-- Bolo de laranja com alecrim vegano
Insert Into modo_de_preparo values (5, 'jojofafa21', 1, 'Em uma tigela, misture a farinha com o farelo de aveia e reserve.');
Insert Into modo_de_preparo values (5, 'jojofafa21', 2, 'Bata no liquidificador o açúcar, o suco e as raspas de laranja, a água, o azeite e o alecrim.');
Insert Into modo_de_preparo values (5, 'jojofafa21', 3, 'Adicione essa mistura na tigela com as farinhas e mexa até ficar homogêneo.');
Insert Into modo_de_preparo values (5, 'jojofafa21', 4, 'Acrescente o fermento, o vinagre de maçã, o sal, misture levemente apenas para incorporar');
Insert Into modo_de_preparo values (5, 'jojofafa21', 5, 'Despeje a massa em uma forma untada e asse em forno preaquecido a 160 ºC por 30 minutos.');
Insert Into modo_de_preparo values (5, 'jojofafa21', 6, 'Quando esfriar, desenforme o bolo e polvilhe açúcar.');
Insert Into modo_de_preparo values (5, 'jojofafa21', 7, 'Para finalizar, decore com ramos de alecrim e está pronto.');

-- Risotos de Frutos do Mar
Insert Into modo_de_preparo values (6, 'jojofafa21', 1, 'Aquecer duas colheres de sopa de manteiga em uma panela média. Adicionar a cebola e o alho para dourar; Acrescentar o arroz, dar uma refogada e cobrir com água para cozinhar; Em outra panela, levar o polvo para ferver, somente até amolecer, e escorrer;');
Insert Into modo_de_preparo values (6, 'jojofafa21', 2, 'Em uma frigideira grande, adicionar as duas colheres de sopa de manteiga restantes e o camarão. Levar ao fogo. Quando estiver rosado, acrescentar a lula e o tomate; Temperar com o sal a gosto, um pouco de vinho e refogar. Assim que o tomate desmanchar, passar o refogado da frigideira para a panela do arroz, juntar o polvo e misturar bem.');
Insert Into modo_de_preparo values (6, 'jojofafa21', 3, 'Ir acrescentando o restante do vinho aos pouquinhos e misturando. Quando o arroz estiver cozido, sem desmanchar, e bem úmido, o risoto estará no ponto. Servir o risoto em pratos fundos ou tigelas e espalhar o queijo ralado e o cheiro-verde por cima.');


	-- Vitória
-- Bolo de Cenoura
Insert Into modo_de_preparo values (1, 'vivibiba15', 1, 'No liquidificador bata todos os ingredientes, exceto a farinha de trigo e o fermento, que devem ser colocados em um recipiente à parte, e misturados com uma colher de pau aos ingredientes já batidos do liquidificador.');
Insert Into modo_de_preparo values (1, 'vivibiba15', 2, 'Unte uma forma com óleo e polvilhe farinha de trigo. Despeje a massa do bolo que deve estar uniforme.');
Insert Into modo_de_preparo values (1, 'vivibiba15', 3, 'Leve ao forno, preaquecido por aproximadamente 45 minutos.');
Insert Into modo_de_preparo values (1, 'vivibiba15', 4, 'Em uma panelinha misture todos os ingredientes, leve ao fogo até que forme uma calda lisa, sem pedaços.');
Insert Into modo_de_preparo values (1, 'vivibiba15', 5, 'Reserve a calda e a despeje sobre o bolo tão logo o tire do forno.');

-- Guisado de grão-de-bico e tomate
Insert Into modo_de_preparo values (2, 'vivibiba15', 1, 'Primeiro, o alho é descascado e picado finamente, enquanto as chalotas são descascadas e picadas grosseiramente. Em seguida, aqueça o azeite numa panela grande e salteie o alho e as chalotas;');
Insert Into modo_de_preparo values (2, 'vivibiba15', 2, 'Em seguida, adicione os tomates, o grão-de-bico escorrido e o caldo de legumes. Cozinhe lentamente durante cerca de 5 minutos e tempere com colorau em pó, sal e pimenta;');
Insert Into modo_de_preparo values (2, 'vivibiba15', 3, 'Para preparar o molho de iogurte, misture o iogurte natural até ficar homogéneo e corte o cebolinho em anéis. O molho é temperado com sal e pimenta;');
Insert Into modo_de_preparo values (2, 'vivibiba15', 4, 'O guisado é agora dividido em pequenas tigelas e servido com o molho de iogurte.');

-- French toast vegana
Insert Into modo_de_preparo values (3, 'vivibiba15', 1, 'Em uma vasilha, misture o leite com canela, baunilha, linhaça e açúcar e deixe repousar por 10 minutos.');
Insert Into modo_de_preparo values (3, 'vivibiba15', 2, 'Em seguida, mergulhe as fatias de pão nesse líquido, submergindo ambos os lados.');
Insert Into modo_de_preparo values (3, 'vivibiba15', 3, 'Aqueça um pouco de óleo de coco em uma frigideira e frite os pães até ficarem dourados em ambos os lados.');
Insert Into modo_de_preparo values (3, 'vivibiba15', 4, 'Adicione mais óleo de coco caso esteja perto de queimar.');
Insert Into modo_de_preparo values (3, 'vivibiba15', 5, 'Sirva com maple syrup e banana. Bom apetite.');

-- Pão ciabatta 
Insert Into modo_de_preparo values (4, 'vivibiba15', 1, 'Em uma batedeira, adicione a farinha de trigo, o fermento e o sal. Comece a bater na função sovar e vá adicionando a água aos poucos.');
Insert Into modo_de_preparo values (4, 'vivibiba15', 2, 'Por fim, acrescente o azeite e deixe sovar por 15 minutos.');
Insert Into modo_de_preparo values (4, 'vivibiba15', 3, 'Despeje a massa em uma vasilha grande untada com azeite. Após isso, polvilhe farinha por cima e deixe descansar por 3 horas em um ambiente levemente aquecido.');
Insert Into modo_de_preparo values (4, 'vivibiba15', 4, 'Quando a massa dobrar de volume, despeje-a em uma superfície limpa com farinha de trigo e trabalhe a massa com as mãos, até obter o formato desejado.');
Insert Into modo_de_preparo values (4, 'vivibiba15', 5, 'Polvilhe mais farinha por cima e corte a massa em tiras verticais com um cortador de pizza. Distribua as massas cortadas em uma assadeira.');
Insert Into modo_de_preparo values (4, 'vivibiba15', 6, 'Asse em forno preaquecido a 180ºC por cerca de 30 minutos ou até dourar e sirva.');

-- Panqueca de cacau vegana 
Insert Into modo_de_preparo values (5, 'vivibiba15', 1, 'Em um recipiente, misture todos os ingredientes.');
Insert Into modo_de_preparo values (5, 'vivibiba15', 2, 'Coloque a massa na frigideira antiaderente e prepare a panqueca.');
Insert Into modo_de_preparo values (5, 'vivibiba15', 3, 'Amasse a banana e leve ao micro-ondas por 30 segundos.');
Insert Into modo_de_preparo values (5, 'vivibiba15', 4, 'Adicione o leite em pó e a canela.');
Insert Into modo_de_preparo values (5, 'vivibiba15', 5, 'Coloque sobre a panqueca.');
Insert Into modo_de_preparo values (5, 'vivibiba15', 6, 'Finalize com os morangos picados.');

-- Salmão assado com alecrim e alcaparras
Insert Into modo_de_preparo values (6, 'vivibiba15', 1, 'Preaquecer o forno. Temperar o salmão com o suco dos dois limões, o sal, o azeite, o alecrim e as alcaparras;');
Insert Into modo_de_preparo values (6, 'vivibiba15', 2, 'Dispor o salmão temperado e fatiado em uma assadeira. Levar ao forno durante 30 minutos.');


	-- Bea
 -- Maionese Caseira
Insert Into modo_de_preparo values (1, 'beaevangelica04', 1, 'Coloque todos os ingredientes no liquidificador ou processador e bata até formar uma mistura cremosa;');
Insert Into modo_de_preparo values (1, 'beaevangelica04', 2, 'Acerte o sal e sirva! Bom apetite.');

-- Rolinho Vietnamita
Insert Into modo_de_preparo values (2, 'beaevangelica04', 1, 'Leve o Filé de Frango Empanado para a airfryer com um fio de azeite. Siga o tempo e temperatura recomendado na embalagem;');
Insert Into modo_de_preparo values (2, 'beaevangelica04', 2, 'Para o molho, combine todos os ingredientes numa cumbuca e incorpore-os com ajuda de um arame (fouet). Ajuste a consistência com água;');
Insert Into modo_de_preparo values (2, 'beaevangelica04', 3, 'Corte a cenoura e a abobrinha em bastonetes(julienne); Corte o repolho roxo finamente; Corte o Filé de Frango Empanado - já crocante - em tiras finas;');
Insert Into modo_de_preparo values (2, 'beaevangelica04', 4, 'Disponha água filtrada num prato aberto que caiba as folhas de arroz. Hidrate as folhas de arroz, uma por vez, nesse prato com água por 8-10 segundos;');
Insert Into modo_de_preparo values (2, 'beaevangelica04', 5, 'Transfira essa folha de arroz hidratada para uma tábua. Monte os rolinhos colocando as tiras de frango, cenoura, abobrinha, repolho roxo, broto de feijão e hortelã;');
Insert Into modo_de_preparo values (2, 'beaevangelica04', 6, 'Tempere com um fio de shoyu e faça as dobras na folha de forma a chegar num rolinho. Repita o processo até acabarem as folhas de arroz;');
Insert Into modo_de_preparo values (2, 'beaevangelica04', 7, 'Corte os rolinhos ao meio e disponha-os num prato. Sirva com o molho de amendoim e gengibre.');

-- Smoothie de banana e frutas vermelhas
Insert Into modo_de_preparo values (3, 'beaevangelica04', 1, 'Descasque as bananas, pique elas e, com as outras frutas, deixe congelar de um dia para o outro.');
Insert Into modo_de_preparo values (3, 'beaevangelica04', 2, 'Em um liquidificador ou mixer, adicione todos os ingredientes e bata até ficar homogêneo (reserve algumas para enfeitar).');
Insert Into modo_de_preparo values (3, 'beaevangelica04', 3, 'Caso queira deixar mais doce, adicione o mel na hora de bater');
Insert Into modo_de_preparo values (3, 'beaevangelica04', 4, 'Agora é só servir. Bom apetite.');

-- Granola Caseira
Insert Into modo_de_preparo values (4, 'beaevangelica04', 1, 'Em uma vasilha, coloque todos os ingredientes e misture bem.');
Insert Into modo_de_preparo values (4, 'beaevangelica04', 2, 'Transfira para uma forma de alumínio, espalhe e asse em forno preaquecido a 180° graus por 50 minutos.');
Insert Into modo_de_preparo values (4, 'beaevangelica04', 3, 'Lembre-se de mexer a cada 10 minutos para não perder o ponto.');
Insert Into modo_de_preparo values (4, 'beaevangelica04', 4, 'Estará pronto quando estiver bem cheirosa e crocante. Agora é só aproveitar.');

-- Leite de coco
Insert Into modo_de_preparo values (5, 'beaevangelica04', 1, 'Quebre os pedaços do coco, com casca, e leve-os para o liquidificador. Acrescente a água e deixe de molho por cerca de 2 minutos.');
Insert Into modo_de_preparo values (5, 'beaevangelica04', 2, 'Bata muito bem, até virar um líquido branco.');
Insert Into modo_de_preparo values (5, 'beaevangelica04', 3, 'Em seguida, utilizando um coador de pano, coe a fibra e aproveite apenas a parte líquida.');
Insert Into modo_de_preparo values (5, 'beaevangelica04', 4, 'Se necessário, aperte a massa de coco no coador para sair mais leite, até secar.');
Insert Into modo_de_preparo values (5, 'beaevangelica04', 5, 'Está pronto para consumo! Aproveite a sua bebida.');

-- Filé de peixe cozido com legumes
Insert Into modo_de_preparo values (6, 'beaevangelica04', 1, 'Cortar os filés de peixe em pedacinhos menores, temperar com uma colher de sopa de tempero caseiro e reservar; Em uma panela, adicionar o azeite de oliva, fritar as duas colheres de sopa que sobraram do tempero caseiro, acrescentar o molho de tomate e a cenoura picada. Juntar a água e deixar cozinhar;');
Insert Into modo_de_preparo values (6, 'beaevangelica04', 2, 'Quando a cenoura estiver cozida – porém, ela não deve ficar mole – adicionar a vagem, a cebola, o tomate e o sal; Então, adicionar o peixe e cozinhar até os filés mudarem de cor.');
Insert Into modo_de_preparo values (6, 'beaevangelica04', 3, 'Deixar a panela destampada para evaporar um pouco do líquido e acrescentar a ervilha. Assim que a ervilha estiver macia – o que deve levar aproximadamente cinco minutos – o peixe estará pronto. Aconselhamos não mexer muito no peixe para que ele não desmanche.');


	-- Fabio
-- Nhoque de mandioquinha recheado com gorgonzola na manteiga de ervas
Insert Into modo_de_preparo values (1, 'fabinhopiccoli11', 1, 'Cozinhe a mandioquinha em água com um pouquinho de sal até ficar bem macia. Escorra-a e amasse-a, acrescentando aos poucos a farinha temperada com um pouquinho de sal até obter uma massa homogênea. Enfarinhe uma superfície limpa, forme um rolo com a massa e corte-o em 16 a 20 pedaços iguais. Corte o gorgonzola em três pedaços e, sem seguida, dois deles em 16 a 20 cubos. Reserve um dos pedaços;');
Insert Into modo_de_preparo values (1, 'fabinhopiccoli11', 2, 'Abra cada pedaço da massa de mandioquinha, coloque um cubinho de gorgonzola no meio e feche a massa,formando uma bolinha. Coloque sobre uma superfície enfarinhada para não grudar. Ferva água em uma panela grande com um pouquinho de sal e coloque as bolinhas de nhoque. Quando elas subirem para a superfície, cronometre mais 2 minutos e depois retire-os com uma escumadeira ou peneira;');
Insert Into modo_de_preparo values (1, 'fabinhopiccoli11', 3, 'Enquanto o nhoque termina de cozinhar, derreta a manteiga em uma frigideira em fogo bem baixinho e acrescente as ervas. Depois de escorrer os nhoques, coloque-os na frigideira, mexa bem e arrume-os no prato. Por cima, despedace o gorgonzola reservado e sirva em seguida.');

-- Pão de Queijo Vegano
Insert Into modo_de_preparo values (2, 'fabinhopiccoli11', 1, 'Em um recipiente, coloque a batata cozida e amasse bem com um garfo até ficar um purê bem macio;');
Insert Into modo_de_preparo values (2, 'fabinhopiccoli11', 2, 'Adicione os ingredientes líquidos: o azeite e a água morna. Misture;');
Insert Into modo_de_preparo values (2, 'fabinhopiccoli11', 3, 'Acrescente o polvilho doce, o salgado e o sal. Misture bem com as mãos até a massa ficar homogênea, firme e que estica um pouco sem despedaçar;');
Insert Into modo_de_preparo values (2, 'fabinhopiccoli11', 4, 'Pegue porções da massa e molde em bolinhas pequenas;');
Insert Into modo_de_preparo values (2, 'fabinhopiccoli11', 5, 'Em uma forma untada com óleo, disponha as bolinhas com uma distância entre elas e leve ao forno preaquecido a 230 ºC por cerca de 15 minutos;');
Insert Into modo_de_preparo values (2, 'fabinhopiccoli11', 6, 'Agora é só servir. Bom apetite!');

-- Torradinha
Insert Into modo_de_preparo values (3, 'fabinhopiccoli11', 1, 'Corte os pães em fatias de cerca de 2 dedos de espessura.');
Insert Into modo_de_preparo values (3, 'fabinhopiccoli11', 2, 'Disponha-os em uma assadeira e reserve.');
Insert Into modo_de_preparo values (3, 'fabinhopiccoli11', 3, 'Em um recipiente, coloque a manteiga, o azeite, o orégano e misture bem até formar uma pastinha.');
Insert Into modo_de_preparo values (3, 'fabinhopiccoli11', 4, 'Passe a manteiga temperada na parte de cima das fatias de pães e leve ao forno preaquecido a 150 ºC por cerca de 15 minutos.');
Insert Into modo_de_preparo values (3, 'fabinhopiccoli11', 5, 'Agora é só servir. Bom apetite.');

-- Chocolate quente vegano
Insert Into modo_de_preparo values (4, 'fabinhopiccoli11', 1, 'Em uma panela, coloque o leite, o amido de milho e misture bem até dissolver.');
Insert Into modo_de_preparo values (4, 'fabinhopiccoli11', 2, 'Adicione o cacau em pó, misture e leve para o fogo baixo.');
Insert Into modo_de_preparo values (4, 'fabinhopiccoli11', 3, 'Acrescente o açúcar, os quadradinhos de chocolate, misture e mexa sempre até derreter.');
Insert Into modo_de_preparo values (4, 'fabinhopiccoli11', 4, 'Deixe cozinhar, mexendo sem parar, até encorpar (quanto mais tempo ficar no fogo, mais cremoso fica).');
Insert Into modo_de_preparo values (4, 'fabinhopiccoli11', 5, 'Agora é só servir. Bom apetite.');

-- Muffin de limão vegano
Insert Into modo_de_preparo values (5, 'fabinhopiccoli11', 1, 'Misture a água, óleo, açúcar, suco e as raspas de limão.');
Insert Into modo_de_preparo values (5, 'fabinhopiccoli11', 2, 'Acrescente a farinha e, depois de misturar tudo, o fermente e o bicarbonato.');
Insert Into modo_de_preparo values (5, 'fabinhopiccoli11', 3, 'Coloque a massa em formas de cupcake untadas com óleo e farinha.');
Insert Into modo_de_preparo values (5, 'fabinhopiccoli11', 4, 'Leve para o forno preaquecido a 180ºC por aproximadamente 20 a 25 minutos.');
Insert Into modo_de_preparo values (5, 'fabinhopiccoli11', 5, 'Sirva depois dos muffins esfriarem. Bom apetite!.');


	-- Filpi
-- Mini suflês ou omeletes de forno
Insert Into modo_de_preparo values (1, 'pandinha15', 1, 'Ligue o forno em 180ºC. Unte as forminhas, coloque nelas o recheio que você usará e tempere à vontade. Quebre os ovos e coloque-os em uma tigela ou prato fundo. Bata-os com um garfo ou fouet até ficarem homogêneos e começarem a espumar;');
Insert Into modo_de_preparo values (1, 'pandinha15', 2, 'Coloque o ovo batido por cima dos recheios até uns 2 dedos abaixo da borda, pois o ovo vai crescer bastante enquanto assa e pode derramar. Distribua um pouquinho de queijo ralado e leve as forminhas ao forno, que já deve estar quente, e deixe assar por algo entre 15 a 20 minutos — o tempo vai depender muito do seu forno e do tamanho das forminhas, então fique de olho a partir dos 15 minutos e, caso queira deixar seus miniomeletes mais douradinhos, suba a temperatura para 220ºC e não se distraia para que não virem carvõezinhos.');

-- Torrada de Abacate com Ovo Mexido
Insert Into modo_de_preparo values (2, 'pandinha15', 1, 'Separe as fatias de pão e esquente elas (pode ser na frigideira, no forno ou em uma sanduicheira);');
Insert Into modo_de_preparo values (2, 'pandinha15', 2, 'Em uma frigideira, em fogo baixo, derreta a manteiga, adicione os ovos e deixe cozinhar (não mexa);');
Insert Into modo_de_preparo values (2, 'pandinha15', 3, 'Acrescente o sal, a pimenta, misture bem e deixe cozinhar por mais 1 a 2 minutos (os ovos ainda devem ficar úmidos). Desligue o fogo e reserve;');
Insert Into modo_de_preparo values (2, 'pandinha15', 4, 'Passe o abacate sobre as fatias de pão e depois coloque os ovos mexidos por cima;');
Insert Into modo_de_preparo values (2, 'pandinha15', 5, 'Agora é só servir!');

-- Rabanada Vegana
Insert Into modo_de_preparo values (3, 'pandinha15', 1, 'Corte o pão e molhe no leite de soja.');
Insert Into modo_de_preparo values (3, 'pandinha15', 2, 'Leve para fritar no óleo.');
Insert Into modo_de_preparo values (3, 'pandinha15', 3, 'Empane na mistura de açúcar com canela e coloque em uma papel toalha para retirar o excesso de gordura.');
Insert Into modo_de_preparo values (3, 'pandinha15', 4, 'Agora é só servir! Bom apetite .');

-- Mingau de aveia com melado
Insert Into modo_de_preparo values (4, 'pandinha15', 1, 'Em uma panela, coloque todos os ingredientes (menos a banana) e misture bem.');
Insert Into modo_de_preparo values (4, 'pandinha15', 2, 'Leve ao fogo baixo e deixe cozinhar, mexendo sempre, até engrossar.');
Insert Into modo_de_preparo values (4, 'pandinha15', 3, 'Despeje em uma tigela e adicione as rodelas de banana.');
Insert Into modo_de_preparo values (4, 'pandinha15', 4, 'Agora é só servir! Bom apetite.');

-- Mingau de aveia e quinoa
Insert Into modo_de_preparo values (5, 'pandinha15', 1, 'Em uma panela, adicione o leite de amêndoas, a aveia, a quinoa, o xilitol, misture e leve para cozinhar em fogo baixo.');
Insert Into modo_de_preparo values (5, 'pandinha15', 2, 'Deixe cozinhar até engrossar e desligue.');
Insert Into modo_de_preparo values (5, 'pandinha15', 3, 'Acrescente o Whey e misture até incorporar.');
Insert Into modo_de_preparo values (5, 'pandinha15', 4, 'Decore com as rodelas de banana, a canela e o coco.');
Insert Into modo_de_preparo values (5, 'pandinha15', 5, 'Agora é só servir. Bom apetite.');

	-- Biazinha
-- Lasanha de Brocolis e Mussarela
Insert Into modo_de_preparo values (1, 'sabiabia29', 1, 'Pique o brócolis em tamanhos bem pequenos. Em seguida, refogue - os em panela com azeite e reserve');
Insert Into modo_de_preparo values (1, 'sabiabia29', 2, 'Em outra panela, coloque a manteiga, um pouco de tempero e o caldo de galinha. Em seguida, acrescente o leite e deixe ferver;');
Insert Into modo_de_preparo values (1, 'sabiabia29', 3, 'Depois, acrescente o brócolis ao molho, desligue a panela e coloque o creme de leite;');
Insert Into modo_de_preparo values (1, 'sabiabia29', 4, 'Em seguida é só montar uma camada de massa, o molho, o queijo e assim sucessivamente;');
Insert Into modo_de_preparo values (1, 'sabiabia29', 5, 'Por fim, jogue o queijo ralado para gratinar e sirva.');

-- Pão de Azeitona com Ricota
Insert Into modo_de_preparo values (2, 'sabiabia29', 1, 'Aqueça o forno a 175°C;');
Insert Into modo_de_preparo values (2, 'sabiabia29', 2, 'Unte com manteiga uma forma grande de bolo inglês e espalhe o gergelim por toda a superfície interna da forma;');
Insert Into modo_de_preparo values (2, 'sabiabia29', 3, 'Misture, em uma tigela, a farinha e o fermento. Reserve;');
Insert Into modo_de_preparo values (2, 'sabiabia29', 4, 'Em outro refratário, misture os ovos, o azeite, o iogurte, as ervas e o sal. Adicione as azeitonas e a ricota e misture bem;');
Insert Into modo_de_preparo values (2, 'sabiabia29', 5, 'Junte com a mistura seca e incorpore bem;');
Insert Into modo_de_preparo values (2, 'sabiabia29', 6, 'Passe para a forma e nivele a mistura com uma espátula. Em seguida polvilhe gergelim por cima;');
Insert Into modo_de_preparo values (2, 'sabiabia29', 7, 'Asse por 45 e espere esfriar para desenformar e servir.');

-- Moqueca de palmito pupunha
Insert Into modo_de_preparo values (3, 'sabiabia29', 1, 'Em uma panela, refogue a cebola e o alho no azeite. Adicione o tomate e o pimentão em cubos, tempere com sal e deixe cozinhar por cerca de 10 minutos.');
Insert Into modo_de_preparo values (3, 'sabiabia29', 2, 'Acrescente o leite de coco e o coentro e cozinhe por mais alguns minutos.');
Insert Into modo_de_preparo values (3, 'sabiabia29', 3, 'Coloque uma camada de pimentão em fatias, outra de tomates fatiados e uma de palmito. Repita as camadas e tampe.');
Insert Into modo_de_preparo values (3, 'sabiabia29', 4, 'Deixe cozinhar por cerca de 15 minutos.');
Insert Into modo_de_preparo values (3, 'sabiabia29', 5, 'Finalize com folhas de coentro e sirva-se.');

-- Risoto vegano 
Insert Into modo_de_preparo values (4, 'sabiabia29', 1, 'Em uma panela a fogo baixo, coloque o azeite e a cebola para refogar, até que fique transparente. Junte o arroz e misture bem.');
Insert Into modo_de_preparo values (4, 'sabiabia29', 2, 'Acrescente o vinho e mexa, mantendo o fogo baixo, e deixe dar uma reduzida.');
Insert Into modo_de_preparo values (4, 'sabiabia29', 3, 'Em seguida, adicione uma concha de caldo de legumes e misture sempre, para não grudar ao fundo. Quando o líquido estiver quase secando, repita o processo, mexendo sem parar, até que acabe o caldo e o arroz fique');
Insert Into modo_de_preparo values (4, 'sabiabia29', 4, 'Tempere com sal, a cúrcuma, o queijo, pimenta-do-reino e alecrim, mexendo bem e constantemente. Tampe a panela e deixe cozinhar por uns 2 minutos.');
Insert Into modo_de_preparo values (4, 'sabiabia29', 5, 'Agora é só servir! Bom apetite.');

-- Torta de liquidificador vegana fácil
Insert Into modo_de_preparo values (5, 'sabiabia29', 1, 'Leve uma panela ao fogo, adicione o azeite, e refogue a cebola. Acrescente o alho e a cenoura, e refogue por mais 3 minutos;');
Insert Into modo_de_preparo values (5, 'sabiabia29', 2, 'Junte o tomate, a ervilha, o milho, o sal, a páprica, as azeitonas, a pimenta, refogue tudo por 5 minutos, e reserve;');
Insert Into modo_de_preparo values (5, 'sabiabia29', 3, 'Coloque o óleo, a cebola, o sal, a água e a cúrcuma no liquidificador, e bata. Acrescente a farinha e bata até homogeneizar;');
Insert Into modo_de_preparo values (5, 'sabiabia29', 4, 'Adicione o fermento e misture com uma colher até ele se incorporar;');
Insert Into modo_de_preparo values (5, 'sabiabia29', 5, 'Despeje metade da massa em uma forma untada, espalhe o recheio por cima, e cubra-o com a outra metade da massa; depois, salpique orégano e pedacinhos de azeitonas;');
Insert Into modo_de_preparo values (5, 'sabiabia29', 6, 'Asse a torta em forno preaquecido a 180º graus por cerca de 35 minutos;');
Insert Into modo_de_preparo values (5, 'sabiabia29', 7, 'Agora é só servir. Bom apetite!');

/*Favorito*/
Insert Into favorito values (1, 'jojofafa21', 'beaevangelica04', '2023-09-26');
Insert Into favorito values (2, 'vivibiba15', 'jojofafa21', '2023-10-25');
Insert Into favorito values (1, 'vivibiba15', 'beaevangelica04', '2023-08-27');
Insert Into favorito values (1, 'beaevangelica04', 'jojofafa21', '2023-10-05');
Insert Into favorito values (2, 'beaevangelica04', 'vivibiba15', '2023-10-05');


/*Seguidor*/
Insert Into seguidor values ('sabiabia29', 'pandinha15');
Insert Into seguidor values ('sabiabia29', 'jojofafa21');
Insert Into seguidor values ('sabiabia29', 'fabinhopiccoli11');
Insert Into seguidor values ('jojofafa21', 'sabiabia29');
Insert Into seguidor values ('fabinhopiccoli11', 'pandinha15');
Insert Into seguidor values ('beaevangelica04', 'pandinha15');
Insert Into seguidor values ('beaevangelica04', 'vivibiba15');
Insert Into seguidor values ('vivibiba15', 'pandinha15');
Insert Into seguidor values ('vivibiba15', 'fabinhopiccoli11');
Insert Into seguidor values ('pandinha15', 'vivibiba15');
 

/*Denuncia Usuario*/
Insert Into denuncia_usuario values ('fabinhopiccoli11', 'sabiabia29', '2023-05-29', 'Imagem Indevida', false);
Insert Into denuncia_usuario values ('beaevangelica04', 'fabinhopiccoli11', '2023-05-29', 'Usuário finge ser outra pessoa', true);
Insert Into denuncia_usuario values ('jojofafa21', 'vivibiba15', '2023-05-29', 'Usuário tóxico', true);
Insert into denuncia_usuario values ('jojofafa21', 'sabiabia29', '2023-07-09', 'O perfil dessa pessoa não posta faz 3 anos e possui uma foto duvidosa', false);
Insert into denuncia_usuario values ('sabiabia29', 'vivibiba15', '2023-08-15', 'Esta usuário fica comentando que eu devo comer um boi bem passado em todas as minhas receitas', true );


/*Avaliação*/
Insert Into avaliacao values (1,'jojofafa21', 'vivibiba15', '2023-08-14', 5);
Insert Into avaliacao values (1,'jojofafa21', 'beaevangelica04', '2023-08-14', 4);
Insert Into avaliacao values (2,'jojofafa21', 'pandinha15', '2023-08-14', 2);
Insert Into avaliacao values (3,'jojofafa21', 'fabinhopiccoli11', '2023-08-14', 5);
Insert Into avaliacao values (4,'jojofafa21', 'pandinha15', '2023-08-14', 4);
Insert Into avaliacao values (5,'jojofafa21', 'sabiabia29', '2023-08-14', 4);
Insert Into avaliacao values (5,'jojofafa21', 'beaevangelica04', '2023-08-14', 5);
Insert Into avaliacao values (1,'pandinha15', 'jojofafa21', '2023-08-14', 1);
Insert Into avaliacao values (2,'pandinha15', 'vivibiba15', '2023-08-14', 5);
Insert Into avaliacao values (3,'pandinha15', 'fabinhopiccoli11', '2023-08-14', 5);
Insert Into avaliacao values (4,'pandinha15', 'vivibiba15', '2023-08-14', 5);
Insert Into avaliacao values (5,'pandinha15', 'sabiabia29', '2023-08-14', 4);
Insert Into avaliacao values (5,'pandinha15', 'vivibiba15', '2023-08-14', 5);
Insert Into avaliacao values (1,'fabinhopiccoli11', 'vivibiba15', '2023-08-14', 5);
Insert Into avaliacao values (4,'fabinhopiccoli11', 'pandinha15', '2023-08-14', 3);
Insert Into avaliacao values (1,'beaevangelica04', 'vivibiba15', '2023-08-14', 3);
Insert Into avaliacao values (2,'beaevangelica04', 'jojofafa21', '2023-08-14', 5);
Insert Into avaliacao values (1,'vivibiba15', 'sabiabia29', '2023-08-14', 5);
Insert Into avaliacao values (2,'vivibiba15', 'jojofafa21', '2023-08-14', 3);
Insert Into avaliacao values (2,'sabiabia29', 'jojofafa21', '2023-08-14', 5);
Insert Into avaliacao values (3,'sabiabia29', 'jojofafa21', '2023-08-14', 5);


/*Comentario*/
Insert Into comentario values (1, 'jojofafa21', 'sabiabia29', '2023-08-29', 'Muito saboroso esse burgão!!', false);
Insert Into comentario values (1, 'jojofafa21', 'fabinhopiccoli11', '2023-08-29', 'Delicia', false);
Insert Into comentario values (1, 'jojofafa21', 'pandinha15', '2023-08-29', 'Se joga do prédio mais alto faz favor', false);
Insert Into comentario values (1, 'jojofafa21', 'beaevangelica04', '2023-08-29', 'Fiz para eu e minha mãe, adoramos muito comemos tudo', false);
Insert Into comentario values (2, 'jojofafa21', 'fabinhopiccoli11', '2023-05-11', 'Achei bem ruinzinha, vm ta melhorando?', true);
Insert Into comentario values (1, 'vivibiba15', 'jojofafa21', '2023-01-21', 'Massa fica bem molhada e gostosinha, ameiii!!', false);
Insert Into comentario values (2, 'vivibiba15', 'pandinha15', '2023-06-30', 'AMEI MUINTO, FIS PROS MEU NETOS, BEIJOS DO ESTRESSADINHO', false);
Insert Into comentario values (1, 'beaevangelica04', 'jojofafa21', '2023-01-21', 'Gosto de agua com limão!!', false);


/*Denúncia Comentário*/
Insert Into denuncia_comentario values (2, 'vivibiba15', 'pandinha15', 'fabinhopiccoli11', '2023-06-30', '2023-02-01', 'Usuario Tóxico, alo moderação!', false);
Insert Into denuncia_comentario values (1, 'vivibiba15', 'jojofafa21', 'pandinha15', '2023-01-21','2023-05-14', 'Falando asneiras na receita da amiga', true);
Insert Into denuncia_comentario values (1, 'beaevangelica04', 'jojofafa21', 'pandinha15', '2023-01-21', '2023-07-12', 'Bla Bla', false);
Insert Into denuncia_comentario values (2, 'jojofafa21', 'fabinhopiccoli11', 'vivibiba15', '2023-05-11', '2021-04-14', 'Dispensa comentarios.', false);
Insert Into denuncia_comentario values (1, 'jojofafa21', 'sabiabia29', 'beaevangelica04', '2023-08-29', '2023-04-01', 'Acontece', true);


/*Ingrediente*/
Insert Into ingrediente values (1, 'Proteina Texturizada de Soja');
Insert Into ingrediente values (2, 'Alho');
Insert Into ingrediente values (3, 'Ovo');
Insert Into ingrediente values (4, 'Farinha de Trigo');
Insert Into ingrediente values (5, 'Molho de Soja');
Insert Into ingrediente values (6, 'Cebola');
Insert Into ingrediente values (7, 'Tomate');
Insert Into ingrediente values (8, 'Água');
Insert Into ingrediente values (9, 'Azeite');
Insert Into ingrediente values (10, 'Sal');
Insert Into ingrediente values (11, 'Cenoura');
Insert Into ingrediente values (12, 'Óleo');
Insert Into ingrediente values (13, 'Laranja');
Insert Into ingrediente values (14, 'Açúcar');
Insert Into ingrediente values (15, 'Fermento Químico');
Insert Into ingrediente values (16, 'Leite de Coco');
Insert Into ingrediente values (17, 'Cacau em Pó');
Insert Into ingrediente values (18, 'Suco de Limão');
Insert Into ingrediente values (19, 'Óleo de Gergelim Tostado');
Insert Into ingrediente values (20, 'Maionese');
Insert Into ingrediente values (21, 'Alho em Pó');
Insert Into ingrediente values (22, 'Banana');
Insert Into ingrediente values (23, 'Amendoim');
Insert Into ingrediente values (24, 'Canela em Pó');
Insert Into ingrediente values (25, 'Suco de Laranja');
Insert Into ingrediente values (26, 'Extrato de Tomate');
Insert Into ingrediente values (27, 'Grão de Bico');
Insert Into ingrediente values (28, 'Castanha');
Insert Into ingrediente values (29, 'Amêndoa');
Insert Into ingrediente values (30, 'Nozes');
Insert Into ingrediente values (31, 'Avelã');
Insert Into ingrediente values (32, 'Maizena');
Insert Into ingrediente values (33, 'Bifum');
Insert Into ingrediente values (34, 'Filé de Frango');
Insert Into ingrediente values (35, 'Abobrinha');
Insert Into ingrediente values (36, 'Repolho Roxo');
Insert Into ingrediente values (37, 'Folha de Arroz');
Insert Into ingrediente values (38, 'Molho Shoyu');
Insert Into ingrediente values (39, 'Mandioquinha');
Insert Into ingrediente values (40, 'Queijo Gorgonzola');
Insert Into ingrediente values (41, 'Nhoque');
Insert Into ingrediente values (42, 'Manteiga');
Insert Into ingrediente values (43, 'Ervas');
Insert Into ingrediente values (44, 'Batata');
Insert Into ingrediente values (45, 'Povilho Doce');
Insert Into ingrediente values (46, 'Povilho Azedo');
Insert Into ingrediente values (47, 'Pepino');
Insert Into ingrediente values (48, 'Azeitona');
Insert Into ingrediente values (49, 'Pão');
Insert Into ingrediente values (50, 'Pimenta-do-reino');
Insert Into ingrediente values (51, 'Abacate');
Insert Into ingrediente values (52, 'Lasanha pré-cozida');
Insert Into ingrediente values (53, 'Queijo');
Insert Into ingrediente values (54, 'Creme de Leite');
Insert Into ingrediente values (55, 'Caldo de Galinha');
Insert Into ingrediente values (56, 'Brócolis');
Insert Into ingrediente values (57, 'Leite');
Insert Into ingrediente values (58, 'Queijo Ralado');
Insert Into ingrediente values (59, 'Gergelim Branco');
Insert Into ingrediente values (60, 'Iogurte Natural');
Insert Into ingrediente values (61, 'Ervas Secas');
Insert Into ingrediente values (62, 'Azeitona Preta');
Insert Into ingrediente values (63, 'Ricota');
Insert Into ingrediente values (64, 'Chia');
Insert Into ingrediente values (65, 'Farinha de linhaça');
Insert Into ingrediente values (66, 'Farinha de aveia');
Insert Into ingrediente values (67, 'Castanha-de-Caju');
Insert Into ingrediente values (68, 'Levedura Nutricional');
Insert Into ingrediente values (69, 'Farelo de aveia');
Insert Into ingrediente values (70, 'Açúcar Demerara');
Insert Into ingrediente values (71, 'Alecrim');
Insert Into ingrediente values (72, 'Vinagre de maçã');
Insert Into ingrediente values (73, 'Leite Vegetal');
Insert Into ingrediente values (74, 'Baunilha');
Insert Into ingrediente values (75, 'Óleo de coco');
Insert Into ingrediente values (76, 'Maple Syrup');
Insert Into ingrediente values (77, 'Fermento seco de pão');
Insert Into ingrediente values (78, 'Linhaça hidratada');
Insert Into ingrediente values (79, 'Farinha de coco');
Insert Into ingrediente values (80, 'Aveia em flocos');
Insert Into ingrediente values (81, 'Leite em pó de coco');
Insert Into ingrediente values (82, 'Broto de feijão');
Insert Into ingrediente values (83, 'Hortelã');
Insert Into ingrediente values (84, 'Pasta de amendoim');
Insert Into ingrediente values (85, 'Gengibre ralado');
Insert Into ingrediente values (86, 'Molho de pimenta');
Insert Into ingrediente values (87, 'Alho ralado');
Insert Into ingrediente values (88, 'Morango');
Insert Into ingrediente values (89, 'Framboesa');
Insert Into ingrediente values (90, 'Mirtilo');
Insert Into ingrediente values (91, 'Amora');
Insert Into ingrediente values (92, 'Mel');
Insert Into ingrediente values (93, 'Flocos de milho');
Insert Into ingrediente values (94, 'Flocos de arroz');
Insert Into ingrediente values (95, 'Aveia em flocos grossos');
Insert Into ingrediente values (96, 'Semente de girassol');
Insert Into ingrediente values (97, 'Linhaça');
Insert Into ingrediente values (98, 'Gergelim');
Insert Into ingrediente values (99, 'Uva-passa');
Insert Into ingrediente values (100, 'Coco seco');
Insert Into ingrediente values (101, 'Água fervente');
Insert Into ingrediente values (102, 'Ervas frescas');
Insert Into ingrediente values (103, 'Batata cozida');
Insert Into ingrediente values (104, 'Água morna');
Insert Into ingrediente values (105, 'Pão francês amanhecido');
Insert Into ingrediente values (106, 'Orégano');
/*Insert Into ingrediente values (107, 'Leite vegetal');*/
Insert Into ingrediente values (108, 'Amido de milho');
Insert Into ingrediente values (109, 'Chocolate vegano');
Insert Into ingrediente values (110, 'Raspas de limão');
/*Insert Into ingrediente values (111, 'Açúcar demerara');*/
Insert Into ingrediente values (112, 'Bicarbonato de sódio');
Insert Into ingrediente values (113, 'Amido de milho');
Insert Into ingrediente values (114, 'Ervas desidratadas');
Insert Into ingrediente values (115, 'Lemon pepper');
Insert Into ingrediente values (116, 'Queijo parmesão');
Insert Into ingrediente values (117, 'Leite de soja');
Insert Into ingrediente values (118, 'Aveia');
Insert Into ingrediente values (119, 'Melado de cana');
Insert Into ingrediente values (120, 'Banana em rodela');
Insert Into ingrediente values (121, 'Leite de amêndoa');
Insert Into ingrediente values (122, 'Quinoa em flocos');
Insert Into ingrediente values (123, 'Xilitol');
Insert Into ingrediente values (124, 'Whey sem sabor');
Insert Into ingrediente values (125, 'Coco em lascas');
Insert Into ingrediente values (126, 'Presunto');
Insert Into ingrediente values (127, 'Fermento Biológico em Pó');
Insert Into ingrediente values (128, 'Azeitona Verde');
Insert Into ingrediente values (129, 'Ervilha');
Insert Into ingrediente values (130, 'Milho');
Insert Into ingrediente values (131, 'Páprica');
Insert Into ingrediente values (132, 'Óleo de Girassol');
Insert Into ingrediente values (133, 'Cúrcuma');
Insert Into ingrediente values (134, 'Cateto Cru');
Insert Into ingrediente values (135, 'Arroz Arbóreo');
Insert Into ingrediente values (136, 'Vinho Branco Seco');
Insert Into ingrediente values (137, 'Caldo de Legumes');
Insert Into ingrediente values (138, 'Queijo Vegano');
Insert Into ingrediente values (139, 'Requeijão de Castanha');
Insert Into ingrediente values (140, 'Cúrcuma em Pó');
Insert Into ingrediente values (141, 'Azeite de Dendê');
Insert Into ingrediente values (142, 'Pimentão Amarelo');
Insert Into ingrediente values (143, 'Coentro');
Insert Into ingrediente values (144, 'Palmito Pupunha');
Insert Into ingrediente values (145, 'Fermento biológico para pão');
Insert Into ingrediente values (146, 'Mix de farinhas sem glúten');
Insert Into ingrediente values (147, 'Raspas de laranja');
Insert Into ingrediente values (148, 'Chalotas frescas');
Insert Into ingrediente values (149, 'Pimenta preta');
Insert Into ingrediente values (150, 'Cebolinho');
Insert Into ingrediente values (151, 'Semente de abóbora');
Insert Into ingrediente values (152, 'Cebola Ralada');
Insert Into ingrediente values (153, 'Dente de Alho');
Insert Into ingrediente values (154, 'Erva Doce Picada');
Insert Into ingrediente values (155, 'Arroz');
Insert Into ingrediente values (156, 'Polvo Picado');
Insert Into ingrediente values (157, 'Camarão');
Insert Into ingrediente values (158, 'Lula');
Insert Into ingrediente values (159, 'Queijo Ralado Grosso');
Insert Into ingrediente values (160, 'Cheiro-verde');
Insert Into ingrediente values (161, 'Salmão');
Insert Into ingrediente values (162, 'Alcaparra');
Insert Into ingrediente values (163, 'Filé de Peixe');
Insert Into ingrediente values (164, 'Tempero Caseiro');
Insert Into ingrediente values (165, 'Molho de Tomate');
Insert Into ingrediente values (166, 'Vagem');
Insert Into ingrediente values (167, 'Ervilha Congelada');
Insert Into ingrediente values (168, 'Cenoura Picada');
Insert Into ingrediente values (169, 'Tomate Picado');

/*Ingrediente Substituto*/
Insert Into ingrediente_substituto values (1, 5, 1, 'jojofafa21', '2', 1);
Insert Into ingrediente_substituto values (2, 9, 1, 'jojofafa21', '2', 1);
Insert Into ingrediente_substituto values (3, 12, 1, 'vivibiba15', '1/2', 10);
Insert Into ingrediente_substituto values (4, 17, 1, 'vivibiba15', '7', 1);
Insert Into ingrediente_substituto values (5, 21, 1, 'beaevangelica04', '1/8', 2);
Insert Into ingrediente_substituto values (29, 30, 2, 'vivibiba15', '1', 11);

/*Medida*/
Insert into medida values (1, 'Colher de Sopa');
Insert into medida values (2, 'Colher de Chá');
Insert into medida values (3, 'ML');
Insert into medida values (4, 'Litro');
Insert into medida values (5, 'Xícara');
Insert into medida values (6, 'Grama');
Insert into medida values (7, 'Quilograma');
Insert into medida values (8, 'Unidade');
Insert into medida values (9, 'Pitada');
Insert into medida values (10, 'Copo');
Insert into medida values (11, 'A gosto');
Insert into medida values (12, 'Pacote');
Insert into medida values (13, 'Caixa');
Insert into medida values (14, 'Xícara de Chá');
Insert into medida values (15, 'Colher de Café');
Insert into medida values (17, 'Fatia');
Insert into medida values (18, 'Colher de Sobremesa');
Insert into medida values (19, 'Pote');


/*Item Receita*/
	-- Joao
-- Hambúrguer Artesanal
Insert Into item_receita values (1, 1, 'jojofafa21', 1, '2', 5);
Insert Into item_receita values (2, 1, 'jojofafa21', 2, '3', 8);
Insert Into item_receita values (3, 1, 'jojofafa21', 3, '1', 8);
Insert Into item_receita values (4, 1, 'jojofafa21', 4, '1/2', 5);
Insert Into item_receita values (5, 1, 'jojofafa21', 5, '2', 1);
Insert Into item_receita values (6, 1, 'jojofafa21', 6, '1', 8);
Insert Into item_receita values (7, 1, 'jojofafa21', 7, '1', 8);
Insert Into item_receita values (8, 1, 'jojofafa21', 8, '1/2', 5);
Insert Into item_receita values (9, 1, 'jojofafa21', 9, '2', 1);
Insert Into item_receita values (10, 1, 'jojofafa21', 10, 'Sal', 2);

-- Sorvete Caseiro Vegano
Insert Into item_receita values (1, 2, 'jojofafa21', 22, '5', 8);
Insert Into item_receita values (2, 2, 'jojofafa21', 23, '2', 10);
Insert Into item_receita values (3, 2, 'jojofafa21', 24, '1', 1);

-- Pão vegano com aveia
Insert Into item_receita values (1, 3, 'jojofafa21', 8, '1 e 1/4', 5);
Insert Into item_receita values (2, 3, 'jojofafa21', 145, '2', 1);
Insert Into item_receita values (3, 3, 'jojofafa21', 14, '1', 1);
Insert Into item_receita values (4, 3, 'jojofafa21', 64, '1', 1);
Insert Into item_receita values (5, 3, 'jojofafa21', 65, '1', 1);
Insert Into item_receita values (6, 3, 'jojofafa21', 10, '2', 2);
Insert Into item_receita values (7, 3, 'jojofafa21', 12, '1/4', 5);
Insert Into item_receita values (8, 3, 'jojofafa21', 66, '1 e 1/2', 5);
Insert Into item_receita values (9, 3, 'jojofafa21', 4, '2 e 1/2', 5);

-- 	Queijo Vegano
Insert Into item_receita values (1, 4, 'jojofafa21', 67, '1/2', 14);
Insert Into item_receita values (2, 4, 'jojofafa21', 8, '400', 3);
Insert Into item_receita values (3, 4, 'jojofafa21', 10, '1', 2);
Insert Into item_receita values (4, 4, 'jojofafa21', 12, '1', 1);
Insert Into item_receita values (5, 4, 'jojofafa21', 68, '1', 1);
Insert Into item_receita values (6, 4, 'jojofafa21', 45, '2', 1);
Insert Into item_receita values (7, 4, 'jojofafa21', 46, '1 a 2', 1);

-- Bolo de laranja com alecrim vegano
Insert Into item_receita values (1, 5, 'jojofafa21', 146, '120', 6);
Insert Into item_receita values (2, 5, 'jojofafa21', 69, '100', 6);
Insert Into item_receita values (3, 5, 'jojofafa21', 70, '150', 6);
Insert Into item_receita values (4, 5, 'jojofafa21', 25, '70', 3);
Insert Into item_receita values (5, 5, 'jojofafa21', 147, '0', 11);
Insert Into item_receita values (6, 5, 'jojofafa21', 8, '180', 3);
Insert Into item_receita values (7, 5, 'jojofafa21', 9, '100', 3);
Insert Into item_receita values (8, 5, 'jojofafa21', 71, '2', 8);
Insert Into item_receita values (9, 5, 'jojofafa21', 15, '12', 6);
Insert Into item_receita values (10, 5, 'jojofafa21', 72, '1', 1);
Insert Into item_receita values (11, 5, 'jojofafa21', 10, '1', 9);
Insert Into item_receita values (12, 5, 'jojofafa21', 14, '0', 11);

-- Risoto de frutos do mar
Insert Into item_receita values (1, 6, 'jojofafa21', 42, '4', 1);
Insert Into item_receita values (2, 6, 'jojofafa21', 152, '1/2', 8);
Insert Into item_receita values (3, 6, 'jojofafa21', 153, '1', 8);
Insert Into item_receita values (4, 6, 'jojofafa21', 154, '1', 1);
Insert Into item_receita values (5, 6, 'jojofafa21', 155, '1', 14);
Insert Into item_receita values (6, 6, 'jojofafa21', 10, '0', 11);
Insert Into item_receita values (7, 6, 'jojofafa21', 156, '100', 6);
Insert Into item_receita values (8, 6, 'jojofafa21', 157, '100', 6);
Insert Into item_receita values (9, 6, 'jojofafa21', 158, '100', 6);
Insert Into item_receita values (10, 6, 'jojofafa21', 7, '2', 8);
Insert Into item_receita values (11, 6, 'jojofafa21', 136, '1', 10);
Insert Into item_receita values (12, 6, 'jojofafa21', 159, '0', 11);
Insert Into item_receita values (13, 6, 'jojofafa21', 160, '0', 11);



	-- Vitória
-- Bolo de Cenoura
Insert Into item_receita values (1, 1, 'vivibiba15', 11, '3', 8);
Insert Into item_receita values (2, 1, 'vivibiba15', 12, '1/2', 10);
Insert Into item_receita values (3, 1, 'vivibiba15', 4, '3', 10);
Insert Into item_receita values (4, 1, 'vivibiba15', 13, '2', 8);
Insert Into item_receita values (5, 1, 'vivibiba15', 14, '1', 10);
Insert Into item_receita values (6, 1, 'vivibiba15', 15, '1', 1);
Insert Into item_receita values (7, 1, 'vivibiba15', 16, '200', 3);
Insert Into item_receita values (8, 1, 'vivibiba15', 14, '7', 1);
Insert Into item_receita values (9, 1, 'vivibiba15', 17, '7', 1);

-- Guisado de grão-de-bico e tomate
Insert Into item_receita values (1, 2, 'vivibiba15', 9, '1', 1);
Insert Into item_receita values (2, 2, 'vivibiba15', 148, '10', 6);
Insert Into item_receita values (3, 2, 'vivibiba15', 2, '1', 8);
Insert Into item_receita values (4, 2, 'vivibiba15', 10, '0', 9);
Insert Into item_receita values (5, 2, 'vivibiba15', 149, '0', 9);
Insert Into item_receita values (6, 2, 'vivibiba15', 131, '0', 9);
Insert Into item_receita values (7, 2, 'vivibiba15', 150, '1/2', 1);
Insert Into item_receita values (8, 2, 'vivibiba15', 27, '100', 6);
Insert Into item_receita values (9, 2, 'vivibiba15', 137, '100', 3);
Insert Into item_receita values (10, 2, 'vivibiba15', 60, '125', 6);
Insert Into item_receita values (11, 2, 'vivibiba15', 7, '100', 6);

-- French toast vegana
Insert Into item_receita values (1, 3, 'vivibiba15', 73, '1', 10);
Insert Into item_receita values (2, 3, 'vivibiba15', 24, '1/2', 2);
Insert Into item_receita values (3, 3, 'vivibiba15', 74, '1/2', 2);
Insert Into item_receita values (4, 3, 'vivibiba15', 65, '2', 2);
Insert Into item_receita values (5, 3, 'vivibiba15', 70, '1', 1);
Insert Into item_receita values (6, 3, 'vivibiba15', 49, '8', 17);
Insert Into item_receita values (7, 3, 'vivibiba15', 75, '0', 11);
Insert Into item_receita values (8, 3, 'vivibiba15', 76, '0', 11);
Insert Into item_receita values (9, 3, 'vivibiba15', 22, '0', 11);

-- Pão ciabatta
Insert Into item_receita values (1, 4, 'vivibiba15', 4, '500', 6);
Insert Into item_receita values (2, 4, 'vivibiba15', 77, '10', 6);
Insert Into item_receita values (3, 4, 'vivibiba15', 10, '10', 6);
Insert Into item_receita values (4, 4, 'vivibiba15', 8, '350', 3);
Insert Into item_receita values (5, 4, 'vivibiba15', 9, '50', 3);
Insert Into item_receita values (6, 4, 'vivibiba15', 4, '0', 11);

-- Panqueca de cacau vegana
Insert Into item_receita values (1, 5, 'vivibiba15', 78, '2', 1);
Insert Into item_receita values (2, 5, 'vivibiba15', 79, '1', 1);
Insert Into item_receita values (3, 5, 'vivibiba15', 80, '1', 1);
Insert Into item_receita values (4, 5, 'vivibiba15', 17, '1', 1);
Insert Into item_receita values (5, 5, 'vivibiba15', 15, '1', 9);
Insert Into item_receita values (6, 5, 'vivibiba15', 22, '1', 8);
Insert Into item_receita values (7, 5, 'vivibiba15', 81, '2', 1);
Insert Into item_receita values (8, 5, 'vivibiba15', 24, '1', 9);
Insert Into item_receita values (9, 5, 'vivibiba15', 88, '0', 11);

-- Salmão assado com alecrim e alcaparras
Insert Into item_receita values (1, 6, 'vivibiba15', 161, '800', 6);
Insert Into item_receita values (2, 6, 'vivibiba15', 18, '2', 8);
Insert Into item_receita values (3, 6, 'vivibiba15', 10, '0', 11);
Insert Into item_receita values (4, 6, 'vivibiba15', 71, '0', 11);
Insert Into item_receita values (5, 6, 'vivibiba15', 9, '0', 11);
Insert Into item_receita values (6, 6, 'vivibiba15', 162, '2', 1);


	-- Beatriz
-- Maionese
Insert Into item_receita values (1, 1, 'beaevangelica04', 18, '1', 1);
Insert Into item_receita values (2, 1, 'beaevangelica04', 8, '1/4', 2);
Insert Into item_receita values (3, 1, 'beaevangelica04', 19, '1', 1);
Insert Into item_receita values (4, 1, 'beaevangelica04', 20, '4', 1);
Insert Into item_receita values (5, 1, 'beaevangelica04', 21, '1/8', 8);

-- Rolinho Vietnamita
Insert Into item_receita values (1, 2, 'beaevangelica04', 7,'2', 8);
Insert Into item_receita values (2, 2, 'beaevangelica04', 56,'3', 8);
Insert Into item_receita values (3, 2, 'beaevangelica04', 18,'3', 1);
Insert Into item_receita values (4, 2, 'beaevangelica04', 33,'1', 8);
Insert Into item_receita values (5, 2, 'beaevangelica04', 37,'2', 8);
Insert Into item_receita values (6, 2, 'beaevangelica04', 27,'300', 6);
Insert Into item_receita values (7, 2, 'beaevangelica04', 59,'100', 6);

-- Smoothie de banana e frutas vermelhas
Insert Into item_receita values (1, 3, 'beaevangelica04', 22,'2', 8); 
Insert Into item_receita values (2, 3, 'beaevangelica04', 88,'4', 8); 
Insert Into item_receita values (3, 3, 'beaevangelica04', 89,'4', 8); 
Insert Into item_receita values (4, 3, 'beaevangelica04', 90,'20', 8);
Insert Into item_receita values (5, 3, 'beaevangelica04', 91,'4', 8);  
Insert Into item_receita values (6, 3, 'beaevangelica04', 8,'100', 3); 
Insert Into item_receita values (7, 3, 'beaevangelica04', 92,'0', 11);

-- Granola caseira
Insert Into item_receita values (1, 4, 'beaevangelica04', 93,'1 e 1/2', 14);  
Insert Into item_receita values (2, 4, 'beaevangelica04', 94,'1', 14);
Insert Into item_receita values (3, 4, 'beaevangelica04', 95,'1', 14); 
Insert Into item_receita values (4, 4, 'beaevangelica04', 151,'1/2', 14);    
Insert Into item_receita values (5, 4, 'beaevangelica04', 96,'1/2', 14); 
Insert Into item_receita values (6, 4, 'beaevangelica04', 97,'1/4', 14);
Insert Into item_receita values (7, 4, 'beaevangelica04', 98,'2', 1);
Insert Into item_receita values (8, 4, 'beaevangelica04', 64,'2', 1);
Insert Into item_receita values (9, 4, 'beaevangelica04', 30,'1/2', 5);    
Insert Into item_receita values (10, 4, 'beaevangelica04', 67,'1/2', 5);  
Insert Into item_receita values (11, 4, 'beaevangelica04', 99,'1/2', 5); 
Insert Into item_receita values (12, 4, 'beaevangelica04', 75,'1/4', 14);
Insert Into item_receita values (13, 4, 'beaevangelica04', 92,'1/2', 14);  
 
-- Leite de coco
Insert Into item_receita values (1, 5, 'beaevangelica04', 100,'200', 6);   
Insert Into item_receita values (2, 5, 'beaevangelica04', 101,'400', 3);   

-- Filé de peixe cozido com legumes
Insert Into item_receita values (1, 6, 'beaevangelica04', 163, '1', 7);
Insert Into item_receita values (2, 6, 'beaevangelica04', 164, '3', 1);
Insert Into item_receita values (3, 6, 'beaevangelica04', 165, '1', 14);
Insert Into item_receita values (4, 6, 'beaevangelica04', 10, '1', 2);
Insert Into item_receita values (5, 6, 'beaevangelica04', 168, '1', 14);
Insert Into item_receita values (6, 6, 'beaevangelica04', 166, '1/2', 14);
Insert Into item_receita values (7, 6, 'beaevangelica04', 169, '1/2', 8);
Insert Into item_receita values (8, 6, 'beaevangelica04', 6, '1/2', 8);
Insert Into item_receita values (9, 6, 'beaevangelica04', 167, '150', 6);
Insert Into item_receita values (10, 6, 'beaevangelica04', 8, '2', 14);
Insert Into item_receita values (11, 6, 'beaevangelica04', 9, '2', 1);


	-- Fabio 
-- Nhoque de mandioquinha recheado com gorgonzola na manteiga de ervas
Insert Into item_receita values (1, 1, 'fabinhopiccoli11', 39, '300', 6);
Insert Into item_receita values (2, 1, 'fabinhopiccoli11', 4, '1/3', 5);
Insert Into item_receita values (3, 1, 'fabinhopiccoli11', 40, '150', 6);
Insert Into item_receita values (4, 1, 'fabinhopiccoli11', 42, '1 1/2', 2);
Insert Into item_receita values (5, 1, 'fabinhopiccoli11', 43, '1', 2);
Insert Into item_receita values (6, 1, 'fabinhopiccoli11', 10, '1', 9);

-- Pão de Queijo Vegano
Insert Into item_receita values (1, 2, 'fabinhopiccoli11', 44, '1', 5);
Insert Into item_receita values (2, 2, 'fabinhopiccoli11', 45, '2', 5);
Insert Into item_receita values (3, 2, 'fabinhopiccoli11', 46, '1/2', 5);
Insert Into item_receita values (4, 2, 'fabinhopiccoli11', 8, '1/2', 5);
Insert Into item_receita values (5, 2, 'fabinhopiccoli11', 9, '1/3', 5);
Insert Into item_receita values (6, 2, 'fabinhopiccoli11', 10, '1', 9);

-- Torradinha
Insert Into item_receita values (1, 3, 'fabinhopiccoli11', 105, '2', 8);
Insert Into item_receita values (2, 3, 'fabinhopiccoli11', 42, '2', 1);
Insert Into item_receita values (3, 3, 'fabinhopiccoli11', 9, '1', 15);
Insert Into item_receita values (4, 3, 'fabinhopiccoli11', 106, '0', 11);

-- Chocolate Quente Vegano
Insert Into item_receita values (1, 4, 'fabinhopiccoli11', 73, '500', 3);
Insert Into item_receita values (2, 4, 'fabinhopiccoli11', 108, '2', 1);
Insert Into item_receita values (3, 4, 'fabinhopiccoli11', 17, '2', 1);
Insert Into item_receita values (4, 4, 'fabinhopiccoli11', 14, '0', 11);
Insert Into item_receita values (5, 4, 'fabinhopiccoli11', 109, '40', 6);

-- Muffin de Limão Vegano
Insert Into item_receita values (1, 5, 'fabinhopiccoli11', 8, '3/4', 5);
Insert Into item_receita values (2, 5, 'fabinhopiccoli11', 12, '1/3', 5);
Insert Into item_receita values (3, 5, 'fabinhopiccoli11', 18, '3/4', 5);
Insert Into item_receita values (4, 5, 'fabinhopiccoli11', 110, '1', 1);
Insert Into item_receita values (5, 5, 'fabinhopiccoli11', 70, '3/4', 5);
Insert Into item_receita values (6, 5, 'fabinhopiccoli11', 66, '2', 5);
Insert Into item_receita values (7, 5, 'fabinhopiccoli11', 15, '1/2', 1);
Insert Into item_receita values (8, 5, 'fabinhopiccoli11', 112, '1/2', 2);

	-- Filipi
-- Mini suflês ou omeletes de forno
Insert Into item_receita values (1, 1, 'pandinha15', 3, '2 a 3', 8);
Insert Into item_receita values (2, 1, 'pandinha15', 10, '0', 11);
Insert Into item_receita values (3, 1, 'pandinha15', 50, '0', 11);
Insert Into item_receita values (4, 1, 'pandinha15', 114, '0', 11);
Insert Into item_receita values (5, 1, 'pandinha15', 131, '0', 11);
Insert Into item_receita values (6, 1, 'pandinha15', 115, '0', 11);
Insert Into item_receita values (7, 1, 'pandinha15', 116, '0', 11);

-- Torrada de Abacate com Ovo Mexido
Insert Into item_receita values (1, 2, 'pandinha15', 49, '1', 8);
Insert Into item_receita values (2, 2, 'pandinha15', 42, '1', 2);
Insert Into item_receita values (3, 2, 'pandinha15', 3, '2', 8);
Insert Into item_receita values (4, 2, 'pandinha15', 10, '1', 9);
Insert Into item_receita values (5, 2, 'pandinha15', 51, '1/2', 8);

-- Rabanada Vegana
Insert Into item_receita values (1, 3, 'pandinha15', 49, '0', 11);
Insert Into item_receita values (2, 3, 'pandinha15', 117, '0', 11);
Insert Into item_receita values (3, 3, 'pandinha15', 70, '0', 11);
Insert Into item_receita values (4, 3, 'pandinha15', 24, '0', 11);
Insert Into item_receita values (5, 3, 'pandinha15', 132, '0', 11);

-- Mingau de Aveia com Melado
Insert Into item_receita values (1, 4, 'pandinha15', 80, '3', 1);
Insert Into item_receita values (2, 4, 'pandinha15', 99, '1', 1);
Insert Into item_receita values (3, 4, 'pandinha15', 17, '1', 2);
Insert Into item_receita values (4, 4, 'pandinha15', 119, '1', 1);
Insert Into item_receita values (5, 4, 'pandinha15', 73, '200', 3);
Insert Into item_receita values (6, 4, 'pandinha15', 22, '1', 8);

-- Mingau de Aveia e Quinoa
Insert Into item_receita values (1, 5, 'pandinha15', 121, '150', 3);
Insert Into item_receita values (2, 5, 'pandinha15', 80, '2', 1);
Insert Into item_receita values (3, 5, 'pandinha15', 122, '2', 1);
Insert Into item_receita values (4, 5, 'pandinha15', 123, '1', 2);
Insert Into item_receita values (5, 5, 'pandinha15', 124, '1', 18);
Insert Into item_receita values (6, 5, 'pandinha15', 22, '0', 11);
Insert Into item_receita values (7, 5, 'pandinha15', 24, '0', 11);
Insert Into item_receita values (8, 5, 'pandinha15', 125, '0', 11);


	-- Biazinha
-- Lasanha de Brocolis e Mussarela
Insert Into item_receita values (1, 1, 'sabiabia29', 52, '1', 8);
Insert Into item_receita values (2, 1, 'sabiabia29', 53, '200', 6);
Insert Into item_receita values (3, 1, 'sabiabia29', 42, '1', 8);
Insert Into item_receita values (4, 1, 'sabiabia29', 55, '2', 8);
Insert Into item_receita values (5, 1, 'sabiabia29', 56, '1', 8);
Insert Into item_receita values (6, 1, 'sabiabia29', 57, '150', 3);
Insert Into item_receita values (7, 1, 'sabiabia29', 10, '1', 9);
Insert Into item_receita values (8, 1, 'sabiabia29', 58, '2', 9);

-- Pão de Azeitona com Ricota
Insert Into item_receita values (1, 2, 'sabiabia29', 59, '3', 1);
Insert Into item_receita values (2, 2, 'sabiabia29', 4, '1 1/4', 5);
Insert Into item_receita values (3, 2, 'sabiabia29', 15, '1', 1);
Insert Into item_receita values (4, 2, 'sabiabia29', 3, '3', 8);
Insert Into item_receita values (5, 2, 'sabiabia29', 9, '1/4', 5);
Insert Into item_receita values (6, 2, 'sabiabia29', 60, '150', 6);
Insert Into item_receita values (7, 2, 'sabiabia29', 61, '1', 1);
Insert Into item_receita values (8, 2, 'sabiabia29', 10, '1/4', 1);
Insert Into item_receita values (9, 2, 'sabiabia29', 48, '100', 6);
Insert Into item_receita values (10, 2, 'sabiabia29', 63, '200', 6);

-- Moqueca de Palmito Pupunha
Insert Into item_receita values (1, 3, 'sabiabia29', 141, '3', 1);
Insert Into item_receita values (2, 3, 'sabiabia29', 6, '1/2', 8);
Insert Into item_receita values (3, 3, 'sabiabia29', 2, '2', 8);
Insert Into item_receita values (4, 3, 'sabiabia29', 142, '1/2', 8);
Insert Into item_receita values (5, 3, 'sabiabia29', 7, '1', 8);
Insert Into item_receita values (6, 3, 'sabiabia29', 10, '0', 11);
Insert Into item_receita values (7, 3, 'sabiabia29', 16, '240', 3);
Insert Into item_receita values (8, 3, 'sabiabia29', 143, '0', 11);
Insert Into item_receita values (9, 3, 'sabiabia29', 7, '3', 1);
Insert Into item_receita values (10, 3, 'sabiabia29', 144, '600', 6);

-- Risoto Vegano
Insert Into item_receita values (1, 4, 'sabiabia29', 6, '1', 8);
Insert Into item_receita values (2, 4, 'sabiabia29', 9, '3', 1);
Insert Into item_receita values (3, 4, 'sabiabia29', 134, '1', 14);
Insert Into item_receita values (4, 4, 'sabiabia29', 136, '1/2', 14);
Insert Into item_receita values (5, 4, 'sabiabia29', 137, '3', 5);
Insert Into item_receita values (6, 4, 'sabiabia29', 138, '1/2', 5);
Insert Into item_receita values (7, 4, 'sabiabia29', 133, '1', 2);
Insert Into item_receita values (8, 4, 'sabiabia29', 10, '2', 2);
Insert Into item_receita values (9, 4, 'sabiabia29', 71, '0', 11);
Insert Into item_receita values (10, 4, 'sabiabia29', 50, '0', 11);

-- Torta de Liquidificador Vegana Fácil
Insert Into item_receita values (1, 5, 'sabiabia29', 9, '1', 1);
Insert Into item_receita values (2, 5, 'sabiabia29', 6, '1', 8);
Insert Into item_receita values (3, 5, 'sabiabia29', 2, '1', 8);
Insert Into item_receita values (4, 5, 'sabiabia29', 11, '1', 8);
Insert Into item_receita values (5, 5, 'sabiabia29', 7, '1', 8);
Insert Into item_receita values (6, 5, 'sabiabia29', 129, '1/2', 14);
Insert Into item_receita values (7, 5, 'sabiabia29', 130, '1', 5);
Insert Into item_receita values (8, 5, 'sabiabia29', 10, '1', 2);
Insert Into item_receita values (9, 5, 'sabiabia29', 131, '1', 15);
Insert Into item_receita values (10, 5, 'sabiabia29', 48, '1/2', 14);
Insert Into item_receita values (11, 5, 'sabiabia29', 50, '0', 11);


/*Dieta*/
Insert into dieta values (1, 'Vegetarianismo');
Insert into dieta values (2, 'Pescetarianismo');
Insert into dieta values (3, 'Ovolactovegetarianismo');
Insert Into dieta values (4, 'Ovovegetarianismo');
Insert into dieta values (5, 'Lactovegetarianismo');


/*Preferência Dieta*/
Insert Into preferencia_dieta values(1, 'jojofafa21');
Insert Into preferencia_dieta values(2, 'sabiabia29');
Insert Into preferencia_dieta values(3, 'pandinha15');
Insert Into preferencia_dieta values(4, 'beaevangelica04');
Insert Into preferencia_dieta values(3, 'vivibiba15');
Insert Into preferencia_dieta values(5, 'fabinhopiccoli11');


/*Dieta Receita*/
	-- João
-- Hambúrguer Artesanal
Insert Into dieta_receita values (4, 1, 'jojofafa21');
Insert Into dieta_receita values (3, 1, 'jojofafa21');
-- Sorvete Caseiro Vegano
Insert Into dieta_receita values (1, 2, 'jojofafa21');
-- Pão Vegano com Aveia
Insert Into dieta_receita values (1, 3, 'jojofafa21');
-- Queijo Vegano
Insert Into dieta_receita values (1, 4, 'jojofafa21');
-- Bolo de Laranja com Alecrim Vegano
Insert Into dieta_receita values (1, 5, 'jojofafa21');
 -- Risoto de frutos do mar
Insert Into dieta_receita values (2, 6, 'jojofafa21');
 
	-- Vitoria
-- Bolo de Cenoura
Insert Into dieta_receita values (1, 1, 'vivibiba15');
-- Guisado de Grão-de-Bico e Tomate
Insert Into dieta_receita values (1, 2, 'vivibiba15');
-- French Toast Vegana
Insert Into dieta_receita values (1, 3, 'vivibiba15');
-- Pão Ciabatt
Insert Into dieta_receita values (1, 4, 'vivibiba15');
-- Panqueca de Cacau Vegana 
Insert Into dieta_receita values (1, 5, 'vivibiba15');
-- Salmão assado com alecrim e alcaparras
Insert Into dieta_receita values (2, 6, 'vivibiba15');

	-- Beatriz
-- Maionese Caseira
Insert Into dieta_receita values (1, 1, 'beaevangelica04');
-- Rolinho Vietnamita
Insert Into dieta_receita values (1, 2, 'beaevangelica04');
-- Smoothie de banana e frutas vermelhas
Insert Into dieta_receita values (1, 3, 'beaevangelica04');
-- Granola Caseira
Insert Into dieta_receita values (1, 4, 'beaevangelica04');
-- Leite de Coco
Insert Into dieta_receita values (1, 5, 'beaevangelica04');
-- Filé de peixe cozido com legumes
Insert Into dieta_receita values (2, 6, 'beaevangelica04');


	-- Fabio
-- Nhoque de mandioquinha recheado com gorgonzola na manteiga de ervas
Insert Into dieta_receita values (5, 1, 'fabinhopiccoli11');
Insert Into dieta_receita values (3, 1, 'fabinhopiccoli11');
-- Pão de Queijo Vegano
Insert Into dieta_receita values (1, 2, 'fabinhopiccoli11');
-- Torradinha
Insert Into dieta_receita values (5, 3, 'fabinhopiccoli11');
Insert Into dieta_receita values (3, 3, 'fabinhopiccoli11');

-- Chocolate Quente Vegano
Insert Into dieta_receita values (1, 4, 'fabinhopiccoli11');
-- Muffin de Limão Vegano
Insert Into dieta_receita values (1, 5, 'fabinhopiccoli11');

	-- Filipi
-- Mini Suflês ou Omeletes de Forno
Insert Into dieta_receita values (4, 1, 'pandinha15');
Insert Into dieta_receita values (3, 1, 'pandinha15');
-- Torrada de Abacate com Ovo Mexido
Insert Into dieta_receita values (4, 2, 'pandinha15');
Insert Into dieta_receita values (3, 2, 'pandinha15');
-- Rabanada Vegana
Insert Into dieta_receita values (1, 3, 'pandinha15');
-- Mingau de Aveia com Melado
Insert Into dieta_receita values (1, 4, 'pandinha15');
-- Mingau de Aveia e Quinoa
Insert Into dieta_receita values (1, 5, 'pandinha15');

	-- Bia
-- Lasanha de Brocolis e Mussarela
Insert Into dieta_receita values (5, 1, 'sabiabia29');
Insert Into dieta_receita values (3, 1, 'sabiabia29');
-- Pão de Azeitona com Ricota
Insert Into dieta_receita values (4, 2, 'sabiabia29');
Insert Into dieta_receita values (3, 2, 'sabiabia29');
-- Moqueca de Palmito Pupunha
Insert Into dieta_receita values (1, 3, 'sabiabia29');
-- Risoto Vegano
Insert Into dieta_receita values (1, 4, 'sabiabia29');
-- Torta de liquidificador vegana fácil
Insert Into dieta_receita values (1, 5, 'sabiabia29');


/*Denuncia Receita*/
Insert Into denuncia_receita values (1, 'jojofafa21', 'sabiabia29', '2023-08-22', 'Receita horrível', false);
Insert Into denuncia_receita values (1, 'jojofafa21', 'beaevangelica04', '2023-03-18', 'Podre', false);
Insert Into denuncia_receita values (1, 'vivibiba15', 'fabinhopiccoli11', '2022-03-11', 'Receita vai contra as diretrizes do site', false);
Insert Into denuncia_receita values (1, 'beaevangelica04', 'pandinha15', '2023-08-22', 'Usuario Tóxico', false);
Insert Into denuncia_receita values (1, 'beaevangelica04', 'jojofafa21', '2023-08-04', 'Lixo d+', false);
