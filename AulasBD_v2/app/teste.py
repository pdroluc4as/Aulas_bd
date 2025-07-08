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


def exercicio_4():
    template = 'exercicio_3.html'

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

        for reg in registros:
            print(reg[1][0])
    
    except Exception as err:
        print(err)

exercicio_4()