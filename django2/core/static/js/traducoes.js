const translations = {
    "success": "Sucesso",
    "error": "Erro",
    "loading": "Carregando",
    "Please wait...": "Por favor, aguarde...",
    "please_wait.": "Por favor, aguarde...",
    "Login successful": "Login bem-sucedido",
    "Login failed": "Falha no login",
    "Submit": "Enviar",
    "Cancel": "Cancelar",
    "Are you sure?": "Você tem certeza?",
    "Delete": "Excluir",
    "Yes, delete it!": "Sim, exclua!",
    "No, cancel!": "Não, cancelar!",
    "No, cancel!": "Não, cancelar!",
    'Unauthorized': "Não autorizado",
    'Ttry_again': "Tente novamente mais tarde",

};

export function translate(word) {
    return translations[word] || word;
}