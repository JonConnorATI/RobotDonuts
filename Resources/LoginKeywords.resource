*** Settings ***
Resource            all_resources.resource

*** Variables ***

*** Keywords ***
Select the login link
    Click    ${Login_Link}

Enter valid username and invalid password
    Fill Secret    ${Username_Field}  $accountEmail
    Fill Secret    ${Password_Field}  $accountPasswordInvalid
    Select the Login Button

Enter invalid username and valid password
    Fill Secret    ${Username_Field}  $accountEmailInvalid
    Fill Secret    ${Password_Field}  $accountPassword
    Select the Login Button

Enter valid username and valid password
    Fill Secret    ${Username_Field}  $accountEmail
    Fill Secret    ${Password_Field}  $accountPassword
    Select the Login Button



Select the Login Button
    Click    ${Login_Button}

Verify Login error message
    Get Text    ${Login_Error_Message}  ==  ${Login_Error_String}

Verify My Account page title
    Wait For Element To Be Visible    ${Side_Nav}
    Get Title  ==  ${Title_My_Account}



