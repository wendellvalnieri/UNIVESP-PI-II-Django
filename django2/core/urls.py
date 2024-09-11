from django.urls import path
from .views import index, contato,home, produto, listaProdutos,produtos, serviços,servicos, login_view,index2

urlpatterns = [
    path('', index, name='home'),
    path('contato/', contato, name='contato'),
    path('produto/', produto, name='produto'),
    path('produtos/', produtos, name='Produtos'),
    path('produtos2/', listaProdutos, name='listaProdutos'),
    path('serviços/', serviços, name='serviços'),
    path('servicos/', servicos, name='servicos'),
    path('login/', login_view, name='login'),
    path('home/', home, name='login'),
    path('index2/', index2, name='login'),
 ]
