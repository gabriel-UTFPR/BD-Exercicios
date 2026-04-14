drop table if exists PRODUTOS;

create table PRODUTOS(
 id serial,
 nome text not null,
 codigo_de_barras varchar(13) Unique not null,
 preco decimal(10,2) check(preco>0),
 desconto decimal(10,2) default 0.0,
 constraint verifica_desconto check(preco>=desconto),
 primary key (id)
);

INSERT INTO PRODUTOS (nome, codigo_de_barras, preco, desconto) VALUES
	('Arroz 5kg', '7891234567890', 25.90, 2.00),
	('Feijão 1kg', '7891234567891', 8.50, 0.50),
	('Macarrão 500g', '7891234567893', 4.75, 0.25),
	('Açúcar 1kg', '7891234567894', 3.80, 0.30);

INSERT INTO PRODUTOS (nome, codigo_de_barras, preco) VALUES
	('Óleo de Soja', '7891234567892', 6.99);