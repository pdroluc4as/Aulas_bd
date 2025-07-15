-- CLIENTES
INSERT INTO Cliente(nome, telefones) VALUES('João da Silva', '4444-5555') -- ID: 1 
INSERT INTO Cliente(nome, telefones) VALUES('Maria José', '3333-2222')	-- ID: 2
INSERT INTO Cliente(nome, telefones) VALUES('José Maria', '1111-9999')	-- ID: 3 

SELECT * FROM Cliente
-- CLIENTES

-- VENDEDOR
INSERT INTO Vendedor(nome) VALUES('Adriano da Silva')	-- ID: 1 
INSERT INTO Vendedor(nome) VALUES('Joana Pereira')	-- ID: 2 
INSERT INTO Vendedor(nome) VALUES('Meire Moura')	-- ID: 3 

SELECT * FROM Vendedor
-- VENDEDOR

-- CATEGORIAS
INSERT INTO Categoria(descricao) VALUES('Monitor')
INSERT INTO Categoria(descricao) VALUES('Processador')

SELECT * FROM Categoria
-- CATEGORIAS

-- PRODUTOS
	-- MONITORES
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('Samsung 22 polegadas', 235.00, 1)	-- ID: 1
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('Samsung 26 polegadas', 325.00, 1)	-- ID: 2
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('LG 22 polegadas', 244.90, 1)	-- ID: 3
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('LG 26 polegadas', 385.50, 1)	-- ID: 4
	-- MONITORES
	
	-- PROCESSADORES
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('Intel i3', 590.00, 2)	-- ID: 5
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('Intel i5', 690.00, 2)	-- ID: 6
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('Intel i7', 790.00, 2)	-- ID: 7
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('AMD 2,7GHZ', 495.50, 2)	-- ID: 8
INSERT INTO Produto(descricao, valor_unit, categoria_id) VALUES('AMD 3,5GHZ', 788.00, 2)	-- ID: 9
	-- PROCESSADORES

SELECT * FROM Produto
-- PRODUTOS

-- VENDAS
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-01-01', 1, 1, 1, 1, 235.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-01-11', 2, 2, 2, 2, 650.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-01-21', 3, 1, 3, 1, 244.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-01-31', 3, 2, 4, 1, 385.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-02-01', 1, 3, 5, 3, 1770.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-02-15', 2, 1, 6, 4, 2760.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-03-01', 1, 3, 7, 6, 4740.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-03-22', 2, 3, 8, 1, 495.00)
INSERT INTO Venda(data_venda, cliente_id, vendedor_id, produto_id, quant_produto, valor_total) VALUES('2025-03-31', 1, 2, 9, 1, 788.00)

SELECT * FROM Venda
-- VENDAS