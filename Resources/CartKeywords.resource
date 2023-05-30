*** Settings ***
Resource            all_resources.resource

*** Variables ***

*** Keywords ***

Empty the Cart at the end of the test
    sleep  2s
    ${Remove_Buttons} =  Get Element Count    ${Remove_Button}
    IF    ${Remove_Buttons} != 0
        ${Buttons} =  Get Elements    ${Remove_Button}
        FOR    ${element}    IN    @{Buttons}
            Click    (${Remove_Button})[1]
            Sleep    2s
            Wait For Element To Be Hidden    css=.blockOverlay:nth-child(3)
        END
    END
    ${isPresent} =  Does Element Exist  ${Order_Now_Button}
    Run Keyword If    ${isPresent} == True
    ...    Click    ${Order_Now_Button}





