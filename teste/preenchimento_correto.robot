*** Settings ***

Resource          ../resource/main.robot
Test Setup        Dado que eu acesse a página inicial
Task Teardown     Fechar o navegador



*** Test Cases ***
Verificar se ao preencher o formulário e clicar no botão, um card é exibido

    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente
    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    Então identificar 3 cards no time esperado
    
Verficar se é possível criar um card para cada time se preenchermos os campos corretamente
    Dado que eu preencha os campos do formulário
    Então criar e identificar 1 card em cada time disponivel 




    
    