*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot
Resource   locators.robot

*** Keywords ***
##### WEB TESTING ######
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_USERNAME}    10s
#    Open Browser    ${URL}    chrome
#    Maximize Browser Window
#    Wait Until Element Is Visible    ${INPUT_USERNAME}    10s


Close Browser
    [Documentation]    ปิดเบราว์เซอร์ทั้งหมด
    Close All Browsers

Input Username
    [Arguments]    ${username}
    Input Text    ${INPUT_USERNAME}   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    ${INPUT_PASSWORD}    ${password}

Submit Login
    Click Button    ${BTN_LOGIN}

Flash Should Contain
    [Arguments]    ${expected}
    Wait Until Element Is Visible    ${FLASH}    10s
    ${text}=    Get Text    ${FLASH}
    Should Contain    ${text}    ${expected}

Logout And Verify
    Click Link      css:a[href="/logout"]
    Wait Until Element Is Visible   ${BTN_LOGIN}    10s
    Flash Should Contain    ${MSG_LOGOUT_SUCCESS}

##### API TESTING ######
Connect REQRES API
       Create Session    reqres    ${BASE_URL}    headers={"X-Api-Key":"${API_KEY}"}    verify=True
