*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${PROFILE_MSGS}                 xpath=//*[@id="center_column"]/p
${PROFILE_USERNAME}             xpath=//*[@id="header"]/div[2]//div[1]/a/span   
${PROFILE_MYACCOUNT}            My account - My Store


*** Keywords ***
## Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible       ${PROFILE_MSGS}
    Element Text Should Be              ${PROFILE_MSGS}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be              ${PROFILE_USERNAME}    Victor Marreiros


Conferir mensagem "Welcome to your account. Here you can manage all of your personal information and orders."
    Wait Until Element Is Visible       ${PROFILE_MSGS}
    Title Should Be                     ${PROFILE_MYACCOUNT}
    Element Text Should Be              ${PROFILE_MSGS}
    ...     Welcome to your account. Here you can manage all of your personal information and orders.
    Page Should Contain Element         ${PROFILE_MSGS}
    ...     Order history and details
    Page Should Contain Element         ${PROFILE_MSGS}
    ...     My personal information
    Sleep                               2

# retirado o trecho 'all of' da mensagem de boas vindas
Conferir mensagem "Welcome to your account. Here you can manage your personal information and orders."
    Wait Until Element Is Visible       ${PROFILE_MSGS}
    Title Should Be                     ${PROFILE_MYACCOUNT}
    Element Text Should Be              ${PROFILE_MSGS}
    ...    Welcome to your account. Here you can manage your personal information and orders.
