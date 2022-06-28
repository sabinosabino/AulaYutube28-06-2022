use ProjetoAccessSqlServer;

CREATE TABLE Clientes(
	Id int Identity(1,1) primary key,
	Nome varchar(100),
	Telefone varchar(20),
	DataCadastro datetime
);

select * from Clientes;

CREATE TABLE Produtos(
	Id int Identity(1,1) primary key,
	Nome varchar(100),
	ValorCompra Decimal(10,2),
	PorcentagemVenda Decimal(4,2)
	);

Select * from Produtos;

CREATE TABLE Vendas(
	Id int Identity(1,1) primary key,
	DataVenda datetime,
	ClienteId int,
);

ALTER TABLE Vendas
Add Foreign Key (ClienteId) References Clientes(Id);

select * from Vendas;




Select V.Id, DataVenda, ClienteId, c.Nome
from Vendas as V
Inner join Clientes as C ON C.Id=v.ClienteId;

CREATE TABLE DetalhesVenda(
	Id int Identity(1,1) primary key,
	VendaId int,
	ProdutoId int,
	Qtd decimal(8,2),
	ValorTotal decimal(10,2)
);

ALTER TABLE DetalhesVenda
ADD ValorUnitario Decimal(10,2);

ALTER TABLE DetalhesVenda
ADD CONSTRAINT ProdutoVenda UNIQUE (VendaId,ProdutoId);

select * from DetalhesVenda;

ALTER TABLE DetalhesVenda
Add Foreign key(VendaId) References Vendas(Id);

