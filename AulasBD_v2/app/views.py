from django.shortcuts import render

import pyodbc


def obter_conexao():
    # define os parametros de conexao
    driver   = '{ODBC Driver 17 for SQL Server}'
    servidor = 'pc-de-casa'
    banco    = 'Aulas_BD'
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

def exercicio_1(request):
    # define a página HTML (template) que deverá será carregada
    template = 'exercicio_1.html'
    try:
        # obtem a conexao com o BD
        conexao = obter_conexao()

        # define um cursor para executar comandos SQL
        cursor = conexao.cursor()

        # define o comando SQL que será executado
        sql = '''
            SELECT  dep.nome as 'departamento',
                    fun.nome, 
                    fun.telefones

            FROM Funcionario fun
            INNER JOIN Departamento dep ON dep.id = fun.departamento_id

            ORDER BY dep.nome, fun.nome
        '''
        
        # usa o cursor para executar o SQL
        cursor.execute(sql)
        # obtem todos os registros retornados
        registros = cursor.fetchall()

        # define a pagina a ser carregada, adicionando os registros das tabelas 
        return render(request, template, context={'registros': registros})
    
    # se ocorreu algunm erro, insere a mensagem para ser exibida no contexto da página 
    except Exception as err:
        return render(request, template, context={'ERRO': err})

def exercicio_2(request):
    template = 'exercicio_2.html'

    try:
        conn = obter_conexao()

        cursor = conn.cursor()

        sql = '''
            SELECT tur.nome as 'Turma',
                alu.nome,
                alu.idade

            FROM Alunos alu INNER JOIN Turma tur ON tur.id = alu.turma_id

            ORDER BY tur.nome, alu.nome
        '''

        cursor.execute(sql)

        registros = cursor.fetchall()

        return render(request, template, context={'registros': registros})
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})
    

def exercicio_3(request):
    template = 'exercicio_3.html'

    try:
        conn = obter_conexao()

        cursor = conn.cursor()

        sql = '''
            SELECT est.nome AS 'Estado',
                cid.nome AS 'Cidade',
                bai.nome AS 'Bairro'

            FROM Cidade cid INNER JOIN Estado AS est ON cid.estado_id = est.sigla
                INNER JOIN Bairro AS bai ON bai.cidade_id = cid.id

            ORDER BY est.nome, cid.nome, bai.nome
        '''

        cursor.execute(sql)

        registros = cursor.fetchall()

        return render(request, template, context={'registros': registros})
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})
    


def exercicio_4(request):
    template = 'exercicio_4.html'

    try:
        conn = obter_conexao()

        cursor = conn.cursor()

        sql = '''
            SELECT fab.descricao AS 'Fabricante',
                mode.descricao AS 'Modelo',
                car.ano_fabricacao AS 'Ano_de_Fabricacao',
                car.cor AS 'Cor',
                car.placa AS 'Placa',
                car.preco AS 'Preco',
                cat.descricao AS 'Categoria'

            FROM Carro car INNER JOIN Modelo AS mode ON car.modelo_id = mode.id
                INNER JOIN Fabricante AS fab ON mode.fabricante_id = fab.id
                INNER JOIN Categoria AS cat ON car.categoria_id = cat.id
            ORDER BY fab.descricao, mode.descricao, car.ano_fabricacao
        '''

        cursor.execute(sql)

        registros = cursor.fetchall()

        return render(request, template, context={'registros': registros})
    
    except Exception as err:
        return render(request, template, context={'ERRO': err})