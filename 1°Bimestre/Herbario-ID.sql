DROP TABLE IF EXISTS ETIQUETA, EXPEDICAO_PESQUISADOR, ESPECIME, EXPEDICAO, PESQUISADOR, ESPECIE, ARMARIO;

CREATE TABLE ESPECIE(
  nome VARCHAR(200),
  nome_popular VARCHAR(200),
  familia VARCHAR(200),
  PRIMARY KEY(nome)
);

CREATE TABLE ARMARIO(
  num INTEGER,
  capacidade_maxima INTEGER,
  PRIMARY KEY(num)
);

CREATE TABLE PESQUISADOR(
  cpf CHAR(11),
  nome VARCHAR(200),
  instituicao VARCHAR(200),
  PRIMARY KEY (cpf)
);

CREATE TABLE EXPEDICAO(
  nome VARCHAR(200),
  bioma VARCHAR(200),
  data_expedicao DATE,
  PRIMARY KEY (nome)
);

CREATE TABLE ESPECIME(
  tombo INTEGER,
  data_coleta DATE,
  estagio VARCHAR(200),
  nome_especie VARCHAR(200),
  nome_expedicao VARCHAR(200),
  num_armario INTEGER,
  PRIMARY KEY(tombo),
  FOREIGN KEY(nome_especie) REFERENCES ESPECIE(nome),
  FOREIGN KEY(nome_expedicao) REFERENCES EXPEDICAO(nome),
  FOREIGN KEY(num_armario) REFERENCES ARMARIO(num)
);

CREATE TABLE EXPEDICAO_PESQUISADOR(
   cpf CHAR(11),
   nome_expedicao VARCHAR(200),
   funcao VARCHAR(200),
   PRIMARY KEY (cpf, nome_expedicao),
   FOREIGN KEY(cpf) REFERENCES PESQUISADOR(cpf),
   FOREIGN KEY(nome_expedicao) REFERENCES EXPEDICAO(nome)
);

CREATE TABLE ETIQUETA(
   codigo_hexadecimal CHAR(100),
   fabricante VARCHAR(200),
   tombo_especime INTEGER,
   PRIMARY KEY (codigo_hexadecimal),
   UNIQUE (tombo_especime),
   FOREIGN KEY (tombo_especime) REFERENCES ESPECIME(tombo)
)