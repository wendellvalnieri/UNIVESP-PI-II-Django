function logout() {
    Swal.fire({
        title: 'Tem certeza?',
        text: "Deseja fazer logout?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sim',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            sessionStorage.clear();
            window.location.href = "/";
        }
    })

}

function formatDate(dateString) {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
}

let fontSize = 16;  // Default font size

document.getElementById('increase-font').addEventListener('click', function () {
    if (fontSize < 24) {
        fontSize += 2;
        document.body.style.fontSize = fontSize + 'px';
    }
});

document.getElementById('decrease-font').addEventListener('click', function () {
    if (fontSize > 12) {  // Set a lower limit to avoid unreadably small text
        fontSize -= 2;
        document.body.style.fontSize = fontSize + 'px';
    }
});

document.getElementById('toggle-contrast').addEventListener('click', function () {
    document.body.classList.toggle('high-contrast');
});

document.getElementById('reset').addEventListener('click', function () {
    fontSize = 16;
    document.body.style.fontSize = '16px';
    document.body.classList.remove('high-contrast');
});

const toggleToolbarBtn = document.getElementById('toggleToolbarBtn');
const toolbar = document.querySelector('.toolbar');

toggleToolbarBtn.addEventListener('click', function () {
    if (toolbar.style.display === 'none' || toolbar.style.display === '') {
        toolbar.style.display = 'grid';
    } else {
        toolbar.style.display = 'none';
    }
});