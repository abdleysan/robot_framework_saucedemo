*** Settings ***
Library    ../library/Authorization.py
Library    ../library/Cart.py
Library     RequestsLibrary
Resource    ../Variables/config.robot

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

Check empty cart
    [Documentation]    Проверка что корзина пустая
    [Tags]    check:positive
    ${response}=    Authorization.Auth    url=${URL}
    ...                                   username=${USERNAME}
    ...                                   password= ${PASSWORD}
    Should be equal     ${response}     ${200} 
    ${response}=    Cart.empty_cart    url=${URL_CART}
    Should be equal     ${response}     ${None}

#Add to cart
#    [Documentation]    Проверка добавления товара в корзину
#    [Tags]    check:positive
#    ${response}=    Authorization.Auth    url=${URL}
#    ...                                   username=${USERNAME}
#    ...                                   password= ${PASSWORD}
#    Should be equal     ${response}     ${200} 
#    ${response}=    Authorization.add_item_to_cart    url=${URL_CART}
#    Should be equal     ${response}     ${200} 