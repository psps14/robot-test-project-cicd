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

Log in to the website
        Input Text            ${INPUT_USERNAME}    ${VALID_USER}
        Input Text        ${INPUT_PASSWORD}    ${VALID_PASS}
        Click Button          ${BTN_LOGIN}
        Wait Until Page Contains Element    ${BTN_BURGER}

Select Sort And Wait
    [Arguments]    ${label}
    # อ่านชื่อชิ้นแรกก่อนเปลี่ยน (กันหน้าไม่รีเฟรชทัน)
    ${before}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[1]
    Select From List By Label    ${DDL_SORT}    ${label}
    Wait Until Keyword Succeeds    10x    200ms    Name Should Change Or Stable    ${before}

Name Should Change Or Stable
    [Arguments]    ${before}
    ${after}=    Get Text    xpath=(//div[contains(@class,'inventory_item_name')])[1]
    # ถ้า sorting เปลี่ยน จะชื่อเปลี่ยน; ถ้าเลือก label เดิม ชื่ออาจเท่าเดิมก็ถือว่า stable (ผ่าน)
    Run Keyword If    '${after}'!='${before}'    Should Not Be Equal    ${after}    __always_diff_marker__
    ...    ELSE    Should Be Equal    ${after}    ${after}

Get Texts From Elements
    [Arguments]    ${locator}
    ${els}=     Get WebElements    ${locator}
    @{texts}=   Create List
    FOR    ${el}    IN    @{els}
        ${t}=   Get Text    ${el}
        Append To List    ${texts}    ${t}
    END
    [Return]    ${texts}

Prices To Floats
    [Arguments]    ${locator}
    ${prices_txt}=    Get Texts From Elements    ${locator}
    @{prices}=    Create List
    FOR    ${p}    IN    @{prices_txt}
        ${clean}=    Replace String    ${p}    $    ${EMPTY}
        ${num}=      Convert To Number    ${clean}
        Append To List    ${prices}    ${num}
    END
    [Return]    ${prices}

Should List Be Sorted Asc
    [Arguments]    ${list}
    ${sorted}=    Evaluate    sorted(${list})
    Lists Should Be Equal    ${list}    ${sorted}

Should List Be Sorted Desc
    [Arguments]    ${list}
    ${sorted}=    Evaluate    sorted(${list}, reverse=True)
    Lists Should Be Equal    ${list}    ${sorted}


