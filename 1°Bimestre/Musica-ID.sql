Drop table if exists ARTISTA,MUSICA;

create table ARTISTA (
id_artista SERIAL,
nome varchar(200) NOT NULL,
pais varchar(200) NOT NULL default 'brasil',
primary key(id_artista)
);

CREATE TABLE MUSICA(
id_musica SERIAL,
titulo varchar(500) NOT NULL,
duracao char(5) NOT NULL,
artista INTEGER,
primary key(id_musica),
foreign key(artista) references ARTISTA(id_artista)
);

INSERT INTO ARTISTA(nome,pais)
values('P.diddy','Estados Unidos'),
      ('Michael Jackson','Estados Unidos'),
      ('Justin Bieber','Estados Unidos');

INSERT INTO MUSICA (titulo, duracao,artista)
VALUES
('I''ll Be Missing You', '04:40',1),
('Bad Boy for Life', '04:13',1),
('Coming Home', '03:58',1),

( 'Billie Jean', '04:54',2),
( 'Thriller', '05:57',2),
( 'Beat It', '04:18',2),

( 'Baby', '03:34',3),
( 'Sorry', '03:20',3),
( 'Love Yourself', '03:53',3);