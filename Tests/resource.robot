*** Settings ***
Documentation    Common libraries used here
Library           SeleniumLibrary

*** Variables ***
${url}        https://rahulshettyacademy.com/loginpagePractise/
${user_name}        rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning
${browser_name}      chrome

*** Keywords ***
Open the browser
    Open Browser    ${url}     chrome

Close browser session
    Close Browser
