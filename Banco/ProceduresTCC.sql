Delimiter $$

Drop function if exists avaliacaoReceita$$
Create function avaliacaoReceita(vCodigo int, vLogin varchar(20)) returns decimal(10,2)
begin
   declare media decimal(10,2) default 0.0;

  select coalesce(avg(vl_avaliacao), 0) into media from avaliacao where cd_receita = vCodigo and cd_login=vLogin;

	return media;
end$$

Drop procedure if exists ExibirDadosMinimosReceitas$$
Create procedure ExibirDadosMinimosReceitas()
begin
	Select 
		R.cd_receita, R.cd_login, R.nm_receita, avaliacaoReceita(r.cd_receita, r.cd_login)
	from 
		receita R
	order by rand();
end$$

Drop procedure if exists ExibirDadosMinimosReceitasMelhoresAvaliadas$$
Create procedure ExibirDadosMinimosReceitasMelhoresAvaliadas()
begin
	Select 
		R.cd_receita, R.cd_login, R.nm_receita, avaliacaoReceita(r.cd_receita, r.cd_login)
	from 
		receita R
	where avaliacaoReceita(r.cd_receita, r.cd_login) >= 4 order by rand();
end$$

Drop procedure if exists ExibirReceitasSeguindo$$
Create procedure ExibirReceitasSeguindo(pLogin varchar(20))
begin
	Select R.cd_receita, R.cd_login, R.nm_receita, avaliacaoReceita(r.cd_receita, r.cd_login) from Seguidor S 
	join usuario U ON (S.cd_login_seguindo = U.cd_login)
	join receita R on (S.cd_login_usuario_seguido = R.cd_login)
	where S.cd_login_seguindo = pLogin order by rand();
end$$

Drop procedure if exists ExibirDadosMinimosReceitasMaisRecentes$$
Create procedure ExibirDadosMinimosReceitasMaisRecentes()
begin
	Select 
		R.cd_receita, R.cd_login, R.nm_receita, avaliacaoReceita(r.cd_receita, r.cd_login), r.dt_receita
	from 
		receita R
	where R.dt_receita >= NOW() - INTERVAL 30 DAY order by R.dt_receita DESC;
end$$

Drop procedure if exists ProcurarReceita$$
Create procedure ProcurarReceita(pFiltro varchar(80))
begin
	Select 
	   distinct(r.cd_login), r.cd_receita, r.nm_receita, avaliacaoReceita(r.cd_receita, r.cd_login) as media
	from receita r 
	join item_receita ir on (r.cd_receita = ir.cd_receita and r.cd_login = ir.cd_login)
	join ingrediente i on (ir.cd_ingrediente = i.cd_ingrediente)
	where 
	  r. nm_receita like concat('%', pFiltro, '%') or nm_ingrediente like concat('%', pFiltro, '%')
	order by media desc;
end$$

Drop procedure if exists ProcurarReceitaDieta$$
Create procedure ProcurarReceitaDieta(pNomeDieta varchar(45))
begin
	Select 
		R.cd_receita, R.cd_login, R.nm_receita, avaliacaoReceita(R.cd_receita, R.cd_login)
	from 
		receita R
	join
		dieta_receita DR on (R.cd_receita = DR.cd_receita and R.cd_login = DR.cd_login)
	join
		dieta D on (D.cd_dieta = DR.cd_dieta)
	where D.nm_dieta = pNomeDieta;
end$$

Drop procedure if exists ExibirEstrelas$$
Create procedure ExibirEstrelas(pCodigoReceita int, pLogin varchar(20))
begin
    select avg(vl_avaliacao) as estrelas from avaliacao where cd_receita = pCodigoReceita and cd_login = pLogin;
end$$

Drop procedure if exists ExibirDadosPerfil$$
Create procedure ExibirDadosPerfil(pLogin varchar(20))
begin
    select nm_perfil, cd_login, dt_criacao_usuario from usuario where cd_login = pLogin;
end$$

Drop procedure if exists ExibirSeguidoresUsuario$$
Create procedure ExibirSeguidoresUsuario(pCodUsuario varchar(20))
begin
	Select 
		cd_login_seguindo, nm_perfil
	from
		seguidor S
			join
		usuario U ON (S.cd_login_seguindo = U.cd_login)
	where
		cd_login_usuario_seguido = pCodUsuario;
end$$

Drop procedure if exists ExibirSeguindoUsuario$$
Create procedure ExibirSeguindoUsuario(pCodUsuario varchar(20))
begin
	Select 
		cd_login_usuario_seguido, nm_perfil
	from
		seguidor S
			join
		usuario U ON (S.cd_login_usuario_seguido = U.cd_login)
	where
		cd_login_seguindo = pCodUsuario;
end$$

Drop procedure if exists ExibirFavoritosUsuario$$
Create procedure ExibirFavoritosUsuario(pCodUsuario varchar(20))
begin
	select 
		F.cd_receita, F.cd_login_receita, avaliacaoReceita(R.cd_receita, R.cd_login), F.cd_login, R.nm_receita
	from
		favorito F
			join
		receita R ON (F.cd_receita = R.cd_receita
			and F.cd_login_receita = R.cd_login)
	where
		F.cd_login = pCodUsuario order by F.dt_favorito DESC;
end$$

Drop procedure if exists ListarMedidas$$
Create procedure ListarMedidas()
begin
	select * from medida order by nm_medida;
end$$

Drop procedure if exists ListarIngredientes$$
Create procedure ListarIngredientes()
begin
	select * from ingrediente;
end$$

Drop procedure if exists ListarDietas$$
Create procedure ListarDietas()
begin
	select * from dieta;
end$$

Drop procedure if exists CriarReceita$$
Create procedure CriarReceita(pLogin varchar(20), pNomeReceita varchar(100), pTempoPreparo time, pRendimento int) /* INCOMPLETO AVALIACAO */
begin
	declare novoCodigo int default 1;
	Select coalesce(max(cd_receita)+1, 1) into novoCodigo from receita where cd_login = pLogin;

	Insert into receita values(novoCodigo, pLogin, pNomeReceita, pTempoPreparo, pRendimento, current_time(), false);
end$$

Drop procedure if exists CriarModoDePreparo$$
Create procedure CriarModoDePreparo(pCodReceita int, pLogin varchar(20), pDescModoPreparo text)
begin
	declare novoCodigo int default 1;
	Select coalesce(max(cd_preparo)+1, 1) into novoCodigo from modo_de_preparo where cd_receita = pCodReceita and cd_login = pLogin;

	Insert into modo_de_preparo values(pCodReceita, pLogin, novoCodigo, pDescModoPreparo);
end$$

Drop procedure if exists ExibirDadosReceita$$
Create procedure ExibirDadosReceita(pCodigoReceita int, pLogin varchar(20))
begin
	select r.cd_receita, r.nm_receita, u.nm_perfil, r.cd_login, r.hr_tempo_preparo_receita, 
    r.qt_rendimento, r.dt_receita, avaliacaoReceita(R.cd_receita, R.cd_login) from receita r 
	join usuario u ON(r.cd_login = u.cd_login)
	where r.cd_receita = pCodigoReceita and r.cd_login = pLogin ;
end$$

Drop procedure if exists ExibirDietasReceita$$
Create procedure ExibirDietasReceita(pCodigoReceita int, pLogin varchar(20))
begin
	select d.nm_dieta as nm_dieta from dieta_receita dr 
join dieta d on (d.cd_dieta = dr.cd_dieta)
where dr.cd_receita = pCodigoReceita and dr.cd_login = pLogin; 
end$$

Drop procedure if exists ExibirIngredientesReceita$$
Create procedure ExibirIngredientesReceita(pCodigoReceita int, pLogin varchar(20))
begin
	select i.nm_ingrediente, ir.qt_ingrediente, m.nm_medida, ir.cd_item_receita from item_receita ir
	join ingrediente i ON(i.cd_ingrediente = ir.cd_ingrediente) 
	join medida m ON(m.cd_medida = ir.cd_medida)
	where ir.cd_receita = pCodigoReceita and ir.cd_login = pLogin ;
end$$

Drop procedure if exists ExibirModoPreparo$$
Create procedure ExibirModoPreparo(pCodigoReceita int, pLogin varchar(20))
begin
	Select cd_preparo, ds_preparo from modo_de_preparo where cd_receita = pCodigoReceita and cd_login = pLogin;
end$$

Drop procedure if exists CadastrarUsuario$$
Create procedure CadastrarUsuario(pCodigoLogin varchar(20), pEmail varchar(100), 
pTelefone bigint, pNomePerfil varchar(50), pDataNascimento date, pSenha varchar(200))
begin
	Insert into usuario values(pCodigoLogin, pEmail, pTelefone, pNomePerfil, pDataNascimento, md5(pSenha), 1, Current_Date(), false);
end$$

Drop procedure if exists DenunciarUsuario$$
Create procedure DenunciarUsuario(pCodDenunciador varchar(50), pCodDenunciado varchar(50), pDescDenuncia text)
begin
	Insert into denuncia_usuario values (pCodDenunciador, pCodDenunciado, Current_Time(), pDescDenuncia, false);
end$$

Drop procedure if exists DenunciarReceita$$
Create procedure DenunciarReceita(pCodReceitaDenunciada int, pCodLoginDenunciado varchar(20), pCodDenunciador varchar(20), pDescDenuncia text)
begin
	Insert into denuncia_receita values (pCodReceitaDenunciada, pCodLoginDenunciado, pCodDenunciador, Current_Time(), pDescDenuncia, false);
end$$

Drop procedure if exists DenunciarComentario$$
Create procedure DenunciarComentario(pCodReceita varchar(50), pCodLoginReceita varchar(20), pCodDenunciado varchar(20), pCodDenunciador varchar(20), pDataComentario datetime, pDescDenuncia text)
begin
	Insert into denuncia_comentario values (pCodReceita, pCodLoginReceita, pCodDenunciado, pCodDenunciador, pDataComentario, Current_Time(), pDescDenuncia, false);
end$$

Drop procedure if exists ExibirTodasDenunciasReceitas$$
Create procedure ExibirTodasDenunciasReceitas()
begin
    select dr.cd_receita, r.nm_receita, dr.cd_login_denunciado, dr.cd_login_denunciador, dr.dt_denuncia_receita, dr.ds_denuncia_receita from denuncia_receita dr
join receita r ON (r.cd_receita = dr.cd_receita and r.cd_login = dr.cd_login_denunciado);
end$$

Drop procedure if exists InfoLoginUsuario$$
Create procedure InfoLoginUsuario(pEmail varchar(100), pSenha varchar(50))
begin
    select cd_login, nm_email, nm_perfil, dt_criacao_usuario from usuario where nm_email = pEmail and cd_senha = md5(pSenha);   
end$$

Drop Function if exists verificarIngrediente$$
Create Function verificarIngrediente(pIngrediente varchar(45)) returns bool
begin
	Declare vIngrediente varchar(45) default null;
	Declare vTem bool default false;

	Select nm_ingrediente into vIngrediente from ingrediente where nm_ingrediente = pIngrediente;

	if (vIngrediente = pIngrediente) then
		set vTem = true;
	end if;

	return vTem;
end$$

Drop Procedure if exists CriarIngrediente$$
Create Procedure CriarIngrediente(pIngrediente varchar(45))
begin
	Declare vCodigo int default 0;
	
	Select coalesce(max(cd_ingrediente)+1, 1) into vCodigo from ingrediente;

	if (verificarIngrediente(pIngrediente) = false) then
		Insert into ingrediente values (vCodigo, pIngrediente);
	end if;
end$$

Drop Procedure if exists CriarItemReceita$$
Create Procedure CriarItemReceita(pLogin varchar(20), pIngrediente varchar(45), pQuantidade text, pNomeMedida varchar(45))
begin
	Declare vIngrediente int default 0;
	Declare vCodigoReceita int default 0;
	Declare vCodigoItemReceita int default 0;
	Declare vCodigoMedida int default 0;
	Select cd_medida into vCodigoMedida from medida where nm_medida = pNomeMedida; 
	Select cd_ingrediente into vIngrediente from ingrediente where nm_ingrediente = pIngrediente;
	Select coalesce(max(cd_receita)) into vCodigoReceita from receita where cd_login = pLogin;
	Select coalesce(max(cd_item_receita)+1, 1) into vCodigoItemReceita from item_receita where cd_login = pLogin and cd_receita = vCodigoReceita;

	Insert into item_receita values (vCodigoItemReceita, vCodigoReceita, pLogin, vIngrediente, pQuantidade, vCodigoMedida); 
end$$

Drop procedure if exists CriarModoDePreparo$$
Create procedure CriarModoDePreparo(pLogin varchar(20), pDescModoPreparo text)
begin
	declare codReceita int default 1;
	declare novoCodigo int default 1;
	Select coalesce(max(cd_receita)) into codReceita from receita where cd_login = pLogin;
	Select coalesce(max(cd_preparo)+1, 1) into novoCodigo from modo_de_preparo where cd_receita = (Select coalesce(max(cd_receita)) from receita where cd_login = pLogin);

	Insert into modo_de_preparo values(codReceita, pLogin, novoCodigo, pDescModoPreparo);
end$$

Drop procedure if exists ContarSeguidoresUsuario$$
Create procedure ContarSeguidoresUsuario(pCodUsuario varchar(20))
begin
	Select 
		count(cd_login_seguindo)
	from
		seguidor S
			join
		usuario U ON (S.cd_login_seguindo = U.cd_login)
	where
		cd_login_usuario_seguido = pCodUsuario;
end$$

Drop procedure if exists ContarSeguindoUsuario$$
Create procedure ContarSeguindoUsuario(pCodUsuario varchar(20))
begin
	Select 
		count(cd_login_usuario_seguido)
	from
		seguidor S
			join
		usuario U ON (S.cd_login_usuario_seguido = U.cd_login)
	where
		cd_login_seguindo = pCodUsuario;
end$$


Drop procedure if exists ExibirReceitasUsuario$$
Create procedure ExibirReceitasUsuario(pCodUsuario varchar(20))
begin
	Select 
		R.cd_receita, R.nm_receita, avaliacaoReceita(r.cd_receita, r.cd_login), R.dt_receita
	from 
		receita R
	where cd_login = pCodUsuario order by dt_receita desc;
end$$

Drop procedure if exists CriarDietaReceita$$
Create procedure CriarDietaReceita(pCodDieta int, pLogin varchar(20))
begin
	declare codReceita int default 1;
	Select coalesce(max(cd_receita)) into codReceita from receita where cd_login = pLogin;
    if(pCodDieta = 1) then
		Insert into dieta_receita values(1, codReceita, pLogin);
	elseif(pCodDieta = 2) then
		Insert into dieta_receita values(2, codReceita, pLogin);
	elseif(pCodDieta = 3) then
            Insert into dieta_receita values(3, codReceita, pLogin);
	elseif(pCodDieta = 4) then
		Insert into dieta_receita values(4, codReceita, pLogin);
        Insert into dieta_receita values(3, codReceita, pLogin);
	elseif(pCodDieta = 5) then
		Insert into dieta_receita values(5, codReceita, pLogin);
        Insert into dieta_receita values(3, codReceita, pLogin);
    end if;
	
end$$

Drop procedure if exists ExibirUltimaReceita$$
Create procedure ExibirUltimaReceita(pLogin varchar(20))
begin
	Select coalesce(max(cd_receita)) from receita where cd_login = pLogin;
end$$

Drop function if exists mediaRanking$$
Create function mediaRanking(vLogin varchar(20)) returns decimal(10,2)
begin
	declare media decimal(10,2) default 0.0;

	Select avg(coalesce(vl_avaliacao,0)) into media
	from receita r 
	left join avaliacao a 
	on(r.cd_receita = a.cd_receita and r.cd_login = a.cd_login)
	where r.cd_login = vLogin and R.dt_receita >= NOW() - INTERVAL 30 DAY;

	return media;
end$$

Drop function if exists quantidadeAvaliacaoRanking$$
Create function quantidadeAvaliacaoRanking(vLogin varchar(20)) returns decimal(10,2)
begin
	declare quantidade int default 0;

	Select count(coalesce(vl_avaliacao,0)) into quantidade
	from receita r 
	join avaliacao a 
	on(r.cd_receita = a.cd_receita and r.cd_login = a.cd_login)
	where r.cd_login = vLogin and R.dt_receita >= NOW() - INTERVAL 30 DAY;

	return quantidade;
end$$

Drop procedure if exists ExibirRanking$$
Create procedure ExibirRanking()
begin
	Select distinct(mediaRanking(r.cd_login)), r.cd_login, u.nm_perfil, quantidadeAvaliacaoRanking(r.cd_login) from receita r 
    join usuario u on(u.cd_login = r.cd_login)
	where (mediaRanking(r.cd_login)) is not null and quantidadeAvaliacaoRanking(r.cd_login) > 1
    order by mediaRanking(r.cd_login) desc, quantidadeAvaliacaoRanking(r.cd_login) desc;
end$$

Drop procedure if exists VerificarExistenciaUsuario$$
Create procedure VerificarExistenciaUsuario(pLogin varchar(20))
begin
	Select * from usuario where cd_login = pLogin; 
end$$

Drop procedure if exists ExibirAvaliacaoP$$
Create procedure ExibirAvaliacaoP(pCodReceita int, pLoginDono varchar(20), pLoginAvaliador varchar(20))
begin
	Select vl_avaliacao from avaliacao where cd_receita = pCodReceita and cd_login = pLoginDono and cd_login_avaliador = pLoginAvaliador;
end$$

Drop procedure if exists AvaliarReceita$$
Create procedure AvaliarReceita(pCodReceita int, pLoginDono varchar(20), pLoginAvaliador varchar(20), pQuantidade int)
begin
	Insert into avaliacao values (pCodReceita, pLoginDono, pLoginAvaliador, current_date(), pQuantidade);
end$$

Drop procedure if exists AtualizarAvaliacao$$
Create procedure AtualizarAvaliacao(pCodReceita int, pLoginDono varchar(20), pLoginAvaliador varchar(20), pQuantidade int)
begin
	Update avaliacao set dt_avaliacao = current_date(), vl_avaliacao = pQuantidade
	where cd_receita = pCodReceita and cd_login = pLoginDono and cd_login_avaliador = pLoginAvaliador;
end$$

Drop procedure if exists ExibirComentariosReceita$$
Create procedure ExibirComentariosReceita(pCodReceita int, pCodLoginReceita varchar(20))
begin 
	Select cd_login_remetente, U.nm_perfil, dt_comentario, ds_comentario from comentario C
	join usuario U on(C.cd_login_remetente = U.cd_login)
	where cd_receita = pCodReceita and cd_login_destinatario = pCodLoginReceita and C.ic_bloqueado = false order by dt_comentario desc;
end$$

Drop procedure if exists ExibirComentario$$
Create procedure ExibirComentario(pCodReceita int, pCodLoginReceita varchar(20), pCodLoginComentario varchar(20), pDataComentario datetime)
begin 
	Select cd_login_remetente, U.nm_perfil, dt_comentario, ds_comentario from comentario C
	join usuario U on(C.cd_login_remetente = U.cd_login)
	where cd_receita = pCodReceita and cd_login_destinatario = pCodLoginReceita and cd_login_remetente = pCodLoginComentario and dt_comentario = pDataComentario;
end$$

Drop procedure if exists CriarComentario$$
Create procedure CriarComentario(pCodReceita int, pCodLoginReceita varchar(20), pCodLoginComentario varchar(20), pDesc text)
begin 
	insert into comentario values(pCodReceita, pCodLoginReceita, pCodLoginComentario, Now(), pDesc, false);
end$$

Drop procedure if exists VerificarSeguir$$
Create procedure VerificarSeguir(pLoginSeguido varchar(20), pLoginSeguindo varchar(20))
begin
	Select cd_login_seguindo from seguidor where cd_login_usuario_seguido = pLoginSeguido and cd_login_seguindo = pLoginSeguindo;
end$$

Drop procedure if exists SeguirUsuario$$
Create procedure SeguirUsuario(pLoginSeguido varchar(20), pLoginSeguindo varchar(20))
begin
	Insert into seguidor values (pLoginSeguido, pLoginSeguindo); 
end$$

Drop procedure if exists PararSeguir$$
Create procedure PararSeguir(pLoginSeguido varchar(20), pLoginSeguindo varchar(20))
begin
	Delete from seguidor WHERE cd_login_usuario_seguido = pLoginSeguido and cd_login_seguindo = pLoginSeguindo;
end$$

Drop procedure if exists VerificarFavorito$$
Create procedure VerificarFavorito(pCodReceita int, pLoginDono varchar(20), pLogin varchar(20))
begin
	Select cd_login from favorito where cd_receita = pCodReceita and cd_login_receita = pLoginDono and cd_login = pLogin;
end$$

Drop procedure if exists FavoritarReceita$$
Create procedure FavoritarReceita(pCodReceita int, pLoginDono varchar(20), pLogin varchar(20))
begin
	Insert into favorito values (pCodReceita, pLoginDono, pLogin, now()); 
end$$

Drop procedure if exists Desfavoritar$$
Create procedure Desfavoritar(pCodReceita int, pLoginDono varchar(20), pLogin varchar(20))
begin
	Delete from favorito where cd_receita = pCodReceita and cd_login_receita = pLoginDono and cd_login = pLogin;
end$$

Drop procedure if exists CriarPreferenciaDieta$$
Create procedure CriarPreferenciaDieta(pCodDieta int, pLogin varchar(20))
begin
	Insert into preferencia_dieta values (pCodDieta, pLogin);
end$$

Drop procedure if exists AtualizarReceita$$
Create procedure AtualizarReceita(pCodigo int, pLogin varchar(20), pNomeReceita varchar(100), pTempoPreparo time, pRendimento int)
begin
	Update receita set nm_receita = pNomeReceita, hr_tempo_preparo_receita = pTempoPreparo, 
	qt_rendimento = pRendimento where cd_receita = pCodigo and cd_login = pLogin;
end$$

Drop procedure if exists SelecionarDietaReceita$$
Create procedure SelecionarDietaReceita(pCodigo int, pCodDieta int, pLogin varchar(20))
begin
	Select NM_dieta from dieta_receita where cd_receita = pCodigo and cd_login = pLogin;
end$$

Drop procedure if exists VerificarDietaReceita$$
Create procedure VerificarDietaReceita(pCodigo int, pCodDieta int, pLogin varchar(20))
begin
	Select cd_dieta from dieta_receita where cd_receita = pCodigo and cd_login = pLogin and cd_dieta = pCodDieta;
end$$

Drop procedure if exists AdicionarDietaReceita$$
Create procedure AdicionarDietaReceita(pCodigo int, pCodDieta int, pLogin varchar(20))
begin
	Delete from dieta_receita where cd_receita = pCodigo and cd_login = pLogin;
	Insert into dieta_receita values(pCodDieta, pCodigo, pLogin);
end$$

Drop Procedure if exists AtualizarItemReceita$$
Create Procedure AtualizarItemReceita(pCodigoItem int, pCodigoReceita int, pLogin varchar(20), pIngrediente varchar(45), pQuantidade text, pNomeMedida varchar(45))
begin
	Declare vIngrediente int default 0;
	Declare vCodigoMedida int default 0;
	Select cd_medida into vCodigoMedida from medida where nm_medida = pNomeMedida; 
	Select cd_ingrediente into vIngrediente from ingrediente where nm_ingrediente = pIngrediente;

	Update item_receita set cd_ingrediente = vIngrediente, cd_medida = vCodigoMedida, qt_ingrediente = pQuantidade
	where cd_receita = pCodigoReceita and cd_login = pLogin and cd_item_receita = pCodigoItem;
end$$

Drop procedure if exists AtualizarModoDePreparo$$
Create procedure AtualizarModoDePreparo(pCodigo int, pLogin varchar(20), pCodigoPreparo int, pDescModoPreparo text)
begin
	Update modo_de_preparo set ds_preparo = pDescModoPreparo
	where cd_receita = pCodigo and cd_login = pLogin and cd_preparo = pCodigoPreparo;
end$$

Drop procedure if exists AtualizarUsuario$$
Create procedure AtualizarUsuario(pLoginNovo varchar(20), pEmail varchar(100), 
pTelefone bigint, pNomePerfil varchar(50), pDataNascimento date, pLogin varchar(20))
begin
	Update usuario set cd_login = pLoginNovo, nm_email = pEmail, cd_telefone = pTelefone, nm_perfil = pNomePerfil,
	dt_nascimento = pDataNascimento where cd_login = pLogin;
end$$

Drop procedure if exists ExibirInformacoesPerfil$$
Create procedure ExibirInformacoesPerfil(pLogin varchar(20))
begin
	Select * from usuario where cd_login = pLogin;
end$$

Drop procedure if exists AdicionarPreferenciaDieta$$
Create procedure AdicionarPreferenciaDieta(pLogin varchar(20), pCodDieta int)
begin
	Insert into preferencia_dieta values(pCodDieta, pLogin);
end$$

Drop procedure if exists VerificarPreferenciaDieta$$
Create procedure VerificarPreferenciaDieta(pCodDieta int, pLogin varchar(20))
begin
	Select cd_dieta from preferencia_dieta where cd_login = pLogin and cd_dieta = pCodDieta;
end$$

Drop procedure if exists ExibirDietasUsuario$$
Create procedure ExibirDietasUsuario(pLogin varchar(20))
begin
	select d.nm_dieta as nm_dieta from preferencia_dieta pd 
join dieta d on (d.cd_dieta = pd.cd_dieta)
where pd.cd_login = pLogin; 
end$$

Drop procedure if exists ExibirReceitasDenunciadas$$
Create procedure ExibirReceitasDenunciadas()
begin 
	select distinct(dr.cd_login_denunciado), dr.cd_receita, r.nm_receita from denuncia_receita dr
	join receita r where (dr.cd_receita = r.cd_receita and r.cd_login = dr.cd_login_denunciado) order by dr.dt_denuncia_receita DESC;
end$$

Drop procedure if exists ExibirComentariosDenunciados$$
Create procedure ExibirComentariosDenunciados()
begin 
	select distinct
    (dc.cd_login_denunciado),
    dc.cd_receita,
    c.cd_login_destinatario,
    u.nm_perfil,
    c.dt_comentario,
    c.ds_comentario
from
    denuncia_comentario dc
        join
    comentario c ON (c.cd_receita = dc.cd_receita
        and c.cd_login_destinatario = dc.cd_login_receita
        and c.cd_login_remetente = dc.cd_login_denunciado)
        join
    usuario u ON (dc.cd_login_denunciado = u.cd_login);
end$$

Drop procedure if exists ExibirUsuariosDenunciados$$
Create procedure ExibirUsuariosDenunciados()
begin 
	select distinct(du.cd_login_denunciado), nm_perfil from denuncia_usuario du
	join usuario u on (du.cd_login_denunciado = u.cd_login);
end$$

Drop procedure if exists ContagemReceitasDenunciadas$$
Create procedure ContagemReceitasDenunciadas(pCodReceita int, pLogin varchar(20))
begin 
	select count(cd_receita and cd_login_denunciado) from denuncia_receita where cd_receita = pCodReceita and cd_login_denunciado = pLogin;
end$$

Drop procedure if exists ExibirMaisInformacoesDenunciaReceita$$
Create procedure ExibirMaisInformacoesDenunciaReceita()
begin 
	select dr.cd_login_denunciado, dr.cd_receita, r.nm_receita, r.dt_receita, if(r.ic_bloqueado = 0,"Desbloqueada","Bloqueada") as ic_bloqueado,
dr.cd_login_denunciador, dr.dt_denuncia_receita, dr.ds_denuncia_receita
from
    denuncia_receita dr
        join
    receita r
where
    (dr.cd_receita = r.cd_receita
        and r.cd_login = dr.cd_login_denunciado)
order by dr.dt_denuncia_receita DESC;
end$$

Drop procedure if exists ExibirMaisInformacoesDenunciaComentario$$
Create procedure ExibirMaisInformacoesDenunciaComentario()
begin
select dc.cd_login_denunciado,
    c.cd_login_destinatario,
    u.nm_perfil,
    c.dt_comentario,
    c.ds_comentario,
	dc.cd_login_denunciador,
	dc.dt_denuncia_comentario,
	dc.ds_denuncia_comentario
from
    denuncia_comentario dc
        join
    comentario c ON (c.cd_receita = dc.cd_receita
        and c.cd_login_destinatario = dc.cd_login_receita
        and c.cd_login_remetente = dc.cd_login_denunciado)
        join
    usuario u ON (dc.cd_login_denunciado = u.cd_login); 
end$$

Drop procedure if exists ExibirMaisInformacoesDenunciaUsuario$$
Create procedure ExibirMaisInformacoesDenunciaUsuario()
begin
select 
    du.cd_login_denunciado,
    u.nm_perfil,
	du.cd_login_denunciador,
    du.ds_denuncia_usuario,
    du.dt_denuncia_usuario
from
    denuncia_usuario du
        join
    usuario u ON (du.cd_login_denunciado = u.cd_login);
end$$

Drop procedure if exists DeletarReceita$$
Create procedure DeletarReceita(pCodReceita int, pLogin varchar(20))
begin
	Delete from item_receita where cd_receita = pCodReceita and cd_login = pLogin;
	Delete from modo_de_preparo where cd_receita = pCodReceita and cd_login = pLogin;
	Delete from dieta_receita where cd_receita = pCodReceita and cd_login = pLogin;
	Delete from avaliacao where cd_receita = pCodReceita and cd_login = pLogin;
	Delete from favorito where cd_receita = pCodReceita and cd_login_receita = pLogin;
	Delete from denuncia_comentario where cd_receita = pCodReceita and cd_login_receita = pLogin;
	Delete from comentario where cd_receita = pCodReceita and cd_login_destinatario = pLogin;
	Delete from denuncia_receita where cd_receita = pCodReceita and cd_login_denunciado = pLogin;
	Delete from receita where cd_receita = pCodReceita and cd_login = pLogin;
end$$

Delimiter ;

/*
call CriarReceita('jojofafa21', 'Rato assado delicioso', 5, 1);
call CriarModoDePreparo(3, 'jojofafa21', 'Pega um rato abre e tira o pulmão');
call CriarModoDePreparo(3, 'jojofafa21', 'Bota no forno e deixa assando por 5 minutos para ficar mal passado que é mais suculento');

call CadastrarUsuario('freddyarcoeflexa', 'proffreddy@gmail.com', 13958149292, 'Frederico', '1910-04-29', 'cocacolameg');

call DenunciarReceita(3, 'jojofafa21', 'vivibiba15', 'Receita completamente inadequada, quase chorei lendo toda essa crueldade. Decepcionante.');
call DenunciarUsuario('vivibiba15', 'jojofafa21', 'Perfil postando receitas horríveis, precisa ser detido urgentemente!!');
call DenunciarComentario(1, 'jojofafa21', 'pandinha15', 'vivibiba15', '2023-08-29', 'apologia ao suicidio isso é muito triste smt pandinha15');
*/