*** Variables ***
# login page
${INPUT_USERNAME}    id=user-name
${INPUT_PASSWORD}    id=password
${BTN_LOGIN}         id=login-button

# product list page page
${DDL_SORT}      //select[@class='product_sort_container']
#Product card
${BTN_BURGER}       id=react-burger-menu-btn
${IMG_PRODUCT}         //div[@class='inventory_item_img']
${PRODUCT_NAME}         //div[@class='inventory_item_name ']
${PRODUCT_DESCRIPTION}       //div[@class='inventory_item_desc']
${PRODUCT_PRICE}          //div[@class='inventory_item_price']
${BTN_ADDTOCART}       //button[@class='btn btn_primary btn_small btn_inventory ']
# Footer socials
${FOOTER_TW}       //li[@class='social_twitter']
${FOOTER_FB}       //li[@class='social_facebook']
${FOOTER_LI}       //li[@class='social_linkedin']

# notification message box
${FLASH}             //div[@class='error-message-container error']
