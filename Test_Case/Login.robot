*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${url} =                    https://automationexercise.com
${browser} =                chrome
${name} =                   JosueHTestinFromRobotFour
${email} =                  ${name}@test.com
${pass} =                   12345
${lastName} =               lastName
${companyName} =            anotherCompanyName
${addressName} =            Street 50, P.O. Box 50, ${companyName}
${countryName} =            United States
${stateName} =              stateName
${cityName} =               cityName
${zipCode} =                501000
${phoneNumber} =            500400300

*** Test Cases ***
Test Case 1: Register User
    [Documentation]                 SuiteLogin
    [Tags]                          Test Case 1: Register User
    open browser                    ${url}      ${browser}
    maximize browser window
    sleep                           3s
    element should be visible       css:.navbar-nav
    click element                   css:.navbar-nav li a[href="/login"]
    element should be visible       css:.signup-form h2
    element text should be          css:.signup-form h2                     New User Signup!
    input text                      css:.signup-form input[name="name"]     ${name}
    input text                      css:.signup-form input[name="email"]    ${email}
    click button                    css:.signup-form button[type="submit"]
    element text should be          css:.login-form .title:nth-child(1)     ENTER ACCOUNT INFORMATION
    sleep                           3s
    select radio button             title                                   Mr
    sleep                           3s
    element attribute value should be       id=name     value       ${name}
    element attribute value should be       id=email    value       ${email}
    input text                      id=password                             ${pass}
    select from list by label       id=days             9
    select from list by label       id=months           December
    select from list by label       id=years            1996
    select checkbox                 id=newsletter
    unselect checkbox               id=newsletter
    select checkbox                 id=newsletter
    select checkbox                 id=optin
    unselect checkbox               id=optin
    select checkbox                 id=optin
    sleep                           3s
    input text                      id=first_name       ${name}
    input text                      id=last_name        ${lastName}
    input text                      id=company          ${companyName}
    input text                      id=address1         ${addressName}
    select from list by label       id=country          ${countryName}
    input text                      id=state            ${stateName}
    input text                      id=city             ${cityName}
    input text                      id=zipcode          ${zipCode}
    input text                      id=mobile_number    ${phonenumber}
    click button                    css:button[data-qa="create-account"]
    element text should be          css:.title b        ACCOUNT CREATED!
    click link                      css:a[data-qa="continue-button"]
    sleep                           3s
    element should contain          css:.navbar-nav li b    ${name}
    sleep                           3s
    click link                      css:.navbar-nav li a[href="/delete_account"]
    sleep                           3s
    element text should be          css:.title b        ACCOUNT DELETED!
    sleep                           3s
    close browser

#           python -m robot -d results Test_Case/Login.robot