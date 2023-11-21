*** Settings ***
Documentation       Navigate to the homepage

Resource            ../../Resources/all_resources.resource

*** Test Cases ***
Open the Browser and navigate to the homepage
    [Documentation]    Opens the browser and navigates to the homepage
    [Tags]
    Open the browser and go to the homepage
    Reload
    Accept the cookies

