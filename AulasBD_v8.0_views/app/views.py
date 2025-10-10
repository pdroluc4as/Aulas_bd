from django.shortcuts import render

# Create your views here.

def home(request):
    # define a página HTML (template) que deverá será carregada
    template = 'home.html'
    return render(request, template)

def exerc_01(request):
    # define a página HTML (template) que deverá será carregada
    template = 'exerc_01.html'
    return render(request, template)

def exerc_02(request):
    # define a página HTML (template) que deverá será carregada
    template = 'exerc_02.html'
    return render(request, template)

def exerc_03(request):
    # define a página HTML (template) que deverá será carregada
    template = 'exerc_03.html'
    return render(request, template)