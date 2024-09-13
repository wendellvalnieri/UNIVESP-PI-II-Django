from django.urls import path
from .views import index, contato,home, produto,produtos, servicos, login_view,index2,admin_dashboard,admin_usuarios,admin_reservas,admin_compras,admin_produtos
from .views import admin_servicos

urlpatterns = [
    path('', index, name='home'),
    path('contato/', contato, name='contato'),
    path('produto/', produto, name='produto'),
    path('produtos/', produtos, name='Produtos'),
    path('servicos/', servicos, name='servicos'),
    path('login/', login_view, name='login'),
    path('home/', home, name='login'),
    path('administrador/dashboard', admin_dashboard, name='dashboard'),
    path('administrador/usuarios', admin_usuarios, name='usuarios'),
    path('administrador/reservas', admin_reservas, name='reservas'),
    path('administrador/compras', admin_compras, name='compras'),
    path('administrador/produtos', admin_produtos, name='produtos'),
    path('administrador/servicos', admin_servicos, name='servicos'),
 ]
