from django.conf import settings

def api_url_processor(request):
    return {
        'API_URL': settings.API_URL  # Adiciona a URL da API no contexto dos templates
    }