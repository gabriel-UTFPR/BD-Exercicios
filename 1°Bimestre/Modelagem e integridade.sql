drop table if exists MARCAS,CARROS;

create table MARCAS(
	id_marca serial,
	nome varchar(200) unique not null,
	primary key(id_marca)
);

create table CARROS(
	modelo varchar(20) not null,
	placa char(8) unique not null,
	ano integer check(ano>=1900 and ano<=2027),
	valor_diaria decimal(10,2) check(valor_diaria>0),
	marca_id integer,
	foreign key(marca_id) references MARCAS(id_marca),
	primary key (placa),
	constraint verifica_ano check( ano!=2024 or valor_diaria>200)
);

insert into MARCAS(nome) values
('Honda'),('Ferrari');

insert into CARROS(modelo,placa,ano,valor_diaria,marca_id) values
	('Civic','HND-2024',2024,250,1),
	('Purosangue','FGJ-2025',2025,300,2),
	('Fusion','ABC-1234',2019,200,1),
	('City','ABD-1234',2020,400,1);

update CARROS
	set valor_diaria = valor_diaria*1.1
	where modelo='Civic';

update CARROS
	set valor_diaria = valor_diaria-50
	where modelo='Civic';	

update CARROS
	set valor_diaria = 500
	where modelo='Purosangue';

select * from CARROS;	

