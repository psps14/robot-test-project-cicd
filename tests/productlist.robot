*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot
Library     SeleniumLibrary

Test Setup        Open Browser To Login Page
Test Teardown     Close Browser

*** Test Cases ***
Verify UI Elements
    [Documentation]    To verify that the product list page displays all element correctly.
     Log in to the website
     # check product card that containts product image, product name, product description, product price and add to cart button
     Page Should Contain Element     ${IMG_PRODUCT}
     Page Should Contain Element     ${PRODUCT_NAME}
     Page Should Contain Element     ${PRODUCT_DESCRIPTION}
     Page Should Contain Element     ${PRODUCT_PRICE}
     Page Should Contain Element     ${BTN_ADDTOCART}
     # check the product list should contain 6 products on the page
     ${count}=    Get Element Count    ${IMG_PRODUCT}
         Should Be Equal As Integers       ${count}    6
     # check footer
    Page Should Contain Element    ${FOOTER_TW}
    Page Should Contain Element    ${FOOTER_FB}
    Page Should Contain Element    ${FOOTER_LI}

Verify sort Name A→Z
    [Documentation]    To verify tha system sort Name A→Z correctly.
    Log in to the website
    [Tags]    sort    name    asc
        Select Sort And Wait    Name (A to Z)
        ${names}=    Get Texts From Elements    ${PRODUCT_NAME}
        Should List Be Sorted Asc    ${names}
        Capture Page Screenshot

#Verify sort Name Z→A
#    [Documentation]    To verify tha system sort Name Z→A correctly.
#    Log in to the website
#    [Tags]    sort    name    desc
#         Select Sort And Wait    Name (Z to A)
#         ${names}=    Get Texts From Elements    ${ITEM_NAMES}
#         Should List Be Sorted Desc    ${names}
#         Capture Page Screenshot
#
#Verify sort Price Low→High
#    [Documentation]    To verify tha system sort Price Low→High correctly.
#    Log in to the website
#    [Tags]    sort    price    asc
#        Select Sort And Wait    Price (low to high)
#        ${prices}=   Prices To Floats    ${ITEM_PRICES}
#        Should List Be Sorted Asc    ${prices}
#        Capture Page Screenshot
#
#Verify sort Price High→Low
#     [Documentation]    To verify that system sort Price High→Low correctly.
#     Log in to the website
#     [Tags]    sort    price    desc
#     Select Sort And Wait    Price (high to low)
#     ${prices}=   Prices To Floats    ${ITEM_PRICES}
#     Should List Be Sorted Desc    ${prices}
#     Capture Page Screenshot


