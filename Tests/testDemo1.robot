*** Settings ***
Documentation    To Validate the Login form
Library           SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${expected_msg}    css:.alert-danger


*** Test Cases ***
Validate Unsuccessful login
    Open the browser
    Fill the login form
    Wait until it displays the error message
    Verify the error message is correct

*** Keywords ***
Open the browser
#    Create Webdriver    Chrome    executable_path=/Users/sugantharamachandran/Documents/chromedriver
    Open Browser       https://rahulshettyacademy.com/loginpagePractise/    chrome
Fill the login form
    Input Text    id:username    sugantha
    Input Text    id:password    12345678
    Click Button    signInBtn
Wait until it displays the error message
    Wait Until Element Is Visible    css:.alert-danger
Verify the error message is correct
    #${result}=    Get Text    css:.alert-danger
    #Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${expected_msg}    Incorrect username/password.



    

