CREATE TABLE Cliente (
	id INT IDENTITY NOT NULL,
	nome VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	primary key(id)
)



create table Veiculo(
	id int identity not null,
	fabricante varchar(60) not null,
	modelo varchar(60) not null,
	ano_fabricacao int not null,
	placa varchar(8) not null,
	uf varchar(2) not null,
	primary key(id)
)

INSERT INTO Veiculo(fabricante, modelo, ano_fabricacao, placa, uf) VALUES('pedro', 'davielucas', '1980', 'ABC-1254', 'PR')

select * from Veiculo