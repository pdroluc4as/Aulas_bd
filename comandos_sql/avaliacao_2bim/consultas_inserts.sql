/* Retornar todos os campos da tabela Produto, juntamente com as descri��es de suas
categorias. Ordene os registros por: descri��o da categoria e descri��o do produto; */

-- 3) A
SELECT prod.id as "id" ,
	prod.descricao AS "Descricao",
	prod.valor_unit AS "Valor Unitario",
	cat.descricao AS "Categoria"

FROM Produto prod INNER JOIN Categoria cat ON prod.categoria_id = cat.id

ORDER BY cat.descricao, prod.descricao

/* ************************************************************************************ */

/* Retornar a data e o valor total da tabela Vendas, juntamente com as descricoeses dos
produtos e os nomes dos clientes e dos vendedores. Ordene os registros por: data da
venda em ordem decrescente. */


-- 3) B
SELECT ven.id AS "id",
	FORMAT(ven.data_venda, 'dd-MM-yyyy') AS "data_venda",
	ven.valor_total AS "valor_total",
	prod.descricao AS "produto",
	cli.nome AS "nome_cliente",
	vend.nome AS "nome_vendedor"

FROM Venda ven 
    INNER JOIN Produto prod ON ven.produto_id = prod.id

    INNER JOIN Cliente cli ON ven.cliente_id = cli.id
	
    INNER JOIN Vendedor vend ON ven.vendedor_id = vend.id

ORDER BY ven.data_venda DESC

SELECT * FROM Venda

SELECT
    v.id,
    V.data_venda AS "data_venda",
    V.valor_total AS "valor_total",
    P.descricao AS "produto",
    C.nome AS "nome_cliente",
    Ve.nome AS "nome_vendedor"
FROM
    Venda AS V
INNER JOIN
    Cliente AS C ON V.cliente_id = C.id
INNER JOIN
    Vendedor AS Ve ON V.vendedor_id = Ve.id
INNER JOIN
    Produto AS P ON V.produto_id = P.id
ORDER BY
    V.data_venda DESC;
