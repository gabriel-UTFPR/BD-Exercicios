create table ALUNO(
	cpf integer(11),
	nome varchar(200),
	data_nascimento date,
	telefone integer,
	plano integer foreign key(plano) references PLANO(id_plano),
	unidade integer foreign key(unidade) references UNIDADE(id_unidade),
	primary key(cpf)
);

create table ALUNO_TREINO(
	cpf_aluno char(11),
	treino integer,
	foreign key(cpf_aluno) references ALUNO(cpf),
	foreign key (treino) references TREINO(id_treino),
	primary key(cpf_aluno,treino)
)

create table PLANO(
	id_plano serial,
	tipo varchar(50),
	primary Key(id_plano)
);

create table UNIDADE(
	id_unidade serial,
	endereco varchar(200),
	primary key (id_unidade)
);

create table EQUIPAMENTO(
	id_equipamento serial,
	nome varchar(200),
	marca varchar(100),
	primary key(id_equipamento)
);

create table GERENTE(
	nome varchar(200),
	cpf char(11),
	primary key(cpf)
);

create table INSTRUTOR(
	cpf char(11),
	nome varchar(200),
	especialidade varchar(200),
	primary key(cpf)
);

create table TREINO(
	id_treino serial,
	nome varchar(200),
	primary key(id_treino)
);