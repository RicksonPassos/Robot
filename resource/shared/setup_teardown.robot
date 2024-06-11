*** Settings ***
Resource    ../main.robot

*** Keywords ***
Dado que eu acesse a página inicial
    Open Browser    url=http://localhost:3000/    browser=Chrome

Fechar o navegador
    Close Browser