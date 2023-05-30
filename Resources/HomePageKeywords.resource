*** Settings ***
Resource            all_resources.resource

*** Variables ***

*** Keywords ***

Open the browser and go to the homepage
    ${Browser Id} =  New Browser  ${browser}  headless=${headless}
    Set Global Variable  ${Browser Id}
    Set Browser Timeout    1m30s
    New Page  ${baseURL}

Accept the cookies
    Wait For Element To Be Visible    ${cookies}
    ${is_Present} =  Does Element Exist    ${coupon}
    Run Keyword If    ${is_Present} == True
    ...    Click   ${no_thanks_btn}
    Click    ${cookies}

Close my browsers
     Close Browser  ALL

