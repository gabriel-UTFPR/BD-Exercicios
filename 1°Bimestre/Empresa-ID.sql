
	DROP TABLE IF EXISTS CLIENTE,PEDIDO,ENTREGA,FORNECEDOR,PRODUTOS,PEDIDO_PRODUTOS,GERENTE,FILIAL,FILIAL_FORNECEDOR,SETOR,FUNCIONARIO;

	Create Table CLIENTE(

	id_cliente serial primary key,
	cpf numeric(11) not null unique,
	nome varchar(500) not null,
	email varchar(400) not null,
	telefone char(9) not null unique
	);

	Create Table PEDIDO(

	id_pedido serial primary key,
	data_pedido date not null default current_date,
	valor_total decimal(10,2) not null,
	cliente integer not null ,
	constraint verifica_total check(valor_total>0),
	foreign key(cliente) references CLIENTE(id_cliente)
	);

	Create Table ENTREGA(

	id_entrega serial primary key,
	cod_rastreio varchar(20) not null unique,
	data_envio date not null default current_date,
	pedido integer not null,
	foreign key(pedido) references PEDIDO(id_pedido),
	constraint verifica_pedido unique(pedido)
	);

	Create Table FORNECEDOR(

	cnpj numeric(14) unique not null primary key,
	nome varchar(500) not null,
	telefone char(9) not null unique
	);

	Create Table PRODUTOS(

	codigo_produto numeric(13) not null unique primary key,
	nome varchar(200) not null,
	preco decimal(10,2) not null,
	estoque integer not null default 0,
	fornecedor numeric(14) not null,
	constraint verifica_preco check(preco>0),
	foreign key(fornecedor) references FORNECEDOR(cnpj)
	);
	
	Create Table PEDIDO_PRODUTOS(

	produtos numeric(13),
	pedido integer,
	quantidade integer not null check(quantidade>0),
	primary key(produtos,pedido),
	foreign key(produtos) references PRODUTOS(codigo_produto),
	foreign key(pedido) references PEDIDO(id_pedido)
	);

	Create Table GERENTE(

	cpf numeric(11) primary key not null,
	nome varchar(300) not null,
	telefone char(9) not null unique
	);
	
	Create Table FILIAL(

	id_filial serial primary key,
	endereco varchar(400) not null unique,
	cidade varchar(100) not null,
	gerente numeric(11) not null,
	foreign key(gerente) references GERENTE(cpf),
	constraint verifica_gerente unique(gerente)
	);

	Create Table FILIAL_FORNECEDOR(

	filial integer not null,
	fornecedor numeric(14) not null,
	foreign key(filial) references FILIAL(id_filial),
	foreign key(fornecedor) references FORNECEDOR(cnpj),
	primary key(filial,fornecedor)
	);

	Create Table SETOR(

	id_setor serial primary key,
	nome varchar(200) unique not null
	);

	Create Table FUNCIONARIO(

	cpf numeric(11) not null primary key,
	nome varchar(300),
	cargo varchar(300),
	setor integer,
	foreign key(setor) references SETOR(id_setor)
	);

	
	