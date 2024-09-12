import { translate } from './traducoes.js';

export function successMessage(message) {
    Swal.fire({
        title: translate('success'),
        text: translate(message) || translate('success'),
        icon: 'success',
        confirmButtonText: 'OK'
    });
}

export function errorMessage(message) {
    Swal.fire({
        title: translate('error'),
        text: translate(message) || translate("try_again"),
        icon: 'error',
        confirmButtonText: 'OK'
    });
}

export function loadingMessage(message) {
    Swal.fire({
        title: translate('loading'),
        text: translate(message) || translate('loading'),
        icon: 'info',
        allowOutsideClick: false,
        showConfirmButton: false,
        willOpen: () => {
            Swal.showLoading();
        }
    });
}

export function closeMessages() {
    Swal.close();
}
