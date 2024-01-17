DROP SCHEMA IF EXISTS verdelicias;
CREATE SCHEMA verdelicias;
USE verdelicias;

CREATE TABLE tipo_usuario
(
	cd_tipo_usuario int,
	nm_tipo_usuario varchar(15),
	constraint pk_tipo_usuario primary key(cd_tipo_usuario)
);

CREATE TABLE usuario
(
	cd_login varchar(20),
	nm_email varchar(100),
	cd_telefone bigint,
	nm_perfil varchar(50),
	dt_nascimento date,
	cd_senha varchar(100),
	cd_tipo_usuario int,
	dt_criacao_usuario date,
	ic_bloqueado bool,
	constraint pk_usuario primary key(cd_login),
	constraint fk_usuario foreign key (cd_tipo_usuario)
	references tipo_usuario (cd_tipo_usuario)
);

CREATE TABLE receita
(
	cd_receita int,
	cd_login varchar(20),
	nm_receita varchar(80),
	hr_tempo_preparo_receita int,
	qt_rendimento int,
	dt_receita datetime,
	ic_bloqueado bool,
	constraint pk_receita primary key(cd_receita, cd_login),
	constraint fk_receita foreign key (cd_login)
	references usuario (cd_login)
);

CREATE TABLE modo_de_preparo
(
	cd_receita int,
	cd_login varchar(20),
	cd_preparo int,
	ds_preparo text,
	constraint pk_modo_de_preparo primary key (cd_receita, cd_login, cd_preparo),
	constraint fk_modo_de_preparo foreign key (cd_receita, cd_login)
	references receita (cd_receita, cd_login)
);

CREATE TABLE favorito
(
	cd_receita int,
	cd_login_receita varchar(20),
	cd_login varchar(20),
	dt_favorito datetime,
	constraint pk_favorito primary key(cd_receita, cd_login_receita, cd_login),
	constraint fk_favorito foreign key (cd_receita, cd_login_receita)
	references receita(cd_receita, cd_login),
	constraint fk_favorito2 foreign key (cd_login)
	references usuario(cd_login)
);

CREATE TABLE seguidor
(
	cd_login_usuario_seguido varchar(20),
	cd_login_seguindo varchar(20),
	constraint pk_seguidor primary key (cd_login_usuario_seguido, cd_login_seguindo),
	constraint fk_seguidor foreign key (cd_login_usuario_seguido)
	references usuario(cd_login),
	constraint fk_seguidor2 foreign key (cd_login_seguindo)
	references usuario(cd_login)
);

CREATE TABLE avaliacao
(
	cd_receita int,
	cd_login varchar(20),
	cd_login_avaliador varchar(20),
	dt_avaliacao datetime,
	vl_avaliacao int,
	constraint pk_avaliacao primary key(cd_receita, cd_login, cd_login_avaliador),
	constraint fk_avaliacao foreign key(cd_login)
	references usuario(cd_login)
);

CREATE TABLE comentario
(
	cd_receita int,
	cd_login_destinatario varchar(20),
	cd_login_remetente varchar(20),
	dt_comentario datetime,
	ds_comentario text,
	ic_bloqueado boolean,
	constraint pk_comentario primary key (cd_receita, cd_login_destinatario, cd_login_remetente, dt_comentario),
	constraint fk_comentario_receita foreign key (cd_receita, cd_login_destinatario)
	references receita(cd_receita, cd_login),
	constraint fk_comentario_remetente foreign key (cd_login_remetente)
	references usuario(cd_login)
);

CREATE TABLE medida
(
	cd_medida int,
	nm_medida varchar(45),
	constraint pk_medida primary key (cd_medida)
);

CREATE TABLE ingrediente
(
	cd_ingrediente int,
	nm_ingrediente varchar(45),
	constraint pk_ingrediente primary key (cd_ingrediente)
);

CREATE TABLE ingrediente_substituto
(
	cd_ingrediente_substituto int,
	cd_ingrediente_substituido int,
	cd_receita int,
	cd_login varchar(20),
	qt_ingrediente_substituto Text,
	cd_medida int,
	constraint pk_ingrediente_substituto primary key (cd_ingrediente_substituto,
	cd_ingrediente_substituido, cd_receita, cd_login, cd_medida)
);

CREATE TABLE item_receita
(
	cd_item_receita int,
	cd_receita int,
	cd_login varchar(20),
	cd_ingrediente int,
	qt_ingrediente Text,
	cd_medida int,
	constraint pk_item_receita primary key (cd_item_receita, cd_receita, cd_login, cd_ingrediente, cd_medida),
	constraint fk_item_receita_medida foreign key (cd_medida)
	references medida(cd_medida),
	constraint fk_item_receita_receita foreign key (cd_login, cd_receita)
	references receita(cd_login, cd_receita),
	constraint fk_item_receita_ingrediente foreign key (cd_ingrediente)
	references ingrediente(cd_ingrediente)
);

CREATE TABLE dieta
(
	cd_dieta int,
	nm_dieta varchar(45),
	constraint pk_dieta primary key (cd_dieta)
);

CREATE TABLE preferencia_dieta
(
	cd_dieta int,
	cd_login varchar(20),
	constraint pk_preferencia_dieta primary key (cd_dieta, cd_login),
	constraint fk_preferencia_dieta_dieta foreign key (cd_dieta)
	references dieta (cd_dieta),
	constraint fk_preferencia_dieta_login foreign key (cd_login)
	references usuario (cd_login)
);

CREATE TABLE dieta_receita
(
	cd_dieta int,
	cd_receita int,
	cd_login varchar(20),
	constraint pk_dieta_receita primary key (cd_dieta, cd_receita, cd_login),
	constraint fk_dieta_receita_dieta foreign key (cd_dieta)
	references dieta (cd_dieta),
	constraint fk_dieta_receita_login foreign key (cd_login)
	references usuario (cd_login)
);

CREATE TABLE denuncia_receita
(
	cd_receita int,
	cd_login_denunciado varchar(20),
	cd_login_denunciador varchar(20),
	dt_denuncia_receita datetime,
	ds_denuncia_receita varchar(150),
	ic_verificado boolean,
	constraint pk_denuncia_receita primary key (cd_receita, cd_login_denunciador, dt_denuncia_receita),
	constraint fk_denuncia_receita_receita foreign key (cd_receita, cd_login_denunciado)
	references receita (cd_receita, cd_login),
	constraint fk_denuncia_receita_login foreign key(cd_login_denunciador)
	references usuario(cd_login)
);

CREATE TABLE denuncia_comentario
(
	cd_receita int,
	cd_login_receita varchar(20),
	cd_login_denunciado varchar(20),
	cd_login_denunciador varchar(20),
	dt_comentario datetime,
	dt_denuncia_comentario datetime,
	ds_denuncia_comentario varchar(150),
	ic_verificado boolean,
	constraint pk_denuncia_comentario primary key (cd_login_denunciador, cd_receita,
	cd_login_receita, cd_login_denunciado, dt_denuncia_comentario),
	constraint fk_denuncia_comentario_usuario foreign key (cd_login_denunciador)
	references usuario(cd_login),
	constraint fk_denuncia_comentario_comentario foreign key (cd_receita, cd_login_receita, cd_login_denunciado, dt_comentario)
	references comentario(cd_receita, cd_login_destinatario, cd_login_remetente, dt_comentario)
);

CREATE TABLE denuncia_usuario
(
	cd_login_denunciador varchar(20),
	cd_login_denunciado varchar(20),
	dt_denuncia_usuario datetime,
	ds_denuncia_usuario varchar(150),
	ic_verificado bool,
	constraint pk_denuncia_usuario primary key (cd_login_denunciador, cd_login_denunciado, dt_denuncia_usuario),
	constraint fk_denuncia_usuario_denunciador foreign key (cd_login_denunciador)
	references usuario(cd_login),
	constraint fk_denuncia_usuario_denunciado foreign key (cd_login_denunciado)
	references usuario(cd_login)
);