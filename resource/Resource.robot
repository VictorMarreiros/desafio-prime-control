*** Settings ***
Library             SeleniumLibrary
Library             FakerLibrary

*** Variables ***
${URL}                      http://automationpractice.com
${BROWSER}                  chrome
${TITULO_HOME}              My Store
${TITULO_LOGINPAGE}         Login - My Store
${BTN_LOGIN}                css=a[class="login"]
${CMP_EMAIL}                css=#email_create
${BTN_SUBMITCREATE}         xpath=//*[@id="SubmitCreate"]
${TITULO_HOME}              My Store
${TITULO_LOGINPAGE}         Login - My Store
${BTN_SIGNIN}               css=a[class="login"]
${CMP_EMAIL}                css=#email_create
${BTN_SUBMITCREATE}         xpath=//*[@id="SubmitCreate"]
${FORM_PERSONAL_INFO}       xpath=//*[@id="account-creation_form"]//*[@class="page-subheading"][contains(text(), "Your personal information")]
${CMP_CLIENTE_NOME}         xpath=//*[@id="customer_firstname"]
${CMP_CLIENTE_SOBRENOME}    xpath=//*[@id="customer_lastname"]
${CMP_CLIENTE_EMAIL}        xpath=//*[@id="email"]
${CMP_CLIENTE_SENHA}        xpath=//*[@id="passwd"]
${CMP_NOME}                 xpath=//*[@id="firstname"]
${CMP_SOBRENOME}            xpath=//*[@id="lastname"]
${CMP_ENDERECO}             xpath=//*[@id="address1"]
${CMP_CIDADE}               xpath=//*[@id="city"]
${CMP_PAIS}                 xpath=//*[@id="id_country"]
${OPT_PAIS}                 xpath=//*[@id="id_country"]/*[contains(text(), "United States")]
${CMP_ESTADO}               xpath=//*[@id="id_state"]
${OPT_ESTADO}               xpath=//*[@id="id_state"]/*[contains(text(), "Alaska")]         
${CMP_COD_POSTAL}           css=#postcode
${CMP_NCELULAR}             css=#phone_mobile
${NUMERO_CEL}               +55 11 99999-1111
${CMP_ALIAS}                css=#alias
${BTN_REGISTER}             css=#submitAccount
${CMP_COD_POSTAL}           xpath=//*[@id="postcode"]
${CMP_NCELULAR}             xpath=//*[@id="phone_mobile"]
${NUMERO_CEL}               +55 11 99999-1111
${CMP_ALIAS}                xpath=//*[@id="alias"]
${BTN_REGISTER}             xpath=//*[@id="submitAccount"]
${MY_ACCOUNT}               xpath=//*[@id="my-account"]        
${TITULO_MYACCOUNT}         My account - My Store
${MENSAGEM_WELCOME}         xpath=//*[@id="center_column"]/*[contains(text(), "Welcome to your account. Here you can manage all of your personal information and orders.")]
${BTN_HISTORICO}            xpath=//*[@id="center_column"]//*[contains(text(), "Order history and details")]
${BTN_INFO_PESSOAL}         xpath=//*[@id="center_column"]//*[contains(text(), "My personal information")]
${MENSAGEM_WELCOME2}        xpath=//*[@id="center_column"]/*[contains(text(), "Welcome to your account. Here you can manage your personal information and orders.")]


*** Keywords ***
### Setup and Teardown
Abrir navegador
    Open Browser        ${URL}          ${BROWSER}    


Fechar navegador
    Close Browser


### Passo-a-Passo
Acessar pagina home do site
    Title Should Be                     ${TITULO_HOME}


Clicar no botão superior direito "Sign in"
    Click Link                          ${BTN_LOGIN}
    Click Link                          ${BTN_SIGNIN}
    

Inserir um e-mail válido
    Title Should Be                     ${TITULO_LOGINPAGE}
    ${EMAIL}=                           FakerLibrary.Email
    Set Suite Variable                  ${EMAIL}
    Input Text                          ${CMP_EMAIL}                ${EMAIL}    


Clicar no botão "Create an account"
    Click Button                        ${BTN_SUBMITCREATE}


Preencher os campos obrigatórios
    Wait Until Element Is Visible       ${FORM_PERSONAL_INFO}
    Title Should Be                     ${TITULO_LOGINPAGE}
    ${FIRSTNAME}=                       FakerLibrary.First Name
    Input Text                          ${CMP_CLIENTE_NOME}         ${FIRSTNAME}
    ${LASTNAME}=                        FakerLibrary.Last Name  
    Input Text                          ${CMP_CLIENTE_SOBRENOME}    ${LASTNAME}
    Input Text                          ${CMP_CLIENTE_EMAIL}        ${EMAIL}
    ${PASSWORD}=                        FakerLibrary.Password
    Input Text                          ${CMP_CLIENTE_SENHA}        ${PASSWORD}
    Input Text                          ${CMP_NOME}                 ${FIRSTNAME}   
    Input Text                          ${CMP_SOBRENOME}            ${LASTNAME}
    ${ENDERECO}=                        FakerLibrary.Street Address
    Input Text                          ${CMP_ENDERECO}             ${ENDERECO}
    ${CIDADE}=                          FakerLibrary.City
    Input Text                          ${CMP_CIDADE}               ${CIDADE}
    Click Element                       ${CMP_PAIS}
    Click Element                       ${OPT_PAIS}
    Click Element                       ${CMP_ESTADO}    
    Click Element                       ${OPT_ESTADO}
    ${COD_POSTAL}=                      FakerLibrary.Postcode
    Input Text                          ${CMP_COD_POSTAL}           ${COD_POSTAL}
    Input Text                          ${CMP_NCELULAR}             ${NUMERO_CEL}
    Input Text                          ${CMP_ALIAS}                ${ENDERECO}


Clicar em "Register" para finalizar o cadastro
    Click Button                        ${BTN_REGISTER}


Clicar em "Register" para finalizar o cadastro
    Click Button                        ${BTN_REGISTER}


Conferir mensagem "Welcome to your account. Here you can manage all of your personal information and orders."
    Wait Until Element Is Visible       ${MY_ACCOUNT}
    Title Should Be                     ${TITULO_MYACCOUNT}
    Page Should Contain Element         ${MENSAGEM_WELCOME}
    Page Should Contain Element         ${BTN_HISTORICO}
    Page Should Contain Element         ${BTN_INFO_PESSOAL}
    Page Should Contain Element         ${BTN_INFO_PESSOAL}
    Sleep                               2

# foi retirado o trecho 'all of' da mensagem de boas vindas
Conferir mensagem "Welcome to your account. Here you can manage your personal information and orders."
    Wait Until Element Is Visible       ${MY_ACCOUNT}
    Title Should Be                     ${TITULO_MYACCOUNT}
    Page Should Contain Element         ${MENSAGEM_WELCOME2}
