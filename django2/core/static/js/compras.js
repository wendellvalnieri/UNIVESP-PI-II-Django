import { postRequest, getRequest } from './api.js';
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

            try {
                loadingMessage('Enviando os dados, por favor aguarde...');

                const response = await postRequest(`/compras`, data);

                form.reset();

                successMessage('Dados enviados com sucesso!');

                setTimeout(() => {
                    document.querySelector('button.close').click();
                    closeMessages();
                }, 1000);


            } catch (error) {
                closeMessages();

                errorMessage('Ocorreu um erro ao enviar os dados, tente novamente.');
                console.error("Erro ao enviar dados:", error);
            }
        });
    });
    getCompras()
});



async function getCompras() {
    const response = await getRequest("compras");
    let data;
    if (response.ok) {
        data = response.data;
        const tbody = document.getElementById('compras-body');

        data.forEach(compra => {
            const row = document.createElement('tr');

            row.innerHTML = `
                <td>${compra.id}</td>
                <td>${compra.nome_cliente}</td>
                <td>${compra.quantidade}</td>
                <td>${compra.preco ? compra.preco : 'N/A'}</td> <!-- Exibir 'N/A' se o preço for null -->
                <td>${compra.preco_total}</td>
                <td>${compra.nome_produto}</td>
                <td>${formatDate(compra.data_compra)}</td>
            `;

            tbody.appendChild(row);
        });
    }
}