//const checklistIngrdiente = document.querySelectorAll(".checkList");
//console.log(checklistIngrdiente);

//for (var i = 0; i < checklistIngrdiente.length; i++) {
//    console.log(checklistIngrdiente[i].checked);
//    if (checklistIngrdiente[i].checked == true) {
//        checklistIngrdiente[i].classList.add("decoracaoTexto");
//    }
//}

function adjustTextareaHeight() {
    const textareas = document.getElementsByClassName("etapaPreparo");
    for (const textarea of textareas) {
        textarea.style.height = "auto";
        textarea.style.height = textarea.scrollHeight + "px";
    }
}

window.addEventListener("load", adjustTextareaHeight);

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
const urlParametros = new URLSearchParams(window.location.search);
const cdReceita = urlParametros.get("cd");
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

function adicionarReceitaBanco() {
    return new Promise((resolve, reject) => {
        const modoPreparo = document.querySelectorAll(".etapaPreparo");
        const inputNomeReceita = document.querySelector("#txtNomeReceita");
        const inputPorcoes = document.querySelector("#txtRendimento");
        const inputTempoPreparo = document.querySelector("#txtTempoPreparo");

        if (inputNomeReceita.value != "" && inputPorcoes.value != "") {
            if (inputTempoPreparo.value != "" && modoPreparo[0].value != "") {
                if (verificarImagem()) {
                    console.log(inputNomeReceita.value)

                    const infoReceitas = [];

                    const receita = {
                        Codigo: cdReceita,
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

                    fetch('lib/atualizarReceita.aspx', opcoesRequisicao)
                        .then(function (response) { return response.json(); })
                        .then(function (dados) {
                            if (dados["situacao"] == 'true') {
                                console.log("Receita atualizada com Sucesso");
                                resolve();
                            }
                            else {
                                console.log("Ocorreu um erro");
                                reject(new Error("Erro ao atualizar receitas"));
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
        const codigoItemReceita = document.querySelectorAll("#itemReceita");
        const nomeIngrediente = document.querySelectorAll(".nomeInput");
        const qtdIngrediente = document.querySelectorAll(".qtdInput");
        const medidaIngrediente = document.querySelectorAll(".cmbMedidas");
        const modoPreparo = document.querySelectorAll(".etapaPreparo");

        const arrayMedidas = [];

        if (nomeIngrediente[0].value != "" && qtdIngrediente[0].value != "") {
            if (modoPreparo[0].value != "") {
                if (verificarImagem()) {
                    for (var i = 0; i < qtdIngrediente.length; i++) {
                        if (qtdIngrediente[i].value != "") {
                            const registro = {
                                Codigo: codigoItemReceita[i].value,
                                Receita: cdReceita,
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

                    fetch(`lib/atualizarItemReceita.aspx`, opcoesRequisicao)
                        .then(function (response) { return response.json(); })
                        .then(function (dados) {
                            if (dados["situacao"] == 'true') {
                                console.log("Item receita atualizado com Sucesso");
                                resolve();
                            }
                            else {
                                console.log("Ocorreu um erro");
                                reject(new Error("Erro ao atualizar os itens-receita"));
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
        const valorModoPreparo = document.getElementsByClassName("numeroIcon");
        console.log(modoPreparo[0].value);

        if (modoPreparo[0].value != "") {
            const arrayModoPreparo = [];

            for (var i = 0; i < modoPreparo.length; i++) {
                if (modoPreparo[i].value != "") {
                    var intValor = parseInt(valorModoPreparo[i].innerText, 10);
                    const registro = {
                        Receita: cdReceita,
                        Codigo: intValor,
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

            fetch(`lib/atualizarModoPreparo.aspx`, opcoesRequisicao)
                .then(function (response) { return response.json(); })
                .then(function (dados) {
                    if (dados["situacao"] == 'true') {
                        console.log("Modo de Preparo atualizado com Sucesso");
                        resolve();
                    }
                    else {
                        console.log("Ocorreu um erro");
                        reject(new Error("Erro ao atualizar o modo de preparo"));
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

function adicionarDietaBanco(index) {
    return new Promise((resolve, reject) => {
        const listaDietas = document.querySelectorAll(".cmbDietas");

        const arrayDietas = [];

        for (var i = 0; i < listaDietas.length; i++) {
                const dieta = {
                    Receita: cdReceita,
                    Dieta: listaDietas[i].options[listaDietas[i].selectedIndex].value,
                };
                arrayDietas.push(dieta);
        }

        var jsonResult = JSON.stringify(arrayDietas, null, 2);

        var opcoesRequisicao = {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: jsonResult
        };

        fetch(`lib/atualizarDieta.aspx`, opcoesRequisicao)
            .then(function (response) { return response.json(); })
            .then(function (dados) {
                if (dados["situacao"] == 'true') {
                    console.log("Dieta da receita atualizada com Sucesso");
                    resolve();
                }
                else {
                    console.log("Ocorreu um erro");
                    reject(new Error("Erro ao atualizar a Dieta da receita"));
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
        const arquivoImagem = document.getElementById("arquivoInput");

        if (arquivoImagem.files.length > 0) {
            if (cropper.cropped) {
                cropper.getCroppedCanvas().toBlob(async blob => {
                    const formData = new FormData();
                    formData.append('arquivo', blob);
                    formData.append('codigo', cdReceita);

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
                    window.location.href = `../receita.aspx?cd=${cdReceita}&u=${dados["user"]}`;
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

const botaoAtualizar = document.getElementById("btnSalvar");
if (botaoAtualizar)
    botaoAtualizar.addEventListener("click", function (e) {
        e.preventDefault();
        adicionarReceitaBanco()
            .then(() => adicionarItemReceita())
            .then(() => adicionarModoDePreparoBanco())
            .then(() => adicionarDietaBanco())
            .then(() => adicionarImagem())
            .then(() => redirecionarParaPagina())
            .catch((error) => console.error("Ocorreu um erro:", error));
    });