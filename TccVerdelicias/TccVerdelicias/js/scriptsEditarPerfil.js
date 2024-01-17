var cropper = null;

function crop(image) {
    return new Cropper(image, {
        dragMode: 'move',
        preview: '#preview-foto-perfil',
        background: false,
        aspectRatio: 1 / 1,
        viewMode: 2,
        data: { width: 720, height: 720 }
    });
}

const btnSelecionar = document.querySelector('#InserirImagem');
if (btnSelecionar) {
    btnSelecionar.addEventListener('change', function (e) {

        const caixaFotoSelecionada = document.querySelector("#caixa-foto-selecionada");
        const previewImage = document.createElement('img');

        // Verifica se já existe imagem carregada sendo exibida, se sim, remove pra entrar outra.
        const preview = document.querySelector('#preview-image');
        if (preview) {
            preview.remove();
        }

        // Crie e exibe a foto a ser cortada.
        const reader = new FileReader;

        reader.onload = function (e) {
            previewImage.id = 'preview-image';
            previewImage.src = e.target.result;
            previewImage.classList.add('escondido');
            previewImage.classList.add('ajusta-largura-total');
            caixaFotoSelecionada.appendChild(previewImage);
        }

        reader.readAsDataURL(btnSelecionar.files[0]);

        // Agurada 200 para ativar o cropper
        setTimeout(function () {
            cropper = crop(previewImage);
            let previewCrop = document.querySelector('#preview-crop');
            previewImage.classList.remove('escondido');
        }, 100);

    });
}

function verificarDados() {
    const user = document.querySelector("#txtCodigoUsuario");
    const nome = document.querySelector("#txtNome");
    const email = document.querySelector("#txtEmail");
    const telefone = document.querySelector("#txtTelefone");

    const litNome = document.getElementById("litNome");
    const litNomeUser = document.getElementById("litNomeUser");
    const litEmail = document.getElementById("litEmail");
    const litTelefone = document.getElementById("litTelefone");

    if (nome.value != "" && nome.value != null) {
        litNome.innerText = "";
        if (user.value != "" && user.value != null) {
            litNomeUser.innerText = "";
            if (email.value != "" && email.value != null) {
                litEmail.innerText = "";
                if (parseInt(telefone.value) > 11111111111) {
                    litTelefone.innerText = "";
                    return true
                }
                else {
                    litTelefone.classList.add("vermelho");
                    litTelefone.innerText = "DIGITE UM TELEFONE VÁLIDO";
                    window.scrollTo({
                        top: 0,
                        behavior: 'smooth',
                        duration: 2000
                    });
                    return false;
                }
            }
            else {
                litEmail.classList.add("vermelho");
                litEmail.innerText = "DIGITE UM EMAIL VÁLIDO";
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth',
                    duration: 2000
                });
                return false;
            }
        }
        else {
            litNomeUser.classList.add("vermelho");
            litNomeUser.innerText = "DIGITE UM NOME DE USUÁRIO VÁLIDO";
            window.scrollTo({
                top: 0,
                behavior: 'smooth',
                duration: 2000
            });
            return false;
        }
    }
    else {
        litNome.classList.add("vermelho");
        litNome.innerText = "DIGITE UM NOME VÁLIDO";
        window.scrollTo({
            top: 0,
            behavior: 'smooth',
            duration: 2000
        });
        return false;
    }
}

function atualizarUsuario() {
    return new Promise((resolve, reject) => {
        if (verificarDados()) {
            const user = document.querySelector("#txtCodigoUsuario");
            const nome = document.querySelector("#txtNome");
            const email = document.querySelector("#txtEmail");
            const emailConfirmar = document.querySelector("#txtEmailConfirmar");
            const telefone = document.querySelector("#txtTelefone");
            const dataNascimento = document.querySelector("#txtDataNasc");

            if (email.value == emailConfirmar.value) {
                    const dataNascimentoDate = new Date(dataNascimento.value);
                    var telefoneInt = parseInt(telefone.value, 10);

                    const infoUsuario = [];

                    if (!isNaN(dataNascimentoDate.getTime())) {
                        const usuario =
                        {
                            User: user.value,
                            NomeUsuario: nome.value,
                            Email: email.value,
                            Telefone: telefoneInt,
                            Nascimento: dataNascimentoDate
                        };

                        infoUsuario.push(usuario);

                        var jsonResult = JSON.stringify(infoUsuario, null, 2);

                        var opcoesRequisicao = {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: jsonResult
                        }

                        fetch('lib/atualizarUsuario.aspx', opcoesRequisicao)
                            .then(function (response) { return response.json(); })
                            .then(function (dados) {
                                if (dados["situacao"] == 'true' && dados["user"] == 'true') {
                                    console.log("Cadastro feito com sucesso");
                                    resolve();
                                }
                                else {
                                    if (dados["situacao"] == 'true' && dados["user"] == 'false') {
                                        const litNomeUser = document.getElementById("litNomeUser");
                                        litNomeUser.classList.add("vermelho");
                                        litNomeUser.innerText = "NOME DE USUÁRIO JÁ EXISTENTE";
                                        return;
                                    }
                                    else {
                                        console.log("Ocorreu um erro");
                                        reject(new Error("Erro ao fazer cadastro"));
                                    }
                                }
                            })
                            .catch((error) => {
                                console.error("Erro na requisição:", error);
                                reject(error);
                            });
                }
            }
            else {
                litErroEmail.classList.add("vermelho");
                litErroEmail.innerText = "EMAIL INCORRETO";
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth',
                    duration: 2000
                });
            }
        }
    })
}

function adicionarDietaUsuario(index) {
    return new Promise((resolve, reject) => {
        const listaDietas = document.querySelectorAll(".txtListaDietas");

        const arrayDietas = [];

        for (var i = 0; i < listaDietas.length; i++) {
            if (listaDietas[i].checked) {
                const dieta = {
                    Dieta: listaDietas[i].value,
                };
                arrayDietas.push(dieta);
            }
        }

        var jsonResult = JSON.stringify(arrayDietas, null, 2);

        var opcoesRequisicao = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: jsonResult
        };

        fetch(`lib/inserirPreferenciaDieta.aspx`, opcoesRequisicao)
            .then(function (response) { return response.json(); })
            .then(function (dados) {
                if (dados["situacao"] == 'true') {
                    console.log("Preferencia dieta salva com Sucesso");
                    resolve();
                }
                else {
                    console.log("Ocorreu um erro");
                    reject(new Error("Erro ao salvar a Preferencia dieta"));
                }
            })
            .catch((error) => {
                console.error("Erro na requisição:", error);
                reject(error);
            });
    })
}

function adicionarImagem() {
    return new Promise((resolve, reject) => {
        if (cropper != null) {
            if (cropper.cropped) {
                cropper.getCroppedCanvas().toBlob(async blob => {
                    const formData = new FormData();
                    formData.append('arquivo', blob);

                    var opcoesRequisicao = {
                        method: 'POST',
                        body: formData
                    }

                    fetch('lib/inserirImagemPerfil.aspx', opcoesRequisicao)
                        .then(function (response) { return response.json(); })
                        .then(function (dados) {
                            if (dados["situacao"] == 'true') {
                                console.log("Imagem salva com Sucesso");
                                resolve();
                            }
                            else {
                                console.log("Ocorreu um erro");
                                reject(new Error("Erro ao salvar imagem"));
                            }
                        })
                        .catch((error) => {
                            console.error("Erro na requisição:", error);
                            reject(error);
                        });
                })
            }
        }
        else {
            console.log("Nenhum arquivo selecionado.");
            resolve();
        }
    });
}

function redirecionarParaPagina() {
    return new Promise((resolve, reject) => {

        const user = document.querySelector("#txtCodigoUsuario");
        const email = document.querySelector("#txtEmail");
        const nome = document.querySelector("#txtNome");

        const infoUsuario = [];

        const usuario =
        {
            User: user.value,
            NomeUsuario: nome.value,
            Email: email.value,
        };

        infoUsuario.push(usuario);

        var jsonResult = JSON.stringify(infoUsuario, null, 2);

        var opcoesRequisicao = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: jsonResult
        }

        fetch(`lib/redirecionarPerfil.aspx`, opcoesRequisicao)
            .then(function (response) { return response.json(); })
            .then(function (dados) {
                if (dados["situacao"] == 'true') {
                    console.log("Redirecionamento feito com sucesso");
                    window.location.href = `../perfil.aspx?u=${dados["user"]}`;
                    resolve();
                }
                else {
                    console.log("Ocorreu um erro");
                    reject(new Error("Erro ao redirecionar"));
                }
            })
            .catch((error) => {
                console.error("Erro na requisição:", error);
                reject(error);
            });
    });
}

const botaoAtualizar = document.getElementById("btnAtualizar");
if (botaoAtualizar)
    botaoAtualizar.addEventListener("click", function (e) {
        e.preventDefault();
        atualizarUsuario()
            .then(() => adicionarDietaUsuario())
            .then(() => adicionarImagem())
            .then(() => redirecionarParaPagina())
            .catch((error) => console.error("Ocorreu um erro:", error));
    });
