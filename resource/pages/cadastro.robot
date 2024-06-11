*** Settings ***
Resource          ../main.robot

*** Variables ***
${CAMPOR_NOME}    ID:form-nome
${CAMPO_CARGO}    ID:form-cargo
${CAMPO_IMAGEM}    ID:form-imagem
${CAMPO_IMAGEM}    ID:form-imagem
${CAMPO_TIME}    class:lista-suspensa
${CAMPO_CARD}    id:form-botao
@{selecionar_times}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')]
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]


*** Keywords ***

Dado que eu preencha os campos do formulário
    ${Nome}    FakerLibrary.First Name
    ${Cargo}    FakerLibrary.Job
    ${Imagem}    FakerLibrary.Image Url   width=100    height=100
    Input Text    ${CAMPOR_NOME}    ${Nome}
    Input Text    ${CAMPO_CARGO}    ${Cargo}
    Input Text    ${CAMPO_IMAGEM}    ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_times}[0]

E clique no botão criar card
    Click Button    ${CAMPO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que eu preencha os campos do formulário
        E clique no botão criar card
    END
    Sleep    5s

Então criar e identificar 1 card em cada time disponivel 
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Dado que eu preencha os campos do formulário
        Click Element    ${time}
        E clique no botão criar card
    END
    Sleep    10s

Dado que eu clique no botão criar card
    Click Element    ${CAMPO_CARD}

Então o sistema deve exibir a mensagem "Campo obrigatório"
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro