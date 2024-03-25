*** Settings ***
Documentation    This is some basic info about the whole suite
Library          SeleniumLibrary

*** Variables ***
${URL1}                 https://www.happydayshopping.com/products/account
${URL2}                 https://login.yahoo.com/?.intl=id&.lang=id-ID&src=ym&activity=mail-direct&pspid=159600001&done=https%3A%2F%2Fmail.yahoo.com%2Fd%2F%3Freason%3Dinvalid_cred&add=1
${URL3}                 https://www.happydayshopping.com/products/account?key=LqA6SfNfpB0u&returnUrl=account
${VALID_USERNAME}       elsa.sarah25@yahoo.com
${VALID_PASSWORD}       Sakithati2!
${INVALID_USERAME}      elsa.sarah25
${INVALID_USERAME2}     @yahoo.com
${INPUT_USERNAME}       //input[@id='ec-signin-email-input']
${INPUT_YAHOO_MAIL}     //input[@id='login-username']
${INPUT_YAHOO_PASS}     //input[@id='login-passwd']
${LOGIN_BTN}            //button[@class='form-control__button form-control__button--icon-center']
${LOGIN_LINK}           //td[@valign='top']//div//a[@rel='nofollow noopener noreferrer']
${BUTTON_YAHOO_EMAIL}   //input[@id='login-signin']
${BUTTON_YAHOO_PASS}    //button[@id='login-signin']
${NOTIF1}               //div[@class='ec-notice__message']
${NOTIF2}               //div[@id='ec-signin-email-input-msg']
${MENU_NOTREAD}         //a[@aria-label='Belum dibaca, dipilih - Menampilkan email yang belum dibaca']
${MENU_READEMAIL}       (//a[contains(@aria-label,'')])[37]
${CHECKBOX1}            //*[@id="recaptcha-anchor"]/div[1]

*** Test Cases ***
TC01. Verify that the user will be able to see and type to the input field of email
    [Documentation]                 The user can see and input email in the field email
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    element should be visible       ${INPUT_USERNAME}
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}

    #close browser
    sleep                           3s
    close browser

TC02. Verify that the user will be able to input their email to login page and click login button
    [Documentation]                 Make sure the user can click Get Sign-in Link
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    sleep                           3
    click button                    ${LOGIN_BTN}

    #close browser
    sleep                           3s
    close browser

TC03. Verify that the user will be able to input their email to login page and pressing Enter key
    [Documentation]                 Make sure the user can access Get Sing-in Link by hit Enter on keyboard
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    sleep                           3
    press keys                      ${LOGIN_BTN}            [RETURN]

    #close browser
    sleep                           3s
    close browser

TC04. Verify the success of sending login link to email should be displayed
    [Documentation]                 Make sure notif of the success sending sign-in link to the user's email be displayed
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    sleep                           3
    click button                    ${LOGIN_BTN}
    sleep                           3
    element should be visible       ${NOTIF1}

    #close browser
    sleep                           3s
    close browser

TC05. Verify the error message should display after leaving the email field blank
    [Documentation]                 The error message should be displayed when input email is empty
    [Tags]                          Negative Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    click button                    ${LOGIN_BTN}
    element should be visible       ${NOTIF2}

    #close browsers
    sleep                   3s
    close browser

TC06. Verify if the user can input an email without a valid email extension behind it
    [Documentation]                 The error message should be displayed when input email not match the credential
    [Tags]                          Edge Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${INVALID_USERAME}
    sleep                           3
    click button                    ${LOGIN_BTN}

    #close browser
    sleep                   3s
    close browser

TC07. Verify if the user can input the extension of the email without an email name
    [Documentation]                 The error message should be displayed when input email not match the credential
    [Tags]                          Edge Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${INVALID_USERAME2}
    sleep                           3
    click button                    ${LOGIN_BTN}

    #close browser
    sleep                   3s
    close browser

*** Keywords ***