import requests



response = requests.get('https://httpbin.org/ip')



print('Seu IP {0}'.format(response.json()['origin']))