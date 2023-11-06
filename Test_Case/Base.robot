*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${url}=                 https://demoqa.com/text-box
${browser}=             chrome
${name}=                Rodrigo
${email}=               myEmail@gmail.com
${currentAddress}=      21
${permanentAddress}=    54Dos
${customSleep}=         .1

@{email_list}=          josue@gmail.com     test@hotmail.com        new@telus.com

*** Test Cases ***
Form exists
    [Documentation]                 Suite #1
    [Tags]                          TC#1 Form exists
    open browser                    ${url}      ${browser}
    maximize browser window
    sleep                           ${customSleep}
    element should be visible       id=userName
    element should be visible       id=userEmail
    element should be visible       id=currentAddress
    element should be visible       id=permanentAddress
    close browser

Form fields placeholders are not empty
    [Tags]                          TC#2 Form fields placeholders are not empty
    open browser                    ${url}      ${browser}
    element attribute value should be       id=userName         placeholder     Full Name
    element attribute value should be       id=userEmail        placeholder     name@example.com
    element attribute value should be       id=currentAddress   placeholder     Current Address
    close browser

Form input validation
    [Tags]                          TC#3 Form input validation
    open browser                    ${url}      ${browser}
    maximize browser window
    page should contain element     css:.undefined
    element should not be visible   css:.border
    sleep                           ${customSleep}
    input text                      id=userName             ${name}
    input text                      id=userEmail            ${email}
    input text                      id=currentAddress       ${currentAddress}
    input text                      id=permanentAddress     ${permanentAddress}
    execute javascript              window.scrollTo(0, 200)
    sleep                           ${customSleep}
    click button                    id=submit
    page should contain element     css:.border
    element should not be visible   css:.undefined
    ${name_text_element}=               Get Text                            id=name
    should contain                      ${name_text_element}                Name:Rodrigo
    ${email_text_element}=              Get Text                            id=email
    should contain                      ${email_text_element}               Email:myEmail@gmail.com
    sleep                           ${customSleep}
    close browser

web page title validation
    [Tags]                          TC#4 web page title validation
    open browser                    ${url}      ${browser}
    maximize browser window
    wait until page contains        Text Box
    sleep                           ${customSleep}
    title should be                 DEMOQA
    sleep                           ${customSleep}
    close browser

*** Keywords ***


#           python -m robot -d results Test_Case/Base.robot