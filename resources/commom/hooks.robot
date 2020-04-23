*** Settings ***
Library         SeleniumLibrary

Resource        env.robot
Resource        keywords.robot

*** Variables ***
${AGE_BUTTON}               id:age-gate-button-yes  

*** Keywords ***
Start section
    Open Browser        ${URL}      ${BROWSER} 
    Set Window Size     1200        800
    Set Selenium Implicit Wait      10
 
Close section
    Close Browser

Start test
    Delete All Cookies
    Go To   ${URL}/products
    Click Button        ${AGE_BUTTON}
    I input the full address 
    ...     Avenida Paulista         1000        Apto: 58

