document.getElementById("login-form").addEventListener("submit", async function (event) {
    const url = "http://localhost:4333/auth/login";
    event.preventDefault();

    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    try {
        let urlDashboard = "";

        const response = await fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                username: username,
                password: password
            })
        });

        if (!response.ok) {
            throw new Error(`Erro: ${response.statusText}`);
        }

        const data = await response.json();
        if (data.isAdmin) {
            urlDashboard = "/administrador/dashboard";
        } else {
            urlDashboard = "/usuario/dashboard";
        }
        sessionStorage.token = data.token;
        location.href = urlDashboard;

    } catch (error) {
        console.error("Erro ao fazer login:", error);
        alert("Erro ao fazer login. Verifique suas credenciais.");
    }

    debugger;
});
