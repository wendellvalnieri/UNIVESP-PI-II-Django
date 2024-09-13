import requests
from django.contrib import messages

from .forms import ContatoForm, ProdutoModelForm
from .models import Produto

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login

API_URL = 'http://localhost:4333'

def login_view(request):
    return render(request, 'login.html')

def index(request):
    return render(request, 'index.html')

def index2(request):
    return render(request, 'index.bkp.html')

def home(request):
    return render(request, 'home.html')

def listaProdutos(request):
    context = {
        'produtos': Produto.objects.all()
    }
    return render(request, 'listaProdutos.html', context)


def contato(request):
    form = ContatoForm(request.POST or None)

    if str(request.method) == 'POST':
        if form.is_valid():
            form.send_mail()

            messages.success(request, 'E-mail enviado com sucesso!')
            form = ContatoForm()
        else:
            messages.error(request, 'Erro ao enviar e-mail')
    context = {
        'form': form
    }
    return render(request, 'contato.html', context)


def produto(request):
    if str(request.user) == 'AnonymousUser':
        if str(request.method) == 'POST':
            form = ProdutoModelForm(request.POST, request.FILES)
            if form.is_valid():

                form.save()

                messages.success(request, 'Produto salvo com sucesso.')
                form = ProdutoModelForm()
            else:
                messages.error(request, 'Erro ao salvar produto.')
        else:
            form = ProdutoModelForm()
        context = {
            'form': form
        }
        return render(request, 'produto.html', context)
    else:
        return redirect('listaProdutos')

def serviços(request):
    return render(request, 'serviços.html')


def servicos(request):
    response = requests.get(API_URL + '/servicos')
    
    if response.status_code == 200:
        servicos = response.json() 
    else:
        servicos = []

    return render(request, 'servicos.html', {'servicos': servicos})

def produtos(request):
    response = requests.get(API_URL+ '/produtos')
    
    if response.status_code == 200:
        produtos = response.json()
    else:
        produtos = []

    return render(request, 'produtos.html', {'produtos': produtos})

def admin_dashboard(request):
    return render(request, 'administrador/dashboard.html')

def admin_usuarios(request):
    response = requests.get(API_URL+ '/usuarios')
    
    if response.status_code == 200:
        data = response.json()
    else:
        data = []
    return render(request, 'administrador/usuarios.html',{"data":data})

def admin_reservas(request):
    response = requests.get(API_URL+ '/reservas')
    
    if response.status_code == 200:
        data = response.json()
    else:
        data = []
    return render(request, 'administrador/reservas.html',{"data":data})

def admin_compras(request):
    response = requests.get(API_URL+ '/compras')
    
    if response.status_code == 200:
        data = response.json()
    else:
        data = []
    return render(request, 'administrador/compras.html', {'data': data})

def admin_produtos(request):
    response = requests.get(API_URL+ '/produtos')
    
    if response.status_code == 200:
        data = response.json()
    else:
        data = []
    return render(request, 'administrador/produtos.html',{"data":data})
