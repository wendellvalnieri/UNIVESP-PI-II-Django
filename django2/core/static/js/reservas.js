
import { closeMessages, successMessage, loadingMessage, errorMessage } from "./mensages.js";
import { getRequest, postRequest } from "./api.js";
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

                const response = await postRequest(`/reservas`, data);

                successMessage('Dados enviados com sucesso!');
                form.reset();
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

    const reservasBody = document.getElementById('reservas-body');
    if (reservasBody) {
        getReservas();
    }
});

async function getReservas() {
    const response = await getRequest("reservas");
    let data;
    if (response.ok) {
        data = response.data;
        const tbody = document.getElementById('reservas-body');

        data.forEach(reserva => {
            const row = document.createElement('tr');

            row.innerHTML = `
                  <td>${reserva.id}</td>
                  <td>${reserva.nome_usuario}</td>
                  <td>${reserva.nome_servico}</td>
                  <td>${formatDate(reserva.data_reserva)}</td>
                  <td>${reserva.hora_reserva}</td>
              `;

            tbody.appendChild(row);

        });
    }
}