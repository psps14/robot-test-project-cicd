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



#Login failed - Password incorrect
#    [Documentation]    To verify that a user can login unsuccessfully when they put a correct username but wrong password.
#    Input Username    ${VALID_USER}
#    Input Password    ${INVALID_PASS}
#    Submit Login
#    #Login failed and the message 'Your password is invalid!' is shown.
#     Flash Should Contain       ${MSG_INVALID_PASSWORD}


#Login Failed - Username Not Found
#    [Documentation]   To verify that a user can login unsuccessfully when they put a username that did not exist.
#    Input Username    ${INVALID_USER}
#    Input Password     ${INVALID_PASS}
#    Submit Login
#    #Login failed and the message Your username is invalid!' is shown.
#     Flash Should Contain       ${MSG_INVALID_USERNAME}