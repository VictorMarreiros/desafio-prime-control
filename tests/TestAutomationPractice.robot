*** Settings ***
## Resources
Resource            ../resources/Resource.robot
Resource            ../resources/PO/Home.robot
Resource            ../resources/PO/Login.robot
Resource            ../resources/PO/Register.robot
Resource            ../resources/PO/Profile.robot
## Setup e Teardown
Test Setup         Abrir navegador
Test Teardown      Fechar navegador


*** Variables ***
${URL}          http://automationpractice.com
${BROWSER}      chrome

** Test Cases ***

Caso de teste 01: Cadastrar Cliente email válido
    Home.Acessar a página home do site
    Home.Clicar em "Sign in"
    Login.Informar um e-mail válido
    Login.Clicar em "Create an account"
    Register.Preencher os dados obrigatórios
    Register.Submeter cadastro
    Profile.Conferir se o cadastro foi efetuado com sucesso
    Profile.Conferir mensagem "Welcome to your account. Here you can manage all of your personal information and orders."

Caso de teste 02: Cadastrar Cliente mensagem de boas vindas inválida
    Home.Acessar a página home do site
    Home.Clicar em "Sign in"
    Login.Informar um e-mail válido
    Login.Clicar em "Create an account"
    Register.Preencher os dados obrigatórios
    Register.Submeter cadastro
    Profile.Conferir se o cadastro foi efetuado com sucesso
    Profile.Conferir mensagem "Welcome to your account. Here you can manage your personal information and orders."
