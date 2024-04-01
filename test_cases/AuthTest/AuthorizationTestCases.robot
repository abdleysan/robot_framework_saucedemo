*** Settings ***
Library    ../../library/Authorization.py
Library     RequestsLibrary
Resource    ../../Variables/config.robot

*** Test Cases ***
Open browser
    [Documentation]    Проверка открытия ссылки
    [Tags]    check:positive
    ${response}=    Authorization.open_website    url=${URL}
    Should be equal     ${response}     ${200}  

Fill login and PASSWORD 
    [Documentation]    Проверка аутентификации
    [Tags]    check:positive
    ${response}=    Authorization.Auth    url=${URL}
    ...                                   username=${USERNAME}
    ...                                   password= ${PASSWORD}
    Should be equal     ${response}     ${200}   

