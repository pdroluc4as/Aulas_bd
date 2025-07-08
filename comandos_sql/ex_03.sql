CREATE TABLE Estado (
	sigla CHAR(2) NOT NULL,
	nome VARCHAR(30),
	PRIMARY KEY(sigla)
)

CREATE TABLE Cidade (
	id INT IDENTITY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	estado_id CHAR(2) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(estado_id) REFERENCES Estado(sigla)
)

CREATE TABLE Bairro (
	id INT IDENTITY NOT NULL,
	nome VARCHAR(30) NOT NULL,
	cidade_id INT NOT NULL,
	FOREIGN KEY(cidade_id) REFERENCES Cidade(id)
)

INSERT INTO Estado(sigla, nome) VALUES('RN', 'Rio Grande do Norte')
INSERT INTO Estado(sigla, nome) VALUES('CE', 'Ceara')

SELECT * FROM Estado



INSERT INTO Cidade(nome, estado_id) VALUES('Natal', 'RN')
INSERT INTO Cidade(nome, estado_id) VALUES('Extremoz', 'RN')
INSERT INTO Cidade(nome, estado_id) VALUES('Parnamirim', 'RN')

INSERT INTO Cidade(nome, estado_id) VALUES('Fortaleza', 'CE')
INSERT INTO Cidade(nome, estado_id) VALUES('Quixada', 'CE')
INSERT INTO Cidade(nome, estado_id) VALUES('Granja', 'CE')

SELECT * FROM Cidade

-- Natal RN
INSERT INTO Bairro(nome, cidade_id) VALUES('Rocas', 1)
INSERT INTO Bairro(nome, cidade_id) VALUES('Pitimbu', 1)
INSERT INTO Bairro(nome, cidade_id) VALUES('Bom Pastor', 1)
INSERT INTO Bairro(nome, cidade_id) VALUES('Capim Macio', 1)

INSERT INTO Bairro(nome, cidade_id) VALUES('Candelaria', 1)
-- Extremox RN
INSERT INTO Bairro(nome, cidade_id) VALUES('Praia de Genipabu', 2)
INSERT INTO Bairro(nome, cidade_id) VALUES('SportClub Natal', 2)
INSERT INTO Bairro(nome, cidade_id) VALUES('Dunas', 2)
INSERT INTO Bairro(nome, cidade_id) VALUES('Pitangui', 2)
INSERT INTO Bairro(nome, cidade_id) VALUES('Lagoa de Extremoz', 2)

-- Parnamirim RN
INSERT INTO Bairro(nome, cidade_id) VALUES('Bela Parnamirim', 3)
INSERT INTO Bairro(nome, cidade_id) VALUES('Boa Esperança', 3)
INSERT INTO Bairro(nome, cidade_id) VALUES('Emaus', 3)
INSERT INTO Bairro(nome, cidade_id) VALUES('Cidade Nova', 3)
INSERT INTO Bairro(nome, cidade_id) VALUES('Pirangi', 3)

-- Fortaleza CE
INSERT INTO Bairro(nome, cidade_id) VALUES('Bom Jardim',5)
INSERT INTO Bairro(nome, cidade_id) VALUES('Siqueira', 5)
INSERT INTO Bairro(nome, cidade_id) VALUES('Aracapé', 5)
INSERT INTO Bairro(nome, cidade_id) VALUES('Vila Velha', 5)
INSERT INTO Bairro(nome, cidade_id) VALUES('Jardim Guanabara', 5)

-- Quixada CE
INSERT INTO Bairro(nome, cidade_id) VALUES('Alto da Boa Vista', 6)
INSERT INTO Bairro(nome, cidade_id) VALUES('Alto São Francisco', 6)
INSERT INTO Bairro(nome, cidade_id) VALUES('Baviera', 6)
INSERT INTO Bairro(nome, cidade_id) VALUES('Boto', 6)
INSERT INTO Bairro(nome, cidade_id) VALUES('Campo Novo', 6)

-- Granja CE
INSERT INTO Bairro(nome, cidade_id) VALUES('Parazinho', 7)
INSERT INTO Bairro(nome, cidade_id) VALUES('Adrianopolis', 7)
INSERT INTO Bairro(nome, cidade_id) VALUES('Ibuguaçu', 7)
INSERT INTO Bairro(nome, cidade_id) VALUES('Pessoa Anta', 7)
INSERT INTO Bairro(nome, cidade_id) VALUES('Timonha', 7)

SELECT * FROM Bairro

/* Fazer um SELECT para retornar: 
nome do estado, nome da cidade e nome do bairro, ordenados pelo nome do estado, da cidade e do bairro. */
SELECT est.nome AS 'Estado',
	cid.nome AS 'Cidade',
	bai.nome AS 'Bairro'

FROM Cidade cid INNER JOIN Estado AS est ON cid.estado_id = est.sigla
	INNER JOIN Bairro AS bai ON bai.cidade_id = cid.id

ORDER BY est.nome, cid.nome, bai.nome