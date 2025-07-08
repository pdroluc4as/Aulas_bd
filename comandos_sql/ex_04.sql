CREATE TABLE Categoria (
	id INT IDENTITY NOT NULL,
	descricao VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Carro (
	id INT IDENTITY NOT NULL,
	cor VARCHAR(30) NOT NULL,
	placa VARCHAR(8) NOT NULL,
	ano_fabricacao INT NOT NULL,
	preco NUMERIC(10,2) NOT NULL,
	modelo_id INT NOT NULL,
	categoria_id INT NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Modelo (
	id INT IDENTITY NOT NULL,
	descricao VARCHAR(30) NOT NULL,
	fabricante_id INT NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Fabricante (
	id INT IDENTITY NOT NULL,
	descricao VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
)

/* 4 categorias, sendo elas: Hatch, Sedã, Picape e Utilitário;
3 fabricantes;
3 modelos para cada fabricante;
3 carros para cada modelo; */

-- Categorias
INSERT INTO Categoria(descricao) VALUES('Hatch')
INSERT INTO Categoria(descricao) VALUES('Sedã')
INSERT INTO Categoria(descricao) VALUES('Picape')
INSERT INTO Categoria(descricao) VALUES('Utilitário')

SELECT * FROM Categoria

-- Fabricantes
INSERT INTO Fabricante(descricao) VALUES('Toyota')
INSERT INTO Fabricante(descricao) VALUES('Volkswagen')
INSERT INTO Fabricante(descricao) VALUES('Ford')

SELECT * FROM Fabricante


-- Fabricante: Toyota
INSERT INTO Modelo(descricao, fabricante_id) VALUES('SUVs', 1)
INSERT INTO Modelo(descricao, fabricante_id) VALUES('Sedans', 1)
INSERT INTO Modelo(descricao, fabricante_id) VALUES('Elétricos e Híbridos', 1)

-- Fabricante: Volkswagen
INSERT INTO Modelo(descricao, fabricante_id) VALUES('SUVs', 2)
INSERT INTO Modelo(descricao, fabricante_id) VALUES('Sedans', 2)
INSERT INTO Modelo(descricao, fabricante_id) VALUES('Elétricos e Híbridos', 2)

-- Fabricante: Ford
INSERT INTO Modelo(descricao, fabricante_id) VALUES('SUVs', 3)
INSERT INTO Modelo(descricao, fabricante_id) VALUES('Sedans', 3)
INSERT INTO Modelo(descricao, fabricante_id) VALUES('Elétricos e Híbridos', 3)

SELECT * FROM Modelo

-- Modelo: SUVs(1) Fabricante: Toyota(1)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Azul', 'ABC12345', 2005, 100000.00, 1, 1)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Vermelho', 'FFG34579', 2006, 100000.00, 1, 2)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Amarelo', 'SSH64809', 2007, 150000.00, 1, 3)


-- Modelo: Sedans(2) Fabricante: Volkswagen(2)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Azul', 'XXA13795', 2010, 90000.00, 2, 4)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Vermelho', 'JQW33770', 2006, 100000.00, 2, 3)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Amarelo', 'VXZ54675', 2008, 200000.00, 2, 2)

-- Modelo: Eletricos e Hibridos(2) Fabricante: Ford(3)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Azul', 'LLK13197', 2009, 90000.00, 3, 1)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Vermelho', 'PPU33770', 2007, 100000.00, 3, 2)
INSERT INTO Carro(cor, placa, ano_fabricacao, preco, modelo_id, categoria_id) 
		VALUES('Amarelo', 'MVN35665', 2007, 200000.00, 3, 3)

SELECT * FROM Carro


/*Fazer um SELECT para retornar os dados da tabela Carro, juntamente com as descrições sobre Categoria, Modelo e Fabricante.
Ordenar o resultado por: descrição do fabricante, descrição do modelo e ano de fabricação do carro;*/

SELECT fab.descricao AS 'Fabricante',
	mode.descricao AS 'Modelo',
	car.ano_fabricacao AS 'Ano de Fabricação',
	car.cor AS 'Cor',
	car.placa AS 'Placa',
	car.preco AS 'Preço',
	cat.descricao AS 'Categoria'

FROM Carro car INNER JOIN Modelo AS mode ON car.modelo_id = mode.id
	INNER JOIN Fabricante AS fab ON mode.fabricante_id = fab.id
	INNER JOIN Categoria AS cat ON car.categoria_id = cat.id
ORDER BY fab.descricao, mode.descricao, car.ano_fabricacao