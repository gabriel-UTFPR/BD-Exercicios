
DROP TABLE ESPECIME,ESPECIE,ETIQUETA,ARMARIO,EXPEDICAO,PESQUISADOR;

CREATE TABLE ESPECIME(
 tombo integer,
 data_coleta date,
 maturacao varchar(200),
 primary key(tombo)
);

CREATE TABLE ESPECIE(
 nome_cientifico varchar(200),
 nome_popular varchar(200),
 familia_botanica varchar(200),
 primary ke

);