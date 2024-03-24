*** Settings ***
Documentation    This is some basic info about the whole suite
Library          SeleniumLibrary

*** Variables ***
${URL1}                 https://www.happydayshopping.com/products/account
${URL2}                 https://mail.yahoo.com/d/folders/1/messages/49219?guce_referrer=aHR0cHM6Ly9sb2dpbi55YWhvby5jb20v&guce_referrer_sig=AQAAADuDVy05XMlqgbNHQRJAsRufL7VBUEGMw-aWXUx0jLz0Qa6xygyvGy8f6bDKyZ1rFL3d8vbabXRcv7HY-whPPi_RaYycNErqMx7gMSwZekHpKyf-LEPZtFrL7IwYMdurkf8irdo5Ib_MSZPeq_8zYE1HJbSBLDbyKdY2gNeodUvm
${ELEMENT_LOGIN}        //input[@id='ec-signin-email-input']
${VALID_USERNAME}       sarah_sasa17@yahoo.com
${INVALID_USERAME}      sarah_sasa17
${INPUT_USERNAME}       //*[@id="username"]
${LOGIN_BTN}            //button[@class='form-control__button form-control__button--icon-center']
${LOGIN_LINK}           //td[@valign='top']//div//a[@rel='nofollow noopener noreferrer']


*** Test Cases ***
TC01. Verify that the user will be able to login with their acc with the correct credential
    [Documentation]         This is the login with valid username & password
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                     Starting the test case!
    open browser            ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                   5
    click element           ${ELEMENT_LOGIN}
    sleep                   5
    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
    click button            ${LOGIN_BTN}
    sleep                   5
    go to                   ${URL2}
    sleep                   5
    click button            ${LOGIN_LINK}

    #close browser
    sleep                   3s
    close browser

#TC02. Verify that the user will get into their account after login in with the correct credential
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Positive Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                     Starting the test case!
#    open browser            ${URL}                  chrome
#    maximize browser window
#
#    #main test
#    click element                   ${ELEMENT_LOGIN}
#    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
#    click button                    ${LOGIN_BTN}
#    element should be visible
#
#    #close browser
#    sleep                   3s
#    close browser
#
#TC03. Verify that the user can login by entering valid credentials and pressing Enter key
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Positive Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                     Starting the test case!
#    open browser            ${URL}                  chrome
#    click element           ${ELEMENT_LOGIN}
#    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
#    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
#    select checkbox         ${REMEMBER_ME}
#    press keys              ${LOGIN_BTN}            [RETURN]
#    click element           ${ELEMENT_LOGIN}
#    sleep                   3s
#    close browser
#
#TC04. Verify whether an eye icon is added to the password field or not
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Positive Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                             Starting the test case!
#    open browser                    ${URL}                  chrome
#    click element                   ${ELEMENT_LOGIN}
#    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
#    input password                  ${INPUT_PASSWORD}       ${VALID_PASSWORD}
#    element should be visible       ${EYE_ICON}
#    sleep                           3s
#    close browser
#
#TC05. Verify that the user can be able to view the password by clicking on the eye icon
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Positive Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                             Starting the test case!
#    open browser                    ${URL}                  chrome
#    click element                   ${ELEMENT_LOGIN}
#    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
#    input password                  ${INPUT_PASSWORD}       ${VALID_PASSWORD}
#    element should be visible       ${EYE_ICON}
#    click element                   ${EYE_ICON}
#    sleep                           3s
#    close browser
#
#TC06. Verify logged-in user doesn't log out by clicking the back button on the browsers tab
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Positive Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                     Starting the test case!
#    open browser            ${URL}                  chrome
#    click element           ${ELEMENT_LOGIN}
#    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
#    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
#    select checkbox         ${REMEMBER_ME}
#    click button            ${LOGIN_BTN}
#    click element           ${ELEMENT_LOGIN}
#    go back
#    click element           ${ELEMENT_LOGIN}
#    sleep                   3s
#    close browser
#
#TC07. Verify the error message should display after just entering a password and leaving the email field blank
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Negative Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                     Starting the test case!
#    open browser            ${URL}                  chrome
#    click element           ${ELEMENT_LOGIN}
#    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
#    click button            ${LOGIN_BTN}
#    page should contain     Username is required.
#    sleep                   3s
#    close browser
#
#TC08. Verify the error message should display after just entering a username and leaving the password field blank
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Negative Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                     Starting the test case!
#    open browser            ${URL}                  chrome
#    click element           ${ELEMENT_LOGIN}
#    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
#    click button            ${LOGIN_BTN}
#    page should contain     The password field is empty.
#    sleep                   3s
#    close browser
#
#TC09. Verify the error message should display after entering an invalid email format
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Negative Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                     Starting the test case!
#    open browser            ${URL}                  chrome
#    click element           ${ELEMENT_LOGIN}
#    input text              ${INPUT_USERNAME}       ${INVALID_USERAME}
#    input password          ${INPUT_PASSWORD}       ${VALID_PASSWORD}
#    click button            ${LOGIN_BTN}
#    page should contain     Unknown email address. Check again or try your username.
#    sleep                   3s
#    close browser
#
#TC10. Verify the error message should display after entering an invalid password format
#    [Documentation]         This is the login with valid username & password
#    [Tags]                  Negative Test Case
#
#    #Initialize Selenium
#    set selenium speed      .2s
#    set selenium timeout    10s
#
#    #open the browser
#    log                     Starting the test case!
#    open browser            ${URL}                  chrome
#    click element           ${ELEMENT_LOGIN}
#    input text              ${INPUT_USERNAME}       ${VALID_USERNAME}
#    input password          ${INPUT_PASSWORD}       ${INVALID_PASSWORD}
#    click button            ${LOGIN_BTN}
#    page should contain     The password you entered for the email address sarah_sasa17@yahoo.com is incorrect.
#    sleep                   3s
#    close browser

*** Keywords ***