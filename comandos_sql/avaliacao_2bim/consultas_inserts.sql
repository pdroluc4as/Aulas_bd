/* Retornar todos os campos da tabela Produto, juntamente com as descrições de suas
categorias. Ordene os registros por: descrição da categoria e descrição do produto; */

-- 3) A
SELECT prod.id as "id" ,
	prod.descricao AS "Descrição",
	prod.valor_unit AS "Valor Unitário",
	cat.descricao AS "Categoria"

FROM Produto prod INNER JOIN Categoria cat ON prod.categoria_id = cat.id

ORDER BY cat.descricao, prod.descricao

/* ************************************************************************************ */

/* Retornar a data e o valor total da tabela Vendas, juntamente com as descrições dos
produtos e os nomes dos clientes e dos vendedores. Ordene os registros por: data da
venda em ordem decrescente. */


-- 3) B
SELECT ven.id AS "id",
	FORMAT(ven.data_venda, 'dd-MM-yyyy') AS "Data Venda",
	ven.valor_total AS "Valor Total",
	prod.descricao AS "Produto",
	cli.nome AS "Nome do Cliente",
	vend.nome AS "Nome Vendedor"

FROM Venda ven INNER JOIN Produto prod ON ven.produto_id = prod.id
	INNER JOIN Cliente cli ON ven.cliente_id = cli.id
	INNER JOIN Vendedor vend ON ven.vendedor_id = ven.id

ORDER BY ven.data_venda DESC

SELECT 
    ven.id AS "id",
    FORMAT(ven.data_venda, 'dd-MM-yyyy') AS "Data Venda",
    ven.valor_total AS "Valor Total",
    STRING_AGG(prod.descricao, ', ') AS "Produtos", -- Agrega os produtos
    cli.nome AS "Nome do Cliente",
    vend.nome AS "Nome Vendedor"
FROM 
    Venda ven 
INNER JOIN 
    Produto prod ON ven.produto_id = prod.id
INNER JOIN 
    Cliente cli ON ven.cliente_id = cli.id
INNER JOIN 
    Vendedor vend ON ven.vendedor_id = ven.id
GROUP BY -- Adiciona a cláusula GROUP BY
    ven.id,
    ven.data_venda,
    ven.valor_total,
    cli.nome,
    vend.nome
ORDER BY 
    ven.data_venda DESC;

SELECT * FROM Venda