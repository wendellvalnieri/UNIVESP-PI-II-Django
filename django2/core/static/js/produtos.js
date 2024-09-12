import { postRequest } from './api.js';
import { successMessage, loadingMessage, errorMessage, closeMessages } from './mensages.js';

document.addEventListener("DOMContentLoaded", function () {
    const forms = document.querySelectorAll("form");

    forms.forEach(function (form) {
        form.addEventListener("submit", async function (event) {
            event.preventDefault();
            const formData = new FormData(form);

            let data = {};
            formData.forEach((value, key) => {
                data[key] = value;
            });

            // Captura o ID do produto do form
            const produtoId = data['produto_id'];

            try {
                loadingMessage('Enviando os dados, por favor aguarde...');

                // Faz a requisição para a URL com o ID do produto
                const response = await postRequest(`/comprar/${produtoId}`, JSON.stringify(data));

                successMessage('Dados enviados com sucesso!');

                closeMessages();

                form.reset();

            } catch (error) {
                closeMessages();

                errorMessage('Ocorreu um erro ao enviar os dados, tente novamente.');
                console.error("Erro ao enviar dados:", error);
            }
        });
    });
});
