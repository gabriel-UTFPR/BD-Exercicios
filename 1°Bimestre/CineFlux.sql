DROP TABLE  IF EXISTS ASSISTE,PLANO, USUARIO, FILME, HISTORICO ;

CREATE TABLE PLANO(
nome varchar(100),
qualidade varchar(10),
valor integer,
codigo varchar(20),
primary key(codigo)
);

CREATE TABLE USUARIO(
id_usuario serial,
nome varchar(500),
email varchar(500),
data_nacimento date,
plano varchar(200),
primary key(id_usuario),
foreign key(plano) references PLANO(codigo)
);

CREATE TABLE FILME(
duracao integer,
genero varchar(100),
titulo varchar(300),
codigo varchar(20),
primary key(codigo)
);

CREATE TABLE ASSISTE(
codigo_filme varchar(20),
id_usuario varchar(500),

foreign key(codigo_filme) references FILME(codigo),
foreign key(id_usuario) references USUARIO(id_usuario),
primary key(codigo_filme,email)
);

CREATE TABLE HISTORICO(
id_hist serial,
data_vis date,
cod_filme integer,
id_usuario integer,
foreign key(cod_filme,id_usuario) references ASSISTE(cod_filme,id_usuario),
primary key(id_hist)
);
