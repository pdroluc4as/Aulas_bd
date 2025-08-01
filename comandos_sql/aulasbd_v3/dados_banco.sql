INSERT INTO Turma(nome) VALUES('Matemática')
INSERT INTO Turma(nome) VALUES('Portugues')

SELECT * FROM Turma

-- TURMA MATEMATICA
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('Pedro Lucas', '666-666', 99, '20060606', 1)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('José Pinto', '669-696', 21, '20040911', 1)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('emerso', '848-848', 17, '20080123', 1)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('giovany', '541-974', 18, '20070403', 1)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('matematico', '778-888', 18, '20060821', 1)

-- TURMA portugues
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('Desgraça Alheia', '777-777', 99, '20080401', 2)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('Outros Parasitas', '746-126', 15, '20090403', 2)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('Pqno Feliz', '347-841', 18, '20070103', 2)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('Tristeza e Depressão', '123-123', 34, '19910524', 2)
INSERT INTO Aluno(nome, telefones, idade, data_nascimento, turma_id) VALUES('Outras Desgraças', '444-481', 29, '19960925', 2)

SELECT * FROM Aluno