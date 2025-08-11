from django import forms
from django.http import HttpResponseRedirect
from django.shortcuts import render

from .util_conexao import *
from .util_views import *

# Define o PREFIXO da página HTML (template) que deverá ser carregada
TEMPLATE_PREFIXO = 'turmas'

# Comando SELECT geral para retornar os registros
SQL_SELECT_GERAL = """
    SELECT   t.id,
             t.nome
    FROM     Turma t
""" 

# Comando SQL para selecionar o registro pelo "id" informado
SQL_OBTER_REGISTRO = SQL_SELECT_GERAL + '\n    ' \
                   + 'WHERE   t.id = {}'

# Comando SQL para retornar todos os registros definindo a ordenação
SQL_LISTAGEM = SQL_SELECT_GERAL + '\n    ' \
             + 'ORDER BY t.nome'

# Comando SQL para excluir um registro
SQL_EXCLUSAO = """ 
    DELETE FROM Turma 
    WHERE id = {}
"""

# Comando SQL para incluir um registro
SQL_INCLUSAO = """ 
    INSERT INTO Turma(nome) 
    VALUES('{}')
"""

# Comando SQL para alterar um registro
SQL_ALTERACAO = """
    UPDATE Turma 
    SET nome = '{}' 
    WHERE id = {}
"""

# Classe que herda de "ViewGenericCRUD"
class ViewCRUD (ViewGenericCRUD):
    
    def obter_campos_formulario(self):
        return [    
            # OBS-1: INFORME OS CAMPOS NA ORDEM QUE APARECEM NO SQL DE INCLUSAO/ALTERACAO 
            'nome',
            # 0BS-2: DEIXAR O ID POR ULTIMO
            'id',
        ]

# Formulário utilizado para edição dos registros (inclusao e alteracao)
class Formulario(forms.Form):
    # ID (DEIXAR ASSIM, NÃO ALTERAR)
    id = forms.IntegerField(label='ID', 
         widget=forms.TextInput(attrs={'readonly': 'readonly'}), required=False)
    # Campos do formulario
    nome = forms.CharField(label='Nome da Turma', max_length=100, required=True)

# Classe que será utilizada como VIEW e que contem os métodos listar(), editar() e salvar()
# OBS: NÃO PRECISA ALTERAR ESTA PARTE DO CÓDIGO
VIEW_CRUD = ViewCRUD(
    TEMPLATE_PREFIXO=TEMPLATE_PREFIXO, 
    SQL_LISTAGEM=SQL_LISTAGEM, 
    SQL_OBTER_REGISTRO=SQL_OBTER_REGISTRO, 
    SQL_INCLUSAO=SQL_INCLUSAO, 
    SQL_ALTERACAO=SQL_ALTERACAO,
    SQL_EXCLUSAO=SQL_EXCLUSAO, 
    FORMULARIO_CLASS=Formulario, 
)