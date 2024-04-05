*** Settings ***
Library    ../../library/Authorization.py
Library    ../../library/Cart.py
Library     RequestsLibrary
Resource    ../../Variables/config.robot

*** Test Cases ***
Check empty cart
    [Documentation]    Проверка что корзина пустая
    [Tags]    check:positive
    ${response}=    Authorization.Auth    url=${URL}
    ...                                   username=${USERNAME}
    ...                                   password= ${PASSWORD}
    Should be equal     ${response.status_code}     ${200} 
    ${response}=    Cart.empty_cart    url=${URL_CART}
    Should be equal     ${response}     ${None}
    [Teardown]

Add to cart
    [Documentation]    Проверка добавления товара в корзину
    [Tags]    check:positive
    ${response}=    Authorization.Auth    url=${URL}
    ...                                   username=${USERNAME}
    ...                                   password= ${PASSWORD}
    Should be equal     ${response.status_code}     ${200} 
    ${response}=    Cart.add_to_cart    url=${URL_CATALOG}
    Should be equal     ${response}     ${True} 


Buying item
    [Documentation]    Проверка покупки товара
    [Tags]    check:positive
    Authorization.Auth    url=${URL}
    ...                                   username=${USERNAME}
    ...                                   password= ${PASSWORD}
    Cart.add_to_cart    url=${URL_CATALOG}
    ${response}=    Cart.buy_item    url=${URL_CHECKOUT}
    Should be equal     ${response}     ${200}    
