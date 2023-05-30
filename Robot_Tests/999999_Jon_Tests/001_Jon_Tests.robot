*** Settings ***
Documentation       Navigate to the homepage

Resource            ../../Resources/all_resources.resource

*** Test Cases ***


Customer is on a budget and orders lowest value donuts
    [Documentation]    Verify the donuts ordered are added to the cart
    [Tags]
    Select the Order Now button
    Select the donuts from the Offbeat Range and verify the quantity is one box  Classic Glazed Dozen  Offbeat Dozen
    Go to fill your boxes section
    Verify Information Box for the Economy order is as expected
    Go to add some magic section
    Go to add to cart section
    Get the total on the Order Now Page
    Select Add to Cart
    Verify Cart pop up information is as Expected
    Select View the cart
    Verify Cart contains the items I have ordered
