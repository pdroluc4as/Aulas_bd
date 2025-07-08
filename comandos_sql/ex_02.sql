CREATE TABLE Turma (
	id INT IDENTITY,
	nome VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Alunos (
	id INT IDENTITY,
	nome VARCHAR(90) NOT NULL,
	telefones VARCHAR(20),
	idade INT,
	data_nascimento DATE,
	turma_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(turma_id) REFERENCES Turma(id)
)


INSERT INTO Turma(nome) VALUES('Matemática')
INSERT INTO Turma(nome) VALUES('Banco de Dados')
INSERT INTO Turma(nome) VALUES('Inglês')

INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Pedro', '11111111', 18, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Lucas', '22222222', 18, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Heitor', '33333333', 16, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Arthur', '44444444', 13, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Afonso', '55555555', 17, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Justo', '66666666', 17, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Hatsune', '77777777', 17, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Leão Dourado', '88888888', 3, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Alec', '99999999', 24, 1)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Eles', '00000000', 999, 1)

INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Pedro', '11111111', 18, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Lucas', '22222222', 18, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Heitor', '33333333', 16, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Arthur', '44444444', 13, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Afonso', '55555555', 17, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Justo', '66666666', 17, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Hatsune', '77777777', 17, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Leão Dourado', '88888888', 3, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Alec', '99999999', 24, 2)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Eles', '00000000', 999, 2)

INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Pedro', '11111111', 18, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Lucas', '22222222', 18, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Heitor', '33333333', 16, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Arthur', '44444444', 13, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Afonso', '55555555', 17, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Justo', '66666666', 17, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Hatsune', '77777777', 17, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Leão Dourado', '88888888', 3, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Alec', '99999999', 24, 3)
INSERT INTO Alunos(nome, telefones, idade, turma_id) VALUES('Eles', '00000000', 999, 3)
	
SELECT * FROM Alunos

/* Fazer um SELECT para retornar: 
nome da turma, nome do aluno e idade do aluno, ordenados pelo nome da turma e pelo nome do aluno. */

SELECT tur.nome as 'Turma',
	   alu.nome,
	   alu.idade

FROM Alunos alu INNER JOIN Turma tur ON tur.id = alu.turma_id

ORDER BY tur.nome, alu.nome
		