*** Settings ***
Resource            all_resources.resource

*** Variables ***

*** Keywords ***

Empty the Cart at the end of the test
    ${is_Cart_Empty} =  Does Element Exist    //*[contains(text(),'Your cart is currently empty.')]
    WHILE    ${is_Cart_Empty} != True
       Click    (${Remove_Button})[1]
       Wait For Element To Be Hidden    css=.blockOverlay:nth-child(3)
       ${is_Cart_Empty} =  Does Element Exist    //*[contains(text(),'Your cart is currently empty.')]
    END

    ${isPresent} =  Does Element Exist  ${Order_Now_Button}
    Run Keyword If    ${isPresent} == True
    ...    Click    ${Order_Now_Button}





