drop table if exists DEPARTAMENTO,PROFESSOR,DISCIPLINA,REGISTRO_SEMESTRAL,ALUNO,MATRICULA;

create table DEPARTAMENTO(

	codigo integer,
	nome varchar(300),
	telefone integer,
	localizacao varchar(500),
	primary key(codigo)
);

create table PROFESSOR(

	matricula int,
	nome varchar(300),
	titulacao varchar(300),
	especialidade varchar(200),
	email varchar(500),
	departamento int,
	primary key(matricula),
	foreign key(departamento) references DEPARTAMENTO(codigo)
);

create table DISCIPLINA(

	codigo int,
	maximo int,
	carga_horaria int,
	nome varchar(300),
	primary key(codigo)
);

create table REGISTRO_SEMESTRAL(
	professor int,
	disciplina int,
	ano int,
	semestre int,
	foreign key(professor) references PROFESSOR(matricula),
	foreign key(disciplina) references DISCIPLINA(codigo),
	primary key(professor,disciplina)
);

create table ALUNO(

	registro_academico int,
	nome varchar(300),
	cpf char(11) primary key,
	data_nascimento date,
	curso varchar(400)	
);

create table MATRICULA(

	aluno char(11),
	disciplina int,
	nota decimal(3,1),
	situacao varchar(40),
	data_matricula date not null default current_date,
	foreign key(aluno) references ALUNO(cpf),
	foreign key(disciplina) references DISCIPLINA(codigo),
	primary key(aluno,disciplina)
);

INSERT INTO DEPARTAMENTO(codigo,nome,telefone,localizacao)
VALUES
(1,'Departamento de Computação',449998877,'Bloco A'),
(2,'Departamento de Matemática',449977665,'Bloco B'),
(3,'Departamento de Física',449955443,'Bloco C');



INSERT INTO PROFESSOR
(matricula,nome,titulacao,especialidade,email,departamento)
VALUES
(1001,'Carlos Henrique','Doutor',
'Banco de Dados',
'carlos@universidade.br',1),

(1002,'Fernanda Lima','Mestre',
'Estrutura de Dados',
'fernanda@universidade.br',1),

(1003,'Ricardo Souza','Doutor',
'Cálculo',
'ricardo@universidade.br',2),

(1004,'Juliana Alves','Pós-Doutora',
'Física Experimental',
'juliana@universidade.br',3);



INSERT INTO DISCIPLINA
(codigo,maximo,carga_horaria,nome)
VALUES
(10,40,80,'Banco de Dados'),

(11,35,60,'Estrutura de Dados'),

(12,50,60,'Cálculo I'),

(13,30,40,'Física Experimental');



INSERT INTO REGISTRO_SEMESTRAL
(professor,disciplina,ano,semestre)
VALUES
(1001,10,2026,1),

(1001,11,2026,1),

(1003,12,2026,1),

(1004,13,2026,1);



INSERT INTO ALUNO
(registro_academico,nome,cpf,data_nascimento,curso)
VALUES
(2001,'Gabriel Martins','12345678901',
'2005-04-10','Sistemas de Informação'),

(2002,'Ana Beatriz','98765432100',
'2004-08-21','Ciência da Computação'),

(2003,'Lucas Pereira','11122233344',
'2003-01-15','Matemática'),

(2004,'Mariana Costa','55566677788',
'2005-11-30','Física');



INSERT INTO MATRICULA
(aluno,disciplina,nota,situacao,data_matricula)
VALUES
('12345678901',10,8.5,'Aprovado','2026-05-06'),

('12345678901',11,7.0,'Cursando','2026-02-10'),

('98765432100',10,9.5,'Aprovado','2026-02-11'),

('11122233344',12,6.8,'Cursando','2026-02-12'),

('55566677788',13,8.9,'Aprovado','2026-02-15');


