*** Settings ***
Library         SeleniumLibrary

Resource        elements.robot

*** Keywords ***
I input the full address
    [Arguments]     ${address}      ${nro}      ${complement}

    Click button    INSERIR ENDEREÇO PARA PEDIR

    Input Text      ${ADDRESS_SEARCH_INPUT}     ${address}
    Wait Until Element Is Visible               ${ADDRESS_LIST}
    @{elements} =   Get WebElements             ${ADDRESS_LIST} 
    Click Element       @{elements}[0]

    Input Text      ${NRO_INPUT}                ${nro}
    Input Text      ${COMPLEMENT_INPUT}         ${complement}

    Click button   ${AVAILABLE_PRODUCTS_BUTTON}
