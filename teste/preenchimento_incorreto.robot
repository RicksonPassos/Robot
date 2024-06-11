*** Settings ***
Resource        ../resource/main.robot
Test Setup    Dado que eu acesse a página inicial
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_CARD}    id:form-botao

*** Test Cases ***
Verificar se quando o campo obrigatório não é preenchido, o sistema deve alertar o usuário
    Dado que eu clique no botão criar card
    Então o sistema deve exibir a mensagem "Campo obrigatório"


