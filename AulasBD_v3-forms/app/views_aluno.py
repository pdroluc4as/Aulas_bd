from django import forms
from django.http import HttpResponseRedirect
from django.shortcuts import render

from .util_conexao import *
from .util_views import *

# Define o PREFIXO da página HTML (template) que deverá ser carregada
TEMPLATE_PREFIXO = 'alunos'

# Comando SELECT geral para retornar os registros
SQL_SELECT_GERAL = """
    SELECT
        a.id,
        a.nome,
        a.telefones,
        a.idade,
        a.data_nascimento,
        a.turma_id,
        t.nome AS turma_nome
    FROM
        Aluno AS a
    INNER JOIN
        Turma AS t ON a.turma_id = t.id 
""" 

# Comando SQL para selecionar o registro pelo "id" informado
SQL_OBTER_REGISTRO = SQL_SELECT_GERAL + '\n    ' \
                   + 'WHERE   a.id = {}'

# Comando SQL para retornar todos os registros definindo a ordenação
SQL_LISTAGEM = SQL_SELECT_GERAL + '\n    ' \
             + 'ORDER BY a.nome'

# Comando SQL para excluir um registro
SQL_EXCLUSAO = """ 
    DELETE FROM Aluno 
    WHERE id = {}
"""

# Comando SQL para incluir um registro
SQL_INCLUSAO = """ 
    INSERT INTO Aluno(nome, data_nascimento, turma_id) 
    VALUES('{}', '{}', {})
"""

# Comando SQL para alterar um registro
SQL_ALTERACAO = """
    UPDATE Aluno 
    SET nome = '{}',
        data_nascimento = '{}', 
        turma_id = {} 
    WHERE id = {}
"""

# Classe que herda de "ViewGenericCRUD"
class ViewCRUD (ViewGenericCRUD):
    
    def obter_campos_formulario(self):
        return [    
            # OBS-1: INFORME OS CAMPOS NA ORDEM QUE APARECEM NO SQL DE INCLUSAO/ALTERACAO 
            'nome',
            'data_nascimento',
            'turma_id',
            # 0BS-2: DEIXAR O ID POR ULTIMO
            'id',
        ]
        
# Formulário utilizado para edicao dos registros (inclusao e alteracao)
class Formulario(forms.Form):
    # ID (DEIXAR ASSIM, NÃO ALTERAR)
    id = forms.IntegerField(label='ID', 
        widget=forms.TextInput(attrs={'readonly': 'readonly'}), required=False)
    
    # Campos do formulario
    nome = forms.CharField(label='Nome do Aluno', max_length=100, required=True)
    data_nascimento = forms.DateField(label='Data de Nascimento', required=True)        
    turma_id = forms.ChoiceField(label='Turma')

    # Construtor do Formulario
    def __init__(self, *args, **kwargs):
            # Chama construtor da classe-Pai
            super().__init__(*args, **kwargs)
            # Obtem os registros da tabela Turma para preencher o campo de seleção
            turmas = executar_select('SELECT id, nome FROM Turma ORDER BY nome')
            # Carrega as turmas no <select> da página usando o ChoiceField
            self.fields['turma_id'].choices = turmas
    
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