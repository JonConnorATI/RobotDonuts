
*** Settings ***
Resource            all_resources.resource

*** Variables ***

*** Keywords ***

Get Current DateTime
  ${CurrDate}  Get Current Date
  ${converted}  Convert date  ${CurrDate}  result_format=%d%m%Y%H%M%S
  RETURN     ${converted}

# Pass element locator as an arguement
# returns True if the element exists, else False
Does Element Exist
   [Arguments]  ${Element Locator}
   ${count}  Get element Count  ${Element Locator}
   ${isExists} =  Set variable if  ${count} == 1  ${True}  ${False}
   RETURN  ${isExists}


Element Should Exist
   [Arguments]  ${Element Locator}
   ${isExist}  Does Element Exist  ${Element Locator}
   run keyword if  not ${isExist}  Fail  ${Element Locator} IS NOT PRESENT

Element Should Not Exist
   [Arguments]  ${Element Locator}
   ${isExist}  Does Element Exist  ${Element Locator}
   run keyword if  ${isExist}  Fail  ${Element Locator} IS PRESENT

# Scroll To an Element
#    [Arguments]  ${locator}
#    Execute Javascript  document.querySelector(${locator}).scrollIntoView()

#Breadcrumbs nav is present on the page
#    Get Element States   ${Breadcrumbs_nav}  contains  attached  visible  enabled  editable  defocused


# Waits for an element to be Hidden within max 1m30s
Wait For Element To Be Hidden
    [Arguments]  ${locator}
    Wait For Elements State  ${locator}  hidden  90s

# Waits for an element to be Visible within max 1m30s
Wait For Element To Be Visible
    [Arguments]  ${locator}
    Wait For Elements State  ${locator}  visible  90s


#####################################################################
#                                                                   #
#    WORKING WITH TABLES                                            #
#                                                                   #
#####################################################################

# Pass in the elements for the table, text of the Column and the row locator (For the count)
Get the required list of elements as displayed in the table
    [Arguments]  ${table}  ${column}  ${rows}
    ${count} =    Count the number of table rows  ${rows}
    @{Displayed_List} =    Create List
    FOR    ${index}    IN RANGE    1    ${count} + 1
        ${Element} =  Get Table Cell Element    ${table}    ${column}    ${index}
        ${Required} =  Get Text  ${Element}
        Append To List    ${Displayed_List}  ${Required}
    END
    RETURN  @{Displayed_List}

# Counts the number of rows in a table
Count the number of table rows
    [Arguments]  ${table_row_locator}
    ${Total_Rows} =  Get Element Count  ${table_row_locator}
    RETURN  ${Total_Rows}



