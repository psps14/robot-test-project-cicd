*** Variables ***
##### WEB TESTING ######
${URL}     https://www.saucedemo.com/
# valid user
${VALID_USER}      standard_user
${VALID_PASS}      secret_sauce

# invalid user
${INVALID_USER}    locked_out_user
${INVALID_PASS}    secret_sauce

# messages
${MSG_LOGIN_SUCCESS}     You logged into a secure area!
${MSG_LOGOUT_SUCCESS}    You logged out of the secure area!
${MSG_WELLCOME_MESSAGE}  Welcome to the Secure Area. When you are done click logout below.
${MSG_INVALID_PASSWORD}  Your password is invalid!
${MSG_INVALID_USERNAME}  Your username is invalid!

##### API TESTING ######
${BASE_URL}    https://reqres.in/api
${API_KEY}     reqres-free-v1
${EXISTING_USER_ID}      /users/12
${NOT_FOUND_USER_ID}     /users/1234

# Expected values for user id 12
${EXP_ID}                12
${EXP_EMAIL}             rachel.howell@reqres.in
${EXP_FIRST_NAME}        Rachel
${EXP_LAST_NAME}         Howell
${EXP_AVATAR}            https://reqres.in/img/faces/12-image.jpg