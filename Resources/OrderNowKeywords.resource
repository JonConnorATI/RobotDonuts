*** Settings ***
Resource            all_resources.resource

*** Variables ***

*** Keywords ***

Select the Order Now Button
    Click    ${Order_Now_Button}
    Wait For Element To Be Visible    ${Order_Now_Heading}



Select the donut range
    [Arguments]  ${Range}
    Scroll To Element    id=top_boxes
    ${isPresent} =  Does Element Exist    //a[contains(text(),"${Range}")][@class="active"]
    Run Keyword If    ${isPresent} == False
    ...    Click    //a[contains(text(),"${Range}")]


Select the donut by name
    [Arguments]  ${Name}
    ${isPresent} =  Does Element Exist    //h3[text()="${Name}"]
    WHILE    ${isPresent} == False
        Click    //*[contains(@class,"next_offbeat-dozen")]
    END
    Click    //h3[text()="${Name}"]${Select_Box_Button}


Verify the button number has changed
    [Arguments]  ${Number}  ${Donut_name}
    Get Text    //h3[text() ="${Donut_name}"]${Box_Quantity}  ==  ${Number}


Select the donuts from the Offbeat Range and verify the quantity is one box
    [Arguments]    ${Donut_Name}  ${Donut_Range}
    Select the donut range    ${Donut_Range}
    Select the donut by name    ${Donut_Name}
    Verify the button number has changed    1    ${Donut_Name}

Verify Information Box for the Economy order is as expected
    Verify Box information text is as Expected  ${Classic_Glazed_Dozen_Box_Info}

Verify Box information text is as Expected
    [Arguments]  ${strings}
    Get Text  (//div[@class='info'])[1]  ==  ${strings}


Go to fill your boxes section
    Click    ${Section_1}${Next_steps}


Go to add some magic section
    Scroll To Element    ${Section_2}${Next_steps}
    Click    ${Section_2}${Next_steps}


Go to add to cart section
    Click    ${Section_3}${Next_steps}


Get the total on the Order Now Page
    ${OrderNowTotal} =  Get Text    ${Sub_Total_Order_Now}
    Set Suite Variable    ${OrderNowTotal}


Select Add to Cart
    Click    ${Add_to_Cart}
    Wait For Element To Be Visible    ${View_Cart_Button}

Verify Cart pop up information is as Expected
    Get Text  (//div[@class='modal-body'])[3]  ==  ${Cart_PopUp}
  

Select View the cart
    Click    ${View_Cart_Button}
    Wait For Element To Be Visible    //h1[@class='entry-title']

Verify Cart contains the items I have ordered for the economy scenario
    Get Text    //h1[@class='entry-title']  ==  ${Cart_Title}
    Get Text    //td[@class='product-name']  ==  ${Economy_Cart}

Verify Cart contains the items I have ordered for the bad books scenario
    Get Text    //h1[@class='entry-title']  ==  my cart (3 items)
    Get Text    (//td[@class='product-name']/a)[1]  ==  Offbeat Dozen
    Get Text    (//td[@class='product-name']/a)[2]  ==  Candles
    Get Text    (//td[@class='product-name']/a)[3]  ==  Piped name
    Get Text    (//dd[@class="variation-Selection"]/p)[2]  ==  "Just For You"
    Get Element Count    ${Remove_Button}  ==  3



Get the total in the Cart
    ${CartTotal} =  Get Text    //tr[@class="cart-subtotal"]//bdi[1]
    Set Suite Variable    ${CartTotal}


Verify the total on the Order Now Page is the same as the Cart
    ${Add_Euro_to_OrderNowTotal} =  Catenate  €${OrderNowTotal}
    Should Be Equal As Strings    ${Add_Euro_to_OrderNowTotal}    ${CartTotal}

Select 12 different donuts
    ${Count}  Set Variable  0
    ${index}  Set Variable  1
    Click    (//a[@class='box_clear'])[1]

    WHILE    ${Count} != 12
        Click  (//*[@id='donuts']//*[@class='btn select'])[${index}]
        ${Count}  Evaluate  ${Count} + 1
        ${index}  Evaluate  ${index} + 1
        sleep  1s
    END


Add some candles
    Wait For Element To Be Visible    (//h4[text() ="Add Candles"])[1]
    Click  (//h4[text() ="Add Candles"])[1]

Add a message to a donut
    [Arguments]  ${text}
    Wait For Elements State    (//h4[text() ='Add Message To A Donut:'])[1]  enabled
    Click    (//h4[text() ="Add Message To A Donut:"])[1]
    Fill Text    //div[@class="selected"]//input[@placeholder="3 words maximum"]   ${text}

Select Auto Fill the box
    Click  (//a[@class='box_autofill'])[1]

Add a card
    Click  (//h4[text() ='Add A Card:'])[1]

Add a greeting
    [Arguments]  ${text}
    Fill Text    (//div[@class='customise']//textarea)[1]   ${text}

Add an occasion
    Click    (//label[contains(text(),'Happy Birthday')])[1]

Add a pink bow
    Click    (//h4[text() ='Add A Bow:'])[1]
    Click    (//label[contains(text(),'Pink')])[1]




Verify Cart contains the items I have ordered for the birthday scenario
    Get Text    //h1[@class='entry-title']  ==  my cart (5 items)
    Get Text    (//td[@class='product-name']/a)[1]  ==  Birthday Double Dozen
    Get Text    (//td[@class='product-name']/a)[2]  ==  Candles
    Get Text    (//td[@class='product-name']/a)[3]  ==  Card
    Get Text    (//td[@class='product-name']/a)[4]  ==  Bow
    Get Text    (//td[@class='product-name']/a)[5]  ==  Piped name
    Get Element Count    ${Remove_Button}  ==  5














