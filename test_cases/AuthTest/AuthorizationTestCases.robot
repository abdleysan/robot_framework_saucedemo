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
    Should be equal     ${response.status_code}     ${200}   

Open catalog
    [Documentation]    Проверка открытия каталога
    [Tags]    check:positive
    ${response}=    Authorization.Auth    url=${URL}
    ...                                   username=${USERNAME}
    ...                                   password= ${PASSWORD}
    ${response}=    Authorization.open_catalog    url=${URL_CATALOG}    
    Should be equal     ${response}     ${200}     


Loading time 
    [Documentation]    Время загрузки страницы
    [Tags]    check:positive
    ${response}=    Authorization.Auth    url=${URL}
    ...                                   username=${LOGIN}
    ...                                   password= ${PASSWORD}
    Should be equal     ${response.status_code}     ${200}   
    ${response}=    Authorization.loading_time    url=${URL_CATALOG}
    Should be equal     ${response}     ${1}    

