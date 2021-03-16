*** Settings ***
Resource            ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador


*** Variables ***
${URL}          http://automationpractice.com
${BROWSER}      chrome

** Test Cases ***

Caso de teste 1: Cadastrar Cliente
    Acessar pagina home do site
    Clicar no botão superior direito "Sign in"
    Inserir um e-mail válido
    Clicar no botão "Create an account"
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro
    Conferir mensagem "Welcome to your account. Here you can manage all of your personal information and orders."