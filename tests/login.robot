*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot
Library     SeleniumLibrary

Test Setup        Open Browser To Login Page
Test Teardown     Close Browser

*** Test Cases ***
Login success
    [Documentation]    To verify that a user can login  successfully when they put a correct username and password.
    Input Username    ${VALID_USER}
    Input Password    ${VALID_PASS}
    Submit Login
    Wait Until Element Is Visible      ${BTN_BURGER}



Login failed
    [Documentation]    To verify that a user can login unsuccessfully when they put a wrong username but correct password.
    Input Username    ${INVALID_USER}
    Input Password    ${VALID_PASS}
    Submit Login
    Flash Should Contain       ${MSG_INVALID_USERNAME}


