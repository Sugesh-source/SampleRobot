*** Settings ***
Documentation    To Validate the Login form
Library           SeleniumLibrary
Library        Collections
Resource        resource.robot
Test Setup    Open the Browser
#Test Teardown    Close browser session

*** Variables ***
${expected_msg}    css:.alert-danger
${checkout_button}    css:.nav-link


*** Test Cases ***
#Validate Unsuccessful login
#    Fill the login form    ${user_name}    ${invalid_password}
#    Wait Until Element an element is located    ${expected_msg}
#    Verify the error message is correct

Validate card
    Fill the login form    ${user_name}    ${valid_password}
    Wait Until Element an element is located    ${checkout_button}
    Verify card titles in the shop page
    Select the card    Blackberry



*** Keywords ***
Fill the login form
    [arguments]    ${user_name}    ${password}    
    Input Text    id:username    ${user_name}
    Input Text    id:password    ${password}
    Click Button    signInBtn
Wait Until Element an element is located
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}
Verify the error message is correct
    #${result}=    Get Text    css:.alert-danger
    #Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${expected_msg}    Incorrect username/password.
Verify card titles in the shop page
    @{expected_list}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${element_list}=    Get WebElements   css:.card-title
    @{actual_list}=   Create List
    FOR    ${element}    IN    @{element_list}
        LOG    ${element.text}
        Append To List    ${actual_list}    ${element.text}
    END
    Lists Should Be Equal    ${actual_list}    ${expected_list}
Select the card
    [arguments]    ${card_name}
    ${card_list}=    Get WebElements   css:.card-title
    ${index}=    Set Variable    1
    FOR    ${card}    IN    @{card_list}
        Exit For Loop If   '${card.text}' == '${card_name}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    



    





    

