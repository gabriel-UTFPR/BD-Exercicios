DROP TABLE IF EXISTS USUARIO,EVENTOS;

select current_date + interval '1 day' + time '09:00:00';
select date '2026-05-10'+interval '45 days';
select age(current_date,'2022-03-15');

create table USUARIO(

	ultimo_acesso date
);

insert into USUARIO(ultimo_acesso) values

('2026-01-15'),
('1945-12-31'),
('2020-06-10'),
('1999-03-25'),
('2005-11-08');

select * from USUARIO where ultimo_acesso< current_date-interval '6 months';

select justify_interval (interval '1 week 3 days'*8);

select current_date - date'2010-05-06' as idade;

select (current_date+ interval'5years 2months')::date as vencimento_cartão;

select interval '90 days'/4 as intervalo_dividido;

select now()+interval'12 hours'as hora;

create table EVENTOS(

	evento varchar(200) primary key,
	data_evento date unique
);
INSERT INTO EVENTOS(evento,data_evento)
VALUES
('Workshop de PostgreSQL','2026-05-20'),

('Feira de Tecnologia','2026-06-15'),

('Palestra sobre IA','2026-07-01'),

('Semana Acadêmica','2026-08-10'),

('Hackathon Universitário','2026-09-05'),

('Curso de JavaScript','2026-10-12'),

('Congresso de Banco de Dados','2026-05-18'),

('Treinamento de Redes','2026-12-03');

select * from EVENTOS where data_evento>current_date and data_evento<current_date+ interval'15days 6hours';
