*** Settings ***
Library     SeleniumLibrary

Resource    elements.robot

*** Keywords ***
I search for "${productName}" in search menu
    Wait Until Page Contains Element    ${SEARCH_INPUT} 
    Input Text          ${SEARCH_INPUT}      ${productName}

    Wait Until Element Is Visible               ${PRODUCT_LIST}
    @{elements} =   Get WebElements             ${PRODUCT_LIST} 

    :FOR    ${element}    IN    @{elements}
    \    ${text}=    Get Text    ${element}
    \    ${contains}=  Evaluate   "${productName}" in """${text}"""
    \    Exit For Loop If  '${contains}' == 'True'  
    END

    Click Element       ${element}


I add a "${listOfProducts}" to cart through search menu
    ${data} =    evaluate    json.loads('''${listOfProducts}''')    json
    Set Test Variable   ${data}

    ${length} = 	Get Length 	${data}[products]

    ${countOfProducts} =    Set Variable  0

    :FOR    ${index}    IN RANGE    0    ${length}
    \   I search for "${data}[products][${index}][name]" in search menu
    \   I add "${data}[products][${index}][qtd]" to a cart
    \   ${countOfProducts} =    Evaluate    int(${countOfProducts}) + int(${data}[products][${index}][qtd])
    END
    Set Test Variable       ${countOfProducts} 


I add a "${categoryProducts}" to cart through category
    ${data} =    evaluate    json.loads('''${categoryProducts}''')    json
    Set Test Variable   ${data}

    ${lengthFilter} = 	Get Length 	${data}[filters]

    ${countOfProducts} =    Set Variable  0

    :FOR    ${i}    IN RANGE    0    ${lengthFilter}
    \   I choose "${data}[filters][${i}][category_name]" in category filter
    \   Set Test Variable   ${i}
    \   Select product from board
    \   I add "${data}[filters][${i}][product][qtd]" to a cart
    \   ${countOfProducts} =    Evaluate    int(${countOfProducts}) + int(${data}[filters][${i}][product][qtd])
    END
    Set Test Variable       ${countOfProducts} 


I choose "${categoryName}" in category filter
    Wait Until Element Is Visible               ${FILTER_CATEGORY_BUTTON}
    @{elements} =   Get WebElements             ${FILTER_CATEGORY_BUTTON} 

    :FOR    ${element}    IN    @{elements}
    \    ${text}=    Get Text    ${element}
    \    ${contains}=  Evaluate   "${categoryName}" in """${text}"""
    \    Exit For Loop If  '${contains}' == 'True'  
    END
    Sleep     2
    Click Element       ${element}
