DROP TABLE IF EXISTS LINHA_DE_PESQUISA, PROFESSOR, ESTANTE, ARTIGO, PROJETO, PROFESSOR_TRABALHA_PROJETO ;

CREATE TABLE LINHA_DE_PESQUISA(
nome VARCHAR(200),
descricao varchar(500),
primary key(nome)
);

CREATE TABLE PROFESSOR(
nome VARCHAR(255),
num integer,
regime Varchar(100),
primary key(num)
);

CREATE TABLE ESTANTE(
codigo integer,
numeracao integer,
primary key(codigo)
);

CREATE TABLE PROJETO(
 titulo varchar(200),
 data_aprovacao date,
 orcamento decimal(10,2),
 nome_linha_pesquisa varchar(200),
 primary key(titulo),
 foreign key(nome_linha_pesquisa)
 references LINHA_DE_PESQUISA (nome)
);

CREATE TABLE ARTIGO(
ano integer,
titulo varchar(200),
nome_revista varchar(200),
codigo_estante integer,
titulo_projeto varchar(200),
primary key(titulo),
foreign key(titulo_projeto) references PROJETO(titulo),
foreign key(codigo_estante) references ESTANTE(codigo)
);

CREATE TABLE PROFESSOR_TRABALHA_PROJETO(
num_professor integer,
titulo_projeto varchar(200),
coordenador Boolean,
carga_horaria integer,
primary key(num_professor,titulo_projeto),
foreign key(num_professor) references PROFESSOR(num),
foreign key(titulo_projeto) references PROJETO(titulo)
);






