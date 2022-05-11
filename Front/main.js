function validaLogin() {
    const email = document.getElementById('email').value;
    const senha = document.getElementById('senha').value;

    if (email.length && senha.length) {
        data = {
            email: email,
            senha: senha
        }
        login(data);
    } else {
        alert('Digite seu e-mail e senha!');
    }
}

function login(data) {
    fetch('http://localhost:3000/usuarios/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    }).then(response => {
        var status = response.status;
        console.log(response);
        response.json().then(result => {
            if (status == 201) {
                window.location.href = "./twitter/index.html";
            } else {
                console.log(result)
                alert(result.menssage);
            }
        })
        
    });
}