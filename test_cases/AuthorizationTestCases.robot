*** Settings ***
Library    ../library/Authorization.py
Library     RequestsLibrary
Resource    ../Variables/config.robot

*** Test Cases ***
Open browser
    [Documentation]    Проверка открытия ссылки
    [Tags]    check:positive
    ${response}=    Authorization.open_website    url=${URL}
    Should be equal     ${response}     ${200}  
