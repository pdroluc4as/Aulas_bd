from django.shortcuts import render

import pyodbc
from .util_conexao import *

# Create your views here.

def home(request):
    # define a página HTML (template) que deverá será carregada
    template = 'home.html'
    return render(request, template)

def exerc_01(request):
    # define a página HTML (template) que deverá será carregada
    template = 'exerc_01.html'
    try:
        # obtem a conexao com o BD
        conexao = obter_conexao()

        # define um cursor para executar comandos SQL
        cursor = conexao.cursor()

        
        sql = '''
            SELECT * FROM nome_da_view
        '''
       
        cursor.execute(sql)

        dados_do_banco = cursor.fetchall()

        # define a pagina a ser carregada, adicionando os registros das tabelas 
        return render(request, template, 
                    context={
                          'dados': dados_do_banco
                    })
    
    # se ocorreu algunm erro, insere a mensagem para ser exibida no contexto da página 
    except Exception as err:
        return render(request, template, context={'ERRO': err})

def exerc_02(request):
    # define a página HTML (template) que deverá será carregada
    template = 'exerc_02.html'
    try:
        # obtem a conexao com o BD
        conexao = obter_conexao()

        # define um cursor para executar comandos SQL
        cursor = conexao.cursor()

        
        sql = '''
            SELECT * FROM nome_da_view
        '''
       
        cursor.execute(sql)

        dados_do_banco = cursor.fetchall()

        # define a pagina a ser carregada, adicionando os registros das tabelas 
        return render(request, template, 
                    context={
                          'dados': dados_do_banco
                    })
    
    # se ocorreu algunm erro, insere a mensagem para ser exibida no contexto da página 
    except Exception as err:
        return render(request, template, context={'ERRO': err})

def exerc_03(request):
    # define a página HTML (template) que deverá será carregada
    template = 'exerc_03.html'
    try:
        # obtem a conexao com o BD
        conexao = obter_conexao()

        # define um cursor para executar comandos SQL
        cursor = conexao.cursor()

        
        sql = '''
            SELECT * FROM nome_da_view
        '''
       
        cursor.execute(sql)

        dados_do_banco = cursor.fetchall()

        # define a pagina a ser carregada, adicionando os registros das tabelas 
        return render(request, template, 
                    context={
                          'dados': dados_do_banco
                    })
    
    # se ocorreu algunm erro, insere a mensagem para ser exibida no contexto da página 
    except Exception as err:
        return render(request, template, context={'ERRO': err})