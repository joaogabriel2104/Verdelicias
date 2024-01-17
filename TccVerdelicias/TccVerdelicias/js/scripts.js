var botaoAdicionar = document.querySelector("#btnAdicionar");
var div = document.querySelector(".divIngredientesJS");
var selectIngrediente = document.querySelector(".cmbMedidas");
var inputQtdIngrediente = document.querySelector(".qtdInput");
var inputNomeIngrediente = document.querySelector(".nomeInput");
var etapaPreparo = document.querySelector(".etapaPreparo");
var nomeReceita = document.querySelector("#txtNomeReceita");
var porcoes = document.querySelector("#txtPorcoes");
var tempoPreparo = document.querySelector("#txtTempoPreparo");
var texto = document.getElementById("vermelho");
let imageCropped;

etapaPreparo.addEventListener("input", function () {
    this.style.height = "auto";
    this.style.height = (this.scrollHeight) + "px";
});

function adicionarIngredientes() {
    if (inputQtdIngrediente.value != "" && inputNomeIngrediente.value != "") {
        if (parseInt(inputQtdIngrediente.value) > 0) {
            texto.innerText = "";
            var option = selectIngrediente.options[selectIngrediente.selectedIndex];

            var divIngrediente = document.createElement("div");
            divIngrediente.classList.add("divIngredientes");

            var inputValorIngrediente = document.createElement("input");
            inputValorIngrediente.classList.add("qtdInput");
            inputValorIngrediente.value = inputQtdIngrediente.value;
            inputValorIngrediente.disabled = false;

            var selectMedida = document.createElement("select");
            selectMedida.classList.add("cmbMedidas");

            var optionMedida = document.createElement("option");
            optionMedida.textContent = option.textContent;

            var inputNomeIngredientePedido = document.createElement("input");
            inputNomeIngredientePedido.classList.add("nomeInput");
            inputNomeIngredientePedido.value = inputNomeIngrediente.value;
            inputNomeIngredientePedido.disabled = false;

            var div1 = document.querySelector(".divQtdJS");
            var div2 = document.querySelector(".divUnidadeJS");
            var div3 = document.querySelector(".divNomeJS");

            selectMedida.appendChild(optionMedida);

            div1.appendChild(inputValorIngrediente);
            div2.appendChild(selectMedida);
            div3.appendChild(inputNomeIngredientePedido);

            inputQtdIngrediente.value = "";
            inputNomeIngrediente.value = "";
        }
        else {
            if (inputQtdIngrediente.value.includes("/")) {
                const registro = {
                    Nome: nomeIngrediente[i].value
                };
                arrayIngredientes.push(registro);
            }
            else {
                texto.innerText = "DIGITE UMA QUANTIDADE VÁLIDA";
                return;
            }
        }
    }
    else {
        texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
    }
}

const botaoAdicionarIngrediente = document.getElementById("btnAdicionar");
if (botaoAdicionarIngrediente)
    botaoAdicionarIngrediente.addEventListener("click", function (e) {
        e.preventDefault();
        adicionarIngredientes();
    });

function adicionarModoPreparo() {
    if (etapaPreparo.value != "") {
        var divModoPreparo = document.createElement("div");
        divModoPreparo.classList.add("divModoPreparo");

        var inputModoPreparo = document.createElement("textarea");
        inputModoPreparo.classList.add("etapaPreparo");
        inputModoPreparo.value = etapaPreparo.value;
        inputModoPreparo.disabled = false;

        var div = document.querySelector(".divModoPreparoJS");

        var textoQuantidade = document.getElementById("textoQtd");

        var paragrafo = document.createElement("p");
        paragrafo.classList.add("textoQuantidade");
        paragrafo.textContent = textoQuantidade.innerText;

        var numeroAtual = parseInt(textoQuantidade.innerText);
        numeroAtual++;
        textoQuantidade.innerText = numeroAtual + ".";

        divModoPreparo.appendChild(paragrafo);
        divModoPreparo.appendChild(inputModoPreparo);

        div.appendChild(divModoPreparo);

        etapaPreparo.value = "";
        etapaPreparo.style.height = "18px";

        inputModoPreparo.style.height = "auto";
        inputModoPreparo.style.height = (inputModoPreparo.scrollHeight) + "px";
    }
    else {
        texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
    }
}

const botaoAdicionarModoPreparo = document.getElementById("btnAdicionarModoPreparo");
if (botaoAdicionarModoPreparo)
    botaoAdicionarModoPreparo.addEventListener("click", function (e) {
        e.preventDefault();
        adicionarModoPreparo();
    });

function verificarImagem() {
    const arquivoImagem = document.getElementById("arquivoInput");

    if (arquivoImagem.files.length > 0) {
        const arquivo = arquivoImagem.files[0];
        const tipoArquivo = arquivo.type.toLowerCase();

        if (tipoArquivo === 'image/jpeg') {
            console.log("O arquivo é uma imagem JPG.");
            return true;
        }
        else {
            return false;
        }
    }
    else {
        console.log("Nenhum arquivo selecionado.");
        return true;
    }
}

function crop(image) {
    return new Cropper(image, {
        dragMode: 'move',
        preview: '#preview-foto-perfil',
        background: false,
        aspectRatio: 16 / 9,
        viewMode: 2,
        data: { width: 1280, height: 720 }
    });
}

const btnSelecionar = document.querySelector('#arquivoInput');
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

function adicionarIngredientesBanco() {
    return new Promise((resolve, reject) => {
        const modoPreparo = document.querySelectorAll(".etapaPreparo");
        const qtdIngrediente = document.querySelectorAll(".qtdInput");
        const nomeIngrediente = document.querySelectorAll(".nomeInput");
        const listaDietas = document.querySelectorAll(".txtListaDietas");

        console.log(qtdIngrediente[0].value);
        console.log(nomeIngrediente[0].value);

        if (qtdIngrediente[0].value != "" && nomeIngrediente[0].value != "") {
            if (modoPreparo[0].value != "") {
                if (modoPreparo[0].value != "") {
                    if (verificarImagem()) {
                        const arrayIngredientes = [];

                        for (var i = 0; i < qtdIngrediente.length; i++) {
                            if (qtdIngrediente[i].value != "" && nomeIngrediente[i].value != "") {
                                if (parseInt(qtdIngrediente[i].value) > 0) {
                                    const registro = {
                                        Nome: nomeIngrediente[i].value
                                    };
                                    arrayIngredientes.push(registro);
                                }
                                else {
                                    if (qtdIngrediente[i].value.includes("/")) {
                                        const registro = {
                                            Nome: nomeIngrediente[i].value
                                        };
                                        arrayIngredientes.push(registro);
                                    }
                                    else {
                                        texto.innerText = "DIGITE UMA QUANTIDADE VÁLIDA";
                                        return;
                                    }
                                }
                            }
                        }

                        var jsonResult = JSON.stringify(arrayIngredientes, null, 2);

                        var opcoesRequisicao = {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: jsonResult
                        };

                        fetch(`lib/inserirIngredientes.aspx`, opcoesRequisicao)
                            .then(function (response) { return response.json(); })
                            .then(function (dados) {
                                if (dados["situacao"] == 'true') {
                                    console.log("Ingredientes salvos com Sucesso");
                                    resolve();
                                }
                                else {
                                    console.log("Ocorreu um erro");
                                    reject(new Error("Erro ao salvar ingredientes"));
                                }
                            })
                            .catch((error) => {
                                console.error("Erro na requisição:", error);
                                reject(error);
                            });
                    }
                    else {
                        texto.innerText = "ADICIONE UM ARQUIVO VÁLIDO";
                    }
                }
                else {
                    texto.innerText = "MARQUE ALGUMA DIETA";
                }
            }
            else {
                texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
            }
        }
        else {
            texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
        }
    });
}

function adicionarReceitaBanco() {
    return new Promise((resolve, reject) => {
        const modoPreparo = document.querySelectorAll(".etapaPreparo");
        const inputNomeReceita = document.querySelector(".inputNomeReceita");
        const inputPorcoes = document.querySelector(".porcoesInput");
        const inputTempoPreparo = document.querySelector(".preparadoInput");
        const listaDietas = document.querySelectorAll(".txtListaDietas");

        if (inputNomeReceita.value != "" && inputPorcoes.value != "") {
            if (inputTempoPreparo.value != "" && modoPreparo[0].value != "") {
                if (inputTempoPreparo.value != "" && modoPreparo[0].value != "") {
                    if (verificarImagem()) {
                        console.log(inputNomeReceita.value)

                        const infoReceitas = [];

                        const receita = {
                            NomeReceita: inputNomeReceita.value,
                            TempoPreparo: inputTempoPreparo.value,
                            Rendimento: inputPorcoes.value
                        }

                        infoReceitas.push(receita);

                        var jsonResult = JSON.stringify(infoReceitas, null, 2);

                        var opcoesRequisicao = {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: jsonResult
                        }

                        fetch('lib/inserirReceitas.aspx', opcoesRequisicao)
                            .then(function (response) { return response.json(); })
                            .then(function (dados) {
                                if (dados["situacao"] == 'true') {
                                    console.log("Receita salva com Sucesso");
                                    resolve();
                                }
                                else {
                                    console.log("Ocorreu um erro");
                                    reject(new Error("Erro ao salvar receitas"));
                                }
                            })
                            .catch((error) => {
                                console.error("Erro na requisição:", error);
                                reject(error);
                            });
                    }
                    else {
                        texto.innerText = "ADICIONE UM ARQUIVO VÁLIDO (.jpg)";
                    }
                }
                else {
                    texto.innerText = "MARQUE ALGUMA DIETA";
                }
            }
            else {
                texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
            }
        }
        else {
            texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
        }
    });
}

function adicionarItemReceita() {
    return new Promise((resolve, reject) => {
        const nomeIngrediente = document.querySelectorAll(".nomeInput");
        const qtdIngrediente = document.querySelectorAll(".qtdInput");
        const medidaIngrediente = document.querySelectorAll(".cmbMedidas");
        const modoPreparo = document.querySelectorAll(".etapaPreparo");
        const listaDietas = document.querySelectorAll(".txtListaDietas");

        const arrayMedidas = [];

        if (nomeIngrediente[0].value != "" && qtdIngrediente[0].value != "") {
            if (modoPreparo[0].value != "") {
                if (modoPreparo[0].value != "") {
                    if (verificarImagem()) {
                        for (var i = 0; i < qtdIngrediente.length; i++) {
                            if (qtdIngrediente[i].value != "") {
                                const registro = {
                                    Ingrediente: nomeIngrediente[i].value,
                                    Medida: medidaIngrediente[i].options[medidaIngrediente[i].selectedIndex].value,
                                    Quantidade: qtdIngrediente[i].value
                                };
                                arrayMedidas.push(registro);
                            }
                        }

                        var jsonResult = JSON.stringify(arrayMedidas, null, 2);

                        var opcoesRequisicao = {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: jsonResult
                        };

                        fetch(`lib/inserirItemReceita.aspx`, opcoesRequisicao)
                            .then(function (response) { return response.json(); })
                            .then(function (dados) {
                                if (dados["situacao"] == 'true') {
                                    console.log("Item receita salvo com Sucesso");
                                    resolve();
                                }
                                else {
                                    console.log("Ocorreu um erro");
                                    reject(new Error("Erro ao salvar os itens-receita"));
                                }
                            })
                            .catch((error) => {
                                console.error("Erro na requisição:", error);
                                reject(error);
                            });
                    }
                    else {
                        texto.innerText = "ADICIONE UM ARQUIVO VÁLIDO (.jpg)";
                    }
                }
                else {
                    texto.innerText = "MARQUE ALGUMA DIETA";
                }
            }
            else {
                texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
            }
        }
        else {
            texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
        }
    });
}

function adicionarModoDePreparoBanco() {
    return new Promise((resolve, reject) => {
        const modoPreparo = document.querySelectorAll(".etapaPreparo");
        console.log(modoPreparo[0].value);

        if (modoPreparo[0].value != "") {
            const arrayModoPreparo = [];

            for (var i = 0; i < modoPreparo.length; i++) {
                if (modoPreparo[i].value != "") {
                    const registro = {
                        Descricao: modoPreparo[i].value
                    };
                    arrayModoPreparo.push(registro);
                }
            }
            var jsonResult = JSON.stringify(arrayModoPreparo, null, 2);

            var opcoesRequisicao = {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: jsonResult
            };

            fetch(`lib/inserirModoPreparo.aspx`, opcoesRequisicao)
                .then(function (response) { return response.json(); })
                .then(function (dados) {
                    if (dados["situacao"] == 'true') {
                        console.log("Modo de Preparo salvo com Sucesso");
                        resolve();
                    }
                    else {
                        console.log("Ocorreu um erro");
                        reject(new Error("Erro ao salvar o modo de preparo"));
                    }
                })
                .catch((error) => {
                    console.error("Erro na requisição:", error);
                    reject(error);
                });
        }
        else {
            texto.innerText = "DIGITE TODAS AS INFORMAÇÕES";
        }
    });
}

function adicionarDietaBanco() {
    return new Promise((resolve, reject) => {
        const listaDietas = document.querySelectorAll(".txtListaDietas");

        const infoDieta = [];

        for (var i = 0; i < listaDietas.length; i++) {
                const dieta = {
                    Dieta: listaDietas[i].options[listaDietas[i].selectedIndex].value,
                };
                infoDieta.push(dieta);
        }

        var jsonResult = JSON.stringify(infoDieta, null, 2);

        var opcoesRequisicao = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: jsonResult
        }

        fetch('lib/inserirDieta.aspx', opcoesRequisicao)
            .then(function (response) { return response.json(); })
            .then(function (dados) {
                if (dados["situacao"] == 'true') {
                    console.log("Dieta salva com Sucesso");
                    resolve();
                }
                else {
                    console.log("Ocorreu um erro");
                    reject(new Error("Erro ao salvar dieta"));
                }
            })
            .catch((error) => {
                console.error("Erro na requisição:", error);
                reject(error);
            });
    });
}

function adicionarImagem() {
    return new Promise((resolve, reject) => {
        const arquivoImagem = document.getElementById("arquivoInput");

        if (arquivoImagem.files.length > 0)
        {
            if (cropper.cropped) {
                cropper.getCroppedCanvas().toBlob(async blob => {
                    const formData = new FormData();
                    formData.append('arquivo', blob);

                    var opcoesRequisicao = {
                        method: 'POST',
                        body: formData
                    }

                    fetch('lib/inserirImagem.aspx', opcoesRequisicao)
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
        fetch(`lib/redirecionar.aspx`, { method: 'POST' })
            .then(function (response) { return response.json(); })
            .then(function (dados) {
                if (dados["situacao"] == 'true') {
                    console.log("Redirecionamento feito com sucesso");
                    window.location.href = `../receita.aspx?cd=${dados["valor"]}&u=${dados["user"]}`;
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

const botaoPostar = document.getElementById("btnPostarReceita");
if (botaoPostar)
                botaoPostar.addEventListener("click", function (e) {
                    e.preventDefault();
                    adicionarIngredientesBanco()
                        .then(() => adicionarReceitaBanco())
                        .then(() => adicionarItemReceita())
                        .then(() => adicionarModoDePreparoBanco())
                        .then(() => adicionarDietaBanco())
                        .then(() => adicionarImagem())
                        .then(() => redirecionarParaPagina())
                        .catch((error) => console.error("Ocorreu um erro:", error));
                });