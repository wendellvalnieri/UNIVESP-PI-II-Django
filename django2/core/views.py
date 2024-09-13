import requests
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User

from django.contrib import messages

from .forms import ContatoForm, ProdutoForm,ServicoForm,UserForm
from .models import Produto,Servico, Reserva

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required

API_URL = 'http://localhost:4333'

def sucessoPage(request):
    return render(request, 'componentes/sucesso.html')

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
            form = ProdutoForm(request.POST, request.FILES)
            if form.is_valid():

                form.save()

                messages.success(request, 'Produto salvo com sucesso.')
                form = ProdutoForm()
            else:
                messages.error(request, 'Erro ao salvar produto.')
        else:
            form = ProdutoForm()
        context = {
            'form': form
        }
        return render(request, 'produto.html', context)
    else:
        return redirect('listaProdutos')

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
    return render(request, 'administrador/produtos/produtos.html',{"data":data})

def admin_produtos_form(request,id=None):
    if id:
        produto = get_object_or_404(Produto, id=id)  
        titulo = 'Editar Produto'
    else:
        produto = None
        titulo = 'Criar Produto'
    
    if request.method == 'POST':
        form = ProdutoForm(request.POST, request.FILES, instance=produto)
        if form.is_valid():
            form.save()
            return render(request, 'componentes/sucesso.html', {'link': "/administrador/produtos"})
    else:
        form = ProdutoForm(instance=produto)

    return render(request, 'administrador/produtos/produtos_form.html',{'form': form, 'titulo': titulo})

def admin_servicos(request):
    response = requests.get(API_URL+ '/servicos')
    
    if response.status_code == 200:
        data = response.json()
    else:
        data = []
    return render(request, 'administrador/servicos/servicos.html',{"data":data})

def admin_servicos_form(request,id=None):
    if id:
        servico = get_object_or_404(Servico, id=id)  
        titulo = 'Editar Serviço'
    else:
        servico = None
        titulo = 'Criar Serviço'
    
    if request.method == 'POST':
        form = ServicoForm(request.POST, request.FILES, instance=servico)
        if form.is_valid():
            form.save()
            return render(request, 'componentes/sucesso.html', {'link': "/administrador/servicos"})
    else:
        form = ServicoForm(instance=servico)

    return render(request, 'administrador/servicos/servicos_form.html',{'form': form, 'titulo': titulo})

def admin_usuarios(request):
    response = requests.get(API_URL+ '/usuarios')
    
    if response.status_code == 200:
        data = response.json()
    else:
        data = []
    return render(request, 'administrador/usuarios/usuarios.html',{"data":data})


def admin_usuarios_form(request,id=None):
    if id:
        user = get_object_or_404(User, id=id)  
        titulo = 'Editar Usuário'
    else:
        user = None
        titulo = 'Criar Usuário'
    
    if request.method == 'POST':
        form = UserForm(request.POST, request.FILES, instance=produto)
        if form.is_valid():
            form.save()
            return render(request, 'componentes/sucesso.html', {'link': "/administrador/usuarios"})
    else:
        form = UserForm(instance=user)

    return render(request, 'administrador/usuarios/usuarios_form.html',{'form': form, 'titulo': titulo})

