from django.urls import path

from .views import index, contato,home, produto,produtos, servicos, login_view,admin_servicos,admin_dashboard,admin_usuarios,admin_reservas,admin_compras,admin_produtos,admin_servicos,admin_produtos_form,admin_servicos_form,admin_usuarios_form,sucessoPage

urlpatterns = [
    
    path('', index, name='home'),
    path('contato/', contato, name='contato'),
    path('produto/', produto, name='produto'),
    path('produtos/', produtos, name='Produtos'),
    path('servicos/', servicos, name='servicos'),
    path('login/', login_view, name='login'),
    path('home/', home, name='login'),

    path('sucesso', sucessoPage, name='sucesso'),
    
    path('administrador', admin_dashboard, name='dashboard'),
    path('administrador/reservas', admin_reservas, name='reservas'),
    path('administrador/compras', admin_compras, name='compras'),
    
    path('administrador/produtos', admin_produtos, name='produtos'),
    path('administrador/produtos/novo', admin_produtos_form, name='produto_criar'),
    path('administrador/produtos/<int:id>/editar/', admin_produtos_form, name='produto_editar'), 
    
    path('administrador/servicos', admin_servicos, name='servicos'),
    path('administrador/servicos/novo', admin_servicos_form, name='servicos_criar'),
    path('administrador/servicos/<int:id>/editar/', admin_servicos_form, name='servicos_editar'), 
    
    path('administrador/usuarios', admin_usuarios, name='usuarios'),
    path('administrador/usuarios/novo', admin_usuarios_form, name='usuarios_criar'),
    path('administrador/usuarios/<int:id>/editar/', admin_usuarios_form, name='usuarios_editar'), 
    
 ]
