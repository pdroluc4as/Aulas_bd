CREATE TABLE Cliente (
	id INT IDENTITY NOT NULL,
	nome VARCHAR(100) NOT NULL,
	telefones VARCHAR(20),
	PRIMARY KEY(id)
)

CREATE TABLE Vendedor (
	id INT IDENTITY NOT NULL,
	nome VARCHAR(100) NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Categoria (
	id INT IDENTITY NOT NULL,
	descricao VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Produto (
	id INT IDENTITY NOT NULL,
	descricao VARCHAR(80) NOT NULL,
	valor_unit NUMERIC(10,2) NOT NULL,
	categoria_id INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(categoria_id) REFERENCES Categoria(id)
)


CREATE TABLE Venda (
	id INT IDENTITY NOT NULL,
	data_venda DATE NOT NULL,
	cliente_id INT NOT NULL,
	vendedor_id INT NOT NULL,
	produto_id INT NOT NULL,
	quant_produto INT NOT NULL,
	valor_total NUMERIC(10,2) NOT NULL,
	PRIMARY KEY(id),

	FOREIGN KEY(cliente_id) REFERENCES Cliente(id),
	FOREIGN KEY(vendedor_id) REFERENCES Vendedor(id),
	FOREIGN KEY(produto_id) REFERENCES Produto(id)
)