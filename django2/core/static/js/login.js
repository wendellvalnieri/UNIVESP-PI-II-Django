import { postRequest } from './api.js';
import { successMessage, loadingMessage, errorMessage, closeMessages } from './mensages.js';

const form = document.getElementById("login-form");

async function login(username, password) {
    const endpoint = "/auth/login";

    try {
        loadingMessage();
        const data = await postRequest(endpoint, { username, password });
        
        if (!data?.ok) {
            throw new Error(data.message);
        }

        const urlDashboard = data.isAdmin ? "/administrador/dashboard" : "/usuario/dashboard";

        sessionStorage.setItem('token', data.token);

        setTimeout(() => {
            window.location.href = urlDashboard;
        }, 2000);

        successMessage("Em breve será redirecionado");

    } catch (error) {
        errorMessage(error.message);
    }
}

form.addEventListener("submit", async function (event) {
    event.preventDefault();

    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    const response = login(username, password);
    return;
});
