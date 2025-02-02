*** Settings ***
Documentation    Common libraries used here
Library           SeleniumLibrary

*** Variables ***
${url}        https://rahulshettyacademy.com/loginpagePractise/
${user_name}        rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning
${browser_name}      headlesschrome

*** Keywords ***
Open the browser
    Open Browser    ${url}     headlesschrome

Close browser session
    Close Browser
