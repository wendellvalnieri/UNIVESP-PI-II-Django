# Django2 Project

Este é um projeto Django configurado para rodar localmente. Siga as instruções abaixo para instalar as dependências e rodar o servidor de desenvolvimento.

## Pré-requisitos

- Python 3.7+ instalado em seu sistema.
- `pip` (gerenciador de pacotes do Python) instalado.

## Instruções de Instalação

### 1. Clonar o Repositório

Se você ainda não clonou o repositório, faça isso agora:

```
git clone <URL_DO_REPOSITORIO>
cd django2
```

### 2. Criar e Ativar o Ambiente Virtual
Para isolar as dependências do projeto, recomenda-se o uso de um ambiente virtual. Execute os seguintes comandos:

No Windows:

```
python -m venv venv
venv\Scripts\activate
```

No Linux/Mac:
```
python3 -m venv venv
source venv/bin/activate
```

### 3. Instalar as Dependências
Com o ambiente virtual ativado, instale as dependências do projeto usando o requirements.txt:
```
pip install -r requirements.txt
```

### 4. Aplicar Migrações do Banco de Dados
Após instalar as dependências, aplique as migrações do banco de dados:
```
python manage.py migrate
```

### 5. Rodar o Servidor de Desenvolvimento
Agora você pode rodar o servidor de desenvolvimento local:
```
python manage.py runserver
```
O servidor estará disponível em http://127.0.0.1:8000/.


### Observações
Certifique-se de que todas as dependências estejam corretamente instaladas e que o Python esteja devidamente configurado.
Se houver algum problema com a instalação de pacotes, verifique se o pip está atualizado:
```
pip install --upgrade pip
```