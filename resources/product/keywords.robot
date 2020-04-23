*** Settings ***
Library     SeleniumLibrary
Library     String

Resource    elements.robot

*** Keywords ***
I add "${qtd}" to a cart
    :FOR    ${i}    IN RANGE    1    ${qtd}
    \   Click Element       ${PLUS_BUTTON} 
    END
    
    Click button        ${ADD_TO_CART_BUTTON}
    Click Element       ${CLOSE_SIDEBAR}


I access the product bag
    Sleep       2
    Wait Until Page Contains Element    ${BAG_AMOUNT}    
    Click Element      ${BAG_AMOUNT}


Should display the purchase amount details
    ${qtd} =   Convert To String   ${countOfProducts} 
    Element Should Contain      ${QTD_PRODUCTS_CART}    ${qtd}


Should show the button "${message}"
    Element Text Should Be      ${FINISH_ORDER_BUTTON}  ${message}


Select product from board
    Wait Until Element Is Visible               ${PRODUCT_DETAILS_LIST}
    @{elements} =   Get WebElements             ${PRODUCT_DETAILS_LIST} 

    :FOR    ${element}    IN    @{elements}
    \    ${text}=    Get Text    ${element}
    \    ${contains}=  Evaluate   "${data}[filters][${i}][product][name]" in """${text}"""
    \    Exit For Loop If  '${contains}' == 'True'  
    END
    Scroll Element Into View    ${element}
    Sleep       2
    Click Element       ${element}

