from django.urls import path
from .views import index, contato, produto, listaProdutos, serviços, login_view

urlpatterns = [
    path('', index, name='index'),
    path('contato/', contato, name='contato'),
    path('produto/', produto, name='produto'),
    path('listaProdutos/', listaProdutos, name='listaProdutos'),
    path('serviços/', serviços, name='serviços'),
    path('login/', login_view, name='login'),
 ]
