const baseURL = "http://localhost:4333";

function createHeaders() {
    const headers = {
        "Content-Type": "application/json"
    };

    const token = sessionStorage.getItem("token");
    if (token) {
        headers["Authorization"] = `Bearer ${token}`;
    }

    return headers;
}

export async function getRequest(endpoint) {
    try {
        const response = await fetch(`${baseURL}${endpoint}`, {
            method: "GET",
            headers: createHeaders()
        });

        if (!response.ok) {
            throw new Error(response.statusText);
        }

        const data = {
            data: await response.json(),
            ok: true
        }

        return data;
    } catch (error) {
        console.error("Erro na requisição GET:", error);
        throw error;
    }
}

export async function postRequest(endpoint, body) {
    try {
        const response = await fetch(`${baseURL}${endpoint}`, {
            method: "POST",
            headers: createHeaders(),
            body: JSON.stringify(body)
        });

        if (!response.ok) {
            throw new Error(response.statusText);
        }

        const data = {
            data: await response.json(),
            ok: true
        }

        return data;
    } catch (error) {
        console.error("post_request", error);
        return error;
    }
}

export async function putRequest(endpoint, body) {
    try {
        const response = await fetch(`${baseURL}${endpoint}`, {
            method: "PUT",
            headers: createHeaders(),
            body: JSON.stringify(body)
        });

        if (!response.ok) {
            throw new Error(response.statusText);
        }

        const data = {
            data: await response.json(),
            ok: true
        }

        return data;
    } catch (error) {
        console.error(error);
        throw error;
    }
}

export async function deleteRequest(endpoint) {
    try {
        const response = await fetch(`${baseURL}${endpoint}`, {
            method: "DELETE",
            headers: createHeaders()
        });

        if (!response.ok) {
            throw new Error(esponse.statusText);
        }

        const data = {
            data: await response.json(),
            ok: true
        }

        return data;
    } catch (error) {
        console.error(error);
        throw error;
    }
}
