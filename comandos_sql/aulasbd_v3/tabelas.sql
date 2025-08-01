CREATE TABLE Turma (
	id INT IDENTITY NOT NULL,
	nome VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Aluno (
	id INT IDENTITY NOT NULL,
	nome VARCHAR(100),
	telefones VARCHAR(20),
	idade INT,
	data_nascimento DATE,
	turma_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(turma_id) REFERENCES Turma(id)
)

