from django.shortcuts import render

import pyodbc
from .util_conexao import *


def home(request):
    # define a página HTML (template) que deverá será carregada
    template = 'home.html'
    return render(request, template)


def dados_gerais(request):
    # define a página HTML (template) que deverá será carregada
    template = 'dados_gerais.html'
    try:
        # obtem a conexao com o BD
        conexao = obter_conexao()

        # define um cursor para executar comandos SQL
        cursor = conexao.cursor()

        # obtem a quantidade de registros de Instituicoes Financeiras
        sql = 'SELECT count(*) FROM IES '
        # obtem o valor retornado usando "fetchval"
        count_ies = cursor.execute(sql).fetchval()

        # obtem a quantidade de registros de Cursos
        sql = 'SELECT count(*) FROM campus '
        count_campus = cursor.execute(sql).fetchval()

        # obtem a quantidade de registros de Cursos
        sql = 'SELECT count(*) FROM curso '
        count_cursos = cursor.execute(sql).fetchval()

        # obtem a quantidade de registros de Cursos
        sql = 'SELECT count(*) FROM cursos_oferecidos_por_campus '
        count_ofertas = cursor.execute(sql).fetchval()

        # obtem a quantidade de registros de Cursos
        sql = 'SELECT count(*) FROM area '
        count_areas = cursor.execute(sql).fetchval()

        # define a pagina a ser carregada, adicionando os registros das tabelas 
        return render(request, template, 
                    context={
                          'count_ies': count_ies,
                          'count_campus': count_campus,
                          'count_cursos': count_cursos,
                          'count_ofertas': count_ofertas,
                          'count_areas': count_areas,
                    })
    
    # se ocorreu algunm erro, insere a mensagem para ser exibida no contexto da página 
    except Exception as err:
        return render(request, template, context={'ERRO': err})

def campi_por_UF(request):
    template = "campi_uf.html"

    try:
        conexao = obter_conexao()

        cursor = conexao.cursor()

        sql = '''
             -- Consulta para contar a quantidade de campi por UF.
            SELECT
                m.uf,
                COUNT(c.id_campus) AS quantidade
            FROM
                Campus AS c
            JOIN
                Municipio AS m ON c.id_municipio = m.id_municipio
            GROUP BY
                m.uf
            ORDER BY
                m.uf
        '''

        dados = cursor.execute(sql).fetchall()

        return render(request, template, 
                    context={
                          'dados_campi': dados,
                    })
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})

def cursos_por_area(request):
    template = "cursos_area.html"

    try:
        conexao = obter_conexao()

        cursor = conexao.cursor()

        sql = '''
              -- Consulta para contar a quantidade de cursos ofertados por área.
            SELECT
                a.descricao AS area_conhecimento,
                COUNT(coc.id) AS quantidade_cursos
            FROM
                Cursos_Oferecidos_por_Campus AS coc
            JOIN
                Area AS a ON coc.id_area = a.id_area
            GROUP BY
                a.descricao
            ORDER BY
                a.descricao;
        '''

        dados = cursor.execute(sql).fetchall()

        return render(request, template, 
                    context={
                          'dados_cursos': dados,
                    })
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})

def ranking_por_municipio(request):
    template = "ranking_municipio.html"

    try:
        conexao = obter_conexao()

        cursor = conexao.cursor()

        sql = '''
              SELECT TOP 15
                m.nome AS municipio,
                m.uf,
                COUNT(c.id_campus) AS quantidade_de_campi
            FROM
                Campus AS c
            JOIN
                Municipio AS m ON c.id_municipio = m.id_municipio
            GROUP BY
                m.nome, m.uf
            ORDER BY
                quantidade_de_campi DESC
        '''

        dados = cursor.execute(sql).fetchall()

        return render(request, template, 
                    context={
                          'dados_ranking': dados,
                    })
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})

def ranking_ofertas_por_uf(request):
    template = "ranking_ofertas_uf.html"

    try:
        conexao = obter_conexao()

        cursor = conexao.cursor()

        sql = '''
              -- Consulta para ranking de cursos com mais ofertas por UF (ENADE >= 2.5).
            WITH RankingCursosPorUF AS (
                SELECT
                    m.uf,
                    c.nome AS nome_curso,
                    COUNT(coc.id) AS total_ofertas,
                    AVG(coc.enade) AS media_enade,
                    MIN(coc.enade) AS min_enade,
                    MAX(coc.enade) AS max_enade,
                    ROW_NUMBER() OVER (PARTITION BY m.uf ORDER BY COUNT(coc.id) DESC) AS ranking
                FROM
                    Cursos_Oferecidos_por_Campus AS coc
                JOIN
                    Curso AS c ON coc.id_curso = c.id_curso
                JOIN
                    Campus AS ca ON coc.id_campus = ca.id_campus
                JOIN
                    Municipio AS m ON ca.id_municipio = m.id_municipio
                WHERE
                    coc.enade >= 2.5
                GROUP BY
                    m.uf, c.nome
            )
            -- Seleção final a partir da tabela temporária.
            SELECT
                rc.uf,
                rc.ranking AS "Posicao",
                rc.nome_curso AS "Curso",
                rc.total_ofertas AS "Ofertas",
                -- O CONCAT junta o texto. ROUND arredonda e CAST converte para inteiro.
                CONCAT(CAST(ROUND(rc.media_enade, 2) AS NUMERIC(10, 2)), ' [', CAST(rc.min_enade AS INT), '-', CAST(rc.max_enade AS INT), ']') AS "ENADE"
            FROM
                RankingCursosPorUF AS rc
            WHERE
                rc.ranking <= 10
            ORDER BY
                rc.uf, rc.ranking;
        '''

        dados = cursor.execute(sql).fetchall()

        return render(request, template, 
                    context={
                          'dados_ranking': dados,
                    })
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})
