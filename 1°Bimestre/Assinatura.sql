Drop table if exists ASSINATURA;
Create table ASSINATURA(
	id serial,
	cliente varchar(200) not null,
	plano varchar(200) not null,
	data_inicio timestamp default now() ,
	proxima_cobranca date,
	primary key(id)
);

INSERT INTO ASSINATURA (cliente, plano, data_inicio, proxima_cobranca) VALUES 
('João Silva', 'mensal', '2026-05-10 10:00:00', '2026-06-10'),
('Maria Oliveira', 'anual', '2026-05-15 10:00:00', '2027-05-15'),
('Carlos Souza', 'trimestral', '2026-05-20 10:00:00','2026-08-20');

update ASSINATURA
	set proxima_cobranca = proxima_cobranca +interval '1 month'
	where id=3;

	select * from Assinatura