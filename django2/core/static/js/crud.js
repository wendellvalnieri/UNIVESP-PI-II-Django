import { deleteRequest } from './api.js';
import { successMessage, loadingMessage, errorMessage } from './mensages.js';

export function deleteItem(endpoint, itemId) {
    Swal.fire({
        title: 'Tem certeza?',
        text: "Você não poderá reverter isso!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sim, apagar!',
        cancelButtonText: 'Cancelar'
    }).then((result) => {

        if (result.isConfirmed) {
            loadingMessage();

            deleteRequest(endpoint,itemId)
                .then(response => {

                    if (response.ok) {
                        const element = document.getElementById(`item-${itemId}`);
                        if(element){
                            element.remove();
                        }
                        successMessage("Apagado com sucesso");
                        return;
                    }
                    throw new Error(response.statusText);
                })
                .catch(error => {
                    console.error('Erro na exclusão:', error);
                    errorMessage("Erro ao apagar")
                });
        }
    });
}

document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll(".btn-danger");

    deleteButtons.forEach((button) => {
        button.addEventListener("click", function () {
            const itemId = this.dataset.itemId;
            const endpoint = this.dataset.endpoint;

            deleteItem(endpoint, itemId);
        });
    });
});