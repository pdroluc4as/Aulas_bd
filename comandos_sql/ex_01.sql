CREATE TABLE Departamento(
    id int identity(1,1) not null,
    nome varchar(30) not null,
    nomeDiretor varchar(90),
    ramal int,
    primary key(id)
)

CREATE TABLE Funcionario(
    id int identity(1,1) not null,
    nome varchar(90) not null,
    telefones varchar(20),
    idade int,
    dataNascimento date,
    endereco varchar(200),
    departamento_id int not null,
    primary key(id),
    FOREIGN KEY(departamento_id) REFERENCES Departamento(id)
)

INSERT INTO Departamento(nome, nomeDiretor, ramal) VALUES ('RH', 'José da Silva', 3001)
INSERT INTO Departamento(nome, nomeDiretor, ramal) VALUES ('Financeiro', 'Maria José', 3022)
INSERT INTO Departamento(nome, nomeDiretor, ramal) VALUES ('Compras', 'João', 3311)



INSERT INTO Funcionario(nome, telefones, idade, dataNascimento, endereco, departamento_id) 
	VALUES ('José da Silva', '3211-1221', 17, '19920325', 'Rua São José, 1221', 1)

INSERT INTO Funcionario(nome, telefones, idade, dataNascimento, endereco, departamento_id) 
	VALUES ('Maria Mariana', null, 16, '19910301', 'Av. Hermes da Fonseca, 121', 1)
    
INSERT INTO Funcionario(nome, telefones, idade, dataNascimento, endereco, departamento_id) 
	VALUES ('Marcos Silva', null, null, null, null, 1)

INSERT INTO Funcionario(nome, telefones, idade, dataNascimento, endereco, departamento_id) 
	VALUES ('Ivan Justo', '3211-8877', 17, '20020825', 'Rua São João, 21', 2)

INSERT INTO Funcionario(nome, telefones, idade, dataNascimento, endereco, departamento_id) 
	VALUES ('Cibele da Silva', null, 16, '19991225', 'Av. Hermes da Fonseca, 121', 2)

INSERT INTO Funcionario(nome, telefones, idade, dataNascimento, endereco, departamento_id) 
	VALUES ('Lúcia Gomes', null, null, null, null, 2)