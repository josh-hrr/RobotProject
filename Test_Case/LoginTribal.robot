*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}          https://www.saucedemo.com/
${browser}      chrome
${username}     standard_user
${password}     secret_sauce


*** Test Cases ***
Login Tribal
    [Documentation]         LoginTestSuite
    [Tags]                  LoginTestCase1ValidCredentials
    open browser            ${url}                              ${browser}
    sleep                   3s
    input text              id=user-name                        ${username}
    input text              id=password                         ${password}
    sleep                   3s
    click button            id=login-button
    sleep                   3s
    click button            css:.inventory_list .inventory_item:nth-child(1) .btn_inventory
    click element           css:.shopping_cart_container
    sleep                   3s
    click button            css:.cart_item .cart_button
    sleep                   3s
    click button            id=react-burger-menu-btn
    sleep                   3s
    click element           id=logout_sidebar_link
    sleep                   3s
    close browser


