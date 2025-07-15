from django.shortcuts import render

import pyodbc


def obter_conexao():
    # define os parametros de conexao
    driver   = '{ODBC Driver 17 for SQL Server}'
    servidor = 'CNAT391789\SQLEXPRESS'
    banco    = 'avaliacao_2bim'
    usuario  = 'sa'
    senha    = '12345' # poder ser também: "senha", "senha@123", "Senha@123"

    # realiza conexao com o BD
    string_conexao = f'Driver={driver};Server={servidor};Database={banco};UID={usuario};PWD={senha}'
    conexao = pyodbc.connect(string_conexao)
    
    # retorna a conexao  
    return conexao


def home(request):
    # define a página HTML (template) que deverá será carregada
    template = 'home.html'
    return render(request, template)

def exercicio_3a(request):
    template = 'exercicio_3a.html'

    try:
        conn = obter_conexao()

        cursor = conn.cursor()

        sql = '''
            SELECT prod.id as "id" ,
	    prod.descricao AS "descricao",
	    prod.valor_unit AS "valor_unitario",
	    cat.descricao AS "categoria"

        FROM Produto prod INNER JOIN Categoria cat ON prod.categoria_id = cat.id

        ORDER BY cat.descricao, prod.descricao
        '''

        cursor.execute(sql)

        registros = cursor.fetchall()

        return render(request, template, context={'registros': registros})
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})


def exercicio_3b(request):
    template = 'exercicio_3b.html'

    try:
        conn = obter_conexao()

        cursor = conn.cursor()

        sql = '''
            SELECT 
	            FORMAT(ven.data_venda, 'dd-MM-yyyy') AS "data_venda",
	            ven.valor_total AS "valor_total",
	            prod.descricao AS "produto",
	            cli.nome AS "nome_do_cliente",
	            vend.nome AS "nome_do_vendedor"

                FROM Venda ven INNER JOIN Produto prod ON ven.produto_id = prod.id
	            INNER JOIN Cliente cli ON ven.cliente_id = cli.id
	            INNER JOIN Vendedor vend ON ven.vendedor_id = ven.id

                ORDER BY ven.data_venda DESC
        '''

        cursor.execute(sql)

        registros = cursor.fetchall()

        return render(request, template, context={'registros': registros})
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})

