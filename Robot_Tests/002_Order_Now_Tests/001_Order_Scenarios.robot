*** Settings ***
Documentation       Test that verifys when I choose an item the total is reflected in the Cart


Resource            ../../Resources/all_resources.resource
#Suite Setup         Set Browser Timeout    1m 30 seconds
Test Teardown       Empty the Cart at the end of the test

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
    Verify Cart contains the items I have ordered for the economy scenario
    Get the total in the Cart
    Verify the total on the Order Now Page is the same as the Cart

Customer is hungry
    [Documentation]    Verify the donuts ordered are added to the cart
    [Tags]
    Sleep    3s
    Select the donuts from the Offbeat Range and verify the quantity is one box  Offbeat Dozen  Offbeat Dozen
    Go to fill your boxes section
    Select 12 different donuts
    Go to add some magic section
    Add some candles
    Add a message to a donut  Just For You
    Get the total on the Order Now Page
    Select Add to Cart
    Verify Cart pop up information is as Expected
    Select View the cart
    Verify Cart contains the items I have ordered for the bad books scenario
    Get the total in the Cart
    Verify the total on the Order Now Page is the same as the Cart

Customer wants luxury
    [Documentation]    Verify the donuts ordered are added to the cart
    [Tags]
    Sleep    3s
    Select the donuts from the Offbeat Range and verify the quantity is one box  Birthday Double Dozen  Offbeat Dozen
    Go to fill your boxes section
    Select Auto Fill the box
    Go to add some magic section
    Add some luxury candles
    Add a card
    Add a greeting  All the best on your special day
    Add an occasion
    Add a pink bow
    Add a luxury message to a donut  Just For You
    Get the total on the Order Now Page
    Select Add to Cart
    Verify Cart pop up information is as Expected
    Select View the cart
    Verify Cart contains the items I have ordered for the birthday scenario
    Get the total in the Cart
    Verify the total on the Order Now Page is the same as the Cart



