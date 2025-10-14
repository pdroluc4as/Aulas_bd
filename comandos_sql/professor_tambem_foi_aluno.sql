
-- 1 - Retornar, sem duplicação, os valores do campo UF da tabela de Municípios. Ordenar pelo nome da UF.
DROP VIEW IF EXISTS view_ex_01

CREATE VIEW view_ex_01 AS 
SELECT DISTINCT 
	uf
FROM Municipio 

SELECT * FROM view_ex_01 ORDER BY uf

-- 2 - Retornar os nomes dos cursos que possuem >= 2000 ofertas, ordenados inversamente por quantidade de ofertas.
DROP VIEW IF EXISTS view_ex_02;

CREATE VIEW view_ex_02 AS
SELECT 
	c.nome,
	COUNT(coc.id_curso) AS Ofertas
FROM Cursos_Oferecidos_por_Campus AS coc
LEFT JOIN Curso c ON coc.id_curso = c.id_curso
GROUP BY c.nome
HAVING COUNT(coc.id_curso) >= 2000;


SELECT 
 *
FROM view_ex_02
ORDER BY -Ofertas;

-- 3 - Retornar a média do ENADE agrupada por área e curso, somente para aquelas áreas e cursos com a média do ENADE >= 3. Ordenar por área e curso
DROP VIEW IF EXISTS view_ex_03

CREATE VIEW view_ex_03 AS
SELECT 
	a.descricao AS Area,
	c.nome AS Curso,
	FORMAT(AVG(coc.enade), 'N2') AS Enade
FROM Cursos_Oferecidos_por_Campus AS coc 
LEFT JOIN Curso c ON c.id_curso = coc.id_curso
LEFT JOIN Area a ON a.id_area = coc.id_area
GROUP BY a.descricao, c.nome
HAVING AVG(coc.enade) >= 3 

SELECT * FROM view_ex_03 ORDER BY Area, Curso



 
 
